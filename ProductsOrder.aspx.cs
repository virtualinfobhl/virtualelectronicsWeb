using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductsOrder : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
//    ClsQuantity objQty = new ClsQuantity();
    API api = new API();
    BaseUrl api1 = new BaseUrl();
    string ProductInfo = "";
    public static int TotAmt = 0, Realprice = 0, totaldis = 0;
    int ordercount = 0, UserTotalCashPoint, PromoCodeId = 0, PromoCodeAmt = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("userlogin.aspx");
        }
        if (!IsPostBack)
        {
            UserDetailes();
            LoadProducts();
          
        }

    }



    public void UserDetailes()
    {
        try
        {
            DataSet ds = new DataSet();
            Cnn.Open();
            Cnn.FillDataSet(ds, "select a.*,b.District_Name as  ShippingDistrict,c.State_Name as ShippingState from register as a inner join Loc_District as b on a.District =b.District_Code inner join Loc_State as c on a.State=c.State_Code where a.userid='" + Session["UserId"] + "'", "Admin_Login");
         
            Cnn.Close();
            lblname.Text = ds.Tables[0].Rows[0]["name"].ToString();
            lbladdress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            lblcity.Text = ds.Tables[0].Rows[0]["ShippingDistrict"].ToString();
            lblstate.Text = ds.Tables[0].Rows[0]["ShippingState"].ToString();
            lblmobile.Text = ds.Tables[0].Rows[0]["MobileNumber"].ToString();
            lblmailid.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
            lblpincode.Text = ds.Tables[0].Rows[0]["Zipcode"].ToString();
            lblWallet.Text = ds.Tables[0].Rows[0]["Wallet"].ToString();
            ordercount = Convert.ToInt32(ds.Tables[0].Rows[0]["OrderCount"].ToString());
          
            if (Convert.ToInt32(lblWallet.Text) <= 0)
            {
                DivWallet.Visible = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void LoadProducts()
    {

        string Sql = "select a.id,a.productid,a.color,a.Size,b.productname,a.Quantity,b.image from trncart as a inner join  product as b on a.productid=b.productid Where a.UserId=" + Session["UserId"] + "";
           
            DataTable Dt = Cnn.FillTable(Sql, "Dt");
      
            lstcart.DataSource = Dt;
            lstcart.DataBind();

            Cnn.Open();
            TotAmt = 0; Realprice = 0; totaldis = 0;
            for (int i = 0; i < lstcart.Items.Count; i++)
            {
                Label lblquantity = lstcart.Items[i].FindControl("lblquantity") as Label;

                Label LblTotalAmoun111t = lstcart.Items[i].FindControl("LblTotalAmoun111t") as Label;
                Label productid = lstcart.Items[i].FindControl("productid") as Label;
                Label lblcolor = lstcart.Items[i].FindControl("lblcolor") as Label;
                Label lblSize = lstcart.Items[i].FindControl("lblSize") as Label;
                LblTotalAmoun111t.Text = Cnn.ExecuteScalar("select (urate*" + lblquantity.Text + ") as urate from ProductSizeQuantity  where ProductId='" + productid.Text + "' and Size='" + lblSize.Text + "' and colorid='" + lblcolor.Text + "'").ToString();
                TotAmt += Convert.ToInt32(Cnn.ExecuteScalar("select (urate*" + lblquantity.Text + ") as urate from ProductSizeQuantity  where ProductId='" + productid.Text + "' and Size='" + lblSize.Text + "' and colorid='" + lblcolor.Text + "'"));
                totaldis += Convert.ToInt32(Cnn.ExecuteScalar("select (udiscount*" + lblquantity.Text + ") as udiscount  from ProductSizeQuantity  where ProductId='" + productid.Text + "' and Size='" + lblSize.Text + "' and colorid='" + lblcolor.Text + "'"));


            }


            lbltotaldilverycharge.Text = api.GetSingleData("/slider/GetCourier/" + Session["UserId"].ToString() + "/" + lblstate.Text + "");
            
            Cnn.Close();
            
            Realprice = TotAmt - totaldis;

            lbltotalamount.Text = Realprice.ToString();
            LblNetAmount.Text = (Realprice + Convert.ToInt32(lbltotaldilverycharge.Text)).ToString();
            LblPaidAmount.Text = LblNetAmount.Text;
            //    LblPaidAmount.Text = "1";
            if (ChkWallet.Checked == true)
            {

                if (Convert.ToInt32(lblWallet.Text) > 0)
                {
                    lblWallet2.Text = (Convert.ToInt32(lbltotalamount.Text) * 5 / 100).ToString();
                    if (Convert.ToInt32(lblWallet2.Text) > Convert.ToInt32(lblWallet.Text))
                    {
                        LblPaidAmount.Text = (Convert.ToInt32(LblNetAmount.Text) - Convert.ToInt32(lblWallet.Text)).ToString();
                        lblWallet2.Text = lblWallet.Text;
                    }
                    else
                    {
                        LblPaidAmount.Text = (Convert.ToInt32(LblNetAmount.Text) - Convert.ToInt32(lblWallet2.Text)).ToString();

                    }

                }
            
        }
    }


    protected void ChkWallet_CheckedChanged(object sender, EventArgs e)
    {
        if (ChkWallet.Checked == true)
        {
            Walletdiv.Visible = true;

        }
        else
        {
            Walletdiv.Visible = false;
        }
        LoadProducts();
    }
    protected void LnkOrderConfirm_Click(object sender, EventArgs e)
    {
        Application["Name"] = lblname.Text; Application["Address"] = lbladdress.Text;
        Application["MobileNo"] = lblmobile.Text; Application["EmailId"] = lblmailid.Text; Application["City"] = lblcity.Text;
        Application["State"] = lblstate.Text; Application["Zipcode"] = lblpincode.Text;
        Application["DeliveryFees"] = lbltotaldilverycharge.Text;
        if (ChkWallet.Checked == true)
        {
            Application["IsWalletDeduct"] = true;
        }
        else
        {
            Application["IsWalletDeduct"] = false;
        }
        string Addamount = "0";
       

        //
        //online  pera meter
        if (!string.IsNullOrEmpty(lblWallet2.Text))
        {
            Application["WalletAmount"] = lblWallet2.Text;
        }
        else
        {
            Application["WalletAmount"] = "0";
        }
        Application["AddAmount"] = Addamount;
        Application["ProductInfo"] = ProductInfo; Application["Amount"] = LblNetAmount.Text; Application["DCharges"] = lbltotaldilverycharge.Text;
        Application["UserId"] = Session["UserId"].ToString();
        //

        if (RdbCash.Checked == true)
        {
            try
            {
                Order Obj = new Order();
                Obj.Usercode = Convert.ToInt32(Session["UserId"].ToString()); Obj.Paymode = "Cash"; Obj.TrnId = ""; Obj.TrnStatus = ""; Obj.ShippingName = lblname.Text;
                Obj.ShippingAddress = lbladdress.Text; Obj.ShippingMobileNo = lblmobile.Text; Obj.ShippingEmailId = lblmailid.Text;
                Obj.ShippingCity = lblcity.Text; Obj.ShippingZipcode = lblpincode.Text; Obj.ShippingStats = lblstate.Text; Obj.PromoCodeAmount = PromoCodeAmt; Obj.PromoCodeId = PromoCodeId; Obj.OrderThrough = "Web";
                Obj.DeliveryFees =Convert.ToInt32(lbltotaldilverycharge.Text);
                if (ChkWallet.Checked == true)
                {
                    Obj.IsWalletDeduct = true;
                }
                else
                {
                    Obj.IsWalletDeduct = false;
                }

                Obj.DeliveryFees = Convert.ToInt32(lbltotaldilverycharge.Text);
                if (!string.IsNullOrEmpty(lblWallet2.Text))
                {
                    Obj.WalletAmount = Convert.ToInt32(lblWallet2.Text);
                }
                else
                {
                    Obj.WalletAmount = 0;
                }
               
                api.PostData("/Order/GenerateOrder", Obj);

                Response.Redirect("Ordersuccess.aspx", false);
                //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Placed Successfully!!')", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        else
        {
            Response.Redirect("request.aspx");
        }

    }



    protected void RdbOnine_CheckedChanged(object sender, EventArgs e)
    {
        if (RdbOnine.Checked == true)
        {
            DivWallet.Visible = false;
          
        }
        LoadProducts();
    }
    protected void RdbCash_CheckedChanged(object sender, EventArgs e)
    {
        if (RdbCash.Checked == true)
        {
            DivWallet.Visible = false;
            Walletdiv.Visible = false;
        }
        ChkWallet.Checked = false;
        LoadProducts();
    }
}
//Condition for Online and Offline

//Condition for Online 