<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerUser.aspx.cs" Inherits="DDStore.registerUser" %>
<%@  Register Src="~/Includes/Navbar.ascx" TagPrefix="uc" TagName="Navbar" %>
<%@  Register Src="~/Includes/header.ascx" TagPrefix="uc" TagName="header" %>
<%@  Register Src="~/Includes/footer.ascx" TagPrefix="uc" TagName="footer" %>

	<!-- Header -->
<uc:header ID="header" runat="server" />

<body>

   <!-- Navbar -->	
<uc:Navbar ID="Navbar" runat="server" />

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
      <div class="container">
        <div
          class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end"
        >
          <div class="col-first">
            <h1>REGISTER</h1>
            <nav class="d-flex align-items-center">
              <a href="../home.aspx"
                >Home<span class="lnr lnr-arrow-right"></span
              ></a>
              <a href="">Register</a>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <!-- End Banner Area -->

    <!--================REGISTER Box Area =================-->
    <section class="login_box_area section_gap">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="login_box_img">
              <img
                class="img-fluid"
                src="../img/banner/regbanner.jpg"
                alt=""
                style="height: 650px"
              />
              <div class="hover">
                <h4>Already have an account ?</h4>

                <a class="primary-btn" href="loginForm.aspx">Sign in</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="login_form_inner" style="padding-top: 15px">
              <h3>Register Account</h3>
              <form
                class="row login_form"
                action=""
                method="post"
                id="registerForm"
                novalidate="novalidate"
                  runat="server"
              >
                <div class="col-md-12 form-group">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="User Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'" runat="server" ></asp:TextBox>
                
                </div>
                <div class="col-md-12 form-group">
                  <asp:TextBox ID="txtPhone" CssClass="form-control" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'" runat="server" ></asp:TextBox>

                </div>
                <div class="col-md-12 form-group">
                 <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" runat="server" ></asp:TextBox>

                </div>
                <div class="col-md-12 form-group">
                  <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name'" runat="server" ></asp:TextBox>
                  
                </div>
                  <div class="col-md-12 form-group">
  <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" runat="server" ></asp:TextBox>
  
</div>
                <div class="col-md-12 form-group">
                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" runat="server" ></asp:TextBox>

                </div>
                <div class="col-md-12 form-group">
                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'" runat="server" ></asp:TextBox>

                </div>
                <div class="col-md-12 form-group" style="margin-bottom:20px;">
                  
                    <asp:Label ID="success" runat="server" ForeColor="#00CC66"></asp:Label>
                    <asp:Label ID="Error" runat="server" ForeColor="#CC3300"></asp:Label>
                    

                </div>
                <div class="col-md-12 form-group">
                    <asp:Button ID="btnRegister" CssClass="primary-btn" runat="server" Text="Register" OnClick="btnRegister_Click" />

                  <%--<a href="#">Forgot Password?</a>--%>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End REGISTER Box Area =================-->



<!-- Footer -->
<uc:footer ID="footer" runat="server" />

