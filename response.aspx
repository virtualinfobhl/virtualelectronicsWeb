<%@ Page Language="C#" AutoEventWireup="true" CodeFile="response.aspx.cs" Inherits="response" %>

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
    <form id="form1" runat="server">
        <div>
            <%=Request.Form["referenceId"] %><br />
            <%=Request.Form["txStatus"] %>
        </div>
    </form>
</body>
</html>
