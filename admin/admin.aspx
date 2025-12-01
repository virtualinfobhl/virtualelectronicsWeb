<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .messagealert {
            width: 100%;
            top: 0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
        }
    </script>
    <script type="text/javascript">
        window.setTimeout(function () {
            $("#alert_container").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="messagealert" id="alert_container">
    </div>

    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line">Enquiry Add</h1>
                </div>
            </div>
            <div class="row">

                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Enquiry Add Form
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <div class="col-md-3">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Name </label>
                                        <asp:TextBox ID="Txttitle" runat="server" class="form-control" required="required"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Mobile NO. </label>
                                        <asp:TextBox ID="txtmobile" runat="server" class="form-control" required="required"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Email ID </label>
                                        <asp:TextBox ID="txemail" runat="server" class="form-control" required="required"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">City </label>
                                        <asp:TextBox ID="txtcity" runat="server" class="form-control" required="required"></asp:TextBox>

                                    </div>
                                </div>

                                 <div class="col-md-12">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="success">Remark </label>
                                        <asp:TextBox ID="txtreamrk" runat="server" class="form-control" TextMode="MultiLine" Rows="2" required="required"></asp:TextBox>

                                    </div>
                                </div>

                                <asp:Label ID="LblErr" runat="server" ForeColor="Red"></asp:Label><br />
                                <asp:Button ID="Button1" runat="server" Class="btn-danger" Text="Submit" Style="border-style: none; padding: 5px" OnClick="Button1_Click" />

                            </form>
                            <hr />


                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="LblId" runat="server" />
                <div class="col-md-12">
                    <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Enquiry List
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Name</th>
                                            <th>Mobile No.</th>
                                            <th>Email ID</th>
                                              <th>City</th>
                                            <th style="min-width:450px;height:85px">Remark</th>
                                            <th>Visit</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:HiddenField ID="HdnID" runat="server" Value='<%# Eval("id") %>' />
                                                       <asp:Label ID="name" runat="server" Text='<%# Eval("name") %>' Visible="false"></asp:Label>
                                                       <asp:Label ID="mobile" runat="server" Text='<%# Eval("mobile") %>' Visible="false"></asp:Label>
                                                       <asp:Label ID="city" runat="server" Text='<%# Eval("city") %>' Visible="false"></asp:Label>
                                                       <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>' Visible="false"></asp:Label>
                                                       <asp:Label ID="remark" runat="server" Text='<%# Eval("remark") %>' Visible="false"></asp:Label>
                                                      

                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("name") %></td>
                                                     <td><%# Eval("mobile") %></td>
                                                     <td><%# Eval("city") %></td>
                                                     <td><%# Eval("email") %></td>
                                                     <td><%# Eval("remark") %></td>
                                                    <td><%# Eval("count") %></td>
                                                  
                                                    <td>   <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edt" Font-Bold="true" ForeColor="#3c8dbc">Edit</asp:LinkButton></td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <%-- <asp:SqlDataSource ID="Categoray" runat="server" ConnectionString="<%$Connectionstrings:topcity %>" SelectCommand="select * from [Restaurant] where CityCode=1 and StateCode=1 order by id desc"></asp:SqlDataSource>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- End  Kitchen Sink -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>

