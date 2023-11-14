<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="DDStore.products" %>
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
    <h1>Products</h1>
    <a href="productsAdd.aspx"><button class="btn btn-warning">Add Product</button></a>
</div>

   <form id="form1" runat="server">
       
<div class="tableDiv">
<asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" CssClass="tableSC" OnRowCommand="GridView1_RowCommand" DataKeyNames="productId">
    <Columns>
        <asp:TemplateField HeaderText="Product Image">
            <ItemTemplate>
                <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' Width="150" Height="140" style="border-radius:15px"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="productId" HeaderText="Product ID" />
        <asp:BoundField DataField="productName" HeaderText="Product Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        <asp:BoundField DataField="Category" HeaderText="Category" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        
        <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="DeleteRow" HeaderText="Delete" ControlStyle-CssClass="btn btn-error" />
        <asp:ButtonField Text="Edit" ButtonType="Button" CommandName="EditRow" HeaderText="Edit" ControlStyle-CssClass="btn btn-info" />

    </Columns>
    
</asp:GridView>

       </div>


   </form>

        <!-- Footer -->
<uc:adminFooter ID="adminFooter" runat="server" />