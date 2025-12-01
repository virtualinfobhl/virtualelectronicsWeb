<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ordersuccess.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW"/>
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
                                    <strong>Order Success</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="container">
	<div class="row text-center">
        <div class="col-sm-6 col-sm-offset-3" style="border:solid 1px #dddddd">
        <br><br> <h2 style="color:#F05529"> Order Success</h2>
      <%--  <h3>Dear, <asp:Label ID="Label1" runat="server" ></asp:Label></h3>--%>
        <p style="font-size:20px;color:#F05529;">Thank you for Shopping with  JUSTFIND MEDIA We have sent Invoice of your order to Your Registered EmailID .</p>
        <a href="MyOrder.aspx" class="btn btn-success" style="background-color:#F05529;border:none">     Log in      </a>
    <br/><br/>
        </div>
        
	</div>
</div>
</asp:Content>

