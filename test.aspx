<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


        <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="4" OnClick="LinkButton4_Click">Discount Heigh to Low</asp:LinkButton>

        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="4" OnClick="LinkButton1_Click">delete</asp:LinkButton>


          <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="4" OnClick="LinkButton2_Click">redirect</asp:LinkButton>

          <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:GridView ID="GridView1" runat="server">
              <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server" />
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("id")%>' Visible="true"></asp:Label>
                    <asp:Image ImageUrl='<%# ConvertImage(Eval("image"))%>' ID="ImageData" Width="50Px"
                        Height="50px" runat="server" />
             <asp:Label ID="lblFilePath" runat="server" Text='<%# FilePath(Eval("image"))%>' Visible="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        </asp:GridView>

           <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
    </form>
  
</body>
</html>
