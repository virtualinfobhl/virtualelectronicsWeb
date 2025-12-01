using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GroupName"] == null)
        {
            Session["GroupName"] = "3";
        }
        if (!IsPostBack)
        {
            Cnn.Open();
            DataTable DtState = Cnn.FillTable("Select 'State_Code'=-1,'State_Name'='Select State Name' union  select State_Code,State_Name from [Loc_State]", "State");
            DDState.DataSource = DtState;
            DDState.DataBind();
            Cnn.Close();
        }
    }
    protected void DDState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Cnn.Open();

        DataTable city = Cnn.FillTable("Select 'District_Code'=-1,'District_Name'='Select District Name' union  select District_Code,District_Name from Loc_District where State_Code='" + DDState.SelectedValue + "'", "State");
        DDDistrict.DataSource = city;
        DDDistrict.DataBind();
        Cnn.Close();
    }
    //protected void BtnChkAvailability_Click(object sender, EventArgs e)
    //{
    //    if (IsRecordAlreadyExist() == true)
    //    {
    //        UserLbl.Text = "User Name Not Available !!!";
    //        UserLbl.ForeColor = System.Drawing.Color.Red;
    //        TxtPassword.Enabled = false;
    //        TxtCofirm.Enabled = false;
    //        TxtUser.Focus();


    //    }
    //    else
    //    {

    //        UserLbl.Text = "User Name Available !!!";
    //        UserLbl.ForeColor = System.Drawing.Color.Green;
    //        TxtPassword.Enabled = true;
    //        TxtCofirm.Enabled = true;
    //        TxtPassword.Focus();
    //    }

    protected void TxtMobile_TextChanged(object sender, EventArgs e)
    {

        if (IsRecordAlreadyMobileExist() == true)
        {
            UserLbl.Text = "Mobile No. Already Exist !!!";
            UserLbl.ForeColor = System.Drawing.Color.Red;
            TxtPassword.Enabled = false;
            TxtCofirm.Enabled = false;
            TxtMobile.Focus();
            Txtstop.Focus();

        }
        else
        {

            UserLbl.Text = "";
            UserLbl.ForeColor = System.Drawing.Color.Green;
            TxtPassword.Enabled = true;
            TxtCofirm.Enabled = true;
            TxtPassword.Focus();
            Txtstop.Focus();
        }
    }


  
    private bool IsRecordAlreadyMobileExist()
    {
        Cnn.Open();
        String Sql = "Select Count(*) From register Where MobileNumber='" + TxtMobile.Text + "'";
        int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());
        if (Count > 0)
            return true;
        else
            return false;
        Cnn.Close();
    }

    private bool IsRecordAlreadyEmailExist()
    {
        Cnn.Open();
        String Sql = "Select Count(*) From register Where EmailId='" + TxtEmail.Text + "'";
        int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());
        if (Count > 0)
            return true;
        else
            return false;
        Cnn.Close();
    }

    public void clear()
    {
        Txtname.Text = "";
        Txtaddress.Text = "";
        
        TxtMobile.Text = "";
        TxtEmail.Text = "";
        TxtPassword.Text = "";
        TxtCofirm.Text = "";
     

     
        DDState.SelectedIndex = 0;
        DDDistrict.SelectedIndex = 0;

    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        string ip = Request.ServerVariables["remote_addr"];
        try
        {
            if (Txtname.Text == "")
            {
                LblErr.Text = "Enter Name !!!";

                return;

            }
            if (Txtaddress.Text == "")
            {
                LblErr.Text = "Enter Address !!!";
                return;
            }
          
            if (TxtMobile.Text == "")
            {
                LblErr.Text = "Enter Mobile Number.!!!";
                return;
            }
            if (TxtEmail.Text == "")
            {
                LblErr.Text = "Enter Emil ID.!!!";
                return;
            }
           
            if (TxtPassword.Text == "")
            {
                LblErr.Text = "Enter Password !!!";
                return;
            }
            if (TxtCofirm.Text == "")
            {
                LblErr.Text = "Enter Confirm Password !!!";
                return;
            }
            if (TxtPassword.Text != TxtCofirm.Text)
            {
                LblErr.Text = "Confirm Password  Do Not Match !!!";
                return;

            }
         
            if (DDState.SelectedValue == "-1")
            {
                LblErr.Text = "Select State Name !!!";
                return;
            }

            if (DDDistrict.SelectedValue == "-1")
            {
                LblErr.Text = "Select District Name !!!";
                return;
            }
            Cnn.Open();
            if (IsRecordAlreadyMobileExist() == false)
            {
                if (IsRecordAlreadyEmailExist() == false)
                {
                    int Firstime = 0, Firstuser = 0, seconduser = 0;
                    int Id = Convert.ToInt32(Cnn.ExecuteScalar("Select IsNull(Max(UserId)+1,1) From [register]"));
                    Firstime = Convert.ToInt32(Cnn.ExecuteScalar("Select Firstime From [Walletamount]"));
                    Firstuser = Convert.ToInt32(Cnn.ExecuteScalar("Select Firstuser From [Walletamount]"));
                    seconduser = Convert.ToInt32(Cnn.ExecuteScalar("Select seconduser From [Walletamount]"));
                    if (IsRecordAlreadyreferExist() == true)
                    {
                        Firstime += seconduser;
                    }

                    string code = "frim" + Id;
                    Cnn.ExecuteNonQuery("insert into [register] (UserId,Name,EmailId,Address,State,District,City,ZipCode,MobileNumber,password,rts,active,ip,Wallet,OrderCount,Groupid,gst,rcode)  Values ('" + Id + "','" + Txtname.Text + "','" + TxtEmail.Text + "','" + Txtaddress.Text + "','" + DDState.SelectedValue + "','" + DDDistrict.SelectedValue + "','" + DDDistrict.SelectedItem + "','" + txtpincode.Text + "','" + TxtMobile.Text.Trim() + "','" + TxtPassword.Text + "',GetDate(),'1','" + ip + "','0','1','1','','" + code + "')");


                    String Sql = "Select Count(*) From register Where rcode='" + txtrefer.Text + "'";
                    int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());
                    if (Count > 0)
                    {
                        Firstime += seconduser;
                    }
                    if (txtrefer.Text.Length > 0)
                    {
                    if (Count > 0)
                    {
                        int Firstuserid = Convert.ToInt32(Cnn.ExecuteScalar("Select userid From [register] where rcode='" + txtrefer.Text + "'"));
                        Cnn.ExecuteNonQuery("update register set Wallet=Wallet+" + seconduser + " where userid=" + Firstuserid + "");
                        Cnn.ExecuteNonQuery("insert into TrnWallet (UserId,OrderId,TrnType,PromoCodeAmount,Amount,IsDeducted,RTS,OrderType,Type,ReMark) values ('" + Firstuserid + "','0','Cr','0','" + seconduser + "',0,Getdate(),'','','Your  Refer Code used by " + Txtname.Text + "  Wallet Amount credited') ");
                    }

                    // grant parent
                    int checkrcode = Convert.ToInt32(Cnn.ExecuteScalar("Select count(*) From [trnrefer] where Fristuser='" + txtrefer.Text + "'"));
                    if (checkrcode == 1)
                    {
                        string rcode = Cnn.ExecuteScalar("Select seconduser From [trnrefer] where Fristuser='" + txtrefer.Text + "'").ToString();
                        int Firstuseidd = Convert.ToInt32(Cnn.ExecuteScalar("Select userid From [register] where rcode='" + rcode + "'"));
                        Cnn.ExecuteNonQuery("insert into TrnWallet (UserId,OrderId,TrnType,PromoCodeAmount,Amount,IsDeducted,RTS,OrderType,Type,ReMark) values ('" + Firstuseidd + "','0','Cr','0','" + Firstuser + "',0,Getdate(),'','','Earn From Child Refer Code Wallet Amount credited') ");
                        Cnn.ExecuteNonQuery("update register set Wallet=Wallet+" + Firstuser + " where userid=" + Firstuseidd + "");
                    }
                    // parent
                    if (txtrefer.Text.Length > 0)
                    {
                        Cnn.ExecuteNonQuery("insert into trnrefer (Fristuser,seconduser,rts) values ('" + code + "','" + txtrefer.Text + "',Getdate()) ");
                    }
                }
            
                    Session["UserId"] =Id;
                    Session["UserName"] =Txtname.Text;
                    Session["GroupName"] = "1";
                    Response.Cookies["UserId"].Value =Id.ToString();
                   Response.Cookies["Name"].Expires = DateTime.Now.AddDays(1);
                    clear();
                 //   Response.Write("<script LANGUAGE='JavaScript' >alert('Thank You For Registration, You will soon recieve a Confirmation Message by Shiv Shakti Synthetics')</script>");
                    Response.Redirect("index.aspx");
                }
                else
                {
                    LblErr.Text = "EmailId Already Exist !!!";
                }
            }

            else
            {
                LblErr.Text = "Mobile No. Already Exist !!!";
            }
            Cnn.Close();


        }
        catch { }
    }

    private bool IsRecordAlreadyreferExist()
    {
        Cnn.Open();
        String Sql = "Select Count(*) From register Where rcode='" + txtrefer.Text + "'";
        int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());
        if (Count > 0)
            return true;
        else
            return false;
        Cnn.Close();
    }
    protected void txtrefer_TextChanged(object sender, EventArgs e)
    {
        lblrefer.Text = "";
        if (IsRecordAlreadyreferExist() == true)
        {
            lblrefer.Text = "Referral Code  Applied";
        }
        else
        {
            lblrefer.Text = "Referral Code  does not exist";
        }
    }
}