<%@ Page Title="MyOrders " Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

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
                      
                        <div id="data-step3" class="account-content" data-temp="tabdata">
                            <div id="form-print" class="admission-form-wrapper">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="heading-part heading-bg mb-30">
                                            <h2 class="heading m-0"><i class="fa fa-clock-o" aria-hidden="true"></i>My Orders</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="col-xs-12 mb-xs-30">
                                        <div class="cart-item-table commun-table">
                                            <div class="table-responsive" style="width:100%">
                                                <table class="table">
                                                    <thead >
                                                       <tr>
                                                           <th>O.No </th>
                                                           <th> Order Date </th>
                                                           <th> Order Amount</th>
                                                           <th> Delivery Charges</th>
                                                           <th></th>
                                                       </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="Lstorder" runat="server" OnItemCommand="Lstorder_ItemCommand">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                       <asp:Label ID="LblOrderId" runat="server" Text='<%#Eval("OrderId") %>'></asp:Label>
                                                                       
                                                                    </td>
                                                                    <td>
                                                                        <%#Eval("RTS")%>
                                                                    </td>
                                                                    <td>
                                                                      <i class="fa fa-inr"></i>   <%#Eval("PaidAmount")%>
                                                                    </td>
                                                                    <td>
                                                                        <i class="fa fa-inr"></i>  <%#Eval("DeliveryFees")%>
                                                                    </td>
                                                                 
                                                                    <td>
                                                                          <asp:LinkButton ID="LnkViews" runat="server" Font-Bold="true" CommandName="View">Order Detail</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>


                        <a id="bottom"></a>
                       
                        <asp:Panel ID="pnlOrderInfo" runat="server" Visible="false">
                        <asp:Button Id="BtnClose" Text="Close" runat="server" OnClick="BtnClose_Click" style="float:right" class="btn btn-danger"  />
                      
                                <div style="width: 840px; padding-top: 20px; padding-bottom: 20px;">
                                    <div id="divPrint" runat="server">
                                        <div style="width: 100%; padding-bottom: 10px; background-color: #f1f0f0; padding: 20px 0px; border: 1px solid #d6d6d6;">
                                            <div style="width: 850px; text-align: center;">
                                                <b style="color: #000; font-family: Tahoma; font-size: 18px; font-weight: normal; letter-spacing: 1px">Order Information</b>
                                            </div>
                                            <div id="tdPrint" runat="server" style="width: 180px; text-align: right; margin-left: 600px; margin-top: -35px;">
                                                <asp:ImageButton ID="Imgbtn" ImageUrl="~/Images/print.png" runat="server" OnClick="Imgbtn_Click" />
                                            </div>
                                        </div>
                                        <div style="width: 100%; padding-bottom: 10px; border-bottom: 1px solid #d6d6d6; border-left: 1px solid #d6d6d6; border-right: 1px solid #d6d6d6;">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; padding-top: 20px;">
                                                <tr>
                                                    <td colspan="2" align="left" style="padding-bottom: 8px; border-bottom: 1px solid #e8e5e5; background-color: #f1f0f0;">
                                                        <span style="font-size: 16px; color: #961515; font-weight: bold; padding-left: 5px;">Order Form</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 500px; padding-top: 0px; background-color: #ffffff; border: 1px solid #e8e5e5; border-bottom: none; border-top: 1px solid #e8e5e5;" valign="top">

                                                        <asp:ListView ID="LstCategory" runat="server" OnItemUpdating="LstCategory_ItemUpdating" OnItemCommand="LstCategory_ItemCommand">
                                                            <LayoutTemplate>
                                                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="LblUserCode" runat="server" Visible="false" Text='<%#Eval("OrderId") %>'></asp:Label>
                                                                <tr>
                                                                    <td style="width: 300px; padding-top: 0px; background-color: #ffffff; border: 1px solid #e8e5e5; border-bottom: none; border-top: 1px solid #e8e5e5;" valign="top">
                                                                        <table width="300px" cellpadding="0" cellspacing="0" border="0">
                                                                            <tr>
                                                                                <td style="width: 70px; padding: 3px">
                                                                                    <b>Name:</b>
                                                                                </td>
                                                                                <td style="width: 200px; padding: 3px" colspan="2">
                                                                                    <asp:Label ID="LblName" runat="server" Text='<%# Eval("ShippingName") %>'></asp:Label>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 3px" valign="top">
                                                                                    <b>Address:</b>
                                                                                </td>
                                                                                <td style="padding: 3px" colspan="2" valign="top">
                                                                                    <asp:Label ID="LblAddress" runat="server" Text='<%# Eval("ShippingAddress") %>'></asp:Label>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 70px; padding: 3px" valign="top">
                                                                                    <b>City:</b>
                                                                                </td>
                                                                                <td style="width: 200px; padding: 3px" colspan="2">
                                                                                    <asp:Label ID="Lblcity" runat="server" Text='<%# Eval("ShippingCity") %>'></asp:Label>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# "-" + Eval("ShippingZipCode") %>'></asp:Label>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# "(" + Eval("ShippingStats") + ")" %>'></asp:Label>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 3px">
                                                                                    <b>Contact No:</b>
                                                                                </td>
                                                                                <td style="padding: 3px" colspan="2">
                                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("ShippingMobileNo") %>'></asp:Label>

                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" style="padding: 3px">
                                                                                    <b>Email Id:</b>
                                                                                </td>
                                                                                <td valign="top" style="padding: 3px" colspan="2">
                                                                                    <asp:Label ID="Label10" Font-Size="12px" runat="server" Text='<%# Eval("ShippingEmailId")%>'></asp:Label>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td valign="top" style="padding: 3px"></td>
                                                                                <td valign="top" style="padding: 3px" colspan="2"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" colspan="6" style="padding: 3px; height: 60px;" valign="top"></td>
                                                                            </tr>
                                                                        </table>
                                                                        <table width="200px" cellpadding="0" cellspacing="0" border="0" style="margin-left: 576px; margin-top: -194px; padding-top: 9px;">
                                                                            <tr>
                                                                                <td style="width: 100px; padding: 3px; text-align: right;" valign="top"></td>
                                                                                <td style="width: 120px; padding: 3px" valign="top"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 3px; text-align: right;"></td>
                                                                                <td style="padding: 3px;"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; padding: 3px; text-align: right;" valign="top">
                                                                                    <b>Order No:</b>
                                                                                </td>
                                                                                <td style="width: 120px; padding: 3px" valign="top">
                                                                                    <asp:Label ID="LblOrderNo" runat="server" Text='<%#(Eval("DisInvoiceNo")) %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 3px; text-align: right;">
                                                                                    <b>Order Date:</b>
                                                                                </td>
                                                                                <td style="padding: 3px">
                                                                                    <asp:Label ID="LblOrderDate" runat="server" Text='<%# Eval("ShippingDate") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td style="width: 100px; padding: 3px; text-align: right;" valign="top">
                                                                                    <b>PayMode:</b>
                                                                                </td>
                                                                                <td style="width: 120px; padding: 3px" valign="top">
                                                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("Paymode") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding-left: 110px;" colspan="2" rowspan="8">
                                                                                    <span style="color: Gray; font-family: Arial; font-size: 12px; font-weight: normal; padding-bottom: 5px;">Enjoy Online Shopping on...</span><br />
                                                                                  <%--  <a style="text-decoration: none" href="http://www.justfindmedia.com" target="_blank">
                                                                                        <img src="img/logo/logo.jpg" width="152" height="100" />
                                                                                    </a>--%>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 850px; padding-top: 0px;" valign="top">
                                                        <table cellpadding="0" cellspacing="0" width="100%" border="0" style="border: 1px solid #e2e2e2; border-collapse: collapse;">
                                                            <asp:ListView ID="LstConferm" runat="server" OnItemCommand="LstConferm_ItemCommand" OnItemEditing="LstConferm_ItemEditing">
                                                                <LayoutTemplate>
                                                                    <tr style="height: 35px; background-color: #DFDFDF; color: #000000;" align="center">
                                                                        <td style="text-align: center; width: 10px;">&nbsp;<b>SNo.</b>
                                                                        </td>
                                                                        <td align="center" style="width: 40px;"></td>
                                                                        <td style="text-align: left; width: 150px; padding-left: 5px; font-weight: bolder; font-family: sans-serif;">
                                                                            <b>Particulars</b>
                                                                        </td>
                                                                        <td></td>
                                                                        <td style="width: 85px; font-weight: bolder; font-family: sans-serif; text-align: right;">
                                                                            <b>Amount</b>
                                                                        </td>
                                                                        <td style="width: 85px; font-weight: bolder; font-family: sans-serif; text-align: right;">
                                                                            <b>Discount</b>
                                                                        </td>
                                                                        <td style="width: 105px; font-weight: bolder; font-family: sans-serif; text-align: right;">
                                                                            <b>NetAmount</b>
                                                                        </td>
                                                                    </tr>
                                                                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                                                </LayoutTemplate>
                                                                <ItemTemplate>
                                                                      <asp:Label ID="lblorderid" runat="server" Visible="false" Text='<%# Eval("OrderId") %>'></asp:Label>
                                                                      <asp:Label ID="LblProductId" runat="server" Visible="false" Text=' <%# Eval("ProductId")%>'></asp:Label>
                                                                    <asp:Label ID="lblaid" runat="server" Visible="false" Text=' <%# Eval("aid")%>'></asp:Label>

                                                                    
                                                                    <asp:HiddenField ID="HdnAmount" runat="server" Value='<%# Eval("Rate") %>' />
                                                                    <asp:HiddenField ID="HdnDiscount" runat="server" Value='<%# Eval("Discount") %>' />
                                                                    <asp:HiddenField ID="HdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                                                                    <asp:HiddenField ID="Hdnweight" runat="server" Value='<%# Eval("Weight") %>' />
                                                                  
                                                                    <asp:Label ID="LblUnit" runat="server" Visible="false" Text='<%# Eval("Unit") %>'></asp:Label>
                                                                  
                                                                  


                                                                    <tr style="background-color: white; color: #535353; border-bottom: 1px solid #e2e2e2;" align="center" valign="top" class="spaceUnder">

                                                                        <td class="LstMyCart_td">
                                                                            <%#Container.DataItemIndex+1 %>
                                                                        </td>
                                                                        <td class="LstMyCart_td">
                                                                            <img width="75" height="110" src="img/product/<%# ((Convert.ToString(Eval("Image")).Length>0)?Eval("Image"):"noimage.jpg")  %>" width="27px" height="40px" />
                                                                        </td>
                                                                        <td style="text-align: left;" valign="top" class="LstMyCart_td">
                                                                            <asp:Label ID="Label4" runat="server" CssClass="pdCode1" ForeColor="#000" Text="Product Name:"></asp:Label>
                                                                            <asp:Label runat="server" ID="Label1" Font-Size="11px" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label5" runat="server" CssClass="pdCode1" ForeColor="#000" Text="Brand Name:"></asp:Label>
                                                                            <asp:Label runat="server" ID="Label6" Font-Size="11px" Text=''></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label9" runat="server" CssClass="pdCode1" ForeColor="#000" Text="Store Name:"></asp:Label>
                                                                           

                                                                            
                                                                            <div class="pdCode" style="font-size: 11px; padding-left: 10px;">
                                                                                Price: 
                                                                          &nbsp;<asp:Label ID="LblRate" runat="server" Text='<%# Eval("Rate") %>'></asp:Label>
                                                                            </div>
                                                                            <br />

                                                                               <asp:LinkButton ID="lktreturn" runat="server" CommandName="Return" Visible="false" ForeColor="Red">Return</asp:LinkButton> 
                                                                               <asp:LinkButton ID="lktcancel" runat="server" CommandName="Cancel" Visible="false" ForeColor="Red">Cancel</asp:LinkButton>
                                                                            

                                                                        </td>
                                                                        <td width="180px">
                                                                            <table cellpadding="0" cellspacing="0" class="rounded-corners" style="padding-top: -7px;">

                                                                                <tr>
                                                                                    <td>
                                                                                        <table style="width: 180px;">
                                                                                            <tr>
                                                                                                <td style="text-align: left; padding-top: 2px; width: 150px;">
                                                                                                    <span style="color: #004A79; font-size: 12px;">Actual Unit: </span>
                                                                                                    <asp:Label ID="lblWeightActual" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
                                                                                                    <asp:Label ID="lblUnitActual" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>

                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="text-align: left; padding-top: 2px; width: 150px; padding-left: 10px;">
                                                                                                    <span style="color: #004A79; font-size: 12px; padding-left: 5px;">Quantity: </span>
                                                                                                    &nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                                                </td>

                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="text-align: left; padding-top: 2px; width: 150px;">
                                                                                                    <span style="color: #004A79; font-size: 12px; padding-left: 35px;">varient: </span>
                                                                                                    &nbsp;<asp:Label ID="Label11" runat="server" Text='<%# Eval("varient") %>'></asp:Label>
                                                                                                </td>

                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="text-align: left; padding-top: 2px; width: 150px;">
                                                                                                    <span style="color: #004A79; font-size: 12px; padding-left: 35px;">Color: </span>
                                                                                                    &nbsp;<asp:Label ID="Label15" runat="server" Text='<%# Eval("ColorName") %>'></asp:Label>
                                                                                                </td>

                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>

                                                                        <td class="LstMyCart_td" style="text-align: right; padding-right: 20px;">
                                                                            <asp:Label runat="server" ID="LblAmount" Text='<%# Eval("Amount") %>'></asp:Label>
                                                                        </td>
                                                                        <td class="LstMyCart_td" style="text-align: right; padding-right: 20px;">
                                                                            <asp:Label runat="server" ID="lblDiscount" Text='<%# Eval("Discount") %>'></asp:Label>
                                                                        </td>
                                                                        <td class="LstMyCart_td" style="text-align: right; padding-right: 20px;">
                                                                            <asp:Label runat="server" ID="lblNetAmount" Text='<%# Eval("NetAmount") %>'></asp:Label>
                                                                        </td>
                                                                        <td id="Td1" visible="false" runat="server">
                                                                            <asp:LinkButton ID="LkBtnEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="12" align="right" style="border: solid 1px #c8c5c5; border-top: none; background-color: #eeeded;">
                                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                            <tr style="height: 30px;">
                                                                <td style="width: 514px; border-right: 1px solid #c8c5c5; text-align: right;">
                                                                    <b>Total Amount (in Rs.)</b>&nbsp;
                                                                </td>
                                                                <td style="width: 58.5px; text-align: right; padding: 4px 16px 4px 8px;">
                                                                    <asp:Label ID="lblAmt" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server" id="walletdiv">
                                                    <td colspan="12" align="right" style="border: solid 1px #c8c5c5; border-top: none; background-color: #eeeded;">
                                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                            <tr style="height: 30px;">
                                                                <td style="width: 514px; border-right: 1px solid #c8c5c5; text-align: right;">
                                                                    <b>Wallet Amount  (-) </b>&nbsp;
                                                                </td>
                                                                <td style="width: 58.5px; text-align: right; padding: 4px 16px 4px 8px;">
                                                                    <asp:Label ID="lblwalletamount" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="12" align="right" style="border: solid 1px #c8c5c5; border-top: none; background-color: #eeeded;">
                                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                            <tr style="height: 30px;">
                                                                <td style="width: 514px; border-right: 1px solid #c8c5c5; text-align: right;">
                                                                    <b>Delivery Charges (in Rs.)</b>&nbsp;
                                                                </td>
                                                                <td style="width: 58.5px; text-align: right; padding: 4px 16px 4px 8px;">
                                                                    <asp:Label ID="LblDeliveryCharges" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="12" align="right" style="border: solid 1px #c8c5c5; border-top: none; background-color: #eeeded;">
                                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                            <tr style="height: 30px;">
                                                                <td style="width: 514px; border-right: 1px solid #c8c5c5; text-align: right;">
                                                                    <b>Net Amount (in Rs.)</b>&nbsp;
                                                                </td>
                                                                <td style="width: 58.5px; text-align: right; padding: 4px 16px 4px 8px;">
                                                                    <asp:Label ID="LblNetAmount" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <%--  <asp:SqlDataSource ID="SrcCart" runat="server" ConnectionString="<%$ ConnectionStrings:ConString%>"
                SelectCommand="set dateformat DMY;select CartId,UserCode,ProductId,ProductName,type,Unit,Quantity,Rate,Amount,Image,Weight,CategoryName,Discount,DiscountActual,NetAmount,QuantityActual,UnitActual,SchemeOffer from [Store].[Order_CartDetail] where OrderId=@OrderId"
                UpdateCommand=" ">
                <SelectParameters>
                    <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SrcUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConString%>"
        SelectCommand="set dateformat DMY; Select OrderId,'ShippingDate'=CONVERT(varchar(10),ShippingDate,103),right(convert(char(20),ShippingTime,0),7) as ShippingTime,'DeliveredDate'=CONVERT(varchar(10),DeliveredDate,103),right(convert(char(20),DeliveredTime,0),7) as DeliveredTime,UserCode,ShippingName,ShippingAddress,ShippingCountry,ShippingState,ShippingDistrict,ShippingCity,ShippingZipCode,ShippingPhoneNumber,ShippingMobileNumber,ShippingEmailId,ShippingDescription from [Store].[Order_OrderDetail] where OrderId=@OrderId" UpdateCommand=" ">
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
                                </div>
                          

                    </asp:Panel>
                    </div>
                </div>
            </section>
            <!-- CONTAINER END -->
        </div>
    </div>
</asp:Content>

