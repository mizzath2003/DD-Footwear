<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="DDStore.Contact_Us" %>
<%@  Register Src="~/Includes/Navbar.ascx" TagPrefix="uc" TagName="Navbar" %>
<%@  Register Src="~/Includes/header.ascx" TagPrefix="uc" TagName="header" %>
<%@  Register Src="~/Includes/footer.ascx" TagPrefix="uc" TagName="footer" %>


	<!-- Header -->
<uc:header ID="header" runat="server" />




	<!-- Navbar -->	
   <uc:Navbar ID="Navbar" runat="server" />

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Contact Us</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">Contact</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Contact Area =================-->
	<section class="contact_area section_gap_bottom">
		<div class="container">
			<div class="mapBox" >
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.909212487152!2d79.86652177456965!3d6.901460318656645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2597e8101fa29%3A0xca75f88cec7580c6!2s296%20Bauddhaloka%20Mawatha%2C%20Colombo%2000700!5e0!3m2!1sen!2slk!4v1698314133829!5m2!1sen!2slk" width="1150" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="contact_info">
						<div class="info_item">
							<i class="lnr lnr-home"></i>
							<h6>Colombo, Sri Lanka</h6>
							<p> 296 Bauddhaloka Mawatha, Colombo 00700</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-phone-handset"></i>
							<h6><a href="#">077 666 2244</a></h6>
							<p> 9am to 9 pm</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-envelope"></i>
							<h6><a href="#">ddfotware@gmail.com</a></h6>
							<p>Send us your query anytime!</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!--================Contact Area =================-->


	<!-- Footer -->
	<uc:footer ID="footer" runat="server" />
