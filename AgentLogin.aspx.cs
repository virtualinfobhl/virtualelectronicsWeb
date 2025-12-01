using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentLogin : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void LogIn_Click(object sender, EventArgs e)
    {

        if (Request.Cookies["Cart"] == null)
        {
            if (TxtUser.Text == "")
            {
                LblErr.Text = "Please Enter User Name";
                return;
            }

            if (TxtPass.Text == "")
            {
                LblErr.Text = "Please Enter Password";
                return;
            }
            DataSet ds = new DataSet();
            Cnn.Open();

            Cnn.FillDataSet(ds, "select * from register  Where MobileNumber = '" + TxtUser.Text.Replace("'", "''") + "'COLLATE SQL_Latin1_General_CP1_CS_AS and Password = '" + TxtPass.Text.Replace("'", "''") + "'", "Admin_Login");
            Cnn.Close();
            if (ds.Tables[0].Rows.Count == 0)
            {
                LblErr.Text = "Please Enter Correct Username & Password";
            }
            else
            {
                LblErr.Text = "";
                Session["UserId"] = ds.Tables[0].Rows[0]["UserId"].ToString();
                Session["UserName"] = ds.Tables[0].Rows[0]["name"].ToString();
                Session["Groupid"] = ds.Tables[0].Rows[0]["Groupid"].ToString();
                Response.Cookies["UserId"].Value = ds.Tables[0].Rows[0]["UserId"].ToString();
                // Response.Cookies["Name"].Expires = DateTime.Now.AddDays(1);
                Response.Redirect("Index.aspx");
            }
        }
        else
        {
            if (TxtUser.Text == "")
            {
                LblErr.Text = "Please Enter User Name";
                return;
            }

            if (TxtPass.Text == "")
            {
                LblErr.Text = "Please Enter Password";
                return;
            }
            DataSet ds = new DataSet();
            Cnn.Open();

            Cnn.FillDataSet(ds, "select * from register Where MobileNumber = '" + TxtUser.Text.Replace("'", "''") + "'COLLATE SQL_Latin1_General_CP1_CS_AS and Password = '" + TxtPass.Text.Replace("'", "''") + "' and active=1 ", "Admin_Login");
            Cnn.Close();
            if (ds.Tables[0].Rows.Count == 0)
            {
                LblErr.Text = "Please Enter Correct Username & Password";
            }
            else
            {
                LblErr.Text = "";
                Session["UserId"] = ds.Tables[0].Rows[0]["UserId"].ToString();
                Session["MobileNumber"] = ds.Tables[0].Rows[0]["MobileNumber"].ToString();
                Session["Groupid"] = ds.Tables[0].Rows[0]["Groupid"].ToString();
                Response.Cookies["UserId"].Value = ds.Tables[0].Rows[0]["UserId"].ToString();
                // Response.Cookies["Name"].Expires = DateTime.Now.AddDays(1);
                Response.Redirect("ProductsOrder.aspx");
            }
        }



    }
    protected void Signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}