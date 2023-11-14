<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userAdd.aspx.cs" Inherits="DDStore.userAdd" %>
<%@ Register Src="~/adminInclude/adminHeader.ascx" TagPrefix="uc" TagName="adminHeader" %>
<%@ Register Src="~/adminInclude/adminSidebar.ascx" TagPrefix="uc" TagName="adminSidebar" %>
<%@ Register Src="~/adminInclude/adminFooter.ascx" TagPrefix="uc" TagName="adminFooter" %>



	<!-- Header -->
<uc:adminHeader ID="adminHeader" runat="server" />

           <!-- Sidebar -->	
<uc:adminSidebar ID="adminSidebar" runat="server" />

<h1>Add User</h1>
<div class="menuBox">
    <form id="form1" class="row" runat="server">
        <div class="form-content col-4">
            <label>User Name</label>
             <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Enter User Name" runat="server"></asp:TextBox>
        </div>
        <div class="form-content col-4">
            <label>Phone</label>
            <asp:TextBox ID="txtPhone" CssClass="form-control" placeholder="Enter Phone" runat="server"></asp:TextBox>
        </div>
        <div class="form-content col-4">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
        </div>
                <div class="form-content col-12">
    <label>Address</label>
    <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" row="3" placeholder="Enter Address" runat="server"></asp:TextBox>
</div>
        
        <div class="form-content col-4">
            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Enter Full Name" runat="server"></asp:TextBox>
        </div>
        <div class="form-content col-4">
    <label>User Type</label>
    <asp:DropDownList ID="ddlUserType" CssClass="select-control" runat="server">
                    <asp:ListItem Text="User" Value="User" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                </asp:DropDownList>
</div>
        <div class="form-content col-4">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
        </div>
        
        
        <div class="form-content col-12" style="text-align:center">
            <asp:Label ID="success" runat="server" ForeColor="#00CC66"></asp:Label>
<asp:Label ID="Error" runat="server" ForeColor="#CC3300"></asp:Label>
        </div>

        <asp:Button runat="server" Text="Submit" CssClass="btnSubmitMenu btn btn-warning" OnClick="btnAddUser_Click"/>
    </form>
</div>    
    



        <!-- Footer -->
<uc:adminFooter ID="adminFooter" runat="server" />