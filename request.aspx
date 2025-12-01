<%@ Page Language="C#" AutoEventWireup="true" CodeFile="request.aspx.cs" Inherits="request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function DisableBackButton() { window.history.forward() }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <%--  <form action='https://test.cashfree.com/billpay/checkout/post/submit' name="frm1" method="post">--%>
    
        <%--<p>Please wait.......</p>

        <input type="hidden" name="signature" value='<%=signature %>' />
        <input type="hidden" name="orderNote" value='<%=model.orderNote %>' />
        <input type="hidden" name="orderCurrency" value='<%=model.orderCurrency %>' />
        <input type="hidden" name="customerName" value='<%=model.customerName %>' />
        <input type="hidden" name="customerEmail" value='<%=model.customerEmail %>' />
        <input type="hidden" name="customerPhone" value='<%=model.customerPhone %>' />
        <input type="hidden" name="orderAmount" value='<%=model.orderAmount %>' />
        <input type="hidden" name="notifyUrl" value='<%=model.notifyUrl %>' />
        <input type="hidden" name="returnUrl" value='<%=model.returnUrl %>' />
        <input type="hidden" name="appId" value='<%=model.appId %>' />
        <input type="hidden" name="orderId" value='<%=model.orderId %>' />
       <button id="showModalButton" >Submit</button>--%>
    </form>

</body>
</html>
