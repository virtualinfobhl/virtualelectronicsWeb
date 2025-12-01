<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main_contact_area">
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="container-inner">
                            <ul>
                                <li class="home">
                                    <a href="Index.aspx">Home</a>
                                    <span>
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </li>
                                <li class="category3">
                                    <strong>My Cart</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shopping-cart-area">
        <div class="container" runat="server" id="CartBox">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="s-cart-all">
                        <div class="page-title">
                            <h1>My Cart</h1>
                        </div>
                        <div class="cart-form table-responsive">
                            <table id="shopping-cart-table" class="data-table cart-table table-responsive">
                                <tr>
                                    <th>Remove</th>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Qty</th>
                                    <th>Subtotal</th>
                                </tr>

                                <asp:ListView ID="LstCart" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="productid" runat="server" Visible="false" Text='<%# Eval("productid") %>'></asp:Label>
                                        <asp:Label ID="id" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                        <asp:Label ID="lblcolor" runat="server" Visible="false" Text='<%# Eval("color") %>'></asp:Label>
                                        <asp:Label ID="lblSize" runat="server" Visible="false" Text='<%# Eval("Size") %>'></asp:Label>
                                        <asp:Label ID="lblquantity" runat="server" Visible="false" Text='<%# Eval("quantity") %>'></asp:Label>
                                        <tr>
                                            <td class="sop-icon">
                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("id") %>'><i class="fa fa-times"></i></asp:LinkButton>

                                            </td>
                                            <td class="sop-cart">
                                                <a href="#">
                                                    <img class="primary-image" alt="" src="img/product/<%# Eval("image") %>" style="height: 150px"></a>
                                            </td>
                                            <td class="sop-cart"><a href="#"><%# Eval("productname") %></a></td>
                                            <td class="sop-cart">
                                                <asp:ListView ID="lstgallery" runat="server" DataSourceID="sqlprice">
                                                    <ItemTemplate>
                                                        ₹<asp:Label ID="LblTotalAmount" runat="server" Text='<%# Eval("Price") %>'></asp:Label>

                                                    </ItemTemplate>
                                </asp:ListView>
                                </td> 
                                            <td class="sop-cart">
                                                <asp:ListView ID="ListView2" runat="server" DataSourceID="sqlprice">
                                                    <ItemTemplate>
                                                        ₹<asp:Label ID="LblTotalAmount" runat="server" Text='<%# Eval("udiscount") %>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </td>
                                <asp:SqlDataSource ID="sqlprice" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                    CancelSelectOnNullParameter="false" SelectCommand="select urate as price,udiscount from ProductSizeQuantity  where ProductId=@ProductId and Size=@lblSize and colorid=@lblcolor">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="ProductId" ControlID="ProductId" DefaultValue="0" />
                                        <asp:ControlParameter Name="lblcolor" ControlID="lblcolor" DefaultValue="0" />
                                        <asp:ControlParameter Name="lblSize" ControlID="lblSize" DefaultValue="0" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <td>
                                    <asp:DropDownList ID="DDQuantity" DataSourceID="SrcQuantity" class="form-control input-sm" AutoPostBack="true" DataTextField="Number" DataValueField="Number" runat="server" Style="width: 50px" OnSelectedIndexChanged="DDQuantity_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SrcQuantity" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                        CancelSelectOnNullParameter="false" SelectCommand=" ; with CTE as  (   Select 1 Number   union all   select Number +1 from CTE where Number<(Select qty From product Where ProductID=@productid)  )  Select * from CTE "
                                        UpdateCommand=" ">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="productid" ControlID="productid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>
                                <td class="sop-cart">
                                  
                                            ₹<asp:Label ID="LblTotalAmoun111t" runat="server"></asp:Label>

                                     

                                </td>
                                <asp:SqlDataSource ID="sqlmain" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                    CancelSelectOnNullParameter="false" SelectCommand="select ((a.urate-a.udiscount)*b.Quantity) as Amount from ProductSizeQuantity as a inner join trncart as b on a.ProductId=b.ProductId  where a.ProductId=@ProductId and a.Size=@lblSize and a.colorid=@lblcolor">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="ProductId" ControlID="ProductId" DefaultValue="0" />
                                        <asp:ControlParameter Name="lblcolor" ControlID="lblcolor" DefaultValue="0" />
                                        <asp:ControlParameter Name="lblSize" ControlID="lblSize" DefaultValue="0" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="cart-collaterals row" style="margin-top: -75px">
                <div class="col-md-8 col-sm-6">
                      <button class="button2  notice" title="" type="button" onclick="window.location='index.aspx';">
                                            <span>Continue Shopping</span>
                                        </button>
                </div>

                <div class="col-md-4 col-sm-12">
                    <div class="totals">
                        <div class="subtotal">
                            <p>Subtotal <span>₹<%= TotAmt%></span></p>
                            <p>Total Discount <span>₹<%= totaldis%></span></p>
                            <p>Grand Total <span>₹<%= Realprice%></span></p>
                        </div>

                        <button class="button2 get" title="" type="button" onclick="window.location='ProductsOrder.aspx';">
                            <span>Proceed to Checkout</span>
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

