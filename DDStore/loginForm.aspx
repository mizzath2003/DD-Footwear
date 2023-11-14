<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginForm.aspx.cs" Inherits="DDStore.loginForm" %>
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
        <h1>SIGN IN</h1>
        <nav class="d-flex align-items-center">
          <a href="../home.aspx"
            >Home<span class="lnr lnr-arrow-right"></span
          ></a>
          <a href="">Sign In</a>
        </nav>
      </div>
    </div>
  </div>
</section>
<!-- End Banner Area -->

      <!--================LOGIN Box Area =================-->
  <section class="login_box_area section_gap">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="login_box_img">
            <img
              class="img-fluid"
              src="../img/banner/loginbanner.jpg"
              alt=""
              style=""
            />
            <div class="hover">
              <h4>Don't have an account ?</h4>

              <a class="primary-btn" href="registerUser.aspx">Register</a>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="login_form_inner" style="padding-top: 15px">

            <h3>Sign In</h3>
            <form
              class="row login_form"
              action=""
              method="post"
              id="registerForm"
                runat="server"
            >
              <div class="col-md-12 form-group">
                  <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="User Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'User Name'" runat="server" ></asp:TextBox>
                 <p style="margin-top:6px;margin-bottom:-4px;"><asp:Label ID="usernameError" runat="server" ForeColor="#CC3300"></asp:Label></p>
              </div>
              
              <div class="col-md-12 form-group">
              <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" runat="server" ></asp:TextBox>
                  <p style="margin-top:7px;margin-bottom:-4px;"><asp:Label ID="Error" runat="server"  ForeColor="#CC3300"></asp:Label></p>
              </div>
              
              <div class="col-md-12 form-group" style="margin-bottom:20px;">
                
                  <asp:Label ID="success" runat="server" ForeColor="#00CC66"></asp:Label>
                  <asp:Label ID="FieldEmptyError" runat="server" ForeColor="#CC3300"></asp:Label>
                  

              </div>
              <div class="col-md-12 form-group">
                  <asp:Button ID="btnLogin" CssClass="primary-btn" runat="server" Text="Sign In" OnClick="btnLogin_Click" />

                <%--<a href="#">Forgot Password?</a>--%>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End LOGIN Box Area =================-->


    <!-- Footer -->
<uc:footer ID="footer" runat="server" />

