using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.IO;

/// <summary>
/// Summary description for SendSMS
/// </summary>
public static class Module
{
    public static DataTable DtOrder;
 
    #region
    /*--------- start SMS -----------------------------------------------------------------------------------*/
    public static class Gateway
    {
        public static string High = "high";
        public static string Regular = "regular";
    }
    public static string CountryCode(string Mobile)
    {
        if (Mobile != "")
        {
            string MobileNo = "";
            char[] delimeter = new char[] { ',', ' ' };
            string[] mobileList = Mobile.Split(delimeter, StringSplitOptions.RemoveEmptyEntries);
            foreach (string mobile in mobileList)
            {
                MobileNo = MobileNo + mobile.Substring(mobile.Length - Math.Min(10, mobile.Length)) + ",";
            }
            MobileNo = MobileNo.Remove(MobileNo.LastIndexOf(','));
            return (MobileNo);
        }
        else
        {
            return ("");
        }
    }
    public static string SendSMS(string Mobile, string Message)
    {
//        Username: nalin349836
//Password: 24871
//IP-vCARGO
        try
        {
            string Gateway = Module.Gateway.Regular;
            string UserName = "Sailcom";
            string Password = "3476";
            string gsmSenderId = "SALCOM";
            Mobile = Module.CountryCode(Mobile);
            Message = Message.Replace("&", "%26");
            Message = Message.Replace("+", "%2B");
            //string baseurl = "";
            string baseurl = "http://msg2.virtualinfosystems.com/ComposeSMS.aspx?username=" + UserName + "&password=" + Password + "&sender=" + gsmSenderId + "&to=" + Mobile + "&message=" + Message + "&priority=1&dnd=1&unicode=0";
            // string baseurl = "http://www.msg2.virtualinfosystems.com/ComposeSMS.aspx?username=" + UserName + "&password=" + Password + "&sender=" + gsmSenderId + "&to=" + Mobile + "&message=" + Message + "&priority=1&dnd=1&unicode=0";
            WebClient client = new WebClient();
            Stream data = client.OpenRead(baseurl);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            data.Close();
            reader.Close();
            return (s);
        }
        catch (Exception Ex)
        {
            return ("");
        }
    }
    /*--------- end SMS--------------------------------------------------------------------------------------*/
    #endregion



    public static string GenOTP()
    {
        char[] charArr = "0123456789".ToCharArray();
        string strrandom = string.Empty;
        Random objran = new Random();
        int noofcharacters =6;
        for (int i = 0; i < noofcharacters; i++)
        {
            //It will not allow Repetation of Characters
            int pos = objran.Next(1, charArr.Length);
            if (!strrandom.Contains(charArr.GetValue(pos).ToString()))
                strrandom += charArr.GetValue(pos);
            else
                i--;
        }
        return strrandom;
    }

    public static bool SaveData(string CartID,string UserID,string GroupID,string PayMode,string Name="",string MobileNo="",string EmnailID="",int State=-1,string City="",string Address="" ,string ZipCode="",string OrderThrough="Web",string TrnID="",string TrnStatus="")
    {
        bool Result = false;
        string strEmailCart = "";

     
     
        try
        {
            ClsConnection Cnn = new ClsConnection();
            Cnn.Open(); 
            if (CartID != null)
            {

                DataView view = new DataView(Module.DtOrder);
                view.RowFilter = "ID=" + CartID + "";
                DataTable Dt=view.ToTable();
                string strMsg = "";
                String ID = Cnn.ExecuteScalar("Select IsNull(MAX(OrderID)+1,1) as OrderID From TrnOrderMain").ToString();
               
                String InvoiceNo = "SL/01/0" + ID + "";
                String Sql = "";int TotQuantity=0,TotAmt=0,DelvyFees=50;

                for (int i = 0; i < Dt.Rows.Count; i++)
                {
                    TotQuantity+=Convert.ToInt32(Dt.Rows[i]["Quantity"].ToString());
                    TotAmt+=Convert.ToInt32(Dt.Rows[i]["Price"].ToString());
                    Sql = Sql + "INSERT INTO TrnOrderDetail(OrderID,InvoiceNo,ProductId,Quantity,Discount,Amount) VALUES(" + ID + ",'" + InvoiceNo + "','" + Dt.Rows[i]["ProductID"].ToString() + "'," + Dt.Rows[i]["Quantity"].ToString() + "," + Dt.Rows[i]["Discount"].ToString() + "," + Dt.Rows[i]["Price"].ToString() + ");";
                    Sql = Sql + ";Update Im_CurrentStock Set Quantity=Quantity-'" + Dt.Rows[i]["Quantity"].ToString() + "' Where ProductId='" + Dt.Rows[i]["ProductID"].ToString() + "'";
                    Sql = Sql + ";Delete  From  TrnCart Where Id='" + CartID + "' And  ProductID='" + Dt.Rows[i]["ProductID"].ToString() + "'";
                    // Send Email
                   
                    strEmailCart = strEmailCart + "<tr><td align='center'><img src='http://sailcomstore.com/img/products/" + Dt.Rows[i]["ProductID"].ToString() + ".jpg' width='45' height='56' padding-top='10' padding-bottom='10'/></td><td padding='10' align='center'>" + Cnn.ExecuteScalar("Select ProductName From M_ProductMaster Where ProductID=" + Dt.Rows[i]["ProductID"].ToString() + "").ToString() + " </td><td padding='10' align='center'>" + Dt.Rows[i]["Quantity"].ToString() + "</td><td padding='10' align='center'>" + Dt.Rows[i]["Discount"].ToString() + "</td><td padding='10' align='center'>" +Dt.Rows[i]["Price"].ToString() +"</td></tr>";
                    strMsg = strMsg + Dt.Rows[i]["ProductName"].ToString().Substring(0, 20) + "..." + "(" + Dt.Rows[i]["Quantity"] + ")";
                }
                if (Sql != "")
                {
                    Sql = Sql + ";INSERT INTO TrnOrderMain(OrderID,InvoiceNo,UserId,GroupID,TotalQuantity,DeliveryFees,TotalAmount,PayMode,TrnID,TrnStatus,Name,MobileNo,EmailID,StateCode,City,ZipCode,Address,OrderThrough)";
                    Sql = Sql + " VALUES(" + ID + ",'" + InvoiceNo + "'," + UserID + ","+GroupID+"," + TotQuantity + "," + DelvyFees + "," + TotAmt + ",'"+PayMode+"','"+TrnID+"','"+TrnStatus+"','"+Name+"','"+MobileNo+"','"+EmnailID+"','"+State+"','"+City+"',"+ZipCode+",'"+Address+"','"+OrderThrough+"')";
                    
                    Cnn.ExecuteNonQuery(Sql);
                    Mail(InvoiceNo, PayMode, strEmailCart, EmnailID, Name, Address, City, State, TotAmt, DelvyFees,MobileNo,strMsg);
                    Result = true;
                }
            }
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        return Result;
    }
    //, string Address, string City, string State
    public static void Mail(string Shipcode, string PayMode, string strEmailCart, string UserEmail, string Name, string Address, string City, int state, int TotAmt, int DelvyFees, string MobileNo,string Mesg)
    {
        ClsConnection Cnn = new ClsConnection();
        string SqlCity, SqlState;

        string strEmail_User, strEmail_Admin;
        Cnn.Open();
        SqlCity = Cnn.ExecuteScalar("Select District_Name  from Loc_District Where District_Code=" + City + "").ToString();
        SqlState = Cnn.ExecuteScalar("Select State_Name  from Loc_State Where State_Code=" + state + " ").ToString();
        Cnn.Close();
        strEmail_User = DateTime.Now + "<br/>";
        strEmail_User += "<html><head><body><div style='border-style: double; border-width: 10px; border-color:#cccccc; padding:20px; Font-size:11px; color:black;width:590px'><img src='http://sailcomstore.com/img/logo.png'  alt='logo'   style='height:100px;width:200px' border='0'/><br /><br />";
        strEmail_User += "Order No. : <b>" + Shipcode + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Date : <b>" + DateTime.Now + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PaymentMode : <b>"+PayMode +"</b><br><br/>";
        strEmail_User += "<strong></strong><br/><br/><body><table width='590' height='auto' border='1' cellpadding='0' cellspacing='0'><tr bgcolor='#cbc7c7'  align='center'><td height='30'>Image</td><td color='#ffffff'>Particulars</td><td>Qty.</td><td>Discount</td><td>Net Amount</td></tr>" + strEmailCart + "</table></body>";
        strEmail_User += "<table width='590' Font-size:'11'><tr><td align='right' style='padding-right:10'>Shipment Value&nbsp;&nbsp;&nbsp;<b>Rs." + TotAmt + " </b></td></tr><tr><td  align='right' style='padding-right:10'>Shipping Charge &nbsp;&nbsp;&nbsp;<b>" + DelvyFees + "</b></td></tr><tr><td><hr/></td></tr><tr><td align='right' style='padding-right:10'><b>Net Amount &nbsp;(GST Include)&nbsp;&nbsp;: Rs." + (Convert.ToInt32(DelvyFees) + Convert.ToInt32(TotAmt)).ToString() + "</b></td></tr><tr><td><hr/></td></tr></table><br/>";
        strEmail_User += "Subject to T&C on <a href='http://www.ankitsuitings.com'>www.sailcomstore.com</a><br/><br/>";
        strEmail_User += "<b>Delivery Address: </b><br/>";

        strEmail_User += Name+ "<br/>";
        strEmail_User += Address+ "<br/>";
        strEmail_User += SqlCity + "<br/>";
        strEmail_User += SqlState + "<br/><br/>";
        strEmail_User += "For any query or assistance, feel free to contact<br/>Thanks & Regards <br/><b>Mahesh Baheti</b><br/>Mobile No.  92144444,&nbsp;<br/>sailcom store<br/>GSTIN : 08AIIPB3182E1ZK  ";
        strEmail_User += "</div></body></head></html>";
        SendEmail(UserEmail, "New Order: www.sailcomstore.com", strEmail_User);

        // Admin Mail
        strEmail_Admin = DateTime.Now + "<br/>";
        strEmail_Admin += "<html><head><body style='width:50%'><div style='border-style: double; border-width: 10px; border-color:#cccccc; padding:20px; Font-size:11px; color:black;'><img src='http://sailcomstore.com/img/logo.png'  alt='logo'   style='height:100px;width:200px' border='0'/><br /><br />";
        strEmail_Admin += "Order No. : <b>" + Shipcode + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Date : <b>" + DateTime.Now + "</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PaymentMode : <b>" + PayMode + "</b><br><br/>";
        strEmail_Admin += "<strong>New Order </strong><br/><br/><body><table width='590' height='a uto' border='1' cellpadding='0' cellspacing='0'><tr bgcolor='#cbc7c7'  align='center'><td height='30'>Image</td><td color='#ffffff'>Particulars</td><td>Qty.</td><td>Discount</td><td>Net Amount</td></tr>" + strEmailCart + "</table></body>";
        strEmail_Admin += "<table width='590' Font-size:'11'><tr><td align='right' style='padding-right:10'>Shipment Value&nbsp;&nbsp;&nbsp;<b>Rs." + TotAmt + " </b></td></tr><tr><td  align='right' style='padding-right:10'>Shipping Charge &nbsp;&nbsp;&nbsp;<b>" + DelvyFees + "</b></td></tr><tr><td><hr/></td></tr><tr><td align='right' style='padding-right:10'><b>Net Amount &nbsp;(GST Include)&nbsp;&nbsp;: Rs." + (Convert.ToInt32(DelvyFees) + Convert.ToInt32(TotAmt)).ToString() + "</b></td></tr><tr><td><hr/></td></tr></table><br/>";
        strEmail_Admin += "Subject to T&C on <a href='http://www.ankitsuitings.com'>www.sailcomstore.com</a><br/><br/>";
        strEmail_Admin += "<b>Delivery Address: </b><br/>";

        strEmail_Admin += Name + "<br/>";
        strEmail_Admin += UserEmail + "<br/>";
        strEmail_Admin += Address + "<br/>";
        strEmail_Admin += SqlCity + "<br/>";
        strEmail_Admin += SqlState + "<br/><br/>";
        strEmail_User += "For any query or assistance, feel free to contact<br/>Thanks & Regards <br/><b>Mahesh Baheti</b><br/>Mobile No.  92144444,&nbsp;<br/>sailcom store<br/>GSTIN : 08AIIPB3182E1ZK  ";
        strEmail_Admin += "</div></body></head></html>";
        SendEmail("info@ankitsuitings.com", "New Order: www.sailcomstore.com", strEmail_Admin);//send email to store

        //msg
        string AdminMobile = "9214472437 ";
        //+91-94138 84119 
     string strMsg_User = "Thanks for Order No. " + Shipcode + Mesg +" Total Amount Rs." + TotAmt + "," + PayMode + ",Delivery Address: " + Address + ", " + City + "," + state + ". Delivery enquiry: http://sailcomstore.com/, 9214442437";
     string strMsg_Admin = "New Order Order No." + Shipcode + Mesg + " Total Amount Rs." + TotAmt + "," + PayMode + ",Delivery Address: " + Address + ", " + City + "," + state;
     SendSMS(MobileNo, strMsg_User); //send sms to user.
      SendSMS(AdminMobile, strMsg_Admin);//send sms to admin. 
        
    }


    #region
    /*--------- start Email -----------------------------------------------------------------------------------*/
    public static void SendEmail(string Receiver_Email, string Subject, string Message)
    {
        try
        {
            //************************************* E-mail system *********************************************************//
            System.Configuration.Configuration configurationFile = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~/web.config");
            System.Net.Configuration.MailSettingsSectionGroup mailSettings = configurationFile.GetSectionGroup("system.net/mailSettings") as System.Net.Configuration.MailSettingsSectionGroup;
            if (mailSettings != null)
            {
                int port = mailSettings.Smtp.Network.Port;
                string host = mailSettings.Smtp.Network.Host;
                string password = mailSettings.Smtp.Network.Password;
                string username = mailSettings.Smtp.Network.UserName;

                System.Net.Mail.MailMessage Msg = new System.Net.Mail.MailMessage();
                Msg.From = new System.Net.Mail.MailAddress(username);
                Msg.To.Add(Receiver_Email);
                Msg.Subject = "SailCom Store";
                Msg.Subject = Subject;
                Msg.Body = Message;

                Msg.IsBodyHtml = true;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = host;
                smtp.Port = port;
                smtp.Credentials = new System.Net.NetworkCredential(username, password);
                smtp.Send(Msg);
                Msg = null;
            }
            //*************************************************************************************************************//
        }
        catch (Exception Ex)
        {

        }
    }


   
    /*--------- end Email--------------------------------------------------------------------------------------*/
    #endregion
	}


