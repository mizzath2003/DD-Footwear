<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="categoryAdd.aspx.cs" Inherits="DDStore.categoryAdd" %>
<%@ Register Src="~/adminInclude/adminHeader.ascx" TagPrefix="uc" TagName="adminHeader" %>
<%@ Register Src="~/adminInclude/adminSidebar.ascx" TagPrefix="uc" TagName="adminSidebar" %>
<%@ Register Src="~/adminInclude/adminFooter.ascx" TagPrefix="uc" TagName="adminFooter" %>


	<!-- Header -->
<uc:adminHeader ID="adminHeader" runat="server" />

           <!-- Sidebar -->	
<uc:adminSidebar ID="adminSidebar" runat="server" />

<h1>Add Category</h1>
<div class="menuBox">
    <form id="form1" class="row" runat="server">
        <div class="form-content col-5">
    <label>Category Id</label>
     <asp:TextBox ID="txtCategoryId" CssClass="form-control" placeholder="Enter Category Id" runat="server"></asp:TextBox>
</div>
<div class="form-content col-5">
    <label>Category Name</label>
    <asp:TextBox ID="txtCategoryName" CssClass="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox>
</div>
        <div class="form-content col-10" style="text-align:center">
            <asp:Label ID="success" text="" runat="server" ForeColor="#00CC66"></asp:Label>
<asp:Label ID="Error" runat="server" text="" ForeColor="#CC3300"></asp:Label>
        </div>
        <div Class="col-10">
        <asp:Button runat="server" Text="Submit" CssClass="btnSubmitMenu btn btn-warning" OnClick="Unnamed1_Click"/>

        </div>

    </form>
</div>    
    



        <!-- Footer -->
<uc:adminFooter ID="adminFooter" CssClass="btnSubmitMenu btn btn-warning" runat="server" />
