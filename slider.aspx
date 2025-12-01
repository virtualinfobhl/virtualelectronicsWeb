<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slider.aspx.cs" Inherits="slider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
        <li data-target="#demo" data-slide-to="4"></li>
        <li data-target="#demo" data-slide-to="5"></li>
        <li data-target="#demo" data-slide-to="6"></li>
        <li data-target="#demo" data-slide-to="7"></li>

  </ul>
  
  <!-- The slideshow -->
<div class="carousel-inner">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="srcwebslider">
                <ItemTemplate>
    <div class="carousel-item <%# Eval("active") %>">
      <img src="img/webslider/<%# Eval("image") %>" alt="" width="1100" height="500"/>
      <div class="carousel-caption">
        <h3>
           <a href="viewproduct.aspx?id=<%# Eval("link") %>" target="_blank" class="btn-success" style="text-decoration:none;padding:8px;background-color:#39b3e4;border-radius:20px;font-family:Arial;font-size:16px ">Buy Now</a>
        </h3>
    
      </div>   
    </div>
    </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="srcwebslider" runat="server" ConnectionString="<%$ ConnectionStrings:Friendsmobile%>"
                CancelSelectOnNullParameter="false" SelectCommand="Select id,image,link,case when priority=1 then 'active' else '' end as  active from webslider order by priority asc"></asp:SqlDataSource>
            

    
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
    </div>
    </form>
</body>
</html>
