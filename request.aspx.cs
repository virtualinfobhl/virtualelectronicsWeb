using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class request : System.Web.UI.Page
{
    public formrequest model = new formrequest();
    public string signature;
    public string amount, firstname, email, txnid, phone, PhoneNumber, productinfo, surl, furl, lastname, curl, address1, address2, city, district, state, country, zipcode, udf1, udf2, udf3, udf4, udf5, udf6, udf7, udf8, udf9, udf10, pg = string.Empty;
    public string UserCode, UserOrderId, IP = string.Empty;
    public string action, hashcode, hashstring = string.Empty;

    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txnid)) // generating txnid
            {
                Random rnd = new Random();
                string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                txnid = strHash.ToString().Substring(0, 20);
                Application["txnid"] = txnid;
            }
            Cnn.Open();
            if (Application["Name"] == null || Application["MobileNo"] == null || Application["EmailId"] == null || Application["State"] == null || Application["City"] == null || Application["Zipcode"] == null || Application["ProductInfo"] == null)
            {
                //|| Session["ONetAmount"] == null 
                Response.Redirect("ProductsOrder.aspx");
            }
        //  amount = "1";//Order Amount
          amount = Application["Amount"].ToString();
                         //        productinfo = Session["ProductInfo"].ToString();
          productinfo = "New Order";
            action = "https://www.cashfree.com/checkout/post/submit";
           // action = "https://test.cashfree.com/billpay/checkout/post/submit";
            firstname = Application["Name"].ToString();
            email = Application["EmailId"].ToString();
            phone = Application["MobileNo"].ToString();

            Random random = new Random();
            int value = random.Next(10000001, 99999999);
            string secretKey = "62fa9d7c3d0a63e3e2e59b7b4bb0db7faacb6a37";
            model.appId = "435029b6933df11c5d42105ff20534";
            //string secretKey = "ef69446e3bbdeddbf3a2b3f50cd4eb60f58cd31a";
            //model.appId = "50932d25df8dffe61a2e7e60c23905";
            model.orderCurrency = "INR";
            model.orderId = "Order" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + "_" + value;
            model.orderAmount = amount;
            model.notifyUrl = Request.Form["notifyUrl"];
            model.returnUrl = "http://virtualelectronics.bharatdial.com/response.aspx";
           // model.returnUrl = "http://localhost:63730/response.aspx";
            model.orderNote = productinfo;
            model.customerName = firstname;
            model.customerEmail = email;
            model.customerPhone = phone;
       

            // string mode = "TEST";  //change mode to PROD for production
            string signatureData = "";
            PropertyInfo[] keys = model.GetType().GetProperties();
            keys = keys.OrderBy(key => key.Name).ToArray();

            foreach (PropertyInfo key in keys)
            {
                signatureData += key.Name + key.GetValue(model, null);
            }
            var hmacsha256 = new HMACSHA256(StringEncode(secretKey));
            byte[] gensignature = hmacsha256.ComputeHash(StringEncode(signatureData));
            signature = Convert.ToBase64String(gensignature);
            System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
            data.Add("appId", model.appId);
            data.Add("signature", signature);
            data.Add("orderNote", model.orderNote);
            data.Add("orderCurrency", model.orderCurrency);
            data.Add("customerName", model.customerName);
            data.Add("customerEmail", model.customerEmail);
            data.Add("customerPhone", model.customerPhone);
            data.Add("orderAmount", model.orderAmount);
            data.Add("notifyUrl", model.notifyUrl);
            data.Add("returnUrl", model.returnUrl);
            data.Add("orderId", model.orderId);
            string strForm = PreparePOSTForm(action, data);
            Page.Controls.Add(new LiteralControl(strForm));
        }
        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");
            //Response.Redirect("Home.aspx");
        }
        //model.appId = Request.Form["appId"];
        //model.orderId = Request.Form["orderId"];
        //model.orderAmount = Request.Form["orderAmount"];
        //model.orderCurrency = Request.Form["orderCurrency"];
        //model.orderNote = Request.Form["orderNote"];
        //model.customerName = Request.Form["customerName"];
        //model.customerEmail = Request.Form["customerEmail"];
        //model.customerPhone = Request.Form["customerPhone"];
        //model.notifyUrl = Request.Form["notifyUrl"];

        //ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "redirectPage();", true);
        //  ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "ModalClick();", true);
        //ViewData["signature"] = signature;
        //if (mode == "PROD")
        //{
        //    ViewData["url"] = "https://www.cashfree.com/checkout/post/submit";
        //}
        //else
        //{
        //    ViewData["url"] = "https://test.cashfree.com/billpay/checkout/post/submit";
        //}
    }

    public string Generatehash512(string text)
    {
        byte[] message = Encoding.UTF8.GetBytes(text);
        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;
    }

    private static byte[] StringEncode(string text)
    {
        var encoding = new UTF8Encoding();
        return encoding.GetBytes(text);
    }

    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }

        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
}