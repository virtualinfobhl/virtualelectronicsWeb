<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px) {
            .iframe_css {
                width: 100%;
                height: 200px;
                border: none !important;
            }

            .iframe_css1 {
                width: 100%;
                height: 60px;
                border: none !important;
            }
        }


        /* Medium devices (landscape tablets, 768px and up) */
        @media only screen and (min-width: 768px) {
            .iframe_css {
                width: 100%;
                height: 460px;
                border: none !important;
            }

            .iframe_css1 {
                width: 100%;
                height: 60px;
                border: none !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <iframe src="slider.aspx" class="iframe_css"></iframe>
    
    <br />  <br /> <div class="container">
     <div class="row" style="text-align:center">
    <asp:LinkButton ID="LnkEdit" runat="server" Text=" Download App"  OnClick="LnkEdit_Click" style="color:red;border:solid 1px red;padding:5px"></asp:LinkButton></div></div>
   <br />
    <iframe src="scrolltab.aspx" class="iframe_css1"></iframe>
    <!-- main slider -->

    <!--main slider end-->
    <!-- start slider_area
		============================================ -->
    <section class="slider_area">
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
                                            <span class="sale-text" runat="server" visible='<%# ((Convert.ToInt32(Eval("sale")) >0))%>'>Sale</span>
                                            <div class="product-img">
                                                <a href="viewproduct.aspx?id=<%# Eval("productid") %>">
                                                    <img class="primary-image" src="img/product/<%# Eval("image") %>" alt="" />
                                                </a>
                                            </div>
                                            <div class="product-content" style="text-align: center">
                                               <div class="price-box">
                                                                <span class="price_newcss">₹<%# Eval("Price") %>/-</span>
                                                                <span id="Span1" class="price_newcss1" visible='<%# ((Convert.ToInt32(Eval("Discount")) ==0) ? false : true) %>' runat="server">₹<%# (int)( Math.Round((Convert.ToDouble(Eval("Discount"))/Convert.ToDouble(Eval("Price"))*100), MidpointRounding.AwayFromZero)) %>%</span>
                                                            </div>
                                                <h2 class="product-name"><a href="viewproduct.aspx?id=<%# Eval("productid") %>"><%# Eval("productname") %></a></h2>

                                                <div class="product-icon" style="margin-top: 8px">
                                                       <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton2_Click1"><i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton3_Click1"><i class="fa fa-heart"></i></asp:LinkButton>
                                                  

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>

                            </asp:ListView>


                        </div>
                    </div>

                </div>


                <div class="col-md-6 col-sm-6 col-xs-12">
                    <br />
                    <br />
                    <div class="lenovo">
                        <a href="viewproduct.aspx?id=<%=m1 %>">
                            <img alt="" src="img/Middleads/4.jpg">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <br />
                    <br />
                    <div class="lenovo">
                        <a href="viewproduct.aspx?id=<%=m2 %>">
                            <img alt="" src="img/Middleads/5.jpg">
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
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="features-tab indicator-style" id="divpr">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs moz" role="tablist">
                            <asp:ListView ID="ListView2" runat="server">
                                <ItemTemplate>
                                    <li role="presentation" class="<%# ((Convert.ToInt32(Eval("active")) ==1) ? "active" : "") %>">

                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MainCategoryid") %>' OnClick="LinkButton1_Click"><%# Eval("MainCategoryName") %></asp:LinkButton></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                        <%--  <asp:SqlDataSource ID="sqlcategory" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select MainCategoryid,MainCategoryName,case when MainCategoryid=1 then 1 else 0 end as  active from M_CategoryMaster "></asp:SqlDataSource>
                        --%>
                        <!-- Tab panes -->
                       
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                 <div class="container-fluid">
                         <div class="row">
                           
                             <div class="col-lg-12">
                               
                                 <div class="features-curosel indicator-style">
                                        <asp:ListView ID="lstproduct" runat="server">
                                            <ItemTemplate>
                                              
                                                    <div class="single-product">
                                                        <span id="Span2" class="sale-text" runat="server" visible='<%# ((Convert.ToInt32(Eval("sale")) >0))%>'>Sale</span>
                                                     

                                                        <div class="product-img">
                                                            <a href="viewproduct.aspx?id=<%# Eval("productid") %>">
                                                                <img class="primary-image" src="img/product/<%# Eval("image") %>" alt="" />
                                                            </a>
                                                        </div>
                                                        <div class="product-content" style="text-align: center">
                                                            <div class="price-box">
                                                                <span class="price_newcss">₹<%# Eval("Price") %>/-</span>
                                                                <span id="Span3" class="price_newcss1" visible='<%# ((Convert.ToInt32(Eval("Discount")) ==0) ? false : true) %>' runat="server">₹<%# (int)( Math.Round((Convert.ToDouble(Eval("Discount"))/Convert.ToDouble(Eval("Price"))*100), MidpointRounding.AwayFromZero)) %>%</span>
                                                            </div>
                                                            <h2 class="product-name"><a href="viewproduct.aspx?id=<%# Eval("productid") %>"><%# Eval("productname") %></a></h2>

                                                            <div class="product-icon" style="margin-top: 8px">
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton2_Click"><i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("productid") %>' OnClick="LinkButton3_Click"><i class="fa fa-heart"></i></asp:LinkButton>
                                                             

                                                            </div>
                                                        </div>
                                                    </div>
                                              
                                            </ItemTemplate>
                                        </asp:ListView>
                                        
                                    </div>
                             </div>
                                    <br />
                                        <a href="Category.aspx?id=<%=mid%>" class="btn-success pull-right" style="padding:6px;border-radius:25px;background-color:#39b3e4">View More</a>
                                </div>
                        </div>
                                
                            </div>

                        </div>
                    </div>
                </div>
                   <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=<%=b1 %>">
                        <img src="img/BannerAds/1.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=<%=b2 %>">
                        <img src="img/BannerAds/2.jpg" alt=""></a>
                </div>
                <div class="product col-md-4 col-sm-4 col-xs-12">
                    <a href="viewproduct.aspx?id=<%=b3 %>">
                        <img src="img/BannerAds/3.jpg" alt=""></a>
                </div>
                <br /><br />
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
                        <h2>Latest News
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
                                            <h3><a href="blogdetails.aspx?id=<%# Eval("id") %>"><%# Eval("title") %></a></h3>
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
                                                  Admin
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

            <br /><br />
        </div>
    </section>
</asp:Content>

