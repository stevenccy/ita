<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>電商首頁</title>
<%@ include file="WEB-INF/public.jspf"%>
<%@ include file="WEB-INF/login.jspf"%>
<!-- COUSTOM CSS link  -->
<link rel="stylesheet" href="${shop}/assets/css/style.css">
<link rel="stylesheet" href="${shop}/assets/css/responsive.css">
<!-- 
	New Page CSS dependencies
 -->
<meta name="description" content="app landing page template" />
<meta name="keywords"
	content="app, landing page, gradient background, image background, video background, template, responsive, bootstrap" />
<meta name="developer" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- FAV AND ICONS   -->
<link rel="shortcut icon" href="${shop}/assets/images/favicon.ico">
<link rel="shortcut icon" href="${shop}/assets/images/apple-icon.png">
<link rel="shortcut icon" sizes="72x72"
	href="${shop}/assets/images/apple-icon-72x72.png">
<link rel="shortcut icon" sizes="114x114"
	href="${shop}/assets/images/apple-icon-114x114.png">

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700%7cPlayfair+Display:400,400i,700,900"
	rel="stylesheet">

<!-- FONT ICONS -->
<link rel="stylesheet"
	href="${shop}/assets/icons/font-awesome-4.7.0/css/font-awesome.min.css">

<!-- Custom Icon Font -->
<link rel="stylesheet" href="${shop}/assets/fonts/flaticon.css">
<!-- Bootstrap-->
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/bootstrap.min.css">
<!-- Fancybox-->
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/jquery.fancybox.min.css">
<!-- Animation -->
<link rel="stylesheet" href="${shop}/assets/plugins/css/animate.css">
<!-- owl -->
<link rel="stylesheet" href="${shop}/assets/plugins/css/owl.css">
<!--flexslider-->
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/flexslider.min.css">
<!-- selectize -->
<link rel="stylesheet" href="${shop}/assets/plugins/css/selectize.css">
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/selectize.bootstrap3.css">
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/jquery-ui.min.css">
<!--dropdown -->
<link rel="stylesheet"
	href="${shop}/assets/plugins/css/bootstrap-dropdownhover.min.css">
<!-- mobile nav-->
<link rel="stylesheet" href="${shop}/assets/plugins/css/meanmenu.css">

<!-- COUSTOM CSS link  -->
<link rel="stylesheet" href="${shop}/assets/css/style.css">
<link rel="stylesheet" href="${shop}/assets/css/responsive.css">


</head>

<body>
	<!--
        |========================
        |  HEADER
        |========================
        -->
	<header id="xt-home" class="xt-header">
	<div class="header-top">
		<div class="container">
			<div class="xt-language col-md-6 col-sm-6 col-xs-12">
				<div class="each-nav">
					<ul>
						<li class="dropdown"><a href="" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">English <span class="fa fa-angle-down"></span>
						</a>
							<ul class="dropdown-menu xt-lang-dropdown">
								<li><a href="">France</a></li>
								<li><a href="">Bangla</a></li>
								<li><a href="">Swidesh</a></li>
							</ul></li>
						<li class="dropdown"><a href="" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">USD <span class="fa fa-angle-down"></span>
						</a>
							<ul class="dropdown-menu xt-lang-dropdown">
								<li><a href="">USD</a></li>
								<li><a href="">EURO</a></li>
								<li><a href="">RMB</a></li>
							</ul></li>
					</ul>
				</div>
			</div>

			<div class="user-nav pull-right col-md-6 col-sm-6 col-xs-12">
				<ul>
					<li><a href="">My wishlist</a></li>
					<li><a href="">Checkout</a></li>
					<li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="main-navigation">
		<nav class="navbar navbar-fixed-top nav-scroll">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span aria-hidden="true" class="icon"></span>
					</button>
					<a class="navbar-brand" href="index.jsp"><img
						src="assets/images/flogo.png" alt="" class="img-responsive"></a>
				</div>

				<div class="collapse navbar-collapse" id="js-navbar-menu">
					<ul class="nav navbar-nav navbar-right ep-mobile-menu"
						id="navbar-nav">
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="${shop}/contentpage.jsp">Shop</a></li>
						<li><a href="">About</a></li>
						<li><a href="contact-us.jsp">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
	</div>
	<!--Mobile Menu-->
	<div class="main-color-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-3 left-menu-wrapper">
					<div class="xt-sidenav hidden-xs hidden-sm">
						<nav>
						<ul class="xt-side-menu">
							<li><a href="#">All Category</a>
								<ul class="xt-dropdown">
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-glasses"></i> FASHION</a>
										<ul class="mega-menu">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Bags</a></li>
													<li><a href="single-shop.html">Funky</a></li>
													<li><a href="single-shop.html">Ear Wear</a></li>
													<li><a href="single-shop.html">Shoes</a></li>
													<li><a href="single-shop.html">Cosmetic</a></li>
												</ul>
											</li>
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Shirt</a></li>
													<li><a href="single-shop.html">Pant</a></li>
													<li><a href="single-shop.html">Trousers</a></li>
													<li><a href="single-shop.html">Jackets & sweater</a></li>
													<li><a href="single-shop.html">T-Shirts</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-dress"></i> WOMEN'S</a>
										<ul class="mega-menu">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Accessories</a></li>
													<li><a href="single-shop.html">Ornaments</a></li>
													<li><a href="single-shop.html">Shoes</a></li>
													<li><a href="single-shop.html">3 Piece</a></li>
													<li><a href="single-shop.html">Cosmetic</a></li>
												</ul>
											</li>
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Ring</a></li>
													<li><a href="single-shop.html">Bags</a></li>
													<li><a href="single-shop.html">Ear Wear</a></li>
													<li><a href="single-shop.html">Storage</a></li>
													<li><a href="single-shop.html">Office</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a href="single-shop.html"><i
											class="fa flaticon-high-heel"></i> SHOES</a></li>
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-v-neck-shirt"></i> MAN'S</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Jeans Pant</a></li>
													<li><a href="single-shop.html">T-Shirts</a></li>
													<li><a href="single-shop.html">Pant</a></li>
													<li><a href="single-shop.html">Jackets</a></li>
													<li><a href="single-shop.html">Cap</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a href="single-shop.html"><i
											class="fa flaticon-jacket"></i> JACKETS</a></li>
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-cosmetics"></i> COSMETICS</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Lipstick</a></li>
													<li><a href="single-shop.html">Makeup Brush</a></li>
													<li><a href="single-shop.html">Nail Polish</a></li>
													<li><a href="single-shop.html"> Hair Dryers</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-hijab"></i>BOURKHA & HIJAB</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">Iranian</a></li>
													<li><a href="single-shop.html">Arabian</a></li>
													<li><a href="single-shop.html">Indian</a></li>
													<li><a href="single-shop.html">Indonesian</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a class="xt-nav-link" href="single-shop.html"><i
											class="fa flaticon-jacket-1"></i>Coats & Gilets</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a href="single-shop.html">German Coats</a></li>
													<li><a href="single-shop.html">Bangladeshi Blezzar</a></li>
													<li><a href="single-shop.html">Thailand Gilets</a></li>
													<li><a href="single-shop.html">Indian Coats</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a href="single-shop.html"><i
											class="fa flaticon-dress-1"></i>Boutique</a></li>
									<li><a href="#more-list"> <i class="fa flaticon-menu"></i>
											More Categories
									</a></li>
								</ul></li>
						</ul>
						</nav>
					</div>
				</div>

				<div class="col-md-8 col-sm-10 col-xs-12 xt-header-search">
					<div
						class="form-group xt-form search-bar  col-md-8 col-sm-8 col-xs-7 padding-right-o">
						<input type="text" class="form-control"
							placeholder="Search for snippets" />
					</div>
					<div
						class="form-group xt-form xt-search-cat col-md-4 col-sm-4 col-xs-5 padding-left-o ">
						<div class="xt-select xt-search-opt">
							<select class="xt-dropdown-search select-beast">
								<option>All Categories</option>
								<option>Boutique</option>
								<option>Shirt</option>
								<option>Pants</option>
								<option>Jeans</option>
								<option>Bourkha</option>
								<option>Hijab</option>
								<option>T-Shirt</option>
								<option>Coats</option>
								<option>Blezzar</option>
								<option>Gilets</option>
								<option>3 Piece</option>
								<option>Cosmetic</option>
							</select>
						</div>
						<div class="xt-search-opt xt-search-btn">
							<button type="button" class="btn btn-primary btn-search">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="col-md-1 col-sm-2 col-xs-2">
					<div class="xt-cart">
						<ul>
							<li class="dropdown"><a href="" class="dropdown-toggle"
								data-toggle="dropdown" data-hover="dropdown"> <i
									class="fa flaticon-shopping-cart"></i>
							</a>
								<ul class="dropdown-menu xt-cart-items">
									<li><a href=""> <img src="assets/images/4.jpg" alt="">
											<h3>Lipstick</h3> <span class="cart-price">$299</span>
									</a></li>
									<li><a href=""> <img src="assets/images/1.jpg" alt="">
											<h3>T-Shirt</h3> <span class="cart-price">$499</span>
									</a></li>
									<li><a href=""> <img src="assets/images/3.jpg" alt="">
											<h3>Shirt</h3> <span class="cart-price">$399</span>
									</a></li>
									<li><a href="" class="subtotal top-checkout">
											<h3>Subtotal :</h3> <span class="total-price">$999</span>
									</a></li>
									<li><a href="" class="process top-checkout">
											<h3>Process to Checkout</h3>
									</a></li>
								</ul></li>
						</ul>
						<span class="xt-item-count">8</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	</header>

	<!--
        |========================
        |  PRODUCT SUB PAGE
        |========================
        -->
	<div class="xt-product-subpage">
		<div class="container">
			<div class="row">
				<!-- SIDEBAR -->
				<aside class="col-md-3 product-sidebar">
				<div class="price-range">
					<h3>Price</h3>
					<div class="each-price-range">
						<div id="xt-price-range"></div>
						<input type="text" id="amount" class="price-range-amount">
						<a href="" class="btn btn-fill">Filter</a>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="xt-product-color">
					<h3>Brands</h3>
					<ul>
						<li><a href="">Blue <span>(11)</span></a></li>
						<li><a href="">Red <span>(7)</span></a></li>
						<li><a href="">Green <span>(4)</span></a></li>
						<li><a href="">Yellow <span>(0)</span></a></li>
						<li><a href="">Magenta <span>(1)</span></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
				</aside>
				<div class="col-md-9">
					<!--end singlw item info -->
					<div class="xt-feature-product">
						<div class="section-separator">
							<div class="xt-filter-nav">
								<div class="col-md-7 col-sm-7 col-xs-10 xt-show-item">
								</div>
								<div class="col-md-5 col-sm-5 col-xs-12">
									<div class="xt-page-pagination">
										<nav aria-label="Page navigation">
										<ul class="pagination xt-pagination">
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#" aria-label="Next"><i
													class="fa fa-caret-right"></i></a></li>
										</ul>
										</nav>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="col-xs-12 xt-top-hr">
									<hr class="xt-hr">
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="xt-each-feature">
								<div class="col-md-4 col-sm-4">
									<div class="xt-feature">
										<div class="product-img">
											<img src="assets/images/2.jpg" alt="" class="img-responsive">
											<span class="product-tag xt-uppercase">sale!</span>
										</div>
										<div class="product-info">
											<div class="product-title">
												<span class="category xt-uppercase">Sweater</span> <span
													class="name xt-semibold">Red Color</span>
											</div>
											<div class="price-tag pull-right">
												<span class="old-price"><del>$280</del></span> <span
													class="new-price xt-semibold">$260</span>
											</div>
											<div class="xt-featured-caption">
												<div class="product-title">
													<span class="category xt-uppercase">Sweater</span> <span
														class="name xt-semibold">Red Color</span>
												</div>
												<div class="price-tag pull-right">
													<span class="old-price"><del>$280</del></span> <span
														class="new-price xt-semibold">$260</span>
												</div>
												<div class="add-cart">
													<a href="" class="btn btn-fill">Add to cart</a>
													<ul class="reaction">
														<li><a href=""><i class="fa fa-search"></i></a></li>
														<li><a href=""><i class="fa fa-heart-o"></i></a></li>
														<li><a href=""><i class="fa fa-bar-chart-o"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-md-12 xt-bottom-hr">
								<hr class="xt-hr">
							</div>
							<div class="xt-filter-nav padding-bottom-60">
								<div class="col-md-5 col-sm-5 col-xs-10 xt-show-item">
								</div>
								<div class="col-md-4 col-sm-4 col-xs-12"></div>
								<div class="col-md-3 col-sm-3 col-xs-12">
									<div class="xt-page-pagination">
										<nav aria-label="Page navigation">
										<ul class="pagination xt-pagination">
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#" aria-label="Next"><i
													class="fa fa-caret-right"></i></a></li>
										</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<!---->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
        |========================
        |  SUBSCRIBE
        |========================
        -->
	<div class="black-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-12">
					<form class="form-inline xt-subscribe-form">
						<div class="form-group col-xs-10 xt-subscribe">
							<label for="subscribe">Subscribe</label> <input type="text"
								class="form-control" id="subscribe"
								placeholder="Your email address">
						</div>
						<div class="col-md-2 col-xs-2">
							<button type="submit" class="btn btn-fill">
								<i class="fa flaticon-home"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="xt-social">
						<span>stay connected</span>
						<ul>
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
        |========================
        |  FOOTER
        |========================
        -->
	<footer class="xt-footer">
	<div class="container">
		<div class="section-separator">
			<div class="row">
				<div class="col-md-3 col-sm-3">
					<div class="footer-widget footer-contact">
						<img src="assets/images/flogo.png" alt="" class="img-responsive">
						<ul>
							<li><i class="fa fa-mobile-phone"></i><a href="">+(1234)
									456 7896</a></li>
							<li><i class="fa fa-envelope-o"></i><a href="">info@shopx.com</a></li>
							<li><i class="fa fa-location-arrow"></i>
								<address>Address: ZhuHai</address></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="footer-widget">
						<h4>My account</h4>
						<ul>
							<li><a href=""><i class="fa fa-caret-right"></i>My
									account</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>about us</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Shopping
									cart</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Checkout</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="footer-widget">
						<h4>Custom Service</h4>
						<ul>
							<li><a href=""><i class="fa fa-caret-right"></i>Shopping
									& return</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Secure
									Shopping</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>International
									Shopping </a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Affiliate</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="footer-widget">
						<h4>Information</h4>
						<ul>
							<li><a href=""><i class="fa fa-caret-right"></i>Store
									location</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>About
									our shop</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Our blog</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Secure
									Shopping</a></li>
							<li><a href=""><i class="fa fa-caret-right"></i>Delivery
									information</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="footer-middle bg-2">
		<div class="container">
			<div class="row section-separator">
				<div class="col-md-4 col-sm-4">
					<div class="footer-widget-2">
						<div class="row">
							<div class="col-md-2 f-icon">
								<i class="fa flaticon-credit-card"></i>
							</div>
							<div class="col-md-10">
								<h4>Safe Payment</h4>
								<p>Pay with the world’s most popular and secure payment
									methods.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="footer-widget-2">
						<div class="row">
							<div class="col-md-2 f-icon">
								<i class="fa flaticon-shipped"></i>
							</div>
							<div class="col-md-10">
								<h4>Worldwide delivery</h4>
								<p>With sites in 5 languages, we shop to over 100 countries
									and regions.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="footer-widget-2">
						<div class="row">
							<div class="col-md-2 f-icon">
								<i class="fa flaticon-question"></i>
							</div>
							<div class="col-md-10">
								<h4>24/7 help center</h4>
								<p>Round-the-clock assistance for a smooth shopping
									experience.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="row section-separator">
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-6">
					<img src="assets/images/payment.png" alt="" class="img-responsive">
				</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>




