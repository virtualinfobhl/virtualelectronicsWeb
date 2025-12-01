using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{

    ClsConnection Cnn = new ClsConnection();
    public enum MessageType { Success, Error, Info, Warning };
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_id"] == null)
        {
            Response.Redirect("login.aspx");
        }

        list();
    }

    public void list()
    {
        Cnn.Open();
        DataTable dt = Cnn.FillTable("select * from usercheck order by id desc", "Detail");
        ListView1.DataSource = dt;
        ListView1.DataBind();
        Cnn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ////update
        if (Button1.Text == "Update")
        {
            Cnn.Open();

            Cnn.ExecuteNonQuery("update usercheck set name='" + Txttitle.Text.Replace("'", "''") + "',mobile='" + txtmobile.Text.Replace("'", "''") + "',city='" + txtcity.Text.Replace("'", "''") + "',email='" + txemail.Text.Replace("'", "''") + "',remark='" + txtreamrk.Text.Replace("'", "''") + "' where id='" + LblId.Value + "' ");
                
            
            clear();
            list();
            ShowMessage("Record updated successfully", MessageType.Success);
            Button1.Text = "Submit";
            Cnn.Open();
        }
        else
        {



            //////////insert
            Cnn.Open();
            int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [usercheck]"));



            Cnn.ExecuteNonQuery("INSERT INTO usercheck (id,name,mobile,city,email,remark,count,rts) values ('" + ID + "','" + Txttitle.Text.Trim().Replace("'", "''") + "','" + txtmobile.Text.Trim().Replace("'", "''") + "','" + txtcity.Text.Trim().Replace("'", "''") + "','" + txemail.Text.Trim().Replace("'", "''") + "','" + txtreamrk.Text.Trim().Replace("'", "''") + "',0,getdate())");









            LblErr.Text = "Success !!!";
            Cnn.Close();



            clear();
            list();
            ShowMessage("Record submitted successfully", MessageType.Success);


        }
    }

    public void clear()
    {
        Txttitle.Text = "";
        txtmobile.Text = "";
        txemail.Text = "";
        txtreamrk.Text = "";
        txtcity.Text = "";

    }
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Cnn.Open();
        if (e.CommandName == "dea")
        {
            if (ListView1.Items.Count > 0)
            {
                for (int i = 0; i < ListView1.Items.Count; i++)
                {
                    if (((CheckBox)ListView1.Items[i].FindControl("ChkBox")).Checked == true)
                    {
                        LblId.Value = ((HiddenField)e.Item.FindControl("HdnID")).Value;

                        Cnn.ExecuteNonQuery("update M_CategoryMaster set Active=0 where Id='" + LblId.Value + "'");
                    }

                }
            }


        }

        Cnn.Close();

        if (e.CommandName == "del")
        {
            LblId.Value = ((HiddenField)e.Item.FindControl("HdnID")).Value;





            Cnn.Open();



            Cnn.ExecuteNonQuery("delete from [M_CategoryMaster] where id='" + LblId.Value + "'");

            list();
            ShowMessage("Record Delete successfully", MessageType.Success);

            Cnn.Close();





            //   string id = ((HiddenField)LstDay.Items[j].FindControl("HdnID")).Value;
            //  Cnn.ExecuteNonQuery("update Poster set  Active=0 where Id='" + LblId.Value + "'");
        }

        if (e.CommandName == "Edt")
        {
            LblId.Value = ((HiddenField)e.Item.FindControl("HdnID")).Value;


            Txttitle.Text = ((Label)e.Item.FindControl("name")).Text;
            txemail.Text = ((Label)e.Item.FindControl("email")).Text;
            txtcity.Text = ((Label)e.Item.FindControl("city")).Text;
           txtmobile.Text = ((Label)e.Item.FindControl("mobile")).Text;
           txtreamrk.Text = ((Label)e.Item.FindControl("remark")).Text;
            Button1.Text = "Update";


            Cnn.Open();
        }
    }


    
}