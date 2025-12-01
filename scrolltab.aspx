<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scrolltab.aspx.cs" Inherits="scrolltab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="scrolltab/style.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css' />


</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="scroller scroller-left"><i class="glyphicon glyphicon-chevron-left"></i></div>
            <div class="scroller scroller-right"><i class="glyphicon glyphicon-chevron-right"></i></div>
            <div class="wrapper">
                <ul class="nav nav-tabs list" id="myTab" style="border: none !important; background-color: white">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <li style="border: solid 1px #c8c6c6; padding: 2px; border-radius: 82px; margin-left:2.5px;margin-right:2px; background-color: white"><a href="viewproduct.aspx?id=<%# Eval("productid") %>" target="_blank" style="color: black; text-decoration: none; background-color: white !important; border-radius: 82px"><%# Eval("productname") %></a></li>
                    </ItemTemplate>

                        <AlternatingItemTemplate>
                            <li style="border: solid 1px #c8c6c6; padding: 2px; border-radius: 82px; margin-left: 2.5px; margin-right:2px;background-color: white"><a href="Brand.aspx?id=<%# Eval("brandid") %>" target="_blank" style="color: black; text-decoration: none; background-color: white !important; border-radius: 82px"><%# Eval("brandname") %></a></li>
                        </AlternatingItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="srcwebslider" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                        CancelSelectOnNullParameter="false" SelectCommand="select top 10 a.brandname,b.productname,b.productid,a.brandid from  brand as a inner join product as b on a.brandid=b.brandid order by productid desc"></asp:SqlDataSource>


                </ul>
            </div>
        </div>
        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

        <script src="scrolltab/script.js"></script>
    </form>
</body>
</html>
