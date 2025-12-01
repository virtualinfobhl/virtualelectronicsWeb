using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dnestedapi : System.Web.UI.Page
{
    BaseUrl api = new BaseUrl();
    protected void Page_Load(object sender, EventArgs e)
    {

        gridviewlist();


    }

    public void PopulateGridView()
    {
        string apiUrl = "http://citystore.virtualappstore.in/api/SubCategory/GetSub/1";
        object input = new
        {
            Name = "",
        };
        string inputJson = (new JavaScriptSerializer()).Serialize(input);
        WebClient client = new WebClient();


        WebClient client1 = new WebClient();
        client1.Headers["Content-type"] = "application/json";
        var content = client1.DownloadString(apiUrl);
        var tr = JsonConvert.DeserializeObject<List<MainClass>>(content);
        ObservableCollection<MainClass> trends = new ObservableCollection<MainClass>(tr);
        // lstSubcategory.DataSource = trends;
        //lstSubcategory.DataBind();

        GridView1.DataSource = trends;
        GridView1.DataBind();





    }


    public void gridviewlist()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[4] 
  {
    new DataColumn("MainCategoryId", typeof(string)),
    new DataColumn("MainCategoryName", typeof(string)),
    new DataColumn("Image", typeof(string)),
    new DataColumn("SubCategory", typeof(string)),
  
  });
        string url = new System.Net.WebClient().DownloadString("http://citystore.virtualappstore.in/api/SubCategory/GetSub/1");
        JArray jsonArray = JArray.Parse(url);
        for (int i = 0; i < jsonArray.Count; i++)
        {
            MainClass isiData = (new
              JavaScriptSerializer()).Deserialize<MainClass>(jsonArray[i].ToString());
            for (int j = 0; j < isiData.SubCategory.Count; j++)
            {
                DataRow dr = dt.NewRow();
                dr["MainCategoryId"] = isiData.MainCategoryId;
                dr["MainCategoryName"] = isiData.MainCategoryName;
                dr["Image"] = isiData.Image;
                dr["SubCategory"] = isiData.SubCategory[j].subCategoryName;

                dt.Rows.Add(dr);
            }
        }
        if (dt.Rows.Count > 0)
        {
            //Bind DataTable to your GridView

            //    lstSubcategory.DataSource = dt;
            //    lstSubcategory.DataBind();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    public class MainClass
    {
        public string MainCategoryId { get; set; }
        public string MainCategoryName { get; set; }
        public string Image { get; set; }
        public List<SubCategory> SubCategory { get; set; }
    }

    public class SubCategory
    {
        public string SubCategoryId { get; set; }
        public string subCategoryName { get; set; }
        public string image { get; set; }

    }







    public class SearchResult
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public string Url { get; set; }
    }
}