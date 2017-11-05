<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--[if IE 7]> <html class="no-js ie7 oldie" lang="en-US"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8 oldie" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">

<head>
<%@include file="/WEB-INF/public.jspf"%>
<!-- TITLE OF SITE -->
<title>eCommerce</title>
<!-- Meta -->
<meta charset="utf-8">
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
<!--[if lt IE 9]>
            <script src="js/plagin-js/html5shiv.js"></script>
            <script src="js/plagin-js/respond.min.js"></script>
        <![endif]-->
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
									<li><a href="">Riyal</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="user-nav pull-right col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="${shop}/checkout.jsp">Checkout</a></li>
						<li><a href="">login</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main-navigation">
			<nav class="navbar navbar-fixed-top nav-scroll">
				<div class="container">
					<div class="row">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span aria-hidden="true" class="icon"></span>
							</button>
							<a class="navbar-brand" href="${shop}/index.jsp"><img
								src="${shop}/assets/images/flogo.png" alt=""
								class="img-responsive"></a>
						</div>
						<div class="collapse navbar-collapse" id="js-navbar-menu">
							<ul class="nav navbar-nav navbar-right ep-mobile-menu"
								id="navbar-nav">
								<li><a href="${shop}/index.jsp">Home</a></li>
								<li><a
									href="${shop}/ProductController/queryForList.mvc?keyword=">Shop</a></li>
								<li><a href="">About</a></li>
								<li><a href="">Contact</a></li>
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
											<li><a class="xt-nav-link" href="contentpage.jsp"><i
													class="fa flaticon-glasses"></i> EYE WEAR</a>
												<ul class="mega-menu xt-column">
													<li>
														<ul class="xt-single-mega">
															<li><a href="${shop}/contentpage.jsp">Sunglasses</a></li>
															<li><a href="${shop}/contentpage.jsp">Glasses</a></li>
														</ul>
													</li>
												</ul></li>
											<li><a href="${shop}/contentpage.jsp"><i
													class="fa flaticon-dress"></i>DRESS</a></li>
											<li><a href="${shop}/contentpage.jsp"><i
													class="fa flaticon-high-heel"></i>SHOES</a></li>
											<li><a href="${shop}/contentpage.jsp"><i
													class="fa flaticon-v-neck-shirt"></i>T-SHIRTS</a></li>
											<li><a href="${shop}/contentpage.jsp"><i
													class="fa flaticon-jacket"></i> JACKETS</a></li>
											<li><a class="xt-nav-link"
												href="${shop}/contentpage.jsp"><i
													class="fa flaticon-cosmetics"></i>COSMETICS</a>
												<ul class="mega-menu xt-column">
													<li>
														<ul class="xt-single-mega">
															<li><a href="${shop}/contentpage.jsp">Lipstick</a></li>
															<li><a href="${shop}/contentpage.jsp">Nail
																	Polish</a></li>
														</ul>
													</li>
												</ul></li>

											<li><a href="${shop}/contentpage.jsp"><i
													class="fa flaticon-hijab"></i>ELECTRONICS</a></li>
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
										<c:forEach items="${sessionScope.order.itemList}"
											var="orderItem">
											<li><a
												href="${shop}/ProductController/detail.mvc?id=${orderItem.product.id}">
													<img
													src="${shop}/assets/images/${orderItem.product.imgurl}"
													alt=""
													style="max-width: 80px; max-height: 80px; width: auto; height: auto;">
													${orderItem.name}<span class="cart-price">${orderItem.number}
														X $${orderItem.price}</span>
											</a></li>
										</c:forEach>
										<li><a href="" class="subtotal top-checkout">
												Subtotal : <span class="total-price">$${sessionScope.order.total}</span>
										</a></li>
										<li><a href="checkout.jsp" class="process top-checkout">
												Process to Checkout </a></li>
									</ul></li>
							</ul>
							<span class="xt-item-count">${fn:length(sessionScope.order.itemList)}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--
        |========================
        |   PRODUCT DESCRIPTION
        |========================
        -->
	<section class="xt-xt-single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-3 visible-xs visible-sm padding-right-o"></div>
				<div class="col-md-9 col-md-offset-3 padding-o">
					<div class="xt-product-inner">
						<div class="col-md-5">
							<div role="tabpanel" class="tab-pane active xt-product-tab">
								<div class="tab-content xt-pro-small-image">
									<!-- Tab panel-->
									<div role="tabpanel" id="xt-pro-3"
										class="tab-pane fade active in">
										<a class="grouped_elements" data-fancybox="gallery"
											href="${shop}/assets/images/${requestScope.product.imgurl}">
											<img
											src="${shop}/assets/images/${requestScope.product.imgurl}"
											alt="" class="img-responsive">
										</a>
									</div>
								</div>
								<!-- Nav tabs -->
								<ul id="tablist" class="xt-pro-thumbs-list" role="tablist">
									<li role="presentation" class="active"><a href="#xt-pro-3"
										role="tab" data-toggle="tab" aria-expanded="true"> <img
											src="${shop}/assets/images/${requestScope.product.imgurl}"
											alt="product thumbs"
											style="max-width: 80px; max-height: 80px; width: auto; height: auto;">
									</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-7">
							<div class="each-product-info">
								<h3>${requestScope.product.name}</h3>
								<span class="single-price"><b>Current Price:</b>
									$${requestScope.product.price}</span>
								<p>${requestScope.product.remark}</p>
								<!--  
								<div class="color-select">
									Color:
									<ul>
										<li class="red-bg selected"><i class="fa fa-check"></i></li>
										<li class="green-bg"><i class="fa fa-check"></i></li>
										<li class="blue-bg"><i class="fa fa-check"></i></li>
									</ul>
								</div>
								<div class="select-size">
									Size:
									<ul>
										<li class="selected">M</li>
										<li>L</li>
										<li>XL</li>
									</ul>
								</div>
								-->
								<div class="select-quantity">
									<input type="number" step="1" name="quantity" value="1"
										title="Qty" class="input-text qty text" size="4">
								</div>
								<div class="product-add-cart">
									<a
										href="${shop}/OrderItemController/addOrderItem.mvc?id=${product.id}"
										class="btn btn-fill">Add to cart</a> <a href="#"
										class="btn liked "><i class="fa fa-heart-o xt-no-color"></i><i
										class="fa fa-heart xt-color"></i></a>
								</div>
								<!--  
								<div class="product-additional-info">
									<ul>
										<li><b>Sku:</b>P001</li>
										<li><b>Category:</b><a href="">Fashion & clothings</a>, <a
											href="">Women</a></li>
										<li><b>Tag:</b> <a href="">Rib</a>, <a href="">Neck</a></li>
									</ul>
								</div>
								-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="clearfix"></div>
	<div class="xt-product-description">
		<div class="container">
			<div class="row section-separator">
				<aside class="col-md-3"></aside>
				<div class="col-md-9">
					<div class="xt-single-item-info">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs xt-single-item-tab" role="tablist"
							id="xt-product-dec-nav">
							<li role="presentation" class="active"><a
								href="#description" aria-controls="description" role="tab"
								data-toggle="tab">Description</a></li>
							<li role="presentation" class=""><a href="#specification"
								aria-controls="specification" role="tab" data-toggle="tab">Specification</a>
							</li>
							<li role="presentation" class=""><a href="#seller"
								aria-controls="seller" role="tab" data-toggle="tab">Seller
									info</a></li>
							<li role="presentation" class=""><a href="#shopping"
								aria-controls="shopping" role="tab" data-toggle="tab">Shopping</a>
							</li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content xt-tab-content">
							<div role="tabpanel"
								class="tab-pane xt-pane xt-description fade in active"
								id="description">
								<h3>Product Description</h3>
								<b>Description</b> <br> <span>${requestScope.product.remark }</span>
							</div>
							<div role="tabpanel" class="tab-pane xt-pane fade"
								id="specification">
								<h3>Product Specification</h3>
								<p>100% New. Free return.</p>
							</div>
							<div role="tabpanel" class="tab-pane xt-pane fade" id="seller">
								Made in China.</div>
							<div role="tabpanel" class="tab-pane xt-pane fade" id="shopping">
								Ships from China. Free Shipping.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
        |========================
        |      FOOTER
        |========================
        -->
	<footer class="xt-footer">
		<div class="container">
			<div class="section-separator">
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="footer-widget footer-contact">
							<img src="${shop}/assets/images/flogo.png" alt=""
								class="img-responsive">
							<ul>
								<li><i class="fa fa-mobile-phone"></i><a href="">+(1234)
										456 7896</a></li>
								<li><i class="fa fa-envelope-o"></i><a href="">info@xootheme.com</a></li>
								<li><i class="fa fa-location-arrow"></i>
									<address>Address: 42/1, dariapara road, New york
										city, New york. USA</address></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="footer-widget">
							<h4>My account</h4>
							<ul>
								<li><a href=""><i class="fa fa-caret-right"></i>My
										account</a></li>
								<li><a href=""><i class="fa fa-caret-right"></i>about
										us</a></li>
								<li><a href=""><i class="fa fa-caret-right"></i>Shopping
										cart</a></li>
								<li><a href="checkout.jsp"><i class="fa fa-caret-right"></i>Checkout</a></li>
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
								<li><a href=""><i class="fa fa-caret-right"></i>Our
										blog</a></li>
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
					<div class="col-md-6 col-sm-6">
						<p>
							Free Bootstrap eCommerce Template by <a
								href="https://xoothemes.com/" target="_blank">XooThemes</a>.
						</p>
					</div>
					<div class="col-md-6 col-sm-6">
						<img src="${shop}/assets/images/payment.png" alt=""
							class="img-responsive">
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--
        |========================
        |      Script
        |========================
        -->
	<!-- jquery -->
	<script src="${shop}/assets/plugins/js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap -->
	<script src="${shop}/assets/plugins/js/bootstrap.min.js"></script>
	<!-- mean menu nav-->
	<script src="${shop}/assets/plugins/js/meanmenu.js"></script>
	<!-- ajaxchimp -->
	<script src="${shop}/assets/plugins/js/jquery.ajaxchimp.min.js"></script>
	<!-- wow -->
	<script src="${shop}/assets/plugins/js/wow.min.js"></script>
	<!-- Owl carousel-->
	<script src="${shop}/assets/plugins/js/owl.carousel.js"></script>
	<!--flexslider-->
	<script src="${shop}/assets/plugins/js/jquery.flexslider-min.js"></script>
	<!--dropdownhover-->
	<script src="${shop}/assets/plugins/js/bootstrap-dropdownhover.min.js"></script>
	<!--jquery-ui.min-->
	<script src="${shop}/assets/plugins/js/jquery-ui.min.js"></script>
	<!--validator -->
	<script src="${shop}/assets/plugins/js/validator.min.js"></script>
	<!--smooth scroll-->
	<script src="${shop}/assets/plugins/js/smooth-scroll.js"></script>
	<!-- Fancybox js-->
	<script src="${shop}/assets/plugins/js/jquery.fancybox.min.js"></script>
	<!-- selectize -->
	<script src="${shop}/assets/plugins/js/standalone/selectize.js"></script>
	<!-- init -->
	<script src="${shop}/assets/js/init.js"></script>
</body>

</html>



