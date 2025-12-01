using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static string orderby = "order by  productname asc";
    string brandid = "", Varient="",colorid="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {

            Response.Redirect("index.aspx");
        }
        if (Session["GroupName"].ToString() == null)
        {
            Session["GroupName"] = "1";
        }
        string tt = Session["GroupName"].ToString();
        if (!string.IsNullOrEmpty(Request.QueryString["brandid"] as string))
        {
            

            brandid = " AND a.brandid=" + Request.QueryString["brandid"] + "";
        }
        if (!string.IsNullOrEmpty(Request.QueryString["varient"] as string))
        {


            Varient = " AND b.Size=" + Request.QueryString["varient"] + "";
        }
        if (!string.IsNullOrEmpty(Request.QueryString["color"] as string))
        {


            colorid = " AND b.ColorId=" + Request.QueryString["color"] + "";
        }
        if (!IsPostBack)
        { Load_Data(); }
    }

    public void Load_Data(String Cond = "")
    {
        Cnn.Open();
        if (Session["GroupName"].ToString() == "1")
        {
            DataTable Dtt1 = Cnn.FillTable("select distinct top 50  a.productid,SUBSTRING(a.productname, 1,18) as productname,a.image,a.sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=a.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=a.ProductID) as discount from product as a   join  ProductSizeQuantity as b  on a.ProductID=b.ProductID where a.active=1  and categoryid=" + Request.QueryString["id"] + " " + Cond + " " + Varient + " " + brandid + " "+colorid+" " + orderby + "", "Detail");
            lstpro2.DataSource = Dtt1;
            lstpro2.DataBind();

        }
        if (Session["GroupName"].ToString() == "2")
        {
            DataTable Dtt1 = Cnn.FillTable("select distinct top 50  a.productid,SUBSTRING(a.productname, 1,18) as productname,a.image,a.sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=a.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=a.ProductID) as discount from product as a   join  ProductSizeQuantity as b  on a.ProductID=b.ProductID where a.active=1  and categoryid=" + Request.QueryString["id"] + " " + Cond + " " + Varient + " " + brandid + " " + colorid + " " + orderby + "", "Detail");
            lstpro2.DataSource = Dtt1;
            lstpro2.DataBind();
        }



        if (!string.IsNullOrEmpty(Request.QueryString["brandid"] as string))
        {

            DataTable Dtt1 = Cnn.FillTable("select distinct  a.id,a.varient from varient as a inner join ProductSizeQuantity as b on a.id=b.size INNER JOIN PRODUCT as c on b.ProductID=c.ProductID where c.brandid=" + Request.QueryString["brandid"] + " and  c.categoryid=" + Request.QueryString["id"] + "", "Detail");
            ListView2.DataSource = Dtt1;
            ListView2.DataBind();
            if (Dtt1.Rows.Count > 0)
            {
                variantdiv.Visible = true;
            }            
        }

        if (!string.IsNullOrEmpty(Request.QueryString["varient"] as string))
        {

            DataTable Dtt1 = Cnn.FillTable("select distinct  a.ColorId,a.ColorName from color as a inner join ProductSizeQuantity as b on a.ColorId=b.ColorId inner join product as c on b.productid=c.productid where b.size=" + Request.QueryString["varient"] + "  and c.categoryid=" + Request.QueryString["id"] + " and c.brandid=" + Request.QueryString["brandid"] + " order by  a.ColorName asc", "Detail");
            lstcolor.DataSource = Dtt1;
            lstcolor.DataBind();
            if (Dtt1.Rows.Count > 0)
            {
                colordiv.Visible = true;
            }
        }
        DataTable Dtt2 = Cnn.FillTable("Select distinct a.brandid,a.brandname from brand as a  INNER JOIN PRODUCT as c on a.brandid=c.brandid where c.categoryid=" + Request.QueryString["id"] + "", "Detail");
        lstbrand.DataSource = Dtt2;
        lstbrand.DataBind();
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
   


    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;

        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [TrnCart]"));

        string cartcolor = Cnn.ExecuteScalar("select top 1 colorid from  dtl_ProductGallery where Product_Id=" + Convert.ToInt32(button.CommandArgument) + "").ToString();
        string colorname = Cnn.ExecuteScalar("select ColorName from  color where ColorId=" + cartcolor + "").ToString();
        string cartvariant = Cnn.ExecuteScalar("select top 1 Size from  ProductSizeQuantity where ProductId=" + Convert.ToInt32(button.CommandArgument) + "").ToString();

        if (Session["userid"] == null)
        {
            if (Request.Cookies["Cart"] == null || Request.Cookies["Cart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["Cart"].Value = trncartid;
                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + ",0," + Convert.ToInt32(button.CommandArgument) + ",1," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {


                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["Cart"].Value + ",0," + Convert.ToInt32(button.CommandArgument) + ",1," + cartvariant + "," + cartcolor + ",1,GetDate())");
                // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");

            }
        }
        else
        {
            if (Request.Cookies["Cart"] == null || Request.Cookies["Cart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["Cart"].Value = trncartid;
                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + "," + Session["userid"] + "," + Convert.ToInt32(button.CommandArgument) + ",1," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {


                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["Cart"].Value + "," + Session["userid"] + "," + Convert.ToInt32(button.CommandArgument) + ",1," + cartvariant + "," + cartcolor + ",1,GetDate())");
                // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");

            }

        }

        Cnn.Close();

    }


    protected void LinkButton3_Click1(object sender, EventArgs e)
    {
        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [wishlist]"));
        LinkButton button = (LinkButton)sender;


        string cartcolor = Cnn.ExecuteScalar("select top 1 colorid from  dtl_ProductGallery where Product_Id=" + Convert.ToInt32(button.CommandArgument) + "").ToString();
        string colorname = Cnn.ExecuteScalar("select ColorName from  color where ColorId=" + cartcolor + "").ToString();
        string cartvariant = Cnn.ExecuteScalar("select top 1 Size from  ProductSizeQuantity where ProductId=" + Convert.ToInt32(button.CommandArgument) + "").ToString();




        if (Session["userid"] == null)
        {
            Response.Redirect("userlogin.aspx");
        }

        else
        {
            string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [wishlist]").ToString();

            Cnn.ExecuteNonQuery("insert into wishlist (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + ",'1','" + Session["userid"] + "'," + Convert.ToInt32(button.CommandArgument) + ",1," + cartvariant + "," + cartcolor + ",1,GetDate())");
            //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
            Response.Redirect("wishlist.aspx");
        }

        Cnn.Close();
    }

    
}