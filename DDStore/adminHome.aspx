<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="DDStore.adminHome" %>
<%@ Register Src="~/adminInclude/adminHeader.ascx" TagPrefix="uc" TagName="adminHeader" %>
<%@ Register Src="~/adminInclude/adminSidebar.ascx" TagPrefix="uc" TagName="adminSidebar" %>
<%@ Register Src="~/adminInclude/adminFooter.ascx" TagPrefix="uc" TagName="adminFooter" %>



	<!-- Header -->
<uc:adminHeader ID="adminHeader" runat="server" />

           <!-- Sidebar -->	
<uc:adminSidebar ID="adminSidebar" runat="server" />

            <div class="header-section">
    <h1>Admin Home</h1>
</div>
    


        <!-- Footer -->
<uc:adminFooter ID="adminFooter" runat="server" />