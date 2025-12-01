using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for BaseUrl
/// </summary>
public class BaseUrl
{
    public string Url()
    {
        string ApiURLLink = "http://virtualelectronics.virtualappstore.in/api/";
        return ApiURLLink;
    }

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
    //public static string SendSMS(string Mobile, string Message)
    //{
    //    try
    //    {
    //        string Gateway = Msg.Gateway.Regular;
    //        string UserName = "virtual349836";
    //        string Password = "5288";
    //        string gsmSenderId = "CTstor";
    //        Mobile = Msg.CountryCode(Mobile);
    //        Message = Message.Replace("&", "%26");
    //        Message = Message.Replace("+", "%2B");
    //        //string baseurl = "";
    //        //string baseurl = "http://msg2.virtualinfosystems.com/ComposeSMS.aspx?username=" + UserName + "&password=" + Password + "&sender=" + gsmSenderId + "&to=" + Mobile + "&message=" + Message + "&priority=1&dnd=1&unicode=0";
    //        string baseurl = "http://kit19.com/ComposeSMS.aspx?username=" + UserName + "&password=" + Password + "&sender=" + gsmSenderId + "&to=" + Mobile + "&message=" + Message + "&priority=1&dnd=1&unicode=0";
    //        WebClient client = new WebClient();
    //        Stream data = client.OpenRead(baseurl);
    //        StreamReader reader = new StreamReader(data);
    //        string s = reader.ReadToEnd();
    //        data.Close();
    //        reader.Close();
    //        return (s);
    //    }
    //    catch (Exception Ex)
    //    {
            
    //        return ("");
    //    }
    //}    
    /*--------- end SMS--------------------------------------------------------------------------------------*/
    #endregion

   
}
