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

public partial class EditProductlist : System.Web.UI.Page
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
       
    }

    protected void lstcolorlist_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "DeActive")
        {
            Cnn.Open();
            try
            {
                Cnn.BeginTrans();
                String Sql1 = "", Sql2 = "", Sql3 = "", Sql4 = "";
                if (lstcolorlist.Items.Count > 0)
                {
                    for (int i = 0; i < lstcolorlist.Items.Count; i++)
                    {
                        if (((CheckBox)lstcolorlist.Items[i].FindControl("ChkBoxDA")).Checked == true)
                        {

                            string ProductId = ((Label)lstcolorlist.Items[i].FindControl("LblProductId")).Text;
                            Sql1 = Sql1 + "; Update Product set Active=1 where ProductId='" + ProductId + "';";

                        }
                        else
                        {
                            string ProductId = ((Label)lstcolorlist.Items[i].FindControl("LblProductId")).Text;
                            Sql1 = Sql1 + "; Update Product set Active=0 where ProductId='" + ProductId + "';";
                        }

                    }
                    //Cnn.ExecuteNonQuery("Update [Store].Product set Active=0 where ProductId='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update [Store].dtl_ProductGallery set Active=0 where Product_Id='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update ProductSizeQuantity set Active=0 where ProductId='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update [Store].dtl_Productcolor set Active=0 where ProductId='" + ProductId + "'");
                    if (Sql1 != "")
                    {
                        String Sql = Sql1 + Sql2 + Sql4;
                        Cnn.ExecuteNonQuery(Sql);
                    }
                }
                Cnn.CommitTrans();
            }
            catch (SqlException ex)
            {
                Cnn.CommitTrans();
            }
            Cnn.Close();
            lstcolorlist.DataBind();
        }
    }
}