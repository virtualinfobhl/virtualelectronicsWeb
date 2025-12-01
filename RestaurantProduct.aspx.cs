using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminRestaurant_RestaurantProduct : System.Web.UI.Page
{
    ClsConnection cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        cnn.Open();
        if (!Page.IsPostBack)
        {
            if (Session["AdminCode"] != null)
            {
                ViewState["RestaurantID"] = Convert.ToString(cnn.ExecuteScalar("Select Restaurant_ID from [Restaurant]. Restaurant_Detail where Admin_Code='" + Session["AdminCode"] + "'"));
            }
            else
            {
                Response.Redirect("~/Admin.aspx");
            }
        }
        if (Session["AdminCode"] == null)
        {
            Response.Redirect("~/Admin.aspx");
        }
        else
        {
            SrcCategory.SelectParameters["Restaurant"].DefaultValue = Convert.ToString(ViewState["RestaurantID"]);
          //  SrcProduct.SelectParameters["RestaurantID"].DefaultValue = Convert.ToString(ViewState["RestaurantID"]);
        }


        if (!IsPostBack) {
            load();
        }
        cnn.Close();
    }


    public void load(string query="")
    {
        DataTable dt1 = cnn.FillTable("select A.Product_ID,A.Product_Name,A.Product_Detail,A.Product_Price,A.Restaurant_ID,A.Product_Unit,A.ProductCategory_ID,A.Veg,A.Nonveg,A.Discount,A.Active,B.Restaurant_Name,C.ProductCategory_Name from [Restaurant]. Restaurant_Product A join [Restaurant].Restaurant_Detail B on A.Restaurant_ID=B.Restaurant_ID join [Restaurant].RestaurantProduct_Category C on A.ProductCategory_ID=C.ProductCategory_ID where B.Restaurant_ID=" + ViewState["RestaurantID"] + " " + query + " order by A.Product_Name Asc", "Challan1");
        lstproduct.DataSource = dt1;
        lstproduct.DataBind();


        DataTable Dtc = cnn.FillTable("select distinct  a.* from [Restaurant].RestaurantProduct_Category  as a  inner join  [Restaurant].Restaurant_Product as b on A.ProductCategory_ID=B.ProductCategory_ID where b.Restaurant_Id=" + ViewState["RestaurantID"] + "  order by a.Priority asc", "Challan1");
        DropDownList2.DataSource = Dtc;
        DropDownList2.DataBind();
    }
    protected void LnkSubmit_Click(object sender, EventArgs e)
    {

        if (TxtName.Text == "")
        {
            Lblerr.Text = "Please insert product name";
            return;
        }
        if (DDCategory.SelectedItem.Text == "<--Select Food Category-->")
        {
            Lblerr.Text = "Please select food category";
            return;
        }

        if (Txtprice.Text == "")
        {
            Lblerr.Text = "Please insert product price";
            return;
        }
        cnn.Open();
        try
        {
            string productID = Convert.ToString(cnn.ExecuteScalar("select isnull(max(Product_ID),0)+1 from [Restaurant]. Restaurant_Product"));
            string productname = TxtName.Text.Replace("'", "''");
            string productdetail = TxtDetail.Text.Replace("'", "''");
            string price = Txtprice.Text.Replace("'", "''");
            string categoryid = DDCategory.SelectedValue;
            string restaurantid = Convert.ToString( ViewState["RestaurantID"]);
            string veg = "";
            string nonveg = "";
            string foodtype = DDfood.SelectedValue;
            switch (foodtype)
            {
                case "0":
                    veg = "0";
                    nonveg = "0";
                    break;
                case "1":
                    veg = "1";
                    nonveg = "0";
                    break;
                case "2":
                    veg = "0";
                    nonveg = "1";
                    break;
            }
            string discount = TxtDiscount.Text.Replace("'", "''");
            double Disc = 0;
            if (!string.IsNullOrEmpty(discount))
            {
                string DiscPercent = discount.Replace("%", "");
                double PricePerUnt = (Convert.ToDouble(price) * Convert.ToDouble(DiscPercent)) / 100;
                Disc = Math.Round(Convert.ToDouble(PricePerUnt), MidpointRounding.AwayFromZero);
                //Response.Write(Disc);
                //return;
            }
            cnn.ExecuteNonQuery("insert into [Restaurant].Restaurant_Product(Product_ID,Product_Name,Product_Detail,Product_Price,ProductCategory_ID,Restaurant_ID,Veg,Nonveg,Discount) values('" + productID + "','" + productname + "','" + productdetail + "','" + price + "','" + categoryid + "','" + restaurantid + "','" + veg + "','" + nonveg + "','" + Disc + "')");
            TxtDetail.Text = "";
            TxtDiscount.Text = "";
            TxtName.Text = "";
            Txtprice.Text = "";
            Lblerr.Text = "Your request have been submitted!!!";
            load();
        }
        catch (Exception ex)
        {
            Lblerr.Text = ex.Message;
        }
        cnn.Close();
    }
    protected void LnkCancel_Click(object sender, EventArgs e)
    {
        TxtDetail.Text = "";
        TxtDiscount.Text = "";
        TxtName.Text = "";
        Txtprice.Text = "";
        Lblerr.Text = "";
    }
    protected string setclass(int active)
    {
        string classToApply = string.Empty;
        if (active == 1)
        {
            classToApply = "greenRow";

        }
        else
        {
            classToApply = "redRow";
        }
        return classToApply;

    }
    protected void lstproduct_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        cnn.Open();
        if (e.CommandName == "Act")
        {
            foreach (ListViewItem mylst in lstproduct.Items)
            {
                CheckBox chkact = ((CheckBox)mylst.FindControl("ChkAct"));
                if (chkact.Checked == true)
                {
                    HiddenField Hdnid = ((HiddenField)mylst.FindControl("HdnID"));
                    string ProductID = Hdnid.Value;
                    cnn.ExecuteNonQuery("Update [Restaurant].Restaurant_Product set Active=1 where Product_ID='" + ProductID + "'");
                }
            }
            load();
        }

        if (e.CommandName == "Deact")
        {
            foreach (ListViewItem mylst in lstproduct.Items)
            {
                CheckBox chkact = ((CheckBox)mylst.FindControl("ChkDeact"));
                if (chkact.Checked == true)
                {
                    HiddenField Hdnid = ((HiddenField)mylst.FindControl("HdnID"));
                    string ProductID = Hdnid.Value;
                    cnn.ExecuteNonQuery("Update [Restaurant].Restaurant_Product set Active=0 where Product_ID='" + ProductID + "'");
                }
            }
            load();
        }

        if (e.CommandName == "Edt")
        {
            foreach (ListViewItem mylst in lstproduct.Items)
            {
            //{
            //    HiddenField Hdnid = ((HiddenField)mylst.FindControl("HdnCategory"));
            //    HiddenField HdnCategory = (e.Item.FindControl("HdnCategory") as HiddenField);
            //    DropDownList DDcat = (e.Item.FindControl("DDCategory") as DropDownList);

            //    string Catid = HdnCategory.Value;
            //    DDcat.Items.FindByValue(Catid).Selected = true;
                TextBox Txtprice = ((TextBox)mylst.FindControl("TxtPrice"));
                TextBox TxtDiscount = ((TextBox)mylst.FindControl("TxtDiscount"));
                Label Lblprice = ((Label)mylst.FindControl("LblPrice"));
                Label LblDiscount = ((Label)mylst.FindControl("LblDiscount"));

                Txtprice.Visible = true;
                TxtDiscount.Visible = true;
                Lblprice.Visible = false;
                LblDiscount.Visible = false;
            }
        }

        if (e.CommandName == "Upd")
        {
            foreach (ListViewItem mylst in lstproduct.Items)
            {

                TextBox Txtprice = ((TextBox)mylst.FindControl("TxtPrice"));
                TextBox TxtDiscount = ((TextBox)mylst.FindControl("TxtDiscount"));
                HiddenField Hdnid = ((HiddenField)mylst.FindControl("HdnID"));
                string ProductID = Hdnid.Value;
                double Disc = 0;
                if (Txtprice.Visible == true)
                {
                    if (!string.IsNullOrEmpty(TxtDiscount.Text))
                    {
                        string DiscPercent = TxtDiscount.Text.Replace("%", "");
                        double PricePerUnt = (Convert.ToDouble(Txtprice.Text) * Convert.ToDouble(DiscPercent)) / 100;
                        Disc = Math.Round(Convert.ToDouble(PricePerUnt), MidpointRounding.AwayFromZero);
                        //Response.Write(Disc);
                        //return;
                    }
                }
                cnn.ExecuteNonQuery("Update [Restaurant].Restaurant_Product set Product_Price='" + Txtprice.Text.Replace("'", "''") + "',Discount='" + Disc+ "' where Product_ID='" + ProductID + "'");
            }
            load();
        }
        cnn.Close();
    }
    protected void lstproduct_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string id = ((HiddenField)lstproduct.Items[e.ItemIndex].FindControl("HdnID")).Value;
        cnn.Open();
        cnn.ExecuteNonQuery("delete from [Restaurant]. Restaurant_Product where Product_ID='" + id + "'");
        
        cnn.Close();
        load();
    }
    protected void lstproduct_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        cnn.Open();
        try
        {
            string id = ((HiddenField)lstproduct.Items[e.ItemIndex].FindControl("HdnID")).Value;
            string ProductName = ((TextBox)lstproduct.Items[e.ItemIndex].FindControl("Txtname")).Text.Replace("'", "''");
            string price = ((TextBox)lstproduct.Items[e.ItemIndex].FindControl("TxtPrice")).Text.Replace("'", "''");
            string discount = ((TextBox)lstproduct.Items[e.ItemIndex].FindControl("TxtDiscount")).Text.Replace("'", "''");
            string foodtype = ((DropDownList)lstproduct.Items[e.ItemIndex].FindControl("DDfood")).SelectedValue;
            string CategoryID = ((DropDownList)lstproduct.Items[e.ItemIndex].FindControl("DDCategory")).SelectedValue;
            string ProductDetail = ((TextBox)lstproduct.Items[e.ItemIndex].FindControl("TxtDetail")).Text.Replace("'", "''");
            string veg = "";
            string nonveg = "";
            switch (foodtype)
            {
                case "0":
                    veg = "0";
                    nonveg = "0";
                    break;
                case "1":
                    veg = "1";
                    nonveg = "0";
                    break;
                case "2":
                    veg = "0";
                    nonveg = "1";
                    break;
            }

            double Disc = 0;

            if (!string.IsNullOrEmpty(discount))
                {
                    string DiscPercent = discount.Replace("%", "");
                    double PricePerUnt = (Convert.ToDouble(price) * Convert.ToDouble(DiscPercent)) / 100;
                    Disc = Math.Round(Convert.ToDouble(PricePerUnt), MidpointRounding.AwayFromZero);
                    //Response.Write(Disc);
                    //return;
                }
            cnn.ExecuteNonQuery("Update [Restaurant].Restaurant_Product set Product_Name='" + ProductName + "',Product_Detail='" + ProductDetail + "',Product_Price='" + price + "',ProductCategory_ID='" + CategoryID + "',Veg='" + veg + "',Nonveg='" + nonveg + "',Discount='" + Disc + "'where Product_ID='" + id + "'");
                
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        cnn.Close();
    }
    protected void lstproduct_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (lstproduct.EditIndex == (e.Item as ListViewItem).DataItemIndex)
        {
            HiddenField HdnCategory = (e.Item.FindControl("HdnCategory") as HiddenField);
            DropDownList DDcat = (e.Item.FindControl("DDCategory") as DropDownList);

            string Catid = HdnCategory.Value;
            DDcat.Items.FindByValue(Catid).Selected = true;

            HiddenField HdnVeg = (e.Item.FindControl("HdnVeg") as HiddenField);
            HiddenField HdnNonveg = (e.Item.FindControl("HdnNonveg") as HiddenField);
            DropDownList DDFood = (e.Item.FindControl("DDfood") as DropDownList);

            string veg = HdnVeg.Value;
            string Nonveg = HdnNonveg.Value;
            if (veg == "True" && Nonveg == "False")
            {
                DDFood.Items.FindByValue("1").Selected = true;
            }
            else if (veg == "False" && Nonveg == "True")
            {
                DDFood.Items.FindByValue("2").Selected = true;
            }
            else
            {
                DDFood.Items.FindByValue("0").Selected = true;
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string query = "";
        query = "and a.ProductCategory_ID="+ DropDownList2.SelectedValue+"";
        load(query);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string query = "";
        query = "and a.Product_Name like '%" + txtproductname.Text+ "%'";
        load(query);
    }
    protected void lstproduct_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}