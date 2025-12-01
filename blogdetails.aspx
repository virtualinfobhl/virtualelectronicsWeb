<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blogdetails.aspx.cs" Inherits="blogdetails" %>

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
                                        <strong>Blog</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <section class="main-blog-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="sqlblog">
                                            <ItemTemplate>
                        <div class="single-bolg">
                            <div class="post-format-area">
                                <div class="b-slide-all">
                                    <img src="img/blog/<%# Eval("image") %>" alt="">
                                   
                                </div>
                            </div>
                            <div class="entry-header-area">
                                <div class="post-types">
                                    <i class="fa fa-picture-o"></i>
                                </div>
                                <div class="info-blog">
                                    <div class="single-b-info category-name">
                                        <i class="fa fa-folder-open-o"></i>
                                        <a href="#">
                                            <span>Blog</span>
                                        </a>
                                    </div>
                                    <div class="single-b-info createdby">
                                        <i class="fa fa-user"></i>
                                        <span>Super User</span>
                                    </div>
                                  
                                   
                                    <h2 class="name">
                                        <a href="#"><%# Eval("title") %></a>
                                    </h2>
                                </div>
                            </div>
                            <p><%# Eval("description") %>.</p>
                           
                        </div> 

                                                     </ItemTemplate>
                                        </asp:ListView>

                    <asp:SqlDataSource ID="sqlblog" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select  * from blog_detail where id=@id">
                            <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                                        </SelectParameters>
                    </asp:SqlDataSource>
                     
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="blog-right-sidebar">
                           
                            <div class="latest-posts">
                                <h3 class="sp-module-title">
                                    <span>Latest Posts</span>
                                </h3>

                                      <asp:ListView ID="ListView1" runat="server" DataSourceID="sqllist">
                                            <ItemTemplate>
                                <div class="single-l-post">
                                          <a href="blogdetails.aspx?id=<%# Eval("id") %>"><%# Eval("title") %></a>
                                    <p>  <%# string.Format(Eval("entrydate","{0:dd/MM/yyyy}")) %></p>
                                </div>
                                  </ItemTemplate>
                                        </asp:ListView>

                    <asp:SqlDataSource ID="sqllist" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select *  from blog_detail where id !=@id">
                            <SelectParameters>
                                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                                        </SelectParameters>
                    </asp:SqlDataSource>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

