<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    
     <script type = "text/javascript" >
         function preventBack() { window.history.forward(); }
         setTimeout("preventBack()", 10);
         window.onunload = function () { null };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" defaultbutton="LogIn" defaultfocus="TxtPass">
     
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
                                    <strong>Forgot Password </strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- BREADCRUMB -->
    
    <!-- /BREADCRUMB -->
    <br /><br />
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-4"></div>
            <div class="col-md-4 order-details" style="border:solid 1px #dcdcdc">  <br /><br /> <asp:Panel ID="Panel1" runat="server" DefaultButton="LogIn">
                <div class="section-title" style="text-align: center">
                    <h3 class="title">Forgot Password</h3>
                    <div class="form-group">
                        <br />
                        <asp:TextBox ID="Forgot" runat="server" placeholder="Enter Your Register Mail Id.." class="form-control"></asp:TextBox>
                    </div>
                   
                    <div class="form-group">
                        <asp:Label ID="LblErr" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Button ID="LogIn" class="btn btn-danger" runat="server" Text="Submit" OnClick="LogIn_Click" Style="background-color:#F05529;border:none;color:white" />
                         <asp:Button ID="Button2" class="btn btn-Dark" runat="server" OnClick="Button2_Click" Text="Cancel" Style="background-color:#33343D;border:none;color:white" />
  
  
                    </div>
                </div></asp:Panel><br /><br />
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</asp:Content>

