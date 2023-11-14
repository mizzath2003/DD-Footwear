<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="DDStore.EditProduct" %>
<%@ Register Src="~/adminInclude/adminHeader.ascx" TagPrefix="uc" TagName="adminHeader" %>
<%@ Register Src="~/adminInclude/adminSidebar.ascx" TagPrefix="uc" TagName="adminSidebar" %>
<%@ Register Src="~/adminInclude/adminFooter.ascx" TagPrefix="uc" TagName="adminFooter" %>



	<!-- Header -->
<uc:adminHeader ID="adminHeader" runat="server" />

           <!-- Sidebar -->	
<uc:adminSidebar ID="adminSidebar" runat="server" />

<h1>Edit Products</h1>
<div class="menuBox">
 <form class="row" method="post" runat="server" enctype="multipart/form-data">
            <div class="form-content col-4">
                <label for="tital">Product Id</label>
                <asp:TextBox ID="txtProductId" runat="server" placeholder="Enter Product Id"></asp:TextBox>
            </div>
            <div class="form-content col-4">
                <label for="tital">Product Name</label>
                <asp:TextBox ID="txtProductName" runat="server" placeholder="Enter Product Name"></asp:TextBox>
            </div>
            <div class="form-content col-4">
                <label for="tital">Product Price</label>
                <asp:TextBox ID="txtProductPrice" runat="server" type="number" placeholder="Enter Price"></asp:TextBox>
            </div>
            <div class="form-content col-4">
                <label for="tital">Product Quantity</label>
                <asp:TextBox ID="txtProductQuantity" runat="server" type="number" placeholder="Enter Quantity"></asp:TextBox>
            </div>
            <div class="form-content col-4">
                <label for="tital">Product Category</label>
                <asp:DropDownList ID="ddlCategory" CssClass="select-control" runat="server">
            </asp:DropDownList>

            </div>
            <div class="form-content col-4">
                <label for="tital">Product Image</label>
                <asp:FileUpload ID="ProductImage" runat="server" />
            </div>
            <div class="form-content col-12">
                <label for="tital">Product Description</label>
                <asp:TextBox ID="txtProductDescription" runat="server" TextMode="MultiLine" Rows="5" placeholder="Enter description"></asp:TextBox>
            </div>
             <div class="form-content col-12" style="text-align:center">
            <asp:Label ID="success" runat="server" ForeColor="#00CC66"></asp:Label>
<asp:Label ID="Error" runat="server"  ForeColor="#CC3300"></asp:Label>
        </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btnSubmitMenu btn btn-warning" OnClick="btnSubmit_Click" />
        </form>
  </div> 

        <!-- Footer -->
<uc:adminFooter ID="adminFooter" runat="server" />
