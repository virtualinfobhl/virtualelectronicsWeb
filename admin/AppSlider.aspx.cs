using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AppSlider : System.Web.UI.Page
{

    ClsConnection Cnn = new ClsConnection();
    public enum MessageType { Success, Error, Info, Warning };
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_id"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            list();
        }
    }

    public void list()
    {
        DataTable dt = Cnn.FillTable("select * from [appslider] where active=1", "Detail");
        ListView1.DataSource = dt;
        ListView1.DataBind();
    }
   
   
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
  


    protected void Button1_Click1(object sender, EventArgs e)
    {

        if (Button1.Text == "Edit")
        {
            foreach (ListViewItem myListViewItem in ListView1.Items)
            {
                string type = ((HiddenField)myListViewItem.FindControl("hdntype")).Value;
                string link = ((HiddenField)myListViewItem.FindControl("hdnlink")).Value;
                
                string id = ((HiddenField)myListViewItem.FindControl("HdnID")).Value;
                TextBox txtPriority = ((TextBox)myListViewItem.FindControl("txtPriority"));
             //   TextBox txtlink = ((TextBox)myListViewItem.FindControl("txtlink"));
                FileUpload FileUpload1 = ((FileUpload)myListViewItem.FindControl("FileUpload1"));
                DropDownList ddtype = ((DropDownList)myListViewItem.FindControl("ddtype"));
              

                DropDownList ddlink = ((DropDownList)myListViewItem.FindControl("DDlink"));
                string query = "";
                if (type == "Product")
                {
                    query = "select productid,productname  from product order by productid desc";
                }
                else if (type == "Category")
                {
                    query = "select MainCategoryid as productid,MainCategoryName as productname  from M_CategoryMaster order by MainCategoryid desc";
                }

                else if (type == "Brand")
                {
                    query = "select brandid as productid,brandName as productname  from brand order by brandid desc";
                }


                ddlink.Items.Clear();
               
                DataTable dt = Cnn.FillTable(query, "Detail");
                ddlink.DataSource = dt;
                ddlink.DataBind(); ddlink.Visible = true;
               

                if (type == "Product")
                {
                    //ddlink.Items.FindByText(link).Selected = true;
                }
                else if (type == "Category")
                {
                    ddlink.Items.FindByValue(link).Selected = true;
                }

                else if (type == "Brand")
                {
                    ddlink.Items.FindByValue(link).Selected = true;
                }

                //ddtype.DataBind();
                ddtype.ClearSelection();
                ddtype.DataBind();
                ddtype.Items.FindByText(type).Selected = true;
             
             //   txtlink.Visible = true;
                FileUpload1.Visible = true;
                txtPriority.Visible = true;
                ddtype.Visible = true;
               
            }
            Button1.Text = "Update";
        }
        else
        {
            foreach (ListViewItem myListViewItem in ListView1.Items)
            {
             
                string id = ((HiddenField)myListViewItem.FindControl("HdnID")).Value;

             //   TextBox txtlink = ((TextBox)myListViewItem.FindControl("txtlink"));
                TextBox txtPriority = ((TextBox)myListViewItem.FindControl("txtPriority"));
                FileUpload FileUpload1 = ((FileUpload)myListViewItem.FindControl("FileUpload1"));
                DropDownList ddtype = ((DropDownList)myListViewItem.FindControl("ddtype"));
                DropDownList ddlink = ((DropDownList)myListViewItem.FindControl("DDlink"));
                string type = ((DropDownList)myListViewItem.FindControl("ddtype")).SelectedItem.ToString();
            //    txtlink.Visible = true;
                txtPriority.Visible = true; ddtype.Visible = true;
                FileUpload1.Visible = true; ddlink.Visible = true;
                Cnn.Open();
                string query = "",productid="",categoryid="",linkm="";
                if (ddlink.SelectedValue.ToString() != "-1")
                {
                    if (type == "Product")
                    {
                        query = "link='" + ddlink.SelectedItem + "',";
                        productid = ddlink.SelectedValue.ToString();
                        categoryid = Cnn.ExecuteScalar("select categoryid from product where productid='" + ddlink.SelectedValue + "'").ToString();
                        string tt = productid + "," + categoryid;
                        linkm = ",lnikn='" + tt + "'";

                    }

                    else if (type == "Category")
                    {
                        query = "link='" + ddlink.SelectedValue + "',";
                    }

                    else if (type == "Brand")
                    {
                        query = "link='" + ddlink.SelectedValue + "',";
                    }
                }

                if (FileUpload1.HasFile)
                {

                    byte[] image = FileUpload1.FileBytes;
                    ImageHandler imageHandler = new ImageHandler();
                    filename = id + ".jpg";
                    Bitmap bmpmain = imageHandler.CreateThumbnail(image, false, 877, 600);
                    if (bmpmain != null)
                    {
                        bmpmain.Save(Server.MapPath("~/img/appslider/" + filename), System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    Cnn.ExecuteNonQuery("update appslider set " + query + "priority='" + txtPriority.Text + "',type='" + ddtype.SelectedItem + "' " + linkm + " where id='" + id + "'");
                }
                else
                { Cnn.ExecuteNonQuery("update appslider set " + query + " priority='" + txtPriority.Text + "',type='" + ddtype.SelectedItem + "' " + linkm + " where id='" + id + "'"); }

                Cnn.Close();
              //  txtlink.Visible = false;
                FileUpload1.Visible = false;
                txtPriority.Visible = false;
                ddtype.Visible = false;
            }
            Button1.Text = "Edit";
             list();
             ShowMessage("Record updated successfully", MessageType.Success);

        }
    }
 
    protected void ddtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        Cnn.Open();
        foreach (ListViewItem myListViewItem in ListView1.Items)
        {
          
            string link = ((DropDownList)myListViewItem.FindControl("ddtype")).SelectedItem.ToString();

            string id = ((HiddenField)myListViewItem.FindControl("HdnID")).Value;
            TextBox txtPriority = ((TextBox)myListViewItem.FindControl("txtPriority"));
            //   TextBox txtlink = ((TextBox)myListViewItem.FindControl("txtlink"));
            FileUpload FileUpload1 = ((FileUpload)myListViewItem.FindControl("FileUpload1"));
            DropDownList ddtype = ((DropDownList)myListViewItem.FindControl("ddtype"));
            string type = ((DropDownList)myListViewItem.FindControl("ddtype")).SelectedItem.ToString();

            string linktext = ((DropDownList)myListViewItem.FindControl("DDlink")).SelectedItem.ToString();
            string linkvalue = ((DropDownList)myListViewItem.FindControl("DDlink")).SelectedValue.ToString();
            DropDownList ddlink = ((DropDownList)myListViewItem.FindControl("DDlink"));
            string query = "";
            if (type == "Product")
            {
                query = "Select 'productid'=-1,'productname'='Select product Name' union  select productid,productname from product";
            }
            else if (type == "Category")
            {
                query = "select 'productid'=-1,'productname'='Select MainCategory Name' union select MainCategoryid as productid,MainCategoryName as productname  from M_CategoryMaster";
            }

            else if (type == "Brand")
            {
                query = "select  'productid'=-1,'productname'='Select brand Name' union select  brandid as productid,brandName as productname  from brand";
            }


           ddlink.Items.Clear();          
            DataTable dt = Cnn.FillTable(query, "Detail");
            ddlink.DataSource = dt;
            ddlink.DataBind(); ddlink.Visible = true;

            if (type == "Product")
            {
                //int count = Convert.ToInt32(Cnn.ExecuteScalar("select count(*)  from product where productname='" + ddlink.SelectedItem + "'"));
                //if (count > 0)
                //{
                //    ddlink.ClearSelection();
                //    ddlink.Items.FindByText(linktext).Selected = true;
                //}

            }
            else if (type == "Category")
            {
                //int count = Convert.ToInt32(Cnn.ExecuteScalar("select count(*)  from M_CategoryMaster where MainCategoryname='" + ddlink.SelectedItem + "'"));
                // if (count > 0)
                // {
                //     ddlink.ClearSelection();
                //     ddlink.Items.FindByValue(linkvalue).Selected = true;
                // }
            }

            else if (type == "Brand")
            {
                //int count = Convert.ToInt32(Cnn.ExecuteScalar("select count(*)  from brand where brandname='" + ddlink.SelectedItem + "'"));
                // if (count > 0)
                // {
                //     ddlink.ClearSelection();
                //     ddlink.Items.FindByValue(linkvalue).Selected = true;
                // }
            }
        //    ddtype.Items.FindByText(type).Selected = true;
          
            //   txtlink.Visible = true;
            FileUpload1.Visible = true;
            txtPriority.Visible = true;
            ddtype.Visible = true;

        }

        Cnn.Close();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
         Cnn.Open();
         if (e.CommandName == "edit")
         {
            
             string type = ((HiddenField)e.Item.FindControl("hdntype")).Value;
             string link = ((HiddenField)e.Item.FindControl("hdnlink")).Value;

             string id = ((HiddenField)e.Item.FindControl("HdnID")).Value;
             TextBox txtPriority = ((TextBox)e.Item.FindControl("txtPriority"));
             //   TextBox txtlink = ((TextBox)myListViewItem.FindControl("txtlink"));
             FileUpload FileUpload1 = ((FileUpload)e.Item.FindControl("FileUpload1"));
             DropDownList ddtype = ((DropDownList)e.Item.FindControl("ddtype"));


             DropDownList ddlink = ((DropDownList)e.Item.FindControl("DDlink"));
             string query = "";
             if (type == "Product")
             {
                 query = "select productid,productname  from product order by productid desc";
             }
             else if (type == "Category")
             {
                 query = "select MainCategoryid as productid,MainCategoryName as productname  from M_CategoryMaster order by MainCategoryid desc";
             }

             else if (type == "Brand")
             {
                 query = "select brandid as productid,brandName as productname  from brand order by brandid desc";
             }


             ddlink.Items.Clear();

             DataTable dt = Cnn.FillTable(query, "Detail");
             ddlink.DataSource = dt;
             ddlink.DataBind(); ddlink.Visible = true;


             if (type == "Product")
             {
                 ddlink.Items.FindByText(link).Selected = true;
             }
             else if (type == "Category")
             {
                 ddlink.Items.FindByValue(link).Selected = true;
             }

             else if (type == "Brand")
             {
                 ddlink.Items.FindByValue(link).Selected = true;
             }

             //ddtype.DataBind();
             ddtype.ClearSelection();
             ddtype.DataBind();
             ddtype.Items.FindByText(type).Selected = true;

             //   txtlink.Visible = true;
             FileUpload1.Visible = true;
             txtPriority.Visible = true;
             ddtype.Visible = true;
         }
    }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}