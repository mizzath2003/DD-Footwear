<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="DDStore.Shop" %>
<%@  Register Src="~/Includes/Navbar.ascx" TagPrefix="uc" TagName="Navbar" %>
<%@  Register Src="~/Includes/header.ascx" TagPrefix="uc" TagName="header" %>
<%@  Register Src="~/Includes/footer.ascx" TagPrefix="uc" TagName="footer" %>


	<!-- Header -->
<uc:header ID="header" runat="server" />


<body>

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
					<a href="../home.aspx" class="primary-btn" style="margin-right: 10px; border-radius:15px; height:50px;">
						<span class="">logout</span>
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


		<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Shop page</h1>
					<nav class="d-flex align-items-center">
						<a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shoes</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<form id="form1" class="row" runat="server">

		<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Browse Categories</div>
					<ul class="main-categories">
    <li class="main-nav-list">
        <a data-toggle="collapse" href="#allCategories" aria-expanded="false" aria-controls="allCategories">
            <span class="lnr lnr-arrow-right"></span>All Categories
           
        </a>
        <ul class="collapse" id="allCategories" data-toggle="collapse" aria-expanded="false" aria-controls="allCategories">
            <asp:Repeater ID="categoryRepeater" runat="server">
                <ItemTemplate>
                    <li class="main-nav-list child">
                        <a href="#">
                            <%# Eval("categoryName") %>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
</ul>
				</div>
			</div>

			<div class="col-xl-9 col-lg-8 col-md-7">
    
					<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
					</div>
				</div>
				<!-- End Filter Bar -->

						<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						
							<asp:Repeater ID="rptProducts" runat="server" >
    <ItemTemplate>
		<!-- single product -->
<div class="col-lg-6 col-md-4">
        <div class="single-product">
            <img class="img-fluid" style="border-radius:10px; max-height:100%" src='<%# "data:image/jpeg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' alt='<%# Eval("productName") %>' />
            <div class="product-details">
                <h6><%# Eval("productName") %></h6>
                <p style="margin-bottom:5px"><%# Eval("Description") %></p>
                <div class="price">
                    <h6><span style="color:#f5a000;margin-right:100px">Rs <%# Eval("Price") %></span></h6>
					<asp:Label ID="outofstock" runat="server" Text="Out of Stock" ForeColor="#CC3300" Visible='<%# Convert.ToInt32(Eval("Quantity")) <= 0 %>'></asp:Label>
                <asp:Label ID="stock" runat="server" Text="Available" ForeColor="#00CC66" Visible='<%# Convert.ToInt32(Eval("Quantity")) > 0 %>'></asp:Label>
                </div>
                <div class="prd-bottom">
                     <asp:Button ID="btnBuyProduct" runat="server" Text="Buy Product" Font-Bold="true" ForeColor="White" BackColor="#f17b01" BorderColor="#f17b01" OnClick="BuyProduct_Click" CommandArgument='<%# Eval("productId") %>'  OnClientClick="return confirmPurchase();"/>
					<%-- <div class="product_count" style="margin-left:200px">
							<label for="qty">Quantity:</label>
							<input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
							 class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
						</div>--%>
				</div>
            </div>
        </div>
	</div>
<!-- single product -->
    </ItemTemplate>
</asp:Repeater>

						
						
					</div>
				</section>
				</div>
				<!-- End Best Seller -->

				</form>

	<script type="text/javascript">
    function confirmPurchase() {
        var result = window.confirm("Are you sure you want to buy this product?");
        return result; // Return true if the user clicks "OK" and false if they click "Cancel".
    }
    </script>


	<!-- Footer -->
	<uc:footer ID="footer" runat="server" />