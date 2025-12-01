using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GroupName"] == null)
        {
            Session["GroupName"] = "3";
        }
     

       
        Response.Cookies["Cart"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Remove("Cart");

        HttpCookie myCookie = new HttpCookie("Cart");
        myCookie.Expires = DateTime.Now.AddDays(-1d);
        Response.Cookies.Add(myCookie);
        
    }
}