using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewproduct : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static int price = 0, discount = 0, netamount = 0, tdiscount = 0;
    public static string metaimg1 = "", metaimg2 = "", metaimg3 = "", metaimg4 = "";
    public static string img1 = "hidden", img2 = "hidden", img3 = "hidden", img4 = "hidden", variant = "", cartcolor = "0", cartvariant = "-1";
    public static string productname = "", colorname = "", qty = "", brand = "", Description = "", sale = "", active = "", visit = "", categoryid = "", shortDescription = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["GroupName"] == null)
            {
                Session["GroupName"] = "1";
            }

            if (!IsPostBack)
            {
                imagelist();
                list();
                count();
                variant1();
                price1();
                colordiv();
            }
        }
        catch (Exception ex)
        {

            Response.Redirect("index.aspx");
        }

    }




    public void imagelist(String Cond = "")
    {

        metaimg1 = ""; metaimg2 = ""; metaimg3 = ""; metaimg4 = "";
        Cnn.Open();
        DataSet ds = new DataSet();
        Cnn.Open();

        int imgcount = Convert.ToInt32(Cnn.ExecuteScalar("select top 4 count(*) from dtl_ProductGallery  where Product_Id=" + Request.QueryString["id"] + "  " + Cond + ""));
        Cnn.FillDataSet(ds, "select top 4 ISNULL(imagecode, '') as ImageCode from dtl_ProductGallery  where Product_Id=" + Request.QueryString["id"] + "  " + Cond + "", "Admin_Login");
        Cnn.Close();
        img1 = "hidden"; img2 = "hidden"; img3 = "hidden"; img4 = "hidden";

        if (imgcount > 0)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageCode"].ToString()))
            {
                img1 = ds.Tables[0].Rows[0]["ImageCode"].ToString();
            }
            metaimg1 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img1 + "\" />";
        }
        if (imgcount > 1)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageCode"].ToString()))
            {
                img1 = ds.Tables[0].Rows[0]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[1]["ImageCode"].ToString()))
            {
                img2 = ds.Tables[0].Rows[1]["ImageCode"].ToString();
            }
            metaimg1 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img1 + "\" />";
            metaimg2 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img2 + "\" />";



        }
        if (imgcount > 2)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageCode"].ToString()))
            {
                img1 = ds.Tables[0].Rows[0]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[1]["ImageCode"].ToString()))
            {
                img2 = ds.Tables[0].Rows[1]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[2]["ImageCode"].ToString()))
            {
                img3 = ds.Tables[0].Rows[2]["ImageCode"].ToString();
            }
            metaimg1 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img1 + "\" />";
            metaimg2 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img2 + "\" />";
            metaimg3 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img3 + "\" />";



        }
        if (imgcount > 4)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageCode"].ToString()))
            {
                img1 = ds.Tables[0].Rows[0]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[1]["ImageCode"].ToString()))
            {
                img2 = ds.Tables[0].Rows[1]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[2]["ImageCode"].ToString()))
            {
                img3 = ds.Tables[0].Rows[2]["ImageCode"].ToString();
            }
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[3]["ImageCode"].ToString()))
            {
                img4 = ds.Tables[0].Rows[3]["ImageCode"].ToString();
            }

            metaimg1 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img1 + "\" />";
            metaimg2 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img2 + "\" />";
            metaimg3 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img3 + "\" />";
            metaimg4 = "<meta property=\"og:image\" content=\"http://http://virtualelectronics.bharatdial.com/img/product/" + img4 + "\" />";


        }





        Cnn.Close();
    }

    public void price1(String Cond = "")
    {
        Cnn.Open();
        DataSet ds = new DataSet();


        Cnn.FillDataSet(ds, "select top 1* from ProductSizeQuantity  where productid=" + Request.QueryString["id"] + " " + Cond + "", "Admin_Login");
        if (Session["GroupName"].ToString() == "1")
        {
            price = Convert.ToInt32(ds.Tables[0].Rows[0]["urate"]);
            discount = Convert.ToInt32(ds.Tables[0].Rows[0]["udiscount"]);
            tdiscount = price * discount / 100;
            netamount = price - discount;
            if (discount > 0)
            {
                dis_dic.Visible = true;
                //    strike_price.Visible = true;
            }
        }
        if (Session["GroupName"].ToString() == "2")
        {
            price = Convert.ToInt32(ds.Tables[0].Rows[0]["arate"]);
            discount = Convert.ToInt32(ds.Tables[0].Rows[0]["adiscount"]);
            tdiscount = price * discount / 100;
            netamount = price - discount;
            if (discount > 0)
            {
                dis_dic.Visible = true;
                //   strike_price.Visible = true;
            }
        }
        Cnn.Close();
    }
    public void count()
    {
        Cnn.Open();

        string variantcount = Cnn.ExecuteScalar("select count(*) from ProductSizeQuantity where  Productid=" + Request.QueryString["id"] + " and colorid!=1").ToString();
        string colorcount = Cnn.ExecuteScalar("select count(*) from dtl_ProductGallery where  Product_id=" + Request.QueryString["id"] + " and colorid!=1").ToString();
        if (variantcount == "0")
        {
            variantbox.Visible = false;
        }
        else
        { variantbox.Visible = true; }

        if (colorcount == "0")
        {
            colorbox.Visible = false;
        }
        else
        { colorbox.Visible = true; }

        Cnn.Open();
        if (Session["GroupName"].ToString() == "1")
        {

            DataTable Dtt1 = Cnn.FillTable("select top 10  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1 and   Productid !=" + Request.QueryString["id"] + "  order by newid()", "Detail");
            DataTable Dtt = Cnn.FillTable("select top 5  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1 and  categoryid= (select categoryid from product where Productid=" + Request.QueryString["id"] + ") and brandid= (select brandid from product where Productid=" + Request.QueryString["id"] + ") and   Productid !=" + Request.QueryString["id"] + "  order by newid()", "Detail");
            lstproduct.DataSource = Dtt1;
            lstproduct.DataBind();


            ListView2.DataSource = Dtt;
            ListView2.DataBind();

        }
        if (Session["GroupName"].ToString() == "2")
        {
            DataTable Dtt1 = Cnn.FillTable("select top 10  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(urate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(udiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1 and   Productid !=" + Request.QueryString["id"] + "  order by newid()", "Detail");
            DataTable Dtt = Cnn.FillTable("select top 5  productid,SUBSTRING(productname, 1,10) as productname,image,sale,(select top 1 coalesce(arate,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as price,(select  top 1 coalesce(adiscount,0) from ProductSizeQuantity where ProductSizeQuantity.ProductID=product.ProductID) as discount from product where active=1  and  categoryid= (select categoryid from product where Productid=" + Request.QueryString["id"] + ") and brandid= (select brandid from product where Productid=" + Request.QueryString["id"] + ") and   Productid !=" + Request.QueryString["id"] + " order by newid()", "Detail");
            lstproduct.DataSource = Dtt1;
            lstproduct.DataBind();
            ListView2.DataSource = Dtt;
            ListView2.DataBind();
        }
        Cnn.Open();
    }
    public void colordiv(String Cond = "")
    {
        DataTable Dtt = Cnn.FillTable("select distinct colorid from  dtl_ProductGallery  where Product_Id=" + Request.QueryString["id"] + "", "Detail");
        lstcolor.DataSource = Dtt;
        lstcolor.DataBind();
    }

    public void variant1(String Cond = "")
    {
        Cnn.Open();
        int vcount = Convert.ToInt32(Cnn.ExecuteScalar("select  top 1 count(*) from varient as a inner join ProductSizeQuantity as b on a.id=b.size where ProductId=" + Request.QueryString["id"] + " " + Cond + ""));
        variant = "";
        if (vcount > 0)
        {
            string vart = Cnn.ExecuteScalar("select  top 1 a.varient from varient as a inner join ProductSizeQuantity as b on a.id=b.size where ProductId=" + Request.QueryString["id"] + " " + Cond + "").ToString();
            variant = "(" + vart + ")";
        }

        cartcolor = Cnn.ExecuteScalar("select top 1 colorid from  dtl_ProductGallery where Product_Id=" + Request.QueryString["id"] + "").ToString();
        colorname = Cnn.ExecuteScalar("select ColorName from  color where ColorId=" + cartcolor + "").ToString();
        cartvariant = Cnn.ExecuteScalar("select top 1 Size from  ProductSizeQuantity where ProductId=" + Request.QueryString["id"] + "").ToString();
        Cnn.Open();
    }
    public void list()
    {
        Cnn.Open();
        DataSet ds = new DataSet();


        Cnn.FillDataSet(ds, "select* from product  where productid=" + Request.QueryString["id"] + "", "Admin_Login");

        brand = Cnn.ExecuteScalar("select image from brand where brandid=" + ds.Tables[0].Rows[0]["Brandid"] + "").ToString();
        categoryid = Cnn.ExecuteScalar("select MainCategoryName from M_CategoryMaster where MainCategoryid=" + ds.Tables[0].Rows[0]["categoryid"] + "").ToString();


        productname = ds.Tables[0].Rows[0]["productname"].ToString();
        int Quantity = Convert.ToInt32(Cnn.ExecuteScalar("select top 1 Quantity from ProductSizeQuantity where ProductID=" + Request.QueryString["id"] + ""));
        for (int i = 1; i <= Quantity; i++)
        {
            DDQuantity.Items.Add(Convert.ToString(i));
        }
        Description = ds.Tables[0].Rows[0]["Description"].ToString();
        sale = ds.Tables[0].Rows[0]["sale"].ToString();
        visit = ds.Tables[0].Rows[0]["visit"].ToString();
        Page.Title = ds.Tables[0].Rows[0]["metatitle"].ToString() + "JUSTFIND MEDIA";
        shortDescription = ds.Tables[0].Rows[0]["metatitle"].ToString();
        string Tags = ds.Tables[0].Rows[0]["productname"].ToString();
        var title = "<meta property=\"og:title\" content=\"" + Tags + "\"/>";

        litMeta.Text = title + metaimg1 + metaimg2 + metaimg3 + metaimg4;

        //  litMeta.Text = Tags +img+mimg2+mimg3+mimg4;
        Cnn.Close();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        imagelist(" AND colorid=" + Convert.ToInt32(button.CommandArgument) + "");
        cartcolor = button.CommandArgument;

        list();
        Cnn.Open();
        colorname = Cnn.ExecuteScalar("select ColorName from  color where ColorId=" + cartcolor + "").ToString();
        int Quantity = Convert.ToInt32(Cnn.ExecuteScalar("select top 1 Quantity from ProductSizeQuantity where ProductID=" + Request.QueryString["id"] + " AND colorid=" + Convert.ToInt32(button.CommandArgument) + ""));
        Cnn.Close();
        DDQuantity.Items.Clear();
        for (int i = 1; i <= Quantity; i++)
        {
            DDQuantity.Items.Add(Convert.ToString(i));
        }
        DDQuantity.DataBind();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#colorbox';", true);
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        variant1(" AND a.id=" + Convert.ToInt32(button.CommandArgument) + "");
        price1(" AND size=" + Convert.ToInt32(button.CommandArgument) + "");
        colordiv(" AND size=" + Convert.ToInt32(button.CommandArgument) + "");

        Cnn.Open();
        int Quantity = Convert.ToInt32(Cnn.ExecuteScalar("select top 1 Quantity from ProductSizeQuantity where ProductID=" + Request.QueryString["id"] + " AND size=" + Convert.ToInt32(button.CommandArgument) + ""));
        Cnn.Close();
        list();
        DDQuantity.Items.Clear();

        for (int i = 1; i <= Quantity; i++)
        {
            DDQuantity.Items.Add(Convert.ToString(i));
        }
        DDQuantity.DataBind();
        cartvariant = button.CommandArgument;

        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#variantbox';", true);

    }



    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {

        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [TrnCart]"));


        if (Session["userid"] == null)
        {
            if (Request.Cookies["Cart"] == null || Request.Cookies["Cart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["Cart"].Value = trncartid;
                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + ",0," + Request.QueryString["id"] + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {

                if (IsRecordAlreadyExist() == false)
                {
                    Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                    Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["Cart"].Value + ",0," + Request.QueryString["id"] + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                    // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                    Response.Redirect("Cart.aspx");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Item Already In Cart')</script>");
                }
            }
        }
        else
        {
            if (Request.Cookies["Cart"] == null || Request.Cookies["Cart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["Cart"].Value = trncartid;
                Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + "," + Session["userid"] + "," + Request.QueryString["id"] + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {

                if (IsRecordAlreadyExist() == false)
                {
                    Request.Cookies["Cart"].Expires = DateTime.Now.AddDays(30);
                    Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["Cart"].Value + "," + Session["userid"] + "," + Request.QueryString["id"] + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                    // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                    Response.Redirect("Cart.aspx");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Item Already In Cart')</script>");
                }
            }

        }

        Cnn.Close();
    }

    private bool IsRecordAlreadyExist()
    {
        try
        {
            Cnn.Open();
            String Sql = "Select Count(*) From TrnCart Where ProductID='" + Request.QueryString["id"] + "' And Id='" + Request.Cookies["Cart"].Value + "'";
            int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());

            if (Count > 0)
                return true;

            else
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [wishlist]"));




        if (Session["userid"] == null)
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Please Login')</script>");
        }

        else
        {
            string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [wishlist]").ToString();

            Cnn.ExecuteNonQuery("insert into wishlist (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + ",'1','" + Session["userid"] + "'," + Request.QueryString["id"] + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
            //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
            Response.Redirect("wishlist.aspx");
        }

        Cnn.Close();
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
}










