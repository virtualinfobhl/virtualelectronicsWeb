<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditProductPrice.aspx.cs" Inherits="EditProductPrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="messagealert" id="alert_container">
    </div>


    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line">Edit Product Price Form </h1>
                </div>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Product Price Form
                        </div>
                        <div class="panel-body">

                            <div class="row">


                                <div class="col-md-4">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Select Category</label>
                                        <asp:DropDownList ID="DDMainCategory" DataSourceID="SrcDDMainCategory" runat="server" AutoPostBack="true" class="form-control" DataValueField="MainCategoryId" DataTextField="MainCategoryName"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SrcDDMainCategory" runat="server" ConnectionString="<%$Connectionstrings:Friendsmobile %>" SelectCommand="Select 'MainCategoryId'=-1,'MainCategoryName'='Select Main Category' union  select MainCategoryId,MainCategoryName from M_CategoryMaster where  active=1"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Select Brand</label>
                                        <asp:DropDownList ID="DDbrand" DataSourceID="SrcDDbrand" runat="server" AutoPostBack="true" class="form-control" DataValueField="brandid" DataTextField="brandname"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SrcDDbrand" runat="server" ConnectionString="<%$Connectionstrings:Friendsmobile %>" SelectCommand="Select 'brandid'=-1,'brandName'='Select Brand' union  select brandid,brandName from brand where  active=1"></asp:SqlDataSource>
                                    </div>
                                </div>

                            </div>


                            <div class="row" runat="server" id="imglist">
                                <div class="table-responsive">
                                    <asp:UpdatePanel ID="updtPnlProdct" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="table table-striped table-bordered table-hover">
                                                <asp:ListView ID="LstProduct" runat="server" DataSourceID="Srclstcolorlist" OnItemCommand="lstcolorlist_ItemCommand">
                                                    <LayoutTemplate>
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                    <asp:LinkButton ID="LkBtnActive" runat="server" CommandName="DeActive">Activated</asp:LinkButton>
                                                                </th>
                                                                <th>S.No</th>
                                                                <th>ID</th>
                                                                <th>Image</th>
                                                                <th>Product Name</th>
                                                                <th>Brand</th>
                                                                <th class="text-center">Price
                                                                </th>
                                                                <td>
                                                                    <asp:LinkButton ID="LnkEdPrice" runat="server" CommandName="EdPrice">Edit</asp:LinkButton>&nbsp;&nbsp;<asp:LinkButton ID="LnkUpPrice" Visible="false" runat="server" CommandName="UpPrice">Update</asp:LinkButton>&nbsp;&nbsp;<asp:LinkButton ID="LnkCancelPrice" runat="server" Visible="false" CommandName="CancelPrice">Cancel</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                                    </LayoutTemplate>

                                                    <ItemTemplate>
                                                        <asp:Label ID="LblProductId" runat="server" Visible="false" Text='<%#Eval("ProductId") %>'></asp:Label>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="ChkBoxDA" runat="server" Checked='<%#Convert.ToInt32( Eval("Active")) ==1 ? true : false %>' />
                                                                </td>
                                                                <td><%# Container.DataItemIndex + 1 %></td>
                                                                <td>
                                                                    <%#Eval("ProductID") %>
                                                                </td>
                                                                <td>
                                                                    <img src="../img/product/<%#Eval("image") %>" width="50" height="50" />
                                                                </td>
                                                                <td><%# Eval("productname") %></td>
                                                                <td><%# Eval("brandname") %></td>
                                                                <td>
                                                                    <table class="table">
                                                                        <asp:ListView ID="LstColorSizeProduct" DataSourceID="SrclstColorSizeProduct" runat="server">
                                                                            <LayoutTemplate>
                                                                                <tr class="table-warning">
                                                                                    <td>
                                                                                        <b>Color</b>
                                                                                    </td>
                                                                                    <td>
                                                                                        <b>Variant</b>
                                                                                    </td>
                                                                                    <td>
                                                                                        <b>Qty</b>
                                                                                    </td>
                                                                                    <td>
                                                                                        <b>MRP</b>
                                                                                    </td>
                                                                                    <td>
                                                                                        <b>Discount</b>
                                                                                    </td>
                                                                                  <%--  <td>
                                                                                        <b>Agent Rate</b>
                                                                                    </td>
                                                                                    <td>
                                                                                        <b>Agent Discount</b>
                                                                                    </td>--%>
                                                                                </tr>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                                                            </LayoutTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="LblColorProductId" runat="server" Visible="false" Text='<%#Eval("ProductId") %>'></asp:Label>
                                                                                <asp:Label ID="lblSizeId" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblColorId" runat="server" Visible="false" Text='<%#Eval("ColorId") %>'></asp:Label>
                                                                                <tr class="table-warning">
                                                                                    <td>
                                                                                        <%# Eval("ColorName")%>
                                                                                    </td>
                                                                                    <td>
                                                                                        <%# Eval("varient")%>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblQty" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                                                        <asp:TextBox ID="txtQty" runat="server" class="form-control" Width="50px" Visible="false" Text='<%# Eval("Quantity")%>'></asp:TextBox>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="LblPrice" runat="server" Text='<%#Eval("urate") %>'></asp:Label>
                                                                                        <asp:TextBox ID="TxtPrice" runat="server" class="form-control" Width="65px" Visible="false" Text='<%# Eval("urate")%>'></asp:TextBox>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblDis" runat="server" Text='<%#Eval("udiscount") %>'></asp:Label>
                                                                                        <asp:Label ID="lblNewDiscount" runat="server" Visible="false"></asp:Label>
                                                                                        <asp:TextBox ID="txtDisSize" runat="server" class="form-control" Width="65px" Text='<%# Eval("udiscount")%>' Visible="false"></asp:TextBox>
                                                                                    </td>
                                                                                  <%--  <td>
                                                                                        <asp:Label ID="lblAgentRate" runat="server" Text='<%#Eval("arate") %>'></asp:Label>
                                                                                        <asp:TextBox ID="txtAgentRate" runat="server" class="form-control" Width="65px" Visible="false" Text='<%# Eval("arate")%>'></asp:TextBox>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblAgntDiscount" runat="server" Text='<%#Eval("adiscount") %>'></asp:Label>
                                                                                        <asp:Label ID="lblNewAgntDiscnt" runat="server" Visible="false"></asp:Label>
                                                                                        <asp:TextBox ID="txtAgentDiscount" runat="server" class="form-control" Width="65px" Text='<%# Eval("adiscount")%>' Visible="false"></asp:TextBox>
                                                                                    </td>--%>
                                                                                    
                                                                                        <asp:Label ID="lblAgentRate" runat="server" Text='<%#Eval("arate") %>' Visible="false"></asp:Label>
                                                                                        <asp:TextBox ID="txtAgentRate" runat="server" class="form-control" Visible="false" Width="65px" Text='<%# Eval("arate")%>'></asp:TextBox>
                                                                                   
                                                                                        <asp:Label ID="lblAgntDiscount" runat="server" Text='<%#Eval("adiscount") %>' Visible="false"></asp:Label>
                                                                                        <asp:Label ID="lblNewAgntDiscnt" runat="server" Visible="false"></asp:Label>
                                                                                        <asp:TextBox ID="txtAgentDiscount" runat="server" class="form-control" Width="65px" Text='<%# Eval("adiscount")%>' Visible="false"></asp:TextBox>
                                                                                    
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:ListView>
                                                                        <asp:SqlDataSource ID="SrclstColorSizeProduct" ConnectionString='<%$ConnectionStrings:Friendsmobile %>' SelectCommand="select a.ProductID,a.ID,a.ColorId,a.Quantity,a.size,a.urate,a.udiscount,a.arate,a.adiscount,b.ColorName,c.varient from ProductSizeQuantity as a join Color as b on a.ColorId=b.ColorId left join varient as c on a.size=c.id where a.ProductID=@Productid" runat="server">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="LblProductId" Name="Productid" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </table>
                                                                </td>

                                                            </tr>
                                                        </tbody>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </table>
                                            <asp:SqlDataSource ID="Srclstcolorlist" runat="server" ConnectionString="<%$Connectionstrings:Friendsmobile %>" SelectCommand="select a.*,b.brandname from Product as a left join brand as b on a.brandid=b.brandid where a.categoryid=@CateId and a.brandid=@BrandId and a.active=1 order by a.productid desc">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DDMainCategory" Name="CateId" Type="Int32" />
                                                    <asp:ControlParameter ControlID="DDbrand" Name="BrandId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <hr />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

