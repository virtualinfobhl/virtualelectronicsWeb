using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            list();
        }
    }

    protected void Imagetitlebind()
    {
        if (ddlColor != null)
        {
            foreach (ListItem li in ddlColor.Items)
            {
                li.Attributes["title"] = "../assets/Color/" + li.Text + ".jpg"; // Define the folder of image which is defined in the application.
            }
        }
    }

    public void list()
    {
        Cnn.Open();
        DataTable Dtt = Cnn.FillTable("Select 'MainCategoryId'=-1,'MainCategoryName'='Select Main Category' union  select MainCategoryId,MainCategoryName from M_CategoryMaster where  active=1", "Detail");
        DDMainCategory.DataSource = Dtt;
        DDMainCategory.DataBind();

        DataTable Dt1t = Cnn.FillTable("Select 'brandid'=-1,'brandName'='Select Brand' union  select brandid,brandName from brand where  active=1", "Detail");
        DDbrand.DataSource = Dt1t;
        DDbrand.DataBind();
        DataTable Dtcolor = Cnn.FillTable("select * from  ProductSizeQuantity where user_session="+ Session["usersession"] + "", "Detail");
        lstcolorlist.DataSource = Dtcolor;
        lstcolorlist.DataBind();
        if (Dtcolor.Rows.Count > 0)
        {
            imglist.Visible = true;
        }
        else
        {
            imglist.Visible = false;
        }
        DataTable Dt11t = Cnn.FillTable("Select 'id'=-1,'varient'='Select varient' union  select id,varient from varient where  active=1", "Detail");
        ddVariant.DataSource = Dt11t;
        ddVariant.DataBind();
        DataTable Dt = Cnn.FillTable("select * from color", "eee");
        if (Dt.Rows.Count > 0)
        {
            for (int i = 0; i < Dt.Rows.Count; i++)
            {

                ddlColor.Items.Add(new ListItem(Dt.Rows[i]["colorname"].ToString(), Dt.Rows[i]["ColorId"].ToString()));

            }
            Imagetitlebind();
        }
        Cnn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {



    }

    public void clear()
    {



    }
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }



    protected void Button1_Click1(object sender, EventArgs e)
    {
        Cnn.Open();
        int productid = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(productid)+1,1) From [product]"));
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [ProductSizeQuantity]"));


        if (FileUpload1.HasFile)
        {
            int image_id = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(image_id)+1,1) From [dtl_ProductGallery]"));
            byte[] image = FileUpload1.FileBytes;
            ImageHandler imageHandler = new ImageHandler();
            filename = productid + "_" + image_id + ".jpg";
            Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 500, 500);
            if (bmpmain != null)
            {
                bmpmain.Save(Server.MapPath("~/img/product/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            Cnn.ExecuteNonQuery("insert into dtl_ProductGallery (Image_Id,Product_Id,Priority,Active,ImageCode,ColorId,size) values ('" + image_id + "','" + productid + "',0,1,'" + filename + "','" + ddlColor.SelectedValue + "','" + ddVariant.SelectedValue + "')");
        }

        if (FileUpload2.HasFile)
        {
            int image_id = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(image_id)+1,1) From [dtl_ProductGallery]"));
            byte[] image = FileUpload2.FileBytes;
            ImageHandler imageHandler = new ImageHandler();
            filename = productid + "_" + image_id + ".jpg";
            Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 500, 500);
            if (bmpmain != null)
            {
                bmpmain.Save(Server.MapPath("~/img/product/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            Cnn.ExecuteNonQuery("insert into dtl_ProductGallery (Image_Id,Product_Id,Priority,Active,ImageCode,ColorId,size) values ('" + image_id + "','" + productid + "',0,1,'" + filename + "','" + ddlColor.SelectedValue + "','" + ddVariant.SelectedValue + "')");
        }
        if (FileUpload3.HasFile)
        {
            int image_id = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(image_id)+1,1) From [dtl_ProductGallery]"));
            byte[] image = FileUpload3.FileBytes;
            ImageHandler imageHandler = new ImageHandler();
            filename = productid + "_" + image_id + ".jpg";
            Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 500, 500);
            if (bmpmain != null)
            {
                bmpmain.Save(Server.MapPath("~/img/product/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            Cnn.ExecuteNonQuery("insert into dtl_ProductGallery (Image_Id,Product_Id,Priority,Active,ImageCode,ColorId,size) values ('" + image_id + "','" + productid + "',0,1,'" + filename + "','" + ddlColor.SelectedValue + "','" + ddVariant.SelectedValue + "')");
        }
        if (FileUpload4.HasFile)
        {
            int image_id = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(image_id)+1,1) From [dtl_ProductGallery]"));
            byte[] image = FileUpload4.FileBytes;
            ImageHandler imageHandler = new ImageHandler();
            filename = productid + "_" + image_id + ".jpg";
            Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 500, 500);
            if (bmpmain != null)
            {
                bmpmain.Save(Server.MapPath("~/img/product/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            Cnn.ExecuteNonQuery("insert into dtl_ProductGallery (Image_Id,Product_Id,Priority,Active,ImageCode,ColorId,size) values ('" + image_id + "','" + productid + "',0,1,'" + filename + "','" + ddlColor.SelectedValue + "','" + ddVariant.SelectedValue + "')");
        }
        if (FileUpload5.HasFile)
        {
            int image_id = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(image_id)+1,1) From [dtl_ProductGallery]"));
            byte[] image = FileUpload5.FileBytes;
            ImageHandler imageHandler = new ImageHandler();
            filename = productid + "_" + image_id + ".jpg";
            Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 500, 500);
            if (bmpmain != null)
            {
                bmpmain.Save(Server.MapPath("~/img/product/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            Cnn.ExecuteNonQuery("insert into dtl_ProductGallery (Image_Id,Product_Id,Priority,Active,ImageCode,ColorId,size) values ('" + image_id + "','" + productid + "',0,1,'" + filename + "','" + ddlColor.SelectedValue + "','" + ddVariant.SelectedValue + "')");
        }


        Cnn.ExecuteNonQuery("INSERT INTO [ProductSizeQuantity] (ID,ProductID,Size,Quantity,RTS,ColorId,urate,udiscount,arate,adiscount,user_session) values ('" + ID + "','" + productid + "','" + ddVariant.SelectedValue + "','" + txtQuantity.Text.Trim().Replace("'", "''") + "',GetDate(),'" + ddlColor.SelectedValue + "','" + txtuserprice.Text.Trim().Replace("'", "''") + "','" + txtDiscount.Text.Trim().Replace("'", "''") + "','" + txtagentprice.Text.Trim().Replace("'", "''") + "','" + txtadiscount.Text.Trim().Replace("'", "''") + "',"+ Session["usersession"] + ")");
        txtQuantity.Text = "";
        txtuserprice.Text = "";
        txtDiscount.Text = "";
        txtagentprice.Text = "";
        txtadiscount.Text = "";
        list();

        Cnn.Close();
    }
    protected void lSTProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            Cnn.Open();
            int productid = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(productid)+1,1) From [product]"));
            string ProductSizeQuantityid = ((HiddenField)e.Item.FindControl("ProductSizeQuantityid")).Value;
            string lblcolor = ((Label)e.Item.FindControl("lblcolor")).Text;
            SqlConnection sqlCon = new SqlConnection(@"Data Source=103.71.99.32; Database=virtualelectronics;initial catalog=virtualelectronics;User id=virtualelectronics;Password=electronics@55");
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from dtl_ProductGallery where Product_Id='" + productid + "' and ColorId='" + lblcolor + "'", sqlCon);
            DataTable Dt = new DataTable();
            sqlDa.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                for (int i = 0; i < Dt.Rows.Count; i++)
                {
                    File.Delete(Server.MapPath("~/img/product/" + Dt.Rows[i]["imagecode"]));
                    SqlCommand DeleteProColor = new SqlCommand("delete from  dtl_ProductGallery  where Product_Id='" + Dt.Rows[i]["Product_Id"] + "' and Image_Id='" + Dt.Rows[i]["Image_Id"].ToString() + "'", sqlCon);
                    string DeleteProColorExec = DeleteProColor.ExecuteNonQuery().ToString();
                }
            }
           
            Cnn.ExecuteNonQuery("delete from [ProductSizeQuantity] where ProductId='" + productid + "' and colorid='" + lblcolor + "' and id='" + ProductSizeQuantityid + "'");
            Cnn.Close();
            list();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Cnn.Open();
        string sale = "0";
        if (CheckBox1.Checked == true)
        {
            sale = "1";
        }
        int productid = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(productid)+1,1) From [product]"));
        int totalqty = Convert.ToInt32(Cnn.ExecuteScalar("select coalesce(sum(Quantity),0) as Quantity  from  ProductSizeQuantity where ProductID=" + productid + ""));
        string fristimg = Cnn.ExecuteScalar("select top 1 ImageCode  from  dtl_ProductGallery where Product_Id=" + productid + "").ToString();

        Cnn.ExecuteNonQuery("insert into  product (categoryid,productid,productname,qty,image,Brandid,Description,sale,active,visit,rts,metatitle) values ('" + DDMainCategory.SelectedValue + "','" + productid + "','" + txtproductname.Text.Trim().Replace("'", "''") + "','" + totalqty + "','" + fristimg + "','" + DDbrand.SelectedValue + "','" + CKEditor1.Value.Trim().Replace("'", "''") + "'," + sale + ",1,1,getdate(),'" + txtmetatitle.Text.Trim().Replace("'", "''") + "')");
        Cnn.Close();
        ShowMessage("Record Add successfully", MessageType.Success);
        txtproductname.Text = "";
        txtmetatitle.Text = "";
        CKEditor1.Value = "";
        Random random = new Random();
        int RandomNumber = random.Next(1, 10000);
        Session["usersession"] = RandomNumber;
        list();
    }
}