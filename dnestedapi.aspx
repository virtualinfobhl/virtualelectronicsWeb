<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dnestedapi.aspx.cs" Inherits="dnestedapi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divOutput" runat="server"></div>       


            <asp:ListView ID="lstSubcategory" runat="server">
                <ItemTemplate>

                    <div class="col-md-3 col-xs-12 item-width mb-30">
                        <a href="products.aspx?MainCategoryId=<%# Eval("MainCategoryId") %>" target="_blank">
                            <div style="border: solid 1px #ebebeb; text-align: center; padding: 5px">
                                <img src="Images/SubCatImages/<%# Eval("image") %>" style="height: 200px; width: 200px; border-radius: 100px;" />
                                <h4 style="text-align: center; color: #FD8D3C"><%# Eval("MainCategoryname") %> and <%# Eval("SubCategory") %></h4>
                            </div>
                        </a>
                    </div>

                </ItemTemplate>
            </asp:ListView>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        </div>



    </form>
</body>
</html>
