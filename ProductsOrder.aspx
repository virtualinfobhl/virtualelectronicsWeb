<%@ Page Title="Order Information" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsOrder.aspx.cs" Inherits="ProductsOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--  <style>
        .mycheckbox input[type="checkbox"] {
            margin-right: 7px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- BREADCRUMB -->

    <!-- /BREADCRUMB -->
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
                                    <strong>Order Confirmed </strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <div class="container">
                    <div class="row">
                        <div class="col-md-3 cart-total">
                            <a href="ViewCart.aspx" style="background-color: #D10024; border: none; padding: 8px" class="btn btn-success btn-block">Back to Cart</a>
                            <br />
                            <div style="border: solid 1px #E1DDDD">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="price-details">

                                            <div id="DivWallet" runat="server" visible="false">
                                                <li style="border-top: solid 1px #DDD9D9; list-style-type: none">

                                                    <label class="radio">
                                                        &nbsp; &nbsp;<asp:CheckBox ID="ChkWallet" runat="server" class="mycheckbox" Text="Deduct From Wallet" OnCheckedChanged="ChkWallet_CheckedChanged" AutoPostBack="true" />:<i class="fa fa-inr"></i><asp:Label ID="lblWallet" runat="server"></asp:Label>/-</label></li>
                                            </div>
                                            <p style="font-size: 17px; color: black !important; border-bottom: 1px solid #DDD9D9"><strong>Order Summary :</strong></p>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td width="70%"><span>Total</span></td>
                                                    <td width="30%"><span class="total1">
                                                        <i class="fa fa-inr"></i>
                                                        <asp:Label ID="lbltotalamount" runat="server" Style="text-align: right;"></asp:Label>


                                                    </span></td>

                                                </tr>
                                            </table>


                                            <table style="width: 100%; border-bottom: 1px solid #DDD9D9">
                                                <tr>
                                                    <td width="70%"><span>Delivery Charges</span></td>
                                                    <td width="30%"><span class="total1">
                                                        <i class="fa fa-inr"></i>
                                                        <asp:Label ID="lbltotaldilverycharge" runat="server"></asp:Label>
                                                    </span></td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%" runat="server" id="Table1">
                                                <tr>
                                                    <td width="70%"><span>Net Amount </span></td>
                                                    <td width="30%"><span class="total1">
                                                        <i class="fa fa-inr"></i>
                                                        <asp:Label ID="LblNetAmount" runat="server"></asp:Label>
                                                    </span></td>
                                                </tr>
                                            </table>
                                            <tr>
                                                <table style="width: 100%" runat="server" id="Walletdiv" visible="false">
                                                    <tr>
                                                        <td width="70%"><span>Wallet </span></td>
                                                        <td width="30%">
                                                            <span class="total1">(-) <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblWallet2" runat="server"></asp:Label>
                                                            </span></td>
                                                    </tr>

                                                </table>

                                                <hr style="border: solid 1px #DDD9D9" />
                                        </div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td width="70%">
                                                    <p style="font-size: 17px; color: black !important"><strong>TOTAL</strong></p>
                                                </td>
                                                <td width="30%"><b style="color: Red">Rs.
                                    <asp:Label ForeColor="Red" Font-Bold="true" ID="LblPaidAmount" runat="server"></asp:Label></b></td>
                                            </tr>
                                        </table>
                                        <div class="price-details">
                                            <br />
                                            <span style="font-size: 17px; color: black !important"><strong>Payment Options</strong> </span>
                                            <div class="sky_form1" style="margin-left: 20px">

                                                <ul>
                                                    <li>
                                                        <label class="radio" runat="server" id="onnline">&nbsp;<asp:RadioButton ID="RdbOnine" runat="server" class="mycheckbox" AutoPostBack="true" GroupName="rbPaymentMode" Text="Online Mode" OnCheckedChanged="RdbOnine_CheckedChanged" Style="font-size: 14px; color: black" /></label></li>
                                                    <li>
                                                        <label class="radio" runat="server" id="offline">&nbsp;<asp:RadioButton ID="RdbCash" runat="server" class="mycheckbox" AutoPostBack="true" GroupName="rbPaymentMode" Text="Cash-On-Delivery" OnCheckedChanged="RdbCash_CheckedChanged" Checked="true" Style="font-size: 14px; color: black" /></label></li>


                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>





                                        <hr style="border: solid 1px #DDD9D9" />


                                        <div class="clearfix"></div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:LinkButton ID="LnkOrderConfirm" runat="server" Text="Order Confirm" Style="background-color: #D10024; border: none; padding: 8px" class="btn btn-success btn-block" OnClick="LnkOrderConfirm_Click" Enabled="false"></asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-md-9 col-xs-12" style="padding: 5px; border: 1px solid #E1DDDD;">

                            <div style="background-color: #F2F0EE; border: 1px solid #E1DDDD; padding: 5px">
                                <b>Buyer:</b><br />
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>

                                        <br />
                                        <div runat="server" id="add1">
                                            <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                                            <br />

                                            <asp:Label ID="lbladdress" runat="server" Text="Label"></asp:Label>`<br />

                                            <asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label>
                                            ,-
                <asp:Label ID="lblpincode" runat="server" Text="Label"></asp:Label>
                                            (
                <asp:Label ID="lblstate" runat="server" Text="Label"></asp:Label>)<br />

                                            <asp:Label ID="lblmobile" runat="server" Text="Label"></asp:Label>,<br />

                                            <asp:Label ID="lblmailid" runat="server" Text="Label"></asp:Label>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </div>
                            <div class="container-fluid">

                                <asp:ListView ID="lstcart" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="productid" runat="server" Visible="false" Text='<%# Eval("productid") %>'></asp:Label>
                                        <asp:Label ID="id" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                        <asp:Label ID="lblcolor" runat="server" Visible="false" Text='<%# Eval("color") %>'></asp:Label>
                                        <asp:Label ID="lblSize" runat="server" Visible="false" Text='<%# Eval("Size") %>'></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Visible="false" Text='<%# Eval("quantity") %>'></asp:Label>
                                        <div class="row" style="margin-top: 5px">

                                            <div class="col-lg-3">
                                                <img src="img/product/<%# Eval("image") %>" alt="" style="width: 100px; height: 120px; border: solid 1px #cccccc" />
                                            </div>
                                            <div class="col-lg-3">
                                                <span><strong>
                                                    <asp:Label ID="LblProductName" runat="server" Text='<%#Eval("ProductName")%>'></asp:Label></strong></span>

                                            </div>
                                            <div class="col-lg-3">
                                                ₹<asp:Label ID="LblTotalAmoun111t" runat="server"></asp:Label>



                                                <asp:SqlDataSource ID="sqlmain" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                                                    CancelSelectOnNullParameter="false" SelectCommand="select ((a.urate-a.udiscount)*b.Quantity) as Amount from ProductSizeQuantity as a inner join trncart as b on a.ProductId=b.ProductId  where a.ProductId=@ProductId and a.Size=@lblSize and a.colorid=@lblcolor AND B.USERID=@UserId">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                                                        <asp:ControlParameter Name="ProductId" ControlID="ProductId" DefaultValue="0" />
                                                        <asp:ControlParameter Name="lblcolor" ControlID="lblcolor" DefaultValue="0" />
                                                        <asp:ControlParameter Name="lblSize" ControlID="lblSize" DefaultValue="0" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="col-xs-6">
                                                    <span><strong>Qty &nbsp;<span class="text-muted"><asp:Label ID="LblQuantity" runat="server" Text='<%#Eval("quantity")%>'></asp:Label></span></strong></span>
                                                    <div class="col-xs-2">
                                                    </div>
                                                </div>
                                            </div>
                                            <hr />


                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>



                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>
    <br />
</asp:Content>

