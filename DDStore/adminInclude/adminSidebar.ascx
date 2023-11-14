<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminSidebar.ascx.cs" Inherits="DDStore.adminInclude.adminSidebar" %>

<!-- Hamburger icon for sidebar toggle -->
<div class="hamburger open" onclick="toggleSidebar()">
    <i class="fas fa-bars"></i>
</div>

<div class="sidebar open">
    <img src="../img/ddlogo.png" width="160px" alt="Logo">

    <a href="../adminHome.aspx" >Home</a>

    <a href="../users.aspx" >Users</a>

    <a href="../category.aspx" >Category</a>

    <a href="../products.aspx" >Products</a>
    <a href="../Orders.aspx" >Orders</a>
   
    <a href="../home.aspx" style="margin-top:auto" class="bottom-align-div"><i class="fa-solid fa-power-off"></i> Logout</a>

    
</div>
<div class="mainSec open">