using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static string b1 = "", b2 = "", b3 = "", m1 = "", m2 = "", active = "active",mid="1";
    public string testing = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GroupName"] == null)
        {
            Session["GroupName"] = "1";
        }

        if (!IsPostBack)
        { Load_Data("AND CategoryId=1"); }


        mid = "1";
    }


    public void Load_Data(String Cond = "")
    {
     //  ur = HttpContext.Current.Request.Url.AbsoluteUri;
        Cnn.Open();
        b1 = Cnn.ExecuteScalar("select link from [ads]   where id=1").ToString();
        b2 = Cnn.ExecuteScalar("select link from [ads]   where id=2").ToString();
        b3 = Cnn.ExecuteScalar("select link from [ads]   where id=3").ToString();
        m1 = Cnn.ExecuteScalar("select link from [ads]   where id=4").ToString();
        m2 = Cnn.ExecuteScalar("select link from [ads]   where id=5").ToString();
        string tt = Session["GroupName"].ToString();
        if (Session["GroupName"].ToString() == "1")
        {
            DataTable Dtt = Cnn.FillTable("select top 50  productid,productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1" + Cond + " order by newid()", "Detail");
            lstproduct.DataSource = Dtt;
            lstproduct.DataBind();
            DataTable Dtt1 = Cnn.FillTable("select top 20  productid,productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1  order by ProductID desc", "Detail");
              lstpro2.DataSource = Dtt1;
              lstpro2.DataBind();
            
        }

        if (Session["GroupName"].ToString() == "2")
        {
            DataTable Dtt = Cnn.FillTable("select top 50  productid,productname,image,sale,(select top 1 coalesce(arate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(adiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1  " + Cond + " order by newid()", "Detail");
            lstproduct.DataSource = Dtt;
            lstproduct.DataBind();
            DataTable Dt1t = Cnn.FillTable("select top 20  productid,productname,image,sale,(select top 1 coalesce(arate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(adiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1  order by ProductID desc", "Detail");
            lstpro2.DataSource = Dt1t;
            lstpro2.DataBind();
        }

        DataTable dthcth = Cnn.FillTable("Select MainCategoryid,MainCategoryName,case when MainCategoryid=1 then 1 else 0 end as  active from M_CategoryMaster ", "Detail");
        ListView2.DataSource = dthcth;
        ListView2.DataBind();
        
    }

  
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        Load_Data(" AND CategoryId=" + Convert.ToInt32(button.CommandArgument) + "");
        mid = Convert.ToInt32(button.CommandArgument).ToString();
        DataTable dthcth = Cnn.FillTable("Select MainCategoryid,MainCategoryName,case when MainCategoryid=" + Convert.ToInt32(button.CommandArgument) + " then 1 else 0 end as  active from M_CategoryMaster ", "Detail");
        ListView2.DataSource = dthcth;
        ListView2.DataBind();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#divpr';", true);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
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

  
    protected void LinkButton3_Click(object sender, EventArgs e)
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
    protected void LnkEdit_Click(object sender, EventArgs e)
    {
        Response.ContentType = "Application/apk";
        Response.AppendHeader("Content-Disposition", "attachment; filename=app.apk");
        Response.TransmitFile(Server.MapPath("~/app.apk"));
        Response.End();
    }
}