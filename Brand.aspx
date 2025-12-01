<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Brand.aspx.cs" Inherits="Brand" %>

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
                                    <strong>Category</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="main_shop_area">

        <div class="main_shop_all">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3">
                       
                      
                        <div class="narrow-by-list">
                            <div class="block layered-attribute">
                                <div class="block-title">
                                    <h2>Short By</h2>
                                </div>
                                <div class="odd">
                                    <ul>

                                        <li>
                                            <asp:LinkButton ID="LinkButton11" runat="server" CommandArgument="1" OnClick="LinkButton1_Click1">Price Low to High</asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="2" OnClick="LinkButton2_Click">Price High to Low</asp:LinkButton></li>


                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="narrow-by-list">
                            <div class="block layered-attribute">
                                <div class="block-title">
                                    <h2>Brand</h2>
                                </div>
                                <div class="odd">
                                    <ul>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="sqlbrand">
                                            <ItemTemplate>
                                                <li>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("brandid") %>' OnClick="LinkButton1_Click"><%# Eval("brandname") %></asp:LinkButton></li>
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource ID="sqlbrand" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                            CancelSelectOnNullParameter="false" SelectCommand="Select brandid,brandname from brand"></asp:SqlDataSource>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <div class="narrow-by-list">
                            <div class="block layered-attribute">
                                <div class="block-title">
                                    <h2>Varient</h2>
                                </div>
                                <div class="odd" style="height:220px;overflow:scroll; overflow-x: hidden;">
                                    <ul>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <li>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click2"><%# Eval("varient") %></asp:LinkButton></li>
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                            CancelSelectOnNullParameter="false" SelectCommand="select distinct  a.id,a.varient from varient as a inner join ProductSizeQuantity as b on a.id=b.size"></asp:SqlDataSource>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="features-tab">
                                    <!-- Nav tabs -->
                                   
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="home">
                                            <div class="row">
                                                <div class="shop-tab">
                                                    <!-- single-product start -->



                                                    <asp:ListView ID="lstpro2" runat="server">
                                                        <ItemTemplate>
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="single-product">
                                                                        <span id="Span1" class="sale-text" runat="server" visible='<%# ((Convert.ToInt32(Eval("sale")) >0))%>'>Sale</span>
                                                                    <div class="product-img">
                                                                        <a href="viewproduct.aspx?id=<%# Eval("productid") %>">
                                                                            <img class="primary-image" src="img/product/<%# Eval("image") %>" alt="" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="product-content" style="text-align: center">
                                                                       <div class="price-box">
                                                               <span class="price_newcss">₹<%# Eval("Price") %>/-</span>
                                                                <span id="Span2" class="price_newcss1" visible='<%# ((Convert.ToInt32(Eval("Discount")) ==0) ? false : true) %>' runat="server">₹<%# (int)( Math.Round((Convert.ToDouble(Eval("Discount"))/Convert.ToDouble(Eval("Price"))*100), MidpointRounding.AwayFromZero)) %>%</span>
                                                            </div>
                                                                        <h2 class="product-name"><a href="viewproduct.aspx?id=<%# Eval("productid") %>"><%# Eval("productname") %></a></h2>

                                                                        <div class="product-icon" style="margin-top: 8px">
                                                                            <a href="viewproduct.aspx?id=<%# Eval("productid") %>"><i class="fa fa-shopping-cart"></i></a>
                                                                            <a href="viewproduct.aspx?id=<%# Eval("productid") %>"><i class="fa fa-heart"></i></a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:ListView>

                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

