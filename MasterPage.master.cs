using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    ClsConnection cnn = new ClsConnection();
    public static string variantcount = "0", wishlistcount = "0", username = "", visible = "visible";
    protected void Page_Load(object sender, EventArgs e)
    {
        count();
    }

    public void count()
    {

        if (Session["UserId"] == null)
        {
            notlogin.Visible = true;
            login.Visible = false;
           
        }
        else
        {
            cnn.Open();
            username = variantcount = cnn.ExecuteScalar("select name from register where userid=" + Session["UserId"] + "").ToString();
            notlogin.Visible = false;
            login.Visible = true;
            cnn.Close();
        }
            string Sql_Inner = "",sql="";
            if (Session["UserId"] != null)
            {
                visible = "hidden";
                Sql_Inner = " Where UserId=" + Session["UserId"] + "";
                sql = " Where b.UserId=" + Session["UserId"] + "";
            }


            else
            {
                if (Request.Cookies["Cart"] != null)
                {
                    if (Request.Cookies["Cart"].Value != null)
                    {
                        Sql_Inner = " Where CartId=" + Request.Cookies["Cart"].Value + "";
                        sql = " Where b.CartId=" + Request.Cookies["Cart"].Value + "";
                    }
                }
            }

            cnn.Open();
            if (sql != "")
            {

                DataTable Dtt = cnn.FillTable("select a.image,a.productname,b.Quantity,b.id from product as a inner join trncart as b on a.productid=b.productid " + sql + "", "Detail");
                ListView2.DataSource = Dtt;
                ListView2.DataBind();
                ListView3.DataSource = Dtt;
                ListView3.DataBind();
            }
            if (Sql_Inner != "")
            {
                variantcount = cnn.ExecuteScalar("select count(*) from trncart " + Sql_Inner + "").ToString();
                wishlistcount = cnn.ExecuteScalar("select count(*) from [wishlist] " + Sql_Inner + "").ToString();
            } cnn.Close();
      
    }
    protected void connect_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?data=" + TextBox1.Text + "");
    }
    protected void LnkEdit_Click(object sender, EventArgs e)
    {
        Response.ContentType = "Application/apk";
        Response.AppendHeader("Content-Disposition", "attachment; filename=app.apk");
        Response.TransmitFile(Server.MapPath("~/app-debug.apk"));
        Response.End();
    }
}
