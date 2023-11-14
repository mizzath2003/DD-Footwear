<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="DDStore.Confirmation" %>
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
        <h1>Confirmation</h1>
        <nav class="d-flex align-items-center">
          <a href="../home.aspx"
            >Shop<span class="lnr lnr-arrow-right"></span
          ></a>
          <a href="">Confirmation</a>
        </nav>
      </div>
    </div>
  </div>
</section>
<!-- End Banner Area -->

    	<!--================Order Details Area =================-->
	<section class="order_details section_gap row">
		<div class="container col-6">
			<h3 class="title_confirmation">Thank you. Your order has been received.</h3>
			
		</div>
	</section>
	<!--================End Order Details Area =================-->

      


    <!-- Footer -->
<uc:footer ID="footer" runat="server" />
