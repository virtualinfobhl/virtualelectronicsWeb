using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Imaging;
public partial class test : System.Web.UI.Page
{
    private string constring = ConfigurationManager.ConnectionStrings["Friendsmobile"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {


      
        if (!IsPostBack)
        {
              int count = 1;
        if (count == 1)
        {
            string tt = "hello ";
            count++;
        }}

        //if (!IsPostBack)
        //{
        //    DeleteFile();
        //    GetData();
        //}
        //if (!IsPostBack)
        //{
        //    if (Request.Cookies["Cart1"] != null)
        //    {
        //        if (Request.Cookies["Cart1"].Value != null)
        //        {
        //            Label1.Text = Request.Cookies["Cart1"].Value;
        //        }
        //    }



        //    HttpContext context = HttpContext.Current;
        //    if (context.Request.Cookies["Cart1"] != null)
        //    {
        //        // return the id
        //        Label1.Text = context.Request.Cookies["Cart1"].Value;
        //    }
        //}
    }


    private void GetData()
    {
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("select * from webslider ", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
 
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Cookies["Cart1"].Value = "123";
        Request.Cookies["Cart1"].Expires = DateTime.Now.AddDays(30);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
      //  Request.Cookies.Clear();
      //  Response.Cookies.Clear();
        if (Request.Cookies["Cart1"] != null)
        {
            Response.Cookies["Cart1"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Remove("Cart1");

            HttpCookie myCookie = new HttpCookie("Cart1");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        HttpContext context = HttpContext.Current;
        if (context.Request.Cookies["Cart1"] != null)
        {
            // return the id
            Label1.Text = context.Request.Cookies["Cart1"].Value;
        }
        else
        {
            Label1.Text = "not data";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text=Generatehash512("");    
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        string filePath = "";
        using (ZipFile zip = new ZipFile())
        {
            zip.AlternateEncodingUsage = ZipOption.AsNecessary;
            zip.AddDirectoryByName("Files");
            foreach (GridViewRow row in GridView1.Rows)
            {

                filePath = (row.FindControl("lblFilePath") as Label).Text;
                zip.AddFile(filePath, "Files");
                
            }

            Response.Clear();
            Response.BufferOutput = false;
            string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
            Response.ContentType = "application/zip";
            Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
            zip.Save(Response.OutputStream);
            Response.End();
        }


    }

    public string FilePath(object fileData)
    {
        byte[] bytes = (byte[])(fileData);
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        MemoryStream ms = new MemoryStream(bytes, 0, bytes.Length);
        ms.Write(bytes, 0, bytes.Length);
        System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
        string newFile = Guid.NewGuid().ToString() + ".jpeg";
        string filePath = Path.Combine(Server.MapPath("~/img/webSlider/"), newFile);
        image.Save(filePath, ImageFormat.Jpeg);
        return filePath;
    }
    private void DeleteFile()
    {
        System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/img/webSlider/"));
        foreach (FileInfo file in di.GetFiles())
        {
            file.Delete();
        }
    }

    public string ConvertImage(object binaryImage)
    {
        byte[] bytes = (byte[])(binaryImage);
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        return "data:image/png;base64," + base64String;
    }
}