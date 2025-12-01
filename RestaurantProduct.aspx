<%@ Page Title="" Language="C#" MasterPageFile="~/AdminRestaurant/RestaurantMaster.master" AutoEventWireup="true" CodeFile="RestaurantProduct.aspx.cs" Inherits="AdminRestaurant_RestaurantProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="Contact" runat="server">
                    <fieldset>
                        <legend>
                            <div class="legenddiv">Restaurant Product</div>
                        </legend>
                        <table cellpadding="5" cellspacing="0" width="100%">
                            <tr>
                                <td align="center">
                                    <table cellpadding="5" cellspacing="0" width="690px" class="insertpanel">
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 369px;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 117px;">Product Name <span class="required">*</span></td>
                                                                    <td>
                                                                        <asp:TextBox ID="TxtName" runat="server" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 350px;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 117px;">Select Food Type</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DDfood" runat="server" Width="205px">
                                                                            <asp:ListItem Text="<--Select Food Type-->" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Vegetarian" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Non-Vegetarian" Value="2"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 350px;" align="left">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 117px;">Select Category<span class="required">*</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DDCategory" runat="server" DataTextField="ProductCategory_Name" DataValueField="ProductCategory_Id" DataSourceID="SrcCategory" Width="205px"></asp:DropDownList>
                                                                        <asp:SqlDataSource ID="SrcCategory" runat="server" ConnectionString="<%$Connectionstrings:BhilwaraOnlineRestaurantConnectionString %>" SelectCommand="select 'ProductCategory_Id'=0,'ProductCategory_Name'='<--Select Food Category-->' union select ProductCategory_Id,ProductCategory_Name from [Restaurant]. RestaurantProduct_Category where Restaurant_ID=@Restaurant">
                                                                            <SelectParameters>
                                                                                <asp:Parameter Name="Restaurant" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="width: 106px;">Product Detail</td>
                                            <td>
                                                <asp:TextBox ID="TxtDetail" runat="server" TextMode="MultiLine" Width="550px" MaxLength="250"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 350px;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 117px;">Product Price<span class="required">*</span></td>
                                                                    <td>
                                                                        <asp:TextBox ID="Txtprice" runat="server" Width="200px"></asp:TextBox></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 117px;">Product Discount</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TxtDiscount" runat="server" Width="200px"></asp:TextBox></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:LinkButton ID="LnkSubmit" runat="server" Text="Submit" OnClick="LnkSubmit_Click" CssClass="lnkinsert"></asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LnkCancel" runat="server" Text="Cancel" OnClick="LnkCancel_Click" CssClass="lnkinsert"></asp:LinkButton>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Label ID="Lblerr" runat="server" ForeColor="Red"></asp:Label></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr >
                                <td class="search">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="5" cellspacing="0">
                                                    <tr>
                                                        <td>Search By Product Name</td>
                                                        <td>
                                                            <asp:TextBox ID="txtproductname" runat="server" Width="220px" Height="22px"></asp:TextBox>
                                                            <asp:Button ID="Button1" runat="server" Text="Search" CssClass="lnkinsert" OnClick="Button1_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right">
                                                <table cellpadding="5" cellspacing="0">
                                                    <tr>
                                                        <td>Search By Category</td>
                                                        <td>
                                                          
                                                                         <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true"  Height="22px" DataTextField="ProductCategory_Name" DataValueField="ProductCategory_Id"  Width="205px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
                                                                             <asp:ListItem Text="Select Food Category" Value="0"></asp:ListItem>
                                                                         </asp:DropDownList>
                                                                      
                                                                    
                                                              
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="width: 100%; margin-bottom: 8px;" align="right">
                                        <asp:DataPager ID="Datapager1" runat="server" PagedControlID="lstproduct" PageSize="10">
                                            <Fields>
                                                <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                    <table cellpadding="5" cellspacing="0" width="100%" border="1">
                                        <asp:ListView ID="lstproduct" runat="server"  OnItemEditing="lstproduct_ItemEditing" OnItemCommand="lstproduct_ItemCommand" OnItemDeleting="lstproduct_ItemDeleting" OnItemUpdating="lstproduct_ItemUpdating" OnItemDataBound="lstproduct_ItemDataBound">
                                            <LayoutTemplate>
                                                <tr>
                                                    <td style="width: 40px;">
                                                        <asp:LinkButton ID="LnkAct" runat="server" Text="Active" CommandName="Act"></asp:LinkButton></td>
                                                    <td style="width: 50px;">
                                                        <asp:LinkButton ID="Lnkdeact" runat="server" Text="Deactive" CommandName="Deact"></asp:LinkButton></td>
                                                    <td style="width: 150px;">Product Name</td>
                                                    <td style="width: 110px;">
                                                        <table cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:LinkButton ID="LnkEdt" runat="server" Text="Edit" CommandName="Edt"></asp:LinkButton></td>
                                                                <td align="right">
                                                                    <asp:LinkButton ID="LnkUpd" runat="server" Text="Update" CommandName="Upd"></asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Price</td>
                                                                <td align="right">Discount</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>Product Detail</td>
                                                    <td style="width: 100px;"></td>
                                                </tr>
                                                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:HiddenField ID="HdnID" runat="server" Value='<%#Eval("Product_ID") %>' />
                                                        <asp:CheckBox ID="ChkAct" runat="server" /></td>
                                                    <td valign="top">
                                                        <asp:CheckBox ID="ChkDeact" runat="server" /></td>
                                                    <td valign="top" class="<%#Convert.ToString(setclass(Convert.ToInt32(Eval("Active")))) %>"><%#Eval("Product_Name")%></td>
                                                    <td valign="top">
                                                        <table cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:Label ID="LblPrice" runat="server" Text='<%#Eval("Product_Price")%>'></asp:Label>
                                                                    <asp:TextBox ID="TxtPrice" runat="server" Text='<%#Eval("Product_Price")%>' Visible="false" Width="50px"></asp:TextBox>
                                                                </td>
                                                                <td align="right">
                                                                   <asp:Label ID="LblDiscount" runat="server" Text='<%# (int)Math.Round(((Convert.ToDouble(Eval("Discount")) / Convert.ToDouble(Eval("Product_Price"))) * 100), MidpointRounding.AwayFromZero) %>'></asp:Label>
                                                                            <asp:TextBox ID="TxtDiscount" runat="server" Text='<%# (int)Math.Round(((Convert.ToDouble(Eval("Discount")) / Convert.ToDouble(Eval("Product_Price"))) * 100), MidpointRounding.AwayFromZero) %>' Visible="false" Width="50px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top">
                                                        <table cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td style="width: 125px;"><b>Product Type:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%#Eval("veg") %>'>
                                                                      <img src="../assets/images/vegicon1.jpg" />
                                                                      </asp:Panel>
                                                                    <asp:Panel ID="Panel2" runat="server" Visible='<%#Eval("nonveg") %>'>
                                                                        <img src="../assets/images/nonvegicon1.jpg" /> 
                                                                    </asp:Panel>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>Product Category:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td><%#Eval("ProductCategory_Name") %>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>Product Detail:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-size: 10px;"><%#Eval("Product_Detail") %>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top">
                                                        <asp:LinkButton ID="LnkEdit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>&nbsp;&nbsp;<asp:LinkButton ID="LnkDlt" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton></td>
                                                </tr>
                                            </ItemTemplate>
                                            
                                            <EditItemTemplate>
                                                <tr class="lstedit">
                                                    <td valign="top">
                                                        <asp:HiddenField ID="HdnID" runat="server" Value='<%#Eval("Product_ID") %>' />
                                                    </td>
                                                    <td valign="top"></td>
                                                    <td valign="top">
                                                        <asp:TextBox ID="Txtname" runat="server" Text='<%#Eval("Product_Name")%>'></asp:TextBox></td>
                                                    <td valign="top">
                                                        <table cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:TextBox ID="TxtPrice" runat="server" Text='<%#Eval("Product_Price")%>' Width="50px"></asp:TextBox>
                                                                </td>
                                                                <td align="right">
                                                                    <asp:TextBox ID="TxtDiscount" runat="server" Text='<%# (int)Math.Round(((Convert.ToDouble(Eval("Discount")) / Convert.ToDouble(Eval("Product_Price"))) * 100), MidpointRounding.AwayFromZero) %>' Width="50px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top">
                                                        <table cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td style="width: 125px;"><b>Product Type:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="HdnVeg" runat="server" Value='<%#Eval("Veg")%>' />
                                                                    <asp:HiddenField ID="HdnNonveg" runat="server" Value='<%#Eval("Nonveg")%>' />
                                                                    <asp:DropDownList ID="DDfood" runat="server" Width="205px">
                                                                        <asp:ListItem Text="<--Select Food Type-->" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Vegetarian" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Non-Vegetarian" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>Product Category:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="HdnCategory" runat="server" Value='<%#Eval("ProductCategory_ID") %>' />
                                                                    <asp:HiddenField ID="HdnRestaurantID" runat="server" Value='<%#Eval("Restaurant_ID") %>' />
                                                                    <asp:DropDownList ID="DDCategory" runat="server" DataTextField="ProductCategory_Name" DataValueField="ProductCategory_Id" DataSourceID="SrcCategory1" Width="205px"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SrcCategory1" runat="server" ConnectionString="<%$Connectionstrings:BhilwaraOnlineRestaurantConnectionString %>" SelectCommand="select 'ProductCategory_Id'=0,'ProductCategory_Name'='<--Select Food Category-->' union select ProductCategory_Id,ProductCategory_Name from [Restaurant]. RestaurantProduct_Category where Restaurant_ID=@Restaurant">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="HdnRestaurantID" Name="Restaurant" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top"><b>Product Detail:</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-size: 10px;">
                                                                    <asp:TextBox ID="TxtDetail" runat="server" Text='<%#Eval("Product_Detail") %>' MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                                                                    <hr />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top">
                                                        <asp:LinkButton ID="LnkUPdate" runat="server" Text="Update" CommandName="Update"></asp:LinkButton>&nbsp;&nbsp;<asp:LinkButton ID="LnkCancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton></td>
                                                </tr>
                                            </EditItemTemplate>
                                        </asp:ListView>
                                    </table>
                                    <div style="width: 100%; margin-bottom: 8px;" align="right">
                                        <asp:DataPager ID="Datapager2" runat="server" PagedControlID="lstproduct" PageSize="10">
                                            <Fields>
                                                <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                  <%--  <asp:SqlDataSource ID="SrcProduct" runat="server" ConnectionString="<%$Connectionstrings:BhilwaraOnlineRestaurantConnectionString %>" SelectCommand="select A.Product_ID,A.Product_Name,A.Product_Detail,A.Product_Price,A.Restaurant_ID,A.Product_Unit,A.ProductCategory_ID,A.Veg,A.Nonveg,A.Discount,A.Active,B.Restaurant_Name,C.ProductCategory_Name from [Restaurant]. Restaurant_Product A join [Restaurant].Restaurant_Detail B on A.Restaurant_ID=B.Restaurant_ID join [Restaurant].RestaurantProduct_Category C on A.ProductCategory_ID=C.ProductCategory_ID where B.Restaurant_ID=@RestaurantId order by A.Product_Name Asc">
                                        <SelectParameters>
                                            <asp:Parameter Name="RestaurantId" Type="Int32" />
                                                 <asp:ControlParameter ControlID="DropDownList2" Name="Restaurant_Id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>--%>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

