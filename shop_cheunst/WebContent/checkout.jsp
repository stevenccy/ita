<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 7]> <html class="no-js ie7 oldie" lang="en-US"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8 oldie" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->


<html lang="en">

<head>
<!-- TITLE OF SITE -->
<title>eCommerce</title>
<!-- Meta -->
<%@include file="/WEB-INF/public.jspf"%>
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
	href="assets/plugins/css/selectize.bootstrap3.css">
<link rel="stylesheet" href="assets/plugins/css/jquery-ui.min.css">
<!--dropdown -->
<link rel="stylesheet"
	href="assets/plugins/css/bootstrap-dropdownhover.min.css">
<!-- mobile nav-->
<link rel="stylesheet" href="assets/plugins/css/meanmenu.css">
<!-- COUSTOM CSS link  -->
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<!--[if lt IE 9]>
            <script src="js/plagin-js/html5shiv.js"></script>
            <script src="js/plagin-js/respond.min.js"></script>
        <![endif]-->
</head>
<script type="text/javascript">
	$(function() {
		$('.btn-danger').click(function() {
			// 1: 发送当前购买商品的id, parents(tr) 可能会查找到多个tr
			var pid = $(this).closest("tr").attr('lang');
			$(this).closest("tr").remove(); // 删除当前td所在的tr
			$.get('${shop}/OrderItemServlet', {
				id : pid,
				type : 'removeOrderItem'
			}, function(total) {
				// 2: 购物车在后台删除对应的购物项 (后台实现)
				// 3: 重新计算总价格 (后台实现)
				// 4: 返回并更新,新的总价格
				alert(total);
				$("#total").html(total);
				$("#subTotal").html(total);
			}, 'text');
		});

		$('.inputNumber').change(
				function() {
					var num = $(this).val();
					console.log('adsdad');
					// 如果是数字,则更新lang属性,否则还原lang属性的值
					if (/^[1-9]\d*$/.test(num)) {
						// 如果数值正确,则替换lang属性的值
						$(this).attr('lang', num);
						// 获取当前购物项对应的pid
						var pid = $(this).closest("tr").attr('lang');
						// 发送ajax请求更新当前购物项数量
						var txtTd = $(this).closest("td");
						console.log(txtTd);
						$.post('${shop}/OrderItemServlet', {
							type : 'updateOrderItem',
							pid : pid,
							num : num
						},
								function(total) {
									console.log(txtTd.next().children(".price")
											.text());
									var price = parseFloat(
											txtTd.next().children(".price")
													.text()).toFixed(1);
									txtTd.next().next().children('.price')
											.text(
													parseFloat(price * num)
															.toFixed(1));
									alert(total);
									$("#total").html(total);
									$("#subTotal").html(total);
								}, 'text');
					} else {
						// lang属性值回显
						$(this).val($(this).attr('lang'));
					}
				});
	});
</script>

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
									<li><a href="causes-list.html">Bangla</a></li>
									<li><a href="causes-details.html">Swidesh</a></li>
								</ul></li>
							<li class="dropdown"><a href="" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">USD <span class="fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu xt-lang-dropdown">
									<li><a href="">USD</a></li>
									<li><a href="causes-list.html">EURO</a></li>
									<li><a href="causes-details.html">Riyal</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="user-nav pull-right col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="">My wishlist</a></li>
						<li><a href="">Checkout</a></li>
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
							<a class="navbar-brand" href="index.jsp"><img
								src="assets/images/flogo.png" alt="" class="img-responsive"></a>
						</div>
						<div class="collapse navbar-collapse" id="js-navbar-menu">
							<ul class="nav navbar-nav navbar-right ep-mobile-menu"
								id="navbar-nav">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="shop-page.html">Shop</a></li>
								<li><a href="single-shop.html">Single Product</a></li>
								<li><a href="">About</a></li>
								<li class="dropdown xt-drop-nav"><a href=""
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown"> Gallery <span class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#">Electronics</a></li>
										<li><a href="#">Furniture</a></li>
										<li class="dropdown"><a href="#">Mobile and Tablets</a>
											<ul class="dropdown-menu">
												<li><a href="#">Nokia</a></li>
												<li><a href="#">iPhone</a></li>
												<li class="dropdown"><a href="#">Memory Card</a>
													<ul class="dropdown-menu">
														<li><a href="#">Max</a></li>
														<li><a href="#">Min</a></li>
													</ul></li>
												<li><a href="#">Computer</a></li>
												<li><a href="#">Office furniture</a></li>
											</ul></li>
										<li><a href="#">Land and space</a></li>
										<li><a href="#">Bike and Cars</a></li>
									</ul></li>
								<li><a href="">Blog</a></li>
								<li><a href="contact-us.html">Contact</a></li>
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
							<nav></nav>
						</div>
					</div>
					<div class="col-md-8 col-sm-10 col-xs-12 xt-header-search">
						<div
							class="form-group xt-form search-bar  col-md-8 col-sm-8 col-xs-7 padding-right-o">
							<input type="text" class="form-control"
								placeholder="Search for snippets">
						</div>
						<div
							class="form-group xt-form xt-search-cat col-md-4 col-sm-4 col-xs-5 padding-left-o ">
							<div class="xt-select xt-search-opt">
								<select class="xt-dropdown-search select-beast selectized"
									tabindex="-1" style="display: none;">
									<option value="All Categories" selected="selected">All
										Categories</option>
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
											<li lang="${orderItem.product.id}"><a
												href="${shop}/ProductServlet?type=detail&id=${orderItem.product.id}">
													<img src="${orderItem.product.imgurl}" alt=""
													style="max-width: 80px; max-height: 80px; width: auto; height: auto;">
													<h3>${orderItem.name}</h3> <span class="cart-price">${orderItem.number}
														X $${orderItem.price}</span>
											</a></li>
										</c:forEach>
										<li><a href="#" class="subtotal top-checkout">
												<h3>Subtotal :</h3> <span class="total-price"
												id="dropDownSubTotal">$${sessionScope.order.total}</span>
										</a></li>
										<li><a href="#" class="process top-checkout">
												<h3>Process to Checkout</h3>
										</a></li>
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
        |  MOBILE MENU
        |========================
        -->
	<div class="menu-spacing">
		<div class="container">
			<div class="row">
				<div class="mobile-menu-area visible-xs visible-sm">
					<div class="mobile-menu">
						<nav id="mobile-menu-active" style="display: block;">
							<ul class="main">
								<li><a class="main-a" href="">Shirt</a></li>
								<li><a class="main-a" href="">Pant</a></li>
								<li class="active"><a class="main-a" href="#">Bourkha</a>
									<ul>
										<li><a href="#">Hijab</a></li>
										<li><a href="#">Scarf</a></li>
										<li><a href="#" class="main-a">Shirt</a>
											<ul>
												<li><a href="#">T-Shirt</a></li>
												<li><a href="#">Trousers</a></li>
												<li><a href="#">Jackets &amp; sweater</a></li>
												<li><a href="#">3 Piece</a></li>
											</ul></li>
									</ul></li>
								<li><a class="main-a" href="">Shawl</a></li>
								<li><a class="main-a" href="">Other</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
        |========================
        |   PRODUCT DESCRIPTION
        |========================
        -->
	<section class="xt-xt-single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-3 visible-xs visible-sm padding-right-o"></div>
				<div class="col-md-9 padding-o">
					<div class="xt-product-inner">
						<div class="container">
							<div class="row">
								<div class="col-sm-12 col-md-10 col-md-offset-1">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Product</th>
												<th>Quantity</th>
												<th class="text-center">Price</th>
												<th class="text-center">Total</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${sessionScope.order.itemList}"
												var="orderItem">
												<tr lang="${orderItem.product.id}">
													<td class="col-sm-8 col-md-6">
														<div class="media">
															<a class="thumbnail pull-left" href="#"> <img
																class="media-object" src="${orderItem.product.imgurl}"
																style="max-width: 120px; max-height: 120px;">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	<a href="#">${orderItem.name}</a>
																</h4>
																<span>Status: </span><span class="text-success"><strong>In
																		Stock</strong></span>
															</div>
														</div>
													</td>
													<td class="col-sm-1 col-md-1" style="text-align: center">
														<input type="text" class="inputNumber"
														value="${orderItem.number}">
													</td>
													<td class="col-sm-1 col-md-1 text-center">$<strong
														class="price">${orderItem.price}</strong></td>
													<td class="col-sm-1 col-md-1 text-center">$<strong
														class="price">${orderItem.price*orderItem.number}</strong></td>
													<td class="col-sm-1 col-md-1">
														<button type="button" class="btn btn-danger">
															<span class="glyphicon glyphicon-remove"></span> Remove
														</button>
													</td>
												</tr>
											</c:forEach>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>
													<h5>Subtotal</h5>
												</td>
												<td class="text-right">
													<h5>
														<strong id="subTotal">$${sessionScope.order.total}</strong>
													</h5>
												</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>
													<h3>Total</h3>
												</td>
												<td class="text-right">
													<h3>
														<strong id="total">$${sessionScope.order.total}</strong>
													</h3>
												</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>
													<button type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-shopping-cart"></span>
														Continue Shopping
													</button>
												</td>
												<td>
													<button type="button" class="btn btn-success">
														Checkout <span class="glyphicon glyphicon-play"></span>
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="clearfix"></div>
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
							<img src="assets/images/flogo.png" alt="" class="img-responsive">
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
								<li><a href="#"><i class="fa fa-caret-right"></i>Checkout</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="footer-widget">
							<h4>Custom Service</h4>
							<ul>
								<li><a href=""><i class="fa fa-caret-right"></i>Shopping
										&amp; return</a></li>
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
	<!-- jquery -->
	<script src="assets/plugins/js/jquery-1.11.3.min.js"></script>
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
	<script src="assets/plugins/js/bootstrap-dropdownhover.min.js"></script>
	<!--jquery-ui.min-->
	<script src="assets/plugins/js/jquery-ui.min.js"></script>
	<!--validator -->
	<script src="assets/plugins/js/validator.min.js"></script>
	<!--smooth scroll-->
	<script src="assets/plugins/js/smooth-scroll.js"></script>
	<!-- Fancybox js-->
	<script src="assets/plugins/js/jquery.fancybox.min.js"></script>
	<!-- selectize -->
	<script src="assets/plugins/js/standalone/selectize.js"></script>
	<!-- init -->
	<script src="assets/js/init.js"></script>
	<div class="selectize-dropdown single xt-dropdown-search select-beast"
		style="display: none;">
		<div class="selectize-dropdown-content"></div>
	</div>
</body>

</html>