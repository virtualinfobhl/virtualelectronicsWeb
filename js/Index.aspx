<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- main slider -->
    <section class="slider-area" style="margin-top: -15px">
        <div class="bend niceties preview-2">
            <div id="ensign-nivoslider" class="slides">
                <img src="img/webslider/1.jpg" alt="" title="#slider-direction-1" />
                <img src="img/webslider/2.jpg" alt="" title="#slider-direction-2" />
                <img src="img/webslider/3.jpg" alt="" title="#slider-direction-3" />
                <img src="img/webslider/4.jpg" alt="" title="#slider-direction-4" />
            </div>
            <!-- direction 1 -->
            <asp:ListView ID="ListView1" runat="server" DataSourceID="srcwebslider">
                <ItemTemplate>
                    <div id="slider-direction-<%# Eval("id") %>" class="t-cn slider-direction">

                        <div class="slider-content t-lfl s-tb slider-1">
                            <div class="title-container s-tb-c title-compress">
                                <h1 class="title1"><%# Eval("title") %></h1>

                                <h3 class="title3"><%# Eval("feature") %></h3>
                                <div class="s-title">
                                    <a href="viewproduct.aspx?id=<%# Eval("id") %>">Buy Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="srcwebslider" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select * from webslider order by priority asc"></asp:SqlDataSource>
            <!-- direction 2 -->



        </div>
    </section>
    <!--main slider end-->
    <!-- start slider_area
		============================================ -->
    <section class="slider_area">
        <div class="container">
            <div class="row">
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=1">
                        <img src="img/BannerAds/1.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=1">
                        <img src="img/BannerAds/2.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=1">
                        <img src="img/BannerAds/3.jpg" alt=""></a>
                </div>
                <section class="product_area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="ma-title">
                        <h2>New Products
                        </h2>
                    </div>
                    <div class="row">
                        <div class="features-curosel indicator-style">
                           <asp:ListView ID="lstpro2" runat="server">
                                            <ItemTemplate>
                                                <div class=" col-md-3">
                                                    <div class="single-product">
                                                        <span class="sale-text">Sale</span>
                                                        <div class="product-img">
                                                            <a href="viewproduct.aspx?id=<%# Eval("productid") %>">
                                                                <img class="primary-image" src="img/product/<%# Eval("image") %>" alt="" />
                                                            </a>
                                                        </div>
                                                        <div class="product-content" style="text-align:center">
                                                            <div class="price-box">
                                                                <span class="special-price">₹<%# Eval("Price") %></span>
                                                                <span class="old-price">₹<%# Eval("Discount") %> </span>
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
    </section>
             
                
            
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <br />
                    <br />
                    <div class="lenovo">
                        <a href="viewproduct.aspx?id=1">
                            <img alt="" src="img/Middleads/1.jpg">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <br />
                    <br />
                    <div class="lenovo">
                        <a href="viewproduct.aspx?id=1">
                            <img alt="" src="img/Middleads/2.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end slider_area
		============================================ -->
    <!-- start product_area
		============================================ -->
    <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="features-tab indicator-style" id="divpr">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs moz" role="tablist">
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="sqlcategory">
                                <ItemTemplate>
                                    <li role="presentation" class="active">
                                       
                                       <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MainCategoryid") %>' OnClick="LinkButton1_Click"><%# Eval("MainCategoryName") %></asp:LinkButton></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                         <asp:SqlDataSource ID="sqlcategory" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select MainCategoryid,MainCategoryName from M_CategoryMaster"></asp:SqlDataSource>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <div class="row">
                                    <div class="features-curosel indicator-style">
                                        <asp:ListView ID="lstproduct" runat="server">
                                            <ItemTemplate>
                                                <div class=" col-md-3">
                                                    <div class="single-product">
                                                        <span class="sale-text">Sale</span>
                                                        <div class="product-img">
                                                            <a href="viewproduct.aspx?id=<%# Eval("productid") %>">
                                                                <img class="primary-image" src="img/product/<%# Eval("image") %>" alt="" />
                                                            </a>
                                                        </div>
                                                        <div class="product-content" style="text-align:center">
                                                            <div class="price-box">
                                                                <span class="special-price">₹<%# Eval("Price") %></span>
                                                                <span class="old-price">₹<%# Eval("Discount") %> </span>
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
    <!-- end product_area
		============================================ -->
    <!-- start shop_area
		============================================ -->
    <section class="shop_area">
        <div class="container">


            <div class="row">
                <div class="col-md-12">
                    <div class="title ma-title">
                        <h2>Latest Post
                        </h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="Latest_Post indicator-style">
                    <asp:ListView ID="ListView3" runat="server" DataSourceID="sqlblog">
                                            <ItemTemplate>
                    <div class="col-md-4">
                        <div class="latest_all">
                            <div class="Latest-img">
                                <a href="blogdetails.aspx?id=<%# Eval("id") %>">
                                    <img class="primary-img" src="img/blog/<%# Eval("image") %>" alt="" />
                                </a>
                            </div>
                            <div class="Latest_slider">
                                <div class="blog-content">
                                    <h3><a href="#"><%# Eval("title") %></a></h3>
                                </div>
                                <div class="date-time">
                                    <div class="time-blog">
                                        <i class="fa fa-calendar-o"></i>
                                     <%# string.Format(Eval("entrydate","{0:dd/MM/yyyy}")) %>
                                            <span>/</span>
                                    </div>
                                    <div class="time-conment">
                                        <span class="comments">
                                            <i class="fa fa-author"></i>
                                            <a href="#">Admin</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                                                </ItemTemplate>
                                        </asp:ListView>

                    <asp:SqlDataSource ID="sqlblog" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select  top 4* from blog_detail order by id desc"></asp:SqlDataSource>
                   
                </div>
            </div>

        </div>
    </section>
</asp:Content>

