<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Google Fonts
		============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900' rel='stylesheet' type='text/css'>
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- nivo slider CSS
		============================================ -->
    <link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
    <link rel="stylesheet" href="lib/css/preview.css" type="text/css" media="screen" />
    <!-- animate CSS
		============================================ -->
    <!-- ui CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <link href="css/jquery-ui.css" rel="stylesheet">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- Image Zoom CSS
		============================================ -->
    <link rel="stylesheet" href="css/img-zoom/jquery.simpleLens.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <style>
        * {
            scrollbar-width: thin;
            scrollbar-color: #fff #e6e6e6;
        }

            *::-webkit-scrollbar {
                width: 0.5px;
            }

            *::-webkit-scrollbar-track {
                background: #fff;
            }

            *::-webkit-scrollbar-thumb {
                background-color: #fff;
                border-radius: 1px;
                border: 1px solid #e6e6e6;
            }
    </style>
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
                                            <asp:linkbutton id="LinkButton11" runat="server" commandargument="1" onclick="LinkButton1_Click1">Price Low to High</asp:linkbutton>
                                        </li>
                                        <li>
                                            <asp:linkbutton id="LinkButton2" runat="server" commandargument="2" onclick="LinkButton2_Click">Price High to Low</asp:linkbutton>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <%--<script type="text/javascript">
                            function GetDate() {
                                $('#amount').val($('#<%= txtamount.ClientID %>').val())
         }</script>--%>
                        <div class="block   layered-price" runat="server" visible="false">
                            <div class="block-title">
                                <h2>Price</h2>
                            </div>
                            <div class="widget shop-filter">
                                <div class="info_widget">
                                    <div class="price_filter">
                                        <div id="slider-range"></div>
                                        <div class="price_slider_amount">

                                            <input type="text" id="amount" name="price" onchange="GetDate()" />

                                            <span id="span_Id"></span>
                                        </div>
                                    </div>
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
                                        <asp:listview id="lstbrand" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a href="Category.aspx?id=<%=Request.QueryString["id"] %>&&brandid=<%# Eval("brandid") %>&&varient=&&color="><%# Eval("brandname") %></a>
                                                   </li>
                                            </ItemTemplate>
                                        </asp:listview>

                                        <asp:sqldatasource id="sqlbrand" runat="server" connectionstring="<%$ ConnectionStrings:Friendsmobile%>"
                                            cancelselectonnullparameter="false" selectcommand="Select brandid,brandname from brand">
                                          
                                        </asp:sqldatasource>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="narrow-by-list" runat="server" id="variantdiv" visible="false">
                            <div class="block layered-attribute">
                                <div class="block-title">
                                    <h2>Varient</h2>
                                </div>
                                <div class="odd" style="height: 180px; overflow: scroll; overflow-x: hidden;">
                                    <ul>
                                        <asp:listview id="ListView2" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a href="Category.aspx?id=<%=Request.QueryString["id"] %>&&brandid=<%=Request.QueryString["brandid"] %>&&varient=<%# Eval("id") %>&&color="><%# Eval("varient") %></a>
                                                  

                                                </li>
                                            </ItemTemplate>
                                        </asp:listview>


                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="narrow-by-list" runat="server" id="colordiv" visible="false">
                            <div class="block layered-attribute">
                                <div class="block-title">
                                    <h2>Color</h2>
                                </div>
                                <div class="odd" style="height: 200px; overflow: scroll; overflow-x: hidden;">
                                    <ul>
                                        <asp:listview id="lstcolor" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a href="Category.aspx?id=<%=Request.QueryString["id"] %>&&brandid=<%=Request.QueryString["brandid"] %>&&varient=<%=Request.QueryString["varient"] %>&&color=<%# Eval("ColorId") %>"><%# Eval("ColorName") %></a>
                                                  

                                                </li>
                                            </ItemTemplate>
                                        </asp:listview>


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



                                                    <asp:listview id="lstpro2" runat="server">
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
                                                                               <span id="Span2"  class="old-price" style="font-size:10px" visible='<%# ((Convert.ToInt32(Eval("Discount")) ==0) ? false : true) %>' runat="server">₹<%# (int)( Math.Round((Convert.ToDouble(Eval("Discount"))/Convert.ToDouble(Eval("Price"))*100), MidpointRounding.AwayFromZero)) %>%</span>
                                                              <span class="price_newcss">₹<%# Eval("Price") %>/-</span>
                                                             
                                                            </div>
                                                                        <h2 class="product-name" style="font-size:14px"><a href="viewproduct.aspx?id=<%# Eval("productid") %>" style="font-size:14px"><%# Eval("productname") %> </a></h2>

                                                                        <div class="product-icon" style="margin-top: 8px">
                                                                         <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton2_Click1"><i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton3_Click1"><i class="fa fa-heart"></i></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:listview>

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

