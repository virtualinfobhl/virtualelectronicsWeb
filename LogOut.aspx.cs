using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["District"] == null)
        //{
        //    Response.Redirect("Index.aspx");
        //}
        //
        try
        {
            Session["GroupName"] = null;
            Session["UserId"] = null;
            Response.Redirect("Index.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}