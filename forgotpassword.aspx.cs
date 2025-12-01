using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgotpassword : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }
    protected void LogIn_Click(object sender, EventArgs e)
    {
        Send_Mail();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    public void Send_Mail()
    {
        try
        {

            LblErr.Text = "Submit Successfully";
            if (Forgot.Text == "")
            {
                LblErr.Text = "Enter Your Register MailId..";
                Forgot.Focus();
                return;
            }
            Cnn.Open();
            string EmailId = Cnn.ExecuteScalar("select Password from Registration where EmailID='" + Forgot.Text + "'").ToString();
            Cnn.Close();
            try
            {

                MailMessage newmail = new MailMessage();
                MailAddress toadd = new MailAddress(Forgot.Text);
                MailAddress fromadd = new MailAddress("info@justfindmedia.com");
                newmail.Subject = "Forgot Password";
                string msg = "<div>";
                msg = DateTime.Now + "<br/>";
                msg += "<html><head><body><div style='border-style: double; border-width: 10px; border-color:#cccccc; padding:20px; Font-size:11px; color:black;'><br />";
                msg += "<b>Hello </b>,<br/><br>Your Password: " + EmailId + "<br /><br />";

                msg += "</div></body></head></html>";
                newmail.Body = msg;
                newmail.To.Add(toadd);
                newmail.From = fromadd;
                newmail.IsBodyHtml = true;
                SmtpClient sserver = new SmtpClient();
                sserver.Host = "mail.http://www.justfindmedia.com";
                sserver.Credentials = new NetworkCredential("info@justfindmedia.com", "Ravi@77");
                sserver.DeliveryMethod = SmtpDeliveryMethod.Network;
                sserver.Port = 25;
                sserver.Send(newmail);
                LblErr.Text = "Password sent successfully";
                Response.Write("<script LANGUAGE='JavaScript' >alert('Send Successful')</script>");
                Forgot.Text = "";
            }
            catch (Exception ex)
            {
                LblErr.Text = ex.Message;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}