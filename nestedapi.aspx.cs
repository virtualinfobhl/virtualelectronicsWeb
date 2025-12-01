using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Text;
using System.Collections;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Data.SqlClient;
public partial class nestedapi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        List<Customer> customers = new List<Customer>();

        DataTable dt = GetData("SELECT top 1* From M_CategoryMaster");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Customer customer = new Customer
            {
                MainCategoryid = Convert.ToString(dt.Rows[i]["MainCategoryid"])
                ,
                MainCategoryName = Convert.ToString(dt.Rows[i]["MainCategoryName"])
                ,
                image = Convert.ToString(dt.Rows[i]["image"])
                ,
                product = GetOrders(Convert.ToString(dt.Rows[i]["MainCategoryid"]))
            };
            customers.Add(customer);
        }

      
        var json = new JavaScriptSerializer().Serialize(customers);
        divOutput.InnerHtml = json;
    }


    public List<product> GetOrders(string customerId)
    {
        List<product> orders = new List<product>();
        DataTable dt = GetData(string.Format("SELECT Top 1 productid,productname,qty,image frOM product Where categoryid ='{0}'", customerId));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            orders.Add(new product
            {
                productid = Convert.ToInt32(dt.Rows[i]["productid"])
                ,
                productname = Convert.ToString(dt.Rows[i]["productname"])
                ,
                qty = Convert.ToInt32(dt.Rows[i]["qty"])
                ,
                image = Convert.ToString(dt.Rows[i]["image"])
                ,
                order1 = GetOrders1(Convert.ToString(dt.Rows[i]["productid"]))
            });
        }
        return orders;
    }



    public List<order1> GetOrders1(string productidId)
    {
        List<order1> orders = new List<order1>();
        DataTable dt = GetData(string.Format("SELECT Top 1 OrderId,InvoiceNo frOM TrnOrderDetail Where productid ='{0}'", productidId));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            orders.Add(new order1
            {
                InvoiceNo = Convert.ToInt32(dt.Rows[i]["InvoiceNo"])
                ,
                OrderId = Convert.ToString(dt.Rows[i]["OrderId"])
              
             
            });
        }
        return orders;
    }
    private DataTable GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["Friendsmobile"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    return dt;

                }
            }
        }
    }
    public class Customer
    {
        public string MainCategoryid { get; set; }
        public string MainCategoryName { get; set; }
        public string image { get; set; }
        public List<product> product { get; set; }


        




    }



    public class product
    {
        public int productid { get; set; }
        public string productname { get; set; }
        public int qty { get; set; }
        public string image { get; set; }
        public List<order1> order1 { get; set; }
    }
    

     public class order1
    {
        public int InvoiceNo { get; set; }
        public string OrderId { get; set; }
      
    }







}