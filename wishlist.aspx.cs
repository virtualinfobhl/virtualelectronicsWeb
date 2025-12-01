using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wishlist : System.Web.UI.Page
{

    ClsConnection Cnn = new ClsConnection();
   public static int TotAmt = 0, Realprice = 0, totaldis = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadCart();

    }

    public void LoadCart()
    {
        string Sql = "select a.id,a.productid,a.color,a.Size,b.productname,a.Quantity,b.image from wishlist as a inner join  product as b on a.productid=b.productid ";
        string Sql_Inner = "";
        if (Session["UserId"] != null)
        {
            Sql_Inner = " Where a.UserId=" + Session["UserId"] + "";
        }


        else
        {
            if (Request.Cookies["Cart"] != null)
            {
                if (Request.Cookies["Cart"].Value != null)
                {
                    Sql_Inner = " Where a.CartId=" + Request.Cookies["Cart"].Value + "";
                }
            }
        }


        if (Sql_Inner != "")
        {
            Sql = Sql + Sql_Inner;
            Cnn.Open();
            DataTable Dt = Cnn.FillTable(Sql, "Dt");
            LstCart.DataSource = Dt;
            LstCart.DataBind();

            if (LstCart.Items.Count == 0)
            {
              //  emptycart.Visible = true;
              CartBox.Visible = false;

            }
            
            if (Dt.Rows.Count > 0)
            {
                for (int i = 0; i < Dt.Rows.Count; i++)
                {
                 //   TotAmt += Convert.ToInt32(Dt.Rows[i]["Price"].ToString());
                  //  Realprice += Convert.ToInt32(Dt.Rows[i]["Rate"].ToString());
                  //  totaldis += Convert.ToInt32(Dt.Rows[i]["Discount"].ToString());
                }
            }
            //Add: 28Jan18,NehaA
            Cnn.Open();
            TotAmt = 0; Realprice = 0; totaldis = 0;
            for (int i = 0; i < LstCart.Items.Count; i++)
            {
                Label lblquantity = LstCart.Items[i].FindControl("lblquantity") as Label;
                DropDownList DDQty = LstCart.Items[i].FindControl("DDQuantity") as DropDownList;
                DDQty.SelectedValue = lblquantity.Text;
                Label productid = LstCart.Items[i].FindControl("productid") as Label;
                Label lblcolor = LstCart.Items[i].FindControl("lblcolor") as Label;
                Label lblSize = LstCart.Items[i].FindControl("lblSize") as Label;
                TotAmt += Convert.ToInt32(Cnn.ExecuteScalar("select (urate*" + DDQty.SelectedValue + ") as urate from ProductSizeQuantity  where ProductId='" + productid.Text + "' and Size='" + lblSize.Text + "' and colorid='" + lblcolor.Text + "'"));
                totaldis += Convert.ToInt32(Cnn.ExecuteScalar("select (udiscount*" + DDQty.SelectedValue + ") as udiscount  from ProductSizeQuantity  where ProductId='" + productid.Text + "' and Size='" + lblSize.Text + "' and colorid='" + lblcolor.Text + "'"));

               
            }
            Cnn.Close();

            Realprice = TotAmt - totaldis;
          
        }
    }
    protected void DDQuantity_SelectedIndexChanged(object sender, EventArgs e)
    { Cnn.Open();
      DropDownList DDQuantity = sender as DropDownList;
           Control item = DDQuantity.Parent.FindControl("id");
        Label lblid = ((Label)item.FindControl("id"));

        Cnn.ExecuteNonQuery("update wishlist set Quantity=" + DDQuantity.SelectedValue + " where id=" + lblid.Text + "");

          Cnn.Close();

          Response.Redirect("wishlist.aspx");

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        
        Cnn.Open();
        Cnn.ExecuteNonQuery("delete from  wishlist  where id=" + button.CommandArgument + "");

        Cnn.Close();

        Response.Redirect("wishlist.aspx");
    }
}