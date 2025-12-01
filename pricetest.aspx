<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pricetest.aspx.cs" Inherits="pricetest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hitstore - Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- favicon
		============================================ -->		
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="main_shop_area">
            <div class="breadcrumbs">
                <div class="container">
                    <div class="container-inner">
                        <ul class="tasnimm">
                            <li class="home">
                                <a href="#">Home</a>
                                <span>
                                    <i class="fa fa-angle-right"></i>
                                </span>
                            </li>
                            <li class="category3">
                                <strong>Smartphones & Accessories</strong>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="category-image-all">
                <div class="container">
                    <div class="category-image">
                        <img title="Smartphones & Accessories" alt="Smartphones & Accessories" src="img/shop/category-image.jpg">
                    </div>
                </div>
            </div>
            <div class="main_shop_all">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="block block-layered-nav">
                                <div class="block-title" id="title">
                                    <h2>Shop By</h2>
                                </div>
                            </div>
                            <div class="block-content">
                                <div class="currently">
                                    <div class="current_one">
                                        <span class="label">Price:</span>
                                        <span class="value">$88.00 - $658.99</span>
                                    </div>
                                    <div class="current">
                                        <a href="#">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="actions">
                                    <a href="#">Clear All</a>
                                </div>
                            </div>
                            <div class="narrow-by-list">
                                <div class="block layered-attribute">
                                    <div class="block-title">
                                        <h2>Category</h2>
                                    </div>
                                    <div class="odd">
                                        <ul>
                                            <li>
                                                <a href="#">Dresses</a>
                                            </li>
                                            <li>
                                                <a href="#">shoes</a>
                                            </li>
                                            <li>
                                                <a href="#">Handbags</a>
                                            </li>
                                            <li>
                                                <a href="#" >Clothing</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="block   layered-price">
                                <div class="block-title">
                                    <h2>Price</h2>
                                </div>
                                <div class="widget shop-filter">
                                    <div class="info_widget">
                                        <div class="price_filter">
                                            <div id="slider-range"></div>
                                            <div class="price_slider_amount">
                                                <input type="text" id="amount" name="price"  />
                                                
                                            </div>
                                        </div>
                                    </div>							
                                </div>
                            </div>
                            <div class="narrow-by-list">
                                <div class="block layered-attribute">
                                    <div class="block-title">
                                        <h2>Manufacturer</h2>
                                    </div>
                                    <div class="odd">
                                        <ul>
                                            <li>
                                                <a href="#">Adidas</a>
                                            </li>
                                            <li>
                                                <a href="#">Chanel</a>
                                            </li>
                                            <li>
                                                <a href="#" >DKNY</a>
                                            </li>
                                            <li>
                                                <a href="#">Dolce</a>
                                            </li>
                                            <li>
                                                <a href="#">Gabbana</a>
                                            </li>
                                            <li>
                                                <a href="#">Nike</a>
                                            </li>
                                            <li>
                                                <a href="#">Vogue</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="narrow-by-list">
                                <div class="block layered-attribute">
                                    <div class="block-title">
                                        <h2>Color</h2>
                                    </div>
                                    <div class="odd">
                                        <ul>
                                            <li>
                                                <a href="#"  >Black</a>
                                            </li>
                                            <li>
                                                <a href="#">Blue</a>
                                            </li>
                                            <li>
                                                <a href="#">Brown</a>
                                            </li>
                                            <li>
                                                <a href="#">Pink</a>
                                            </li>
                                            <li>
                                                <a href="#">Red</a>
                                            </li>
                                            <li>
                                                <a href="#">While</a>
                                            </li>
                                            <li>
                                                <a href="#">Yellow</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="block layered">
                                <div class="block-title">
                                    <h2>Popular Tags</h2>
                                </div>
                                <div class="block-content">
                                    <ul class="tags-list">
                                        <li>
                                            <a href="#">Clothing</a>
                                        </li>
                                        <li>
                                            <a href="#">accessories</a>
                                        </li>
                                        <li>
                                            <a href="#">fashion</a>
                                        </li>
                                        <li>
                                            <a href="#" >footwear</a>
                                        </li>
                                        <li>
                                            <a href="#">good</a>
                                        </li>
                                        <li>
                                            <a href="#">kid</a>
                                        </li>
                                        <li>
                                            <a href="#" >men</a>
                                        </li>
                                        <li>
                                            <a href="#">women</a>
                                        </li>
                                    </ul>
                                    <div class="actions">
                                        <a href="#">View All Tags</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="features-tab">
                                      <!-- Nav tabs -->
                                        <div class="shop-all-tab">
                                            <div class="two-part">
                                                <ul class="nav tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-th-large"></i></a></li>
                                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-align-justify"></i></a></li>
                                                </ul>
                                                <div class="shop5">
                                                    <label>Show</label>
                                                    <select>
                                                        <option value="">12</option>
                                                        <option value="">24</option>
                                                        <option value="">36</option>
                                                    </select>
                                                     per page        
                                                </div>
                                            </div>
                                            <div class="sort-by">
                                                <div class="shop6">
                                                    <label>Sort By</label>
                                                    <select>
                                                        <option value="">Position</option>
                                                        <option value="">Name</option>
                                                        <option value="">Price</option>
                                                    </select>
                                                    <a href="#"><i class="fa fa-long-arrow-up"></i></a> 
                                                </div>
                                            </div>
                                        </div>
                                      <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="home">
                                                <div class="row">
                                                    <div class="shop-tab">
                                                        <!-- single-product start -->
                                                        <div class="col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product end -->				
                                                        <!-- single-product start -->
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product end -->	
                                                        <!-- single-product start -->
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product end -->	
                                                        <!-- single-product start -->
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product end -->	
                                                        <!-- single-product start -->
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- single-product end -->	
                                                        <!-- single-product start -->
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                    <h2 class="product-name"><a href="#"> Donec ac tempus </a></h2>
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" col-md-3 col-sm-6">
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
                                                                        <a href="#"><i class="fa fa-shopping-cart"> </i></a>
                                                                        <a href="#"><i class="fa fa-heart"></i></a>
                                                                        <a href="#"><i class="fa fa-refresh"> </i></a>
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
                                                    <div class="li-item">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="single-product">
                                                                <span class="sale-text">Sale</span>
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img class="primary-image" alt="" src="img/product/4.jpg">
                                                                    </a>							
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <div class="f-fix">
                                                                <h2 class="product-name">
                                                                    <a href="#">Quisque in arcu</a>
                                                                </h2>
                                                                <div class="pro-rating">
                                                                    <div class="pro_one">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="pro_two">
                                                                        <a href="#">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </a>
                                                                    </div>
                                                                    <p class="rating-links">
                                                                        <a href="#">1 Review(s)</a>
                                                                        <span class="separator">|</span>
                                                                        <a href="#">Add Your Review</a>
                                                                    </p>
                                                                </div>
                                                                <p class="desc">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Viva </p>
                                                                <div class="p-box">
                                                                    <span class="special-price">$123.00</span>
                                                                </div>
                                                                <div class="product-icon">
                                                                    <a href="#">
                                                                        <i class="fa fa-shopping-cart"> </i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-refresh"> </i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="li-item">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="single-product">
                                                                <span class="sale-text">Sale</span>
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img class="primary-image" alt="" src="img/product/7_2.jpg">
                                                                    </a>							
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <div class="f-fix">
                                                                <h2 class="product-name">
                                                                    <a href="#">Voluptas nulla</a>
                                                                </h2>
                                                                <div class="pro-rating">
                                                                    <div class="pro_one">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="pro_two">
                                                                        <a href="#">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </a>
                                                                    </div>
                                                                    <p class="rating-links">
                                                                        <a href="#">1 Review(s)</a>
                                                                        <span class="separator">|</span>
                                                                        <a href="#">Add Your Review</a>
                                                                    </p>
                                                                </div>
                                                                <p class="desc">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Viva </p>
                                                                <div class="p-box">
                                                                    <span class="special-price">$222.00</span>
                                                                </div>
                                                                <div class="product-icon">
                                                                    <a href="#">
                                                                        <i class="fa fa-shopping-cart"> </i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-refresh"> </i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="li-item">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="single-product">
                                                                <span class="sale-text">Sale</span>
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img class="primary-image" alt="" src="img/product/20.jpg">
                                                                    </a>							
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <div class="f-fix">
                                                                <h2 class="product-name">
                                                                    <a href="#">pleasure rationally</a>
                                                                </h2>
                                                                <div class="pro-rating">
                                                                    <div class="pro_one">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="pro_two">
                                                                        <a href="#">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </a>
                                                                    </div>
                                                                    <p class="rating-links">
                                                                        <a href="#">1 Review(s)</a>
                                                                        <span class="separator">|</span>
                                                                        <a href="#">Add Your Review</a>
                                                                    </p>
                                                                </div>
                                                                <p class="desc">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Viva </p>
                                                                <div class="p-box">
                                                                    <span class="special-price">$222.00</span>
                                                                    <span class="old-price">$333.00 </span>
                                                                </div>
                                                                <div class="product-icon">
                                                                    <a href="#">
                                                                        <i class="fa fa-shopping-cart"> </i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-refresh"> </i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="li-item">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="single-product">
                                                                <span class="sale-text">Sale</span>
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img class="primary-image" alt="" src="img/product/16_3.jpg">
                                                                    </a>							
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <div class="f-fix">
                                                                <h2 class="product-name">
                                                                    <a href="#">consequences</a>
                                                                </h2>
                                                                <div class="pro-rating">
                                                                    <div class="pro_one">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="pro_two">
                                                                        <a href="#">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </a>
                                                                    </div>
                                                                    <p class="rating-links">
                                                                        <a href="#">1 Review(s)</a>
                                                                        <span class="separator">|</span>
                                                                        <a href="#">Add Your Review</a>
                                                                    </p>
                                                                </div>
                                                                <p class="desc">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Viva </p>
                                                                <div class="p-box">
                                                                    <span class="special-price">$211.00</span>
                                                                </div>
                                                                <div class="product-icon">
                                                                    <a href="#">
                                                                        <i class="fa fa-shopping-cart"> </i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-refresh"> </i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="li-item">
                                                        <div class="col-md-4 col-sm-4">
                                                            <div class="single-product">
                                                                <span class="sale-text">Sale</span>
                                                                <div class="product-img">
                                                                    <a href="#">
                                                                        <img class="primary-image" alt="" src="img/product/18.jpg">
                                                                    </a>							
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8">
                                                            <div class="f-fix">
                                                                <h2 class="product-name">
                                                                    <a href="#">occaecati cupiditate</a>
                                                                </h2>
                                                                <div class="pro-rating">
                                                                    <div class="pro_one">
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                        <a href="#">
                                                                            <i class="fa fa-star"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="pro_two">
                                                                        <a href="#">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </a>
                                                                    </div>
                                                                    <p class="rating-links">
                                                                        <a href="#">1 Review(s)</a>
                                                                        <span class="separator">|</span>
                                                                        <a href="#">Add Your Review</a>
                                                                    </p>
                                                                </div>
                                                                <p class="desc">Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Viva </p>
                                                                <div class="p-box">
                                                                    <span class="special-price">$345.00</span>
                                                                </div>
                                                                <div class="product-icon">
                                                                    <a href="#">
                                                                        <i class="fa fa-shopping-cart"> </i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-refresh"> </i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>	
                                            </div>
                                        </div>
                                        <div class="shop-all-tab">
                                            <div class="two-part">
                                                <ul class="nav tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-th-large"></i></a></li>
                                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-align-justify"></i></a></li>
                                                </ul>
                                                <div class="shop5 page">
                                                    <p>Page:</p>
                                                    <ul>
                                                        <li>
                                                            <a class="active" href="#">1</a>
                                                            <a href="#">2</a>
                                                            <a href="#"><i class="fa fa-arrow-right"></i></a>
                                                        </li>
                                                    </ul>        
                                                </div>
                                            </div>
                                            <div class="sort-by">
                                                <div class="shop6">
                                                    <label>Sort By</label>
                                                    <select>
                                                        <option value="">Position</option>
                                                        <option value="">Name</option>
                                                        <option value="">Price</option>
                                                    </select>
                                                    <a href="#"><i class="fa fa-long-arrow-up"></i></a> 
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
        <div class="shop_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title ma-title lab">
                            <h2>
                                Our brands
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="row">          
                    <div class="item_all indicator-style">
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                        <div class="col-md-12">
                            <img class="primary-img" src="img/item/br1.jpg" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- end shop_area
		============================================ -->
        <!-- start tweets_area
		============================================ -->
        <section class="tweets_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tweet-content">
                            <div class="tweet-title ma-title">
                                <h2>Latest Tweets</h2>
                            </div>
                            <div class="twitter-article">
                                <div class="twitter-pic">
                                    <a href="#"><img src="img/tweet/sMv5yar__normal.png" alt="" /></a>
                                </div>
                                <div class="twitter-text">
                                    <span class="tweetprofilelink">
                                        <strong>
                                        <a href="#">Magento themes Club</a>
                                        </strong>
                                        <a href="#">@plazathemes</a>
                                    </span>
                                    <br>
                                        Check Out "Optician - Responsive #OpenCart #Digital #Theme" on #envatomarket by
                                        <a href="#">@posthemes</a>
                                        #themeforest
                                        <a href="#">https://t.co/NGqqa3v0tf</a>
                                    <br>
                                    <span class="tweet-time">
                                        <a href="#">11h</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="social-footer">
                            <div class="ma-title">
                                <h2>Stay Connected</h2>
                            </div>
                            <div class="footer-static-content">
                                <ul class="link-follow">
                                    <li class="first">
                                        <a class="twitter fa fa-twitter" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="google fa fa-google-plus" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="facebook fa fa-facebook" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="linkedin fa fa-linkedin" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="youtube fa fa-youtube" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="rss fa fa-rss" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="vimeo-square fa fa-vimeo-square" href="#"></a>
                                    </li>
                                    <li class="first">
                                        <a class="instagram fa fa-instagram" href="#"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

