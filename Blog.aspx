<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                        <strong>Latest News</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
       
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
                CancelSelectOnNullParameter="false" SelectCommand="Select  * from blog_detail order by id desc"></asp:SqlDataSource>
                   
                </div>
            </div>

        </div>
    </section>
</asp:Content>

