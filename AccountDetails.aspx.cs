using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountDetails : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
  public static   string refercode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        Cnn.Open();
        refercode = Cnn.ExecuteScalar("select rcode from  register where userid=" + Session["UserId"] + "").ToString();
        Cnn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        try
        {
            Cnn.Open();
            foreach (ListViewItem myListViewItem in ListView1.Items)
            {
                // string id = ((Label)myListViewItem.FindControl("lblid")).Text;
                TextBox TxtName = ((TextBox)myListViewItem.FindControl("TxtName"));
                TextBox Txtaddress = ((TextBox)myListViewItem.FindControl("Txtaddress"));
                TextBox TxtMobile = ((TextBox)myListViewItem.FindControl("TxtMobile"));
                TextBox Txtemail = ((TextBox)myListViewItem.FindControl("TxtEmail"));
                TextBox Txtpincode = ((TextBox)myListViewItem.FindControl("txtpincode"));
                Label id = (Label)myListViewItem.FindControl("LblErr") as Label;
                
                Cnn.Open();
                Cnn.ExecuteNonQuery("update  register set name='" + TxtName.Text.Trim() + "',Address='" + Txtaddress.Text.Trim() + "',MobileNumber='" + TxtMobile.Text.Trim() + "',EmailId='" + Txtemail.Text.Trim() + "',ZipCode='" + Txtpincode.Text + "'  where UserId='" + Session["UserId"] + "'");
                Cnn.Close();
                id.Text = "changed successfully";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "window.location.href = '#data-step3'", true);
            Cnn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}