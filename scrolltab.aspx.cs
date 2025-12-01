using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class scrolltab : System.Web.UI.Page
{
    BaseUrl api = new BaseUrl();
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateGridView();
    }

    public void PopulateGridView()
    {
        string apiUrl = "http://friendsmobile.virtualappstore.in/api/slider/Getnewproduct";
        object input = new
        {
            Name = "",
        };
        string inputJson = (new JavaScriptSerializer()).Serialize(input);
        WebClient client = new WebClient();
        client.Headers["Content-type"] = "application/json";
        client.Encoding = Encoding.UTF8;
        string json = client.DownloadString(apiUrl);
        ListView1.DataSource = (new JavaScriptSerializer()).Deserialize<List<newitem>>(json);
        ListView1.DataBind();

    }

    public class newitem
    {

        public string brandid { get; set; }
        public string brandname { get; set; }
        public string productname { get; set; }
        public int productid { get; set; }
    }
}