using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Txtusername.Text == "")
        {
            LblErr.Text = "Please enter User Name";
            return;
        }
        if (Txtpassword.Text == "")
        {
            LblErr.Text = "Please enter Password";
            return;
        }
        DataSet ds = new DataSet();
        Cnn.Open();
        Cnn.FillDataSet(ds, "select * from [usercheck] where mobile='" + Txtpassword.Text.Replace("'", "''") + "'", "Admin_Login");
        Cnn.Close();
        if (ds.Tables[0].Rows.Count == 0)
        {
            LblErr.Text = "Please Enter Correct  Password";
        }
        else
        {
            LblErr.Text = "";
            Cnn.Open();
            Cnn.ExecuteNonQuery("Update usercheck set Count = Count + 1  where  mobile='" + Txtpassword.Text.Replace("'", "''") + "'");
            Cnn.Close();
            Random random = new Random();
            int RandomNumber = random.Next(1, 10000);
            Session["usersession"] = RandomNumber;
            Session["Admin_id"] = ds.Tables[0].Rows[0]["Id"].ToString();
            Response.Redirect("AddCategory.aspx");
        }
    }
}