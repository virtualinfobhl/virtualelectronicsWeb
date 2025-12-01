<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- main slider -->
    <section class="slider-area" style="margin-top: -15px">
        <div class="bend niceties preview-2">
            <div id="ensign-nivoslider" class="slides">
                <img src="img/slider/1.jpg" alt="" title="#slider-direction-1" />
                <img src="img/slider/2.jpg" alt="" title="#slider-direction-2" />
                <img src="img/slider/3.jpg" alt="" title="#slider-direction-3" />
                <img src="img/slider/4.jpg" alt="" title="#slider-direction-4" />
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
                                    <a href="viewproduct.aspx?id=<%# Eval("id") %>">view collection</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
              <asp:SqlDataSource ID="srcwebslider" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                                                CancelSelectOnNullParameter="false" SelectCommand="Select * from webslider order by priority asc">
                                                            
                                                            </asp:SqlDataSource>
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
                    <a href="#">
                        <img src="img/product/banner23.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="#">
                        <img src="img/product/banner24.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="#">
                        <img src="img/product/banner25.jpg" alt=""></a>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="features-tab indicator-style">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs moz" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Computers & Networking</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Clothing</a></li>
                            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Lingerie</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <div class="row">
                                    <div class="features-curosel indicator-style">
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/8.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$155.00</span>
                                                        <span class="old-price">$170.00 </span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Fusce aliquam</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/4.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$699.00</span>
                                                        <span class="old-price">$800.00 </span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Quisque in arcu</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/5_1_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$88.00</span>
                                                        <span class="old-price">$99.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Proin lectus ipsum</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/3_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$123.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Aliquam consequat</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/5_1_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$721.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Donec non est</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/7_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Donec ac tempus </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/6_4.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Pellentesque habitant </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/13.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$432.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Etiam gravida</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/1_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$155.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Cras neque metus</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/12_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Nunc facilisis</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/15_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$99.00</span>
                                                        <span class="old-price">$111.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Primis in faucibus</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/17.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Accumsan elit </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/18.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$345.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">occaecati cupiditate</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/16_3.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$211.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">consequences</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/20.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">pleasure rationally</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="profile">
                                <div class="row">
                                    <div class="features-curosel  indicator-style">
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/1_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$155.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Cras neque metus</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/12_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Nunc facilisis</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/15_1.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$99.00</span>
                                                        <span class="old-price">$111.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Primis in faucibus</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/17.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Accumsan elit </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/18.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$345.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">occaecati cupiditate</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/16_3.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$211.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">consequences</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/20.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">pleasure rationally</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/7_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Donec ac tempus </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="messages">
                                <div class="row">
                                    <div class="features-curosel  indicator-style">
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/7_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Donec ac tempus </a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/12_2.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Nunc facilisis</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/8.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$155.00</span>
                                                        <span class="old-price">$170.00 </span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Fusce aliquam</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                        <!-- single-product start -->
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/4.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$699.00</span>
                                                        <span class="old-price">$800.00 </span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">Quisque in arcu</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star-o"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/18.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$345.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">occaecati cupiditate</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/16_3.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$211.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">consequences</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-md-3">
                                            <div class="single-product">
                                                <span class="sale-text">Sale</span>
                                                <div class="product-img">
                                                    <a href="#">
                                                        <img class="primary-image" src="img/product/20.jpg" alt="" />
                                                    </a>
                                                </div>
                                                <div class="product-content">
                                                    <div class="price-box">
                                                        <span class="special-price">$222.00</span>
                                                        <span class="special-price">$333.00</span>
                                                    </div>
                                                    <h2 class="product-name"><a href="#">pleasure rationally</a></h2>
                                                    <div class="pro-rating">
                                                        <div class="pro_one">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                        <div class="pro_two">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="product-icon">
                                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                        <a href="#"><i class="fa fa-refresh"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="lenovo">
                        <a href="#">
                            <img alt="" src="img/banner/banner15.jpg">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="lenovo">
                        <a href="#">
                            <img alt="" src="img/banner/banner14.jpg">
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
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/8.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$155.00</span>
                                            <span class="old-price">$170.00 </span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Fusce aliquam</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star-half-o"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/4.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$699.00</span>
                                            <span class="old-price">$800.00 </span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Quisque in arcu</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/5_1_1.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$88.00</span>
                                            <span class="old-price">$99.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Proin lectus ipsum</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/3_2.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$123.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Aliquam consequat</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star-o"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/5_1_1.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$721.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Donec non est</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <!-- single-product start -->
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/7_2.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$222.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Donec ac tempus </a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/6_4.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$333.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Pellentesque habitant </a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/13.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$432.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Etiam gravida</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/1_1.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$155.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Cras neque metus</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/12_2.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$222.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Nunc facilisis</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/15_1.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$99.00</span>
                                            <span class="old-price">$111.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Primis in faucibus</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/17.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$333.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">Accumsan elit </a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/18.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$345.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">occaecati cupiditate</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/16_3.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$211.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">consequences</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">Sale</span>
                                    <div class="product-img">
                                        <a href="#">
                                            <img class="primary-image" src="img/product/20.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special-price">$222.00</span>
                                            <span class="special-price">$333.00</span>
                                        </div>
                                        <h2 class="product-name"><a href="#">pleasure rationally</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <div class="pro_two">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-icon">
                                            <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product end -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
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
                    <div class="col-md-4">
                        <div class="latest_all">
                            <div class="Latest-img">
                                <a href="#">
                                    <img class="primary-img" src="img/shop/blog12.jpg" alt="" />
                                </a>
                            </div>
                            <div class="Latest_slider">
                                <div class="blog-content">
                                    <h3><a href="#">Fiant sollemnes in futurum</a></h3>
                                </div>
                                <div class="date-time">
                                    <div class="time-blog">
                                        <i class="fa fa-calendar-o"></i>
                                        01 Jan 1970 
                                            <span>/</span>
                                    </div>
                                    <div class="time-conment">
                                        <span class="comments">
                                            <i class="fa fa-comments-o"></i>
                                            0 <a href="#">comments</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="latest_all">
                            <div class="Latest-img">
                                <a href="#">
                                    <img class="primary-img" src="img/shop/blog13.jpg" alt="" />
                                </a>
                            </div>
                            <div class="Latest_slider">
                                <div class="blog-content">
                                    <h3><a href="#">Fiant sollemnes in futurum</a></h3>
                                </div>
                                <div class="date-time">
                                    <div class="time-blog">
                                        <i class="fa fa-calendar-o"></i>
                                        22  Sep  2015
                                            <span>/</span>
                                    </div>
                                    <div class="time-conment">
                                        <span class="comments">
                                            <i class="fa fa-comments-o"></i>
                                            0 <a href="#">comments</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="latest_all">
                            <div class="Latest-img">
                                <a href="#">
                                    <img class="primary-img" src="img/shop/blog12.jpg" alt="" />
                                </a>
                            </div>
                            <div class="Latest_slider">
                                <div class="blog-content">
                                    <h3><a href="#">Fiant sollemnes in futurum</a></h3>
                                </div>
                                <div class="date-time">
                                    <div class="time-blog">
                                        <i class="fa fa-calendar-o"></i>
                                        22  Sep  2015
                                            <span>/</span>
                                    </div>
                                    <div class="time-conment">
                                        <span class="comments">
                                            <i class="fa fa-comments-o"></i>
                                            0 <a href="#">comments</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="latest_all">
                            <div class="Latest-img">
                                <a href="#">
                                    <img class="primary-img" src="img/shop/blog11.jpg" alt="" />
                                </a>
                            </div>
                            <div class="Latest_slider">
                                <div class="blog-content">
                                    <h3><a href="#">Fiant sollemnes in futurum</a></h3>
                                </div>
                                <div class="date-time">
                                    <div class="time-blog">
                                        <i class="fa fa-calendar-o"></i>
                                        22  Sep  2015
                                            <span>/</span>
                                    </div>
                                    <div class="time-conment">
                                        <span class="comments">
                                            <i class="fa fa-comments-o"></i>
                                            0 <a href="#">comments</a>
                                        </span>
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

