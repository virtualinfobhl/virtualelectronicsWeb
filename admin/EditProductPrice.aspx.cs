using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProductPrice : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static string UserCode = "";
    public string colo = "";
    static string flag = "", flag1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void lstcolorlist_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "EdPrice")
        {
            LinkButton LnkEdPrice = (LinkButton)LstProduct.FindControl("LnkEdPrice") as LinkButton; LnkEdPrice.Visible = false;
            LinkButton LnkUpPrice = (LinkButton)LstProduct.FindControl("LnkUpPrice") as LinkButton; LnkUpPrice.Visible = true;
            LinkButton LnkCancelPrice = (LinkButton)LstProduct.FindControl("LnkCancelPrice") as LinkButton; LnkCancelPrice.Visible = true;
            for (int i = 0; i < LstProduct.Items.Count; i++)
            {
                ListView lstColorSize = (ListView)LstProduct.Items[i].FindControl("LstColorSizeProduct") as ListView;
                lstColorSize.DataBind();
                for (int j = 0; j < lstColorSize.Items.Count; j++)
                {
                    Label LblProductId = (Label)lstColorSize.Items[j].FindControl("LblColorProductId");
                    Label LblPrice = (Label)lstColorSize.Items[j].FindControl("LblPrice");
                    Label LblAgntsPrice = (Label)lstColorSize.Items[j].FindControl("lblAgentRate");
                    Label LblDiscount = (Label)lstColorSize.Items[j].FindControl("lblDis");
                    Label LblAgntDiscount = (Label)lstColorSize.Items[j].FindControl("lblAgntDiscount");
                    TextBox TxtDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtDisSize");
                    TextBox TxtAgntDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtAgentDiscount");
                    Label LblQty = (Label)lstColorSize.Items[j].FindControl("LblQty");
                    Label LblNewDiscount = (Label)lstColorSize.Items[j].FindControl("lblNewDiscount");
                    //TextBox TxtQty = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                    TextBox TxtPrice = (TextBox)lstColorSize.Items[j].FindControl("TxtPrice");
                    TextBox TxtAgntPrice = (TextBox)lstColorSize.Items[j].FindControl("txtAgentRate");
                    TextBox TxtQty = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                    //Label LblUnt = (Label)lstColorSize.Items[i].FindControl("lblUnit");
                    //Label LblWeight = (Label)lstColorSize.Items[i].FindControl("lblWeight");
                    //TextBox TxtWeight = (TextBox)lstColorSize.Items[i].FindControl("txtWeight");
                    //DropDownList DDUnit = (DropDownList)lstColorSize.Items[i].FindControl("DDselectQuantity1");

                    //LblPrice.Text = TxtPrice.Text;
                    //LblQty.Text = TxtQty.Text;
                    //TxtQty.Visible = true;
                    //DDUnit.Visible = true;
                    //TxtWeight.Visible = true;
                    //DDUnit.DataBind();
                    //DDUnit.Items.FindByText(LblUnt.Text).Selected = true;
                    TxtAgntPrice.Visible = false; TxtAgntDisStock.Visible = false;
                    TxtPrice.Visible = true;  LblPrice.Visible = false; LblDiscount.Visible = false; LblAgntsPrice.Visible = false; LblAgntDiscount.Visible = false;
                    //LblQty.Visible = false; LblUnt.Visible = false; LblWeight.Visible = false;
                    TxtDisStock.Visible = true;
                   
                    LblQty.Visible = false; TxtQty.Visible = true;
                    //double Disc = 0;
                    //if (!string.IsNullOrEmpty(LblDiscount.Text))
                    //{

                    //double PricePerUnt = (Convert.ToDouble(DiscPercent) / Convert.ToDouble(LblPrice.Text)) * 100;
                    //Disc = Math.Round(PricePerUnt, MidpointRounding.AwayFromZero);
                    //TxtDisStock.Text = LblDiscount.Text;
                    //TxtAgntDisStock.Text = LblAgntDiscount.Text;
                    //LblNewDiscount.Text = Disc.ToString();
                    //Response.Write(Disc);
                    //return;
                    //}
                }
            }
            //LinkButton LnkEdPrice = (LinkButton)LstProduct.FindControl("LnkEdPrice") as LinkButton; LnkEdPrice.Visible = false;
            //LinkButton LnkUpPrice = (LinkButton)LstProduct.FindControl("LnkUpPrice") as LinkButton; LnkUpPrice.Visible = true;
            //LinkButton LnkCancelPrice = (LinkButton)LstProduct.FindControl("LnkCancelPrice") as LinkButton; LnkCancelPrice.Visible = true;
            //for (int i = 0; i < LstProduct.Items.Count; i++)
            //{
            //    Label LblProductId = (Label)LstProduct.Items[i].FindControl("LblProductId");
            //    Label LblPrice = (Label)LstProduct.Items[i].FindControl("LblPrice");
            //    Label LblDiscount = (Label)LstProduct.Items[i].FindControl("LblDiscount");
            //    TextBox TxtStock = (TextBox)LstProduct.Items[i].FindControl("TxtPrice");
            //    TextBox TxtDisStock = (TextBox)LstProduct.Items[i].FindControl("TxtDiscount");
            //    Label LblQty = (Label)LstProduct.Items[i].FindControl("LblQty");
            //    Label LblUnt = (Label)LstProduct.Items[i].FindControl("lblUnit");
            //    Label LblWeight = (Label)LstProduct.Items[i].FindControl("lblWeight");
            //    TextBox TxtWeight = (TextBox)LstProduct.Items[i].FindControl("txtWeight");
            //    DropDownList DDUnit = (DropDownList)LstProduct.Items[i].FindControl("DDselectQuantity1");
            //    TextBox TxtQty = (TextBox)LstProduct.Items[i].FindControl("TxtQty");
            //    LblPrice.Text = TxtStock.Text;
            //    LblQty.Text = TxtQty.Text;
            //    TxtQty.Visible = true;
            //    DDUnit.Visible = true;
            //    TxtWeight.Visible = true;
            //    DDUnit.DataBind();
            //    DDUnit.Items.FindByText(LblUnt.Text).Selected = true;
            //    TxtStock.Visible = true; LblPrice.Visible = false; LblDiscount.Visible = false; LblQty.Visible = false; LblUnt.Visible = false; LblWeight.Visible = false;
            //    TxtDisStock.Visible = true;
            //}
            //LstProduct.Focus();
        }

        if (e.CommandName == "UpPrice")
        {
            Cnn.Open();
            try
            {
                Cnn.BeginTrans();
                LinkButton LnkEdPrice = (LinkButton)LstProduct.FindControl("LnkEdPrice") as LinkButton; LnkEdPrice.Visible = true;
                LinkButton LnkUpPrice = (LinkButton)LstProduct.FindControl("LnkUpPrice") as LinkButton; LnkUpPrice.Visible = false;
                LinkButton LnkCancelPrice = (LinkButton)LstProduct.FindControl("LnkCancelPrice") as LinkButton; LnkCancelPrice.Visible = false;
                for (int i = 0; i < LstProduct.Items.Count; i++)
                {
                    Label LblMainProductId = (Label)LstProduct.Items[i].FindControl("LblProductId");
                    ListView lstColorSize = (ListView)LstProduct.Items[i].FindControl("LstColorSizeProduct") as ListView;
                    //lstColorSize.DataBind();
                    for (int j = 0; j < lstColorSize.Items.Count; j++)
                    {
                        Label LblProductId = (Label)lstColorSize.Items[j].FindControl("LblColorProductId");
                        Label LblProSizeId = (Label)lstColorSize.Items[j].FindControl("lblSizeId");
                        Label LblProColorId = (Label)lstColorSize.Items[j].FindControl("lblColorId");
                        Label LblPrice = (Label)lstColorSize.Items[j].FindControl("LblPrice");
                        Label LblAgntsPrice = (Label)lstColorSize.Items[j].FindControl("lblAgentRate");
                        Label LblDiscount = (Label)lstColorSize.Items[j].FindControl("lblDis");
                        Label LblAgntDiscount = (Label)lstColorSize.Items[j].FindControl("lblAgntDiscount");
                        TextBox TxtDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtDisSize");
                        TextBox TxtAgntDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtAgentDiscount");
                        Label LblQty = (Label)lstColorSize.Items[j].FindControl("LblQty");
                        Label LblNewDiscount = (Label)lstColorSize.Items[j].FindControl("lblNewDiscount");
                        //TextBox TxtQty = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                        TextBox TxtPrice = (TextBox)lstColorSize.Items[j].FindControl("TxtPrice");
                        TextBox TxtAgntPrice = (TextBox)lstColorSize.Items[j].FindControl("txtAgentRate");
                        TextBox TxtQtyStock = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                        //TextBox TxtWeight = (TextBox)LstProduct.Items[j].FindControl("txtWeight");
                        //DropDownList DDUnit = (DropDownList)LstProduct.Items[j].FindControl("DDselectQuantity1");
                        //double Disc = 0;
                        //if (TxtPrice.Visible == true)
                        //{
                        //    if (!string.IsNullOrEmpty(TxtDisStock.Text))
                        //    {
                        //        string DiscPercent = TxtDisStock.Text.Replace("%", "");
                        //        double PricePerUnt = (Convert.ToDouble(TxtPrice.Text) * Convert.ToDouble(DiscPercent)) / 100;
                        //        Disc = Math.Round(Convert.ToDouble(PricePerUnt), MidpointRounding.AwayFromZero);
                        //        //Response.Write(Disc);
                        //        //return;
                        //    }
                        //}
                        Cnn.ExecuteNonQuery("Update ProductSizeQuantity Set urate='" + TxtPrice.Text + "',udiscount='" + TxtDisStock.Text + "',Quantity='" + TxtQtyStock.Text + "',arate=" + TxtAgntPrice.Text + ",adiscount=" + TxtAgntDisStock.Text + " Where ProductId='" + LblProductId.Text + "' and ID=" + LblProSizeId.Text + "");

                        TxtPrice.Visible = false; LblPrice.Visible = true;
                        TxtAgntPrice.Visible = false;LblAgntsPrice.Visible = true;
                        TxtDisStock.Visible = false; LblDiscount.Visible = true;
                        TxtAgntDisStock.Visible = false;LblAgntDiscount.Visible = true;
                        TxtQtyStock.Visible = false; LblQty.Visible = true;
                        //TxtQty.Visible = false; LblQty.Visible = true;
                        //DDUnit.Visible = false; LblUnt.Visible = true;
                        //TxtWeight.Visible = false; LblWeight.Visible = true;
                    }
                    int Totalquantity = 0;
                    DataTable dt1 = Cnn.FillTable("select distinct colorid from ProductSizeQuantity  where productid=" + LblMainProductId.Text + " group by colorid", "lstPrdct");
                    if (dt1.Rows.Count > 0)
                    {
                        for (int k = 0; k < dt1.Rows.Count; k++)
                        {
                            int Qty = Convert.ToInt32(Cnn.ExecuteScalar("select distinct SUM(Quantity) from ProductSizeQuantity where productid=" + LblMainProductId.Text + " and ColorId=" + dt1.Rows[k]["colorid"] + ""));
                            //DataRow Dr = Cnn.FillRow("select color_img,color_name from Store.mst_Color where color_id=" + dt1.Rows[k]["colorid"] + "");
                            //DataRow Dr1 = Cnn.FillRow("select top 1 rate,discount from ProductSizeQuantity where productid=" + LblMainProductId.Text + " and ColorId=" + dt1.Rows[k]["colorid"] + " order by id asc");
                            //Cnn.ExecuteNonQuery("update Store.dtl_ProductColor set rate=" + Dr1["rate"].ToString() + ",discount=" + Dr1["discount"] + ",Quantity=" + Qty + " where ProductId=" + LblMainProductId.Text + " and ColorName='" + Dr["color_name"].ToString() + "'");
                            Totalquantity += Qty;
                        }
                    }
                    //DataRow Dr2 = Cnn.FillRow("select top 1 rate,discount from Store.dtl_ProductColor where productid=" + LblMainProductId.Text + " order by CId asc");
                    Cnn.ExecuteNonQuery("update Product set qty=" + Totalquantity + " where ProductId=" + LblMainProductId.Text + "");
                }
                Cnn.CommitTrans();
            }
            catch (Exception ex)
            {
                Cnn.RollBackTrans();
            }
            LstProduct.DataBind();
            Cnn.Close();
            LstProduct.Focus();
            //LoadData(" AND a.SubCategoryId='" + DDSearchSubCat.SelectedValue + "'");
        }

        if (e.CommandName == "CancelPrice")
        {
            LinkButton LnkEdPrice = (LinkButton)LstProduct.FindControl("LnkEdPrice") as LinkButton; LnkEdPrice.Visible = true;
            LinkButton LnkUpPrice = (LinkButton)LstProduct.FindControl("LnkUpPrice") as LinkButton; LnkUpPrice.Visible = false;
            LinkButton LnkCancelPrice = (LinkButton)LstProduct.FindControl("LnkCancelPrice") as LinkButton; LnkCancelPrice.Visible = false;
            for (int i = 0; i < LstProduct.Items.Count; i++)
            {
                Label LblMainProductId = (Label)LstProduct.Items[i].FindControl("LblProductId");
                ListView lstColorSize = (ListView)LstProduct.Items[i].FindControl("LstColorSizeProduct") as ListView;
                lstColorSize.DataBind();
                for (int j = 0; j < lstColorSize.Items.Count; j++)
                {
                    Label LblPrice = (Label)lstColorSize.Items[j].FindControl("LblPrice");
                    Label LblAgntsPrice = (Label)lstColorSize.Items[j].FindControl("lblAgentRate");
                    Label LblDiscount = (Label)lstColorSize.Items[j].FindControl("lblDis");
                    Label LblAgntDiscount = (Label)lstColorSize.Items[j].FindControl("lblAgntDiscount");
                    TextBox TxtDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtDisSize");
                    TextBox TxtAgntDisStock = (TextBox)lstColorSize.Items[j].FindControl("txtAgentDiscount");
                    Label LblQty = (Label)lstColorSize.Items[j].FindControl("LblQty");
                    Label LblNewDiscount = (Label)lstColorSize.Items[j].FindControl("lblNewDiscount");
                    //TextBox TxtQty = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                    TextBox TxtPrice = (TextBox)lstColorSize.Items[j].FindControl("TxtPrice");
                    TextBox TxtAgntPrice = (TextBox)lstColorSize.Items[j].FindControl("txtAgentRate");
                    TextBox TxtQty = (TextBox)lstColorSize.Items[j].FindControl("txtQty");
                    //DropDownList DDUnit = (DropDownList)LstProduct.Items[i].FindControl("DDselectQuantity1");
                    //Label LblWeight = (Label)LstProduct.Items[i].FindControl("lblWeight");
                    //TextBox TxtWeight = (TextBox)LstProduct.Items[i].FindControl("txtWeight");
                    TxtPrice.Visible = false; LblPrice.Visible = true;
                    TxtDisStock.Visible = false; LblDiscount.Visible = true;
                    TxtAgntPrice.Visible = false; LblAgntsPrice.Visible = true;
                    TxtAgntDisStock.Visible = false; LblAgntDiscount.Visible = true;
                    TxtQty.Visible = false; LblQty.Visible = true;
                    //DDUnit.Visible = false; LblUnt.Visible = true;
                    //TxtWeight.Visible = false; LblWeight.Visible = true;
                }
            }
            LstProduct.DataBind();
            LstProduct.Focus();

            //LoadData(" AND a.SubCategoryId='" + DDSearchSubCat.SelectedValue + "'");
        }
        if (e.CommandName == "DeActive")
        {
            try
            {
                Cnn.BeginTrans();
                String Sql1 = "", Sql2 = "", Sql3 = "", Sql4 = "";
                if (LstProduct.Items.Count > 0)
                {
                    for (int i = 0; i < LstProduct.Items.Count; i++)
                    {
                        if (((CheckBox)LstProduct.Items[i].FindControl("ChkBoxDA")).Checked == true)
                        {
                            string ProductId = ((Label)LstProduct.Items[i].FindControl("LblProductId")).Text;
                            Sql1 = Sql1 + "; Update Product set Active=1 where ProductId='" + ProductId + "';";
                        }
                        else
                        {
                            string ProductId = ((Label)LstProduct.Items[i].FindControl("LblProductId")).Text;
                            Sql1 = Sql1 + "; Update Product set Active=0 where ProductId='" + ProductId + "';";
                        }
                    }
                    //Cnn.ExecuteNonQuery("Update [Store].Product set Active=0 where ProductId='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update [Store].dtl_ProductGallery set Active=0 where Product_Id='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update ProductSizeQuantity set Active=0 where ProductId='" + ProductId + "'");
                    //Cnn.ExecuteNonQuery("Update [Store].dtl_Productcolor set Active=0 where ProductId='" + ProductId + "'");
                    if (Sql1 != "")
                    {
                        String Sql = Sql1 + Sql2 + Sql4;
                        Cnn.ExecuteNonQuery(Sql);
                    }
                }
                Cnn.CommitTrans();
            }
            catch (SqlException ex)
            {
                Cnn.CommitTrans();
            }
            LstProduct.DataBind();
            LstProduct.Focus();

        }
    }
}