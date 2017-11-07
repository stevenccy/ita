<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/public.jspf"%>

<title>電商首頁</title>
<meta charset="utf-8">
<meta name="description" content="app landing page template" />
<meta name="keywords"
	content="app, landing page, gradient background, image background, video background, template, responsive, bootstrap" />
<meta name="developer" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- FAV AND ICONS   -->
<link rel="shortcut icon" href="assets/images/favicon.ico">
<link rel="shortcut icon" href="assets/images/apple-icon.png">
<link rel="shortcut icon" sizes="72x72"
	href="assets/images/apple-icon-72x72.png">
<link rel="shortcut icon" sizes="114x114"
	href="assets/images/apple-icon-114x114.png">

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700%7cPlayfair+Display:400,400i,700,900"
	rel="stylesheet">


<!--  login css -->
<link rel="stylesheet" href="css/style.css">
<!-- FONT ICONS -->
<link rel="stylesheet"
	href="assets/icons/font-awesome-4.7.0/css/font-awesome.min.css">

<!-- Custom Icon Font -->
<link rel="stylesheet" href="assets/fonts/flaticon.css">
<!-- Bootstrap-->
<link rel="stylesheet" href="assets/plugins/css/bootstrap.min.css">
<!-- Fancybox-->
<link rel="stylesheet" href="assets/plugins/css/jquery.fancybox.min.css">
<!-- Animation -->
<link rel="stylesheet" href="assets/plugins/css/animate.css">
<!-- owl -->
<link rel="stylesheet" href="assets/plugins/css/owl.css">
<!--flexslider-->
<link rel="stylesheet" href="assets/plugins/css/flexslider.min.css">
<!-- selectize -->
<link rel="stylesheet" href="assets/plugins/css/selectize.css">
<link rel="stylesheet"
	href="assets/plugins/css//selectize.bootstrap3.css">
<link rel="stylesheet" href="assets/plugins/css/jquery-ui.min.css">
<!--dropdown -->
<link rel="stylesheet"
	href="assets/plugins/css/bootstrap-dropdownhover.min.css">
<!-- mobile nav-->
<link rel="stylesheet" href="assets/plugins/css/meanmenu.css">

<!-- COUSTOM CSS link  -->
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<body>
	<!--
        |========================
        |  HEADER
        |========================
        -->
	<header id="xt-home" class="xt-header">
	<div class="header-top">
		<div class="container">
			<div class="row">
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
						<li><a href="${shop}/checkout.jsp">Checkout</a></li>
						<li><a href="#" data-toggle="modal"
							data-target="#login-modal">login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">

		<div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Login to Your Account</h1>
				<br>
				<form action="${shop}/AccountController/login.mvc" method="get">
					<input type="text" name="user_name" placeholder="Username">
					<input type="password" name="password" placeholder="Password">
					<input type="hidden" name="role" value="admin" /> <input
						type="submit" class="login loginmodal-submit">
				</form>
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
					<a class="navbar-brand" href="index.html"><img
						src="assets/images/flogo.png" alt="" class="img-responsive"></a>
				</div>

				<div class="collapse navbar-collapse" id="js-navbar-menu">
					<ul class="nav navbar-nav navbar-right ep-mobile-menu"
						id="navbar-nav">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a
									href="${shop}/ProductController/queryForList.mvc?keyword=&currentPage=0">Shop</a></li>
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
									<li><a class="xt-nav-link"
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=1&currentPage=0"><i
											class="fa flaticon-glasses"></i> EYE WEAR</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a
														href="${shop}/ProductController/queryCategoryForList.mvc?cid=1&currentPage=0">Sunglasses</a></li>
													<li><a
														href="${shop}/ProductController/queryCategoryForList.mvc?cid=1&currentPage=0">Glasses</a></li>
												</ul>
											</li>
										</ul></li>
									<li><a
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=2&currentPage=0"><i
											class="fa flaticon-dress"></i>DRESS</a></li>
									<li><a
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=3&currentPage=0"><i
											class="fa flaticon-high-heel"></i>SHOES</a></li>
									<li><a
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=4&currentPage=0"><i
											class="fa flaticon-v-neck-shirt"></i>T-SHIRTS</a></li>
									<li><a
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=11&currentPage=0"><i
											class="fa flaticon-jacket"></i> JACKETS</a></li>
									<li><a class="xt-nav-link"
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=13&currentPage=0"><i
											class="fa flaticon-cosmetics"></i>COSMETICS</a>
										<ul class="mega-menu xt-column">
											<li>
												<ul class="xt-single-mega">
													<li><a
														href="${shop}/ProductController/queryCategoryForList.mvc?cid=13&currentPage=0">Lipstick</a></li>
													<li><a
														href="${shop}/ProductController/queryCategoryForList.mvc?cid=13&currentPage=0">Nail
															Polish</a></li>
												</ul>
											</li>
										</ul></li>

									<li><a
										href="${shop}/ProductController/queryCategoryForList.mvc?cid=7&currentPage=0"><i
											class="fa flaticon-hijab"></i>ELECTRONICS</a></li>
								</ul></li>
						</ul>
						</nav>
					</div>
				</div>

				<div class="col-md-8 col-sm-10 col-xs-12 xt-header-search">
					<form action="${shop}/ProductController/queryForList.mvc">
						<div
							class="form-group xt-form search-bar  col-md-8 col-sm-8 col-xs-7 padding-right-o">
							<input type="text" class="form-control" name="keyword"
								placeholder="Search for things you want to buy">
						</div>
						<div
							class="form-group xt-form xt-search-cat col-md-4 col-sm-4 col-xs-5 padding-left-o ">
							<div class="xt-search-opt xt-search-btn">
								<button type="submit" class="btn btn-primary btn-search"
									style="height: 47px">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
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
												src="${shop }/assets/images/${orderItem.product.imgurl}"
												alt=""
												style="max-width: 80px; max-height: 80px; width: auto; height: auto;">
												<h3>${orderItem.name}</h3> <span class="cart-price">${orderItem.number}
													X $${orderItem.price}</span>
										</a></li>
									</c:forEach>
									<li><a href="" class="subtotal top-checkout">
											<h3>Subtotal :</h3> <span class="total-price">$${sessionScope.order.total}</span>
									</a></li>
									<li><a href="${shop}/checkout.jsp"
										class="process top-checkout">
											<h3>Proceed to Checkout</h3>
									</a></li>
								</ul></li>
						</ul>
						<span class="xt-item-count">
							${fn:length(sessionScope.order.itemList)} </span>
					</div>
				</div>
			</div>
		</div>
	</div>

	</header>


	<!--
        |========================
        |  SLIDER
        |========================
        -->
	<section class="xt-slider">
	<div class="container">
		<div class="row">
			<div class="col-md-3 category-hidden padding-right-o"></div>
			<div class="col-md-9 col-md-offset-3 padding-o padding-sm">
				<div class="flexslider xt-slider-inner">
					<ul class="slides">
						<li><img src="assets/images/model-five.jpg" alt="" />
							<div class="slide_text">
								<span class="slide-category">Fashion</span>
								<h2 class="slide_title">
									Spring Summer <br> Fashion Collection
								</h2>
								<p class="slide_byline ">Lorem ipsum dolor sit amet,
									consectetur adipis cing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua ut enim ad minim.</p>
								<a href="" class="btn btn-fill ">Shop Now</a>
							</div></li>
						<li><img src="assets/images/model-four.jpg" alt="" />
							<div class="slide_text">
								<span class="slide-category">Style</span>
								<h2 class="slide_title ">
									Winter Autumn <br> Jacket Collection
								</h2>
								<p class="slide_byline ">Usher in the summer months with
									showerproof jackets and lightweight boys' coats. Items are
									great to be presented loved ones and the reasonable price makes
									the collection suitable.</p>
								<a href="" class="btn btn-fill ">Shop Now</a>
							</div></li>
						<li><img src="assets/images/model-three.jpg" alt="" />
							<div class="slide_text">
								<span class="slide-category">Spring Collection</span>
								<h2 class="slide_title ">
									Spring Upcomming <br> New Collection
								</h2>
								<p class="slide_byline ">Bags, Glasses and belts are all of
									the best quality and are made by famous brands in this area.
									Vitrine helped them to show their products better and sell
									more.</p>
								<a href="" class="btn btn-fill ">Shop Now</a>
							</div></li>
					</ul>
				</div>
				<div class="flexslider-controls">
					<ol class="flex-control-nav">
						<li><img src="assets/images/model-five-thumb.jpg" alt="" />
							<div class="nav-title">
								<span>Fashion</span>
								<h3>Spring Summer Fashion Collection</h3>
							</div></li>
						<li><img src="assets/images/model-four-thumb.jpg" alt="" />
							<div class="nav-title">
								<span>Style</span>
								<h3>Winter Autumn Jacket COllection</h3>
							</div></li>
						<li><img src="assets/images/model-three-thumb.jpg" alt="" />
							<div class="nav-title">
								<span>Spring</span>
								<h3>Spring New Collection 2018</h3>
							</div></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!--
        |========================
        |  PRODUCT
        |========================
        -->
	<c:forEach items="${applicationScope.bigList}" var="proList">
		<section class="xt-feature-product">
		<div class="container">
			<div class="row section-separator">
				<div class="section-title">
					<h2>${proList[0].category.name}</h2>
					<span class="xt-title-bg"></span>
				</div>
				<div class="xt-each-feature">
					<c:forEach items="${proList}" var="product">
						<div class="col-md-4 col-sm-4">
							<div class="xt-feature">
								<div class="product-img">
									<a href="ProductController/detail.mvc?id=${product.id}"> <img
										src="${shop}/assets/images/${product.imgurl}" alt=""
										class="img-responsive"></a> <span
										class="product-tag xt-uppercase">sale!</span>
								</div>
								<div class="product-info">
									<div class="product-title">
										<span class="category xt-uppercase">${product.name}</span> <span
											class="name xt-semibold">${product.remark}</span>
									</div>
									<div class="price-tag pull-right">
										<span class="old-price"><del>$${product.price+500}</del></span>
										<span class="new-price xt-semibold">$${product.price}</span>
									</div>
									<div class="xt-featured-caption">
										<div class="product-title">
											<span class="category xt-uppercase">${product.name}</span> <span
												class="name xt-semibold">${product.remark}</span>
										</div>
										<div class="price-tag pull-right">
											<span class="old-price"><del>$${product.price+500}</del></span>
											<span class="new-price xt-semibold">${product.price}</span>
										</div>
										<div class="add-cart">
											<a
												href="${shop}/OrderItemController/addOrderItem.mvc?id=${product.id}&quantity=1"
												class="btn btn-fill">Add to cart</a>
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
					</c:forEach>
				</div>
			</div>
		</div>
		</section>
	</c:forEach>
	<!--
        |========================
        |  BY CATEGORY 
        |========================
        -->
	<section class="product-category">
	<div class="container">
		<div class="row section-separator">
			<div class="section-title">
				<h2>PRODUCTS by category</h2>
				<span class="xt-title-bg"></span>
			</div>
			<div class="col-xs-12">
				<div class="xt-product-slide">
					<div class="xt-carousel owl-theme">
						<div class="xt-item">
							<i class="fa flaticon-dress-1"></i> <span>Fashion</span>
						</div>
						<div class="xt-item">
							<i class="fa flaticon-jacket-1"></i> <span>Style</span>
						</div>
						<div class="xt-item">
							<i class="fa flaticon-v-neck-shirt"></i> <span>Lipstick</span>
						</div>
						<div class="xt-item">
							<i class="fa flaticon-high-heel"></i> <span>Blezzar</span>
						</div>
						<div class="xt-item">
							<i class="fa flaticon-dress"></i> <span>Jacket</span>
						</div>
					</div>
				</div>
			</div>
			<div class="xt-category-feature col-xs-12">
				<div class="col-md-4 col-sm-4">
					<div class="xt-feature">
						<div class="product-img">
							<img src="assets/images/model-one-660-640.jpg" alt=""
								class="img-responsive"> <span
								class="product-tag xt-uppercase">sale!</span>
						</div>
						<div class="product-info">
							<div class="product-title">
								<span class="category xt-uppercase">Winter COllection</span> <span
									class="name xt-semibold">Black Color</span>
							</div>
							<div class="price-tag pull-right">
								<span class="old-price"><del>$280</del></span> <span
									class="new-price xt-semibold">$260</span>
							</div>
							<div class="xt-featured-caption">
								<div class="product-title">
									<span class="category xt-uppercase">Winter COllection</span> <span
										class="name xt-semibold">Black Color</span>
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
				<div class="col-md-4 col-sm-4">
					<div class="xt-feature">
						<div class="product-img">
							<img src="assets/images/model-two-660-640.jpg" alt=""
								class="img-responsive"> <span
								class="product-tag xt-uppercase">sale!</span>
						</div>
						<div class="product-info">
							<div class="product-title">
								<span class="category xt-uppercase">Autumn Collection</span> <span
									class="name xt-semibold">Imported From U.A.E.</span>
							</div>
							<div class="price-tag pull-right">
								<span class="old-price"><del>$280</del></span> <span
									class="new-price xt-semibold">$260</span>
							</div>
							<div class="xt-featured-caption">
								<div class="product-title">
									<span class="category xt-uppercase">Autumn Collection</span> <span
										class="name xt-semibold">Imported From U.A.E.</span>
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
				<div class="col-md-4 col-sm-4">
					<div class="xt-feature">
						<div class="product-img">
							<img src="assets/images/model-five-660-640.jpg" alt=""
								class="img-responsive"> <span
								class="product-tag xt-uppercase">sale!</span>
						</div>
						<div class="product-info">
							<div class="product-title">
								<span class="category xt-uppercase">Spring Collection</span> <span
									class="name xt-semibold">2017 New Model</span>
							</div>
							<div class="price-tag pull-right">
								<span class="old-price"><del>$280</del></span> <span
									class="new-price xt-semibold">$260</span>
							</div>
							<div class="xt-featured-caption">
								<div class="product-title">
									<span class="category xt-uppercase">Spring Collection</span> <span
										class="name xt-semibold">2017 New Model</span>
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
		</div>
	</div>
	</section>


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
								<address>Address: Zhuhai</address></li>
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
							<li><a href=""><i class="fa fa-caret-right"></i>Seacure
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
				<div class="col-md-6 col-sm-6">
					<p>
						Free Bootstrap eCommerce Template by <a
							href="https://xoothemes.com/" target="_blank">XooThemes</a>.
					</p>
				</div>
				<div class="col-md-6 col-sm-6">
					<img src="assets/images/payment.png" alt="" class="img-responsive">
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

	<!-- Bootstrap -->
	<script src="assets/plugins/js/bootstrap.min.js"></script>
	<!-- mean menu nav-->
	<script src="assets/plugins/js/meanmenu.js"></script>
	<!-- ajaxchimp -->
	<script src="assets/plugins/js/jquery.ajaxchimp.min.js"></script>
	<!-- wow -->
	<script src="assets/plugins/js/wow.min.js"></script>
	<!-- Owl carousel-->
	<script src="assets/plugins/js/owl.carousel.js"></script>
	<!--flexslider-->
	<script src="assets/plugins/js/jquery.flexslider-min.js"></script>
	<!--dropdownhover-->
	<script src="assets/plugins/js	/bootstrap-dropdownhover.min.js"></script>
	<!--jquery-ui.min-->
	<script src="assets/plugins/js/jquery-ui.min.js"></script>
	<!--validator -->
	<script src="assets/plugins/js/validator.min.js"></script>
	<!--smooth scroll-->
	<script src="assets/plugins/js/smooth-scroll.js"></script>
	<!-- Fancybox js-->
	<script src="assets/plugins/js/jquery.fancybox.min.js"></script>
	<!-- SELECTIZE-->
	<script src="assets/plugins/js/standalone/selectize.js"></script>
	<!-- init -->
	<script src="assets/js/init.js"></script>
</body>
</html>




