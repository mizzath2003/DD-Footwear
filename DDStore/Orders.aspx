<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="DDStore.Orders" %>
<%@ Register Src="~/adminInclude/adminHeader.ascx" TagPrefix="uc" TagName="adminHeader" %>
<%@ Register Src="~/adminInclude/adminSidebar.ascx" TagPrefix="uc" TagName="adminSidebar" %>
<%@ Register Src="~/adminInclude/adminFooter.ascx" TagPrefix="uc" TagName="adminFooter" %>


	<!-- Header -->
<uc:adminHeader ID="adminHeader" runat="server" />

           <!-- Sidebar -->	
<uc:adminSidebar ID="adminSidebar" runat="server" />

    <style type="text/css">
        .tableSC {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
        }

        .tableSC th,
        .tableSC td {
            text-align: left;
            padding: 8px;
            border: 1px solid rgb(84, 84, 84);
        }

        .tableSC th {
            color: #dedede;
        }

        .tableSC td {
            color: #b8b5b5;
        }

        .tableSC tr:first-child th {
            border-top: 0;
        }

        .tableSC tr td:first-child,
        .tableSC tr th:first-child {
            border-left: 0;
        }

        .tableSC tr:last-child td {
            border-bottom: 0;
        }

        .tableSC tr td:last-child,
        .tableSC tr th:last-child {
            border-right: 0;
        }
    </style>

        <div class="header-section">
    <h1>Oders</h1>
    <a href="categoryAdd.aspx"><button class="btn btn-warning">Add Category</button></a>
</div>

    <form id="form1" runat="server">
        
 <div class="tableDiv">
            <asp:GridView ID="GridView1" runat="server" CssClass="tableSC" >
                 
                
            </asp:GridView>
        </div>


    </form>

        <!-- Footer -->
<uc:adminFooter ID="adminFooter" runat="server" />
