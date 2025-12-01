<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type = "text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 10);
        window.onunload = function () { null };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
     <section class="main_contact_area">
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="container-inner">
                                <ul>
                                    <li class="home">
                                        <a href="#">Home</a>
                                        <span>
                                            <i class="fa fa-angle-right"></i>
                                        </span>
                                    </li>
                                    <li class="category3">
                                        <strong>contact </strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
  
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-4"></div>
            <div class="col-md-4 order-details" style="border:solid 1px #dcdada">
                 <asp:Panel ID="Panel1" runat="server" DefaultButton="LogIn">
                <div class="section-title" style="text-align: center">
                    <h3 class="title">Login Form</h3>
                    <div class="form-group">
                        <br />
                        <asp:TextBox ID="TxtUser" runat="server" placeholder="Mobile No." class="form-control" TabIndex="1"></asp:TextBox>
                    </div>
                    <div class="form-group">
                       
                        <asp:TextBox ID="TxtPass" runat="server" class="form-control" placeholder="Password"   TextMode="Password" onkeypress="FireOnClickButton();" TabIndex="2"></asp:TextBox>

                        
                   
                    </div>
                     <div class="form-group">
                          <span  class="btn pull-right" style="text-align:right !important"> <a href="forgotpassword.aspx"> Forgot Your Password?</a></span>
                          </div><br />
                    <div class="form-group">
                        <asp:Label ID="LblErr" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Button ID="LogIn" class="btn btn-danger" runat="server" Text="Login" OnClick="LogIn_Click" TabIndex="3" Style="background-color:#F05529;border:none;color:white" />
                         <asp:Button ID="Signup" class="btn btn-Dark" runat="server" Text="Sign up" OnClick="Signup_Click" Style="background-color:#33343D;border:none;color:white" />
  
                    </div>
                </div> 
                     </asp:Panel>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
                    </div>
                </div></section>
</asp:Content>

