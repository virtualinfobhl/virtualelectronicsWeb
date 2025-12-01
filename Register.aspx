<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
    $(document).on('change', ".gstinnumber", function () {
        var inputvalues = $(this).val();
        var gstinformat = new RegExp('^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');

        if (gstinformat.test(inputvalues)) {
            return true;
        } else {
            alert('Please Enter Valid GSTIN Number');
            $(".gstinnumber").val('');
            $(".gstinnumber").focus();
        }

    });
</script> 
    <style>
        .btn_css_cvc {
            background-color: #188AC8 !important;
            color: white !important;
            padding: 5px 5px;
            transition: 0.3s;
            border: none;
        }
    </style>


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
                                        <a href="Index.aspx">Home</a>
                                        <span>
                                            <i class="fa fa-angle-right"></i>
                                        </span>
                                    </li>
                                    <li class="category3">
                                        <strong>User Register </strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

    <div class="container">
        <div class="container"  style="border:solid 1px #dbdee0">
            <div class="row  order-details">
            
                <h3>New User? <span style="color:#F05529">Please Register your details :-  </span></h3>
              
                <div class="col-sm-5 col-md-5 col-lg-5">
                    <form>
                        <div class="form-group">
                            <asp:TextBox ID="Txtname" runat="server" class="form-control" placeholder="Enter Name" TabIndex="1"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="Txtaddress" runat="server" class="form-control" placeholder="Enter Address" TabIndex="2"></asp:TextBox>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:DropDownList ID="DDState" runat="server" AutoPostBack="true" class="form-control" TabIndex="3" DataValueField="State_Code" DataTextField="State_Name" OnSelectedIndexChanged="DDState_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="DDDistrict" runat="server" class="form-control" TabIndex="4" DataValueField="District_Code" DataTextField="District_Name">
                                    </asp:DropDownList>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                      
                       

                        <div class="form-group">
                            <asp:TextBox ID="TxtEmail" runat="server" Enabled="true" class="form-control" placeholder="Enter Email Id" TabIndex="5"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="E-mailId is Invalid"
                                ControlToValidate="TxtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>



                    </form>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                <div class="col-sm-5 col-md-5 col-lg-5">
                    
                  
                   <div class="form-group">
                            <asp:TextBox ID="txtpincode" runat="server" class="form-control" placeholder="Enter PinCode" TabIndex="7"></asp:TextBox>
                        </div>
                    <div class="form-group">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtMobile" runat="server" class="form-control" TabIndex="9" placeholder="Enter Mobile Number / User Id" MaxLength="10" onkeypress='return ((event.charCode >= 48 && event.charCode <= 57)||event.keyCode == 8||event.keyCode == 9)' OnTextChanged="TxtMobile_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <asp:Label ID="UserLbl" runat="server" Font-Size="10px" ForeColor="Red"></asp:Label>


                                <asp:Label ID="Label28" runat="server" Font-Size="10px"></asp:Label>

                                <div class="form-group">


                                    <asp:TextBox ID="TxtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password" TabIndex="10"
                                        Enabled="False" Style="width: 100%; height: 32px"></asp:TextBox>
                                    <asp:Label ID="Label29" runat="server" Font-Size="10px" ForeColor="#999999"  Text="" Style="width: 100%; height: 32px"></asp:Label>
                                </div>
                                <div class="form-group">

                                    <asp:TextBox ID="TxtCofirm" runat="server" placeholder="Password" TextMode="Password"  Style="width: 100%; height: 32px" class="form-control" TabIndex="11"
                                        Enabled="False" ></asp:TextBox>
                                   <%-- <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TxtCofirm"
                                        ErrorMessage="Password Not Matched" Font-Size="Small" ControlToCompare="TxtPassword"></asp:CompareValidator>--%>

                                </div>
                                 <div class="form-group" runat="server" visible="false">
                                    <asp:TextBox ID="txtrefer" runat="server" class="form-control" TabIndex="9" placeholder="Enter Referral Code" MaxLength="10"  OnTextChanged="txtrefer_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <asp:Label ID="lblrefer" runat="server" Font-Size="10px" ForeColor="Red"></asp:Label>

                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </div>

                    <div class="form-group">
                        <label class="checkbox">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="ChkTerms" Checked="true" runat="server" Text="" /><i></i>I Agree Terms & conditions &nbsp;<a class="terms" href="Terms.aspx"> terms of service</a>
                        </label>
                    </div>
                    &nbsp;<asp:Label ID="LblErr" runat="server" ForeColor="red"></asp:Label>
                    <div class="form-group">
                        <asp:Button ID="btnregister" runat="server" Text="Create an account" TabIndex="12" class="btn btn-primary" OnClick="btnregister_Click" Style="background-color: #F05529; border: none; color: white" />

                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
            </div>
        </div>



    </div>
    <asp:TextBox ID="Txtstop" runat="server" Style="border:none;background-color:none;width:0px"></asp:TextBox>

                    </div>
                </div>
         </section>
</asp:Content>
