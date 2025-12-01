<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountDetails.aspx.cs" Inherits="AccountDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        table#t01 tr:nth-child(even) {
            background-color: #eee;
        }

        table#t01 tr:nth-child(odd) {
            background-color: #fff;
        }

        table#t01 th {
            background-color: #FF5252;
            color: white;
            padding: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- BANNER STRAT -->
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
                                    <strong>My Order </strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- BANNER END -->
        </div>
    </section>

    <div class="mian-contain">
        <div class="container">

            <!-- CONTAIN START ptb-95-->
            <section class="checkout-section ptb-95 ptb-sm-60 ptb-xs-30">
                <div class="row">
                    <div class="col-md-2 col-sm-4">
                        <div class="account-sidebar account-tab mb-xs-30">
                            <div class="dark-bg tab-title-bg">
                                <div class="heading-part">
                                </div>
                            </div>
                            <div class="narrow-by-list">
                                <div class="block layered-attribute">
                                    <div class="block-title">
                                        <h2>My Account</h2>
                                    </div>
                                    <div class="odd">
                                        <ul>

                                            <li>
                                                <a href="AccountDetails.aspx">Account Details
                                                   
                                                </a>
                                            </li>
                                            <li>
                                                <a href="MyOrder.aspx">My Order List                                                   
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-10 col-sm-8">

                        <div id="data-step2" class="account-content" data-temp="tabdata">
                            <div class="row">
                                <div class="col-12">
                                    <div class="heading-part heading-bg mb-30">
                                        <h2 class="heading m-0">Account Details</h2>
                                    </div>
                                </div>
                            </div>
                         
                            <div class="container-fluid" style="border: solid 1px #dbdee0">
                                 <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:ListView ID="ListView1" runat="server" DataSourceID="Sqlnewarrival">
                                                    <ItemTemplate>
                                <div class="row">


                                    <div class="col-sm-5 col-md-5 col-lg-5">
                                        <form>
                                            <div class="form-group">
                                                <asp:TextBox ID="TxtName" runat="server" class="form-control" type="text" Text='<%#Eval("Name")%>' style="color:black" placeholder="Name"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="TxtEmail" runat="server" type="email" class="form-control" style="color:black" Text='<%#Eval("emailid")%>' placeholder="Email Id"></asp:TextBox>
                                            </div>


                                            <div class="form-group">
                                                <asp:TextBox ID="TxtMobile" runat="server" class="form-control"  style="color:black" Text='<%#Eval("mobilenumber")%>' placeholder="Mobile No."></asp:TextBox>
                                            </div>





                                        </form>
                                    </div>

                                    <div class="col-sm-5 col-md-5 col-lg-5">

                                       

                                      

                                        <div class="form-group">
                                            <asp:TextBox ID="txtpincode" runat="server" class="form-control" style="color:black" Text='<%#Eval("zipcode")%>' placeholder="Enter PinCode" TabIndex="7"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="Txtaddress" runat="server" class="form-control" style="color:black" TextMode="MultiLine" Rows="2" Text='<%#Eval("Address")%>' placeholder="Address"></asp:TextBox>

                                        </div>

                                       <%--    <div class="form-group" style="color:black">
                                        Wallet Amount : <%#Eval("Wallet")%> &nbsp;     
                                        </div>--%>
                                    
                                    &nbsp;<asp:Label ID="LblErr" runat="server" ForeColor="red"></asp:Label>
                                    <div class="form-group">
                                        <asp:Button ID="btnregister" runat="server" Text="Update" TabIndex="12" class="btn btn-primary" OnClick="btnregister_Click" Style="background-color: #F05529; border: none; color: white" />

                                    </div>
                                    </div>
           
                                </div>  

</ItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="Sqlnewarrival" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile %>" SelectCommand="select * from  register  Where UserId=@UserId">
                                                    <SelectParameters>

                                                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                            </div>



                            
                        </div>

                       <%-- <br /><br />
                        <div class="row" style="border:2px solid #118b4c;padding:6px;text-align:center;font-family:'Maiandra GD';font-size:15px">
                            Your Referral code is : <b> <%=refercode %> </b> &nbsp;&nbsp;&nbsp;Share  Referral code and Earn Money
                        </div>
                         <div class="row">
                             <img src="refer.jpg" style="border:solid 1px #d8d8d8;padding:3px" />
                         </div>

                      
                        <br /><br />--%>

                        <a id="bottom"></a>

                    </div>
                </div>
            </section>
            <!-- CONTAINER END -->
        </div>
    </div>
</asp:Content>
