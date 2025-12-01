using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static string orderby = "order by  productname asc";
    string category = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GroupName"] == null)
        {
            Session["GroupName"] = "1";
        }

      
        if (!IsPostBack)
        { Load_Data(); }
    }

    public void Load_Data(String Cond = "")
    {
        Cnn.Open();
        if (Session["GroupName"] == "1")
        {

            DataTable Dtt1 = Cnn.FillTable("select top 50  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1 and productname like '%" + Request.QueryString["data"] + "%' " + Cond + " " + orderby + "", "Detail");
            lstpro2.DataSource = Dtt1;
            lstpro2.DataBind();

        }
        if (Session["GroupName"] == "2")
        {


            DataTable Dt1t = Cnn.FillTable("select top 50  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(arate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(adiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1 and categoryid=" + Request.QueryString["data"] + "  " + Cond + " " + orderby + "", "Detail");
            lstpro2.DataSource = Dt1t;
            lstpro2.DataBind();
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        Load_Data(" AND brandid=" + Convert.ToInt32(button.CommandArgument) + "");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        orderby = "order by price asc";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
        Load_Data(); 
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        orderby = "order by price desc";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
        Load_Data(); 
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        orderby = "order by discount asc";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
        Load_Data(); 

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        orderby = "order by discount desc";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
        Load_Data(); 
    }
    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        Load_Data(" AND categoryid=" + Convert.ToInt32(button.CommandArgument) + "");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#title';", true);
    }
}