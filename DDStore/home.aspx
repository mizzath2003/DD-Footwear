<%@  Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DDStore.WebForm1" %>
<%@  Register Src="~/Includes/Navbar.ascx" TagPrefix="uc" TagName="Navbar" %>
<%@  Register Src="~/Includes/header.ascx" TagPrefix="uc" TagName="header" %>
<%@  Register Src="~/Includes/footer.ascx" TagPrefix="uc" TagName="footer" %>


	<!-- Header -->
<uc:header ID="header" runat="server" />


<body>

	<!-- Navbar -->	
   <uc:Navbar ID="Navbar" runat="server" />

		<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1>Nike New <br>Collection!</h1>
									<p><b>Soldier 8 Flyease,</b> <br>The special Flyease edition of the Zoom LeBron Soldier 8 is already available for purchase… in three different colorways.<br /> It’s definitely a game changer in the way we think about athletic shoes with a new, easy-entry footwear system that is designed for everyone regardless of ability or age. </p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href="Shop.aspx"><span class="lnr lnr-move"></span></a>
										<span class="add-text text-uppercase">View Details</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="img/banner/banner-img.png" alt="">
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>Nike New <br>Collection!</h1>
									<p><b>Soldier 8 Flyease,</b> <br>The special Flyease edition of the Zoom LeBron Soldier 8 is already available for purchase… in three different colorways.<br /> It’s definitely a game changer in the way we think about athletic shoes with a new, easy-entry footwear system that is designed for everyone regardless of ability or age. </p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href="Shop.aspx"><span class="lnr lnr-move"></span></a>
										<span class="add-text text-uppercase">View Details</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="img/banner/banner-img.png"  alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
    
		<!-- start features Area -->
	<section class="features-area section_gap">
		<div class="container">
			<div class="row features-inner">
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon1.png" alt="">
						</div>
						<h6>Free Delivery</h6>
						<p>Free Shipping on all order</p>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon2.png" alt="">
						</div>
						<h6>Return Policy</h6>
						<p>Free Shipping on all order</p>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon3.png" alt="">
						</div>
						<h6>24/7 Support</h6>
						<p>Free Shipping on all order</p>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon4.png" alt="">
						</div>
						<h6>Secure Payment</h6>
						<p>Free Shipping on all order</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end features Area -->


	<!-- Footer -->
	<uc:footer ID="footer" runat="server" />
