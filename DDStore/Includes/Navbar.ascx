<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="DDStore.WebUserControl1" %>


<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="../home.aspx"><img src="img/ddlogo.png" alt="" style="max-height:60px"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="../home.aspx">Home</a></li>

							<li class="nav-item"><a class="nav-link" href="../Shop.aspx">Shop</a></li>



							<li class="nav-item"><a class="nav-link" href="../ContactUs.aspx">Contact</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
							</li>
							<div style="margin-left:15px; display: flex; align-items: center; justify-content: center;">
					<a href="../registerUser.aspx" class="primary-btn" style="margin-right: 10px; border-radius:15px; height:50px;">
						<span class="">Register</span>
					</a>
					<a href="../loginForm.aspx" class="primary-btn" style="border-radius:15px; height:50px;">
						<span class="">Sign In</span>
					</a>
				  </div>
						</ul>
					</div>
				</div>
			</nav>

		</div>

		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->
