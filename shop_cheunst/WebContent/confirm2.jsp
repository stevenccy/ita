<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
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
			$.get('${shop}/OrderItemController/removeOrderItem.mvc', {
				id : pid
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
						$.post('${shop}/OrderItemController/updateItemNum.mvc',
								{
									pid : pid,
									num : num
								}, function(total) {
									console.log(txtTd.next().children(".price")
											.text());
									var price = parseFloat(
											txtTd.next().children(".price")
													.text()).toFixed(1);
									txtTd.next().next().children('.price')
											.text(
													parseFloat(price * num)
															.toFixed(1));
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
	</header>
	<!--
        |========================
        |   PRODUCT DESCRIPTION
        |========================
        -->
	<div class="section_container">
		<!-- 确认订单信息 -->
		<div class="check-stup">
			<!-- 商品确认 -->
			<div class="pro-check check ">
				<h1>Confirm the order detail</h1>
				<table class="data-table cart-table" cellpadding="0" cellspacing="0">
					<tr>
						<th class="align_center" width="10%">Product ID</th>
						<th class="align_left" width="25%">Product Image</th>
						<th class="align_left" width="10%">Name</th>
						<th class="align_center" width="10%">Price</th>
						<th class="align_center" width="20%">Quantity</th>
						<th class="align_center" width="15%">Sum</th>
					</tr>
					<c:forEach items="${sessionScope.order.itemList}" var="orderItem">
						<tr>
							<td class="align_center"><a href="#" class="edit">${orderItem.product.id}</a>
							</td>
							<td width="80px">
							<div style="minwidth=50px; maxwidth=50px; minheight=70px;maxheight=70px	"><img src="${shop}/assets/images/${orderItem.product.imgurl }" /></div></td>
							<td class="align_left"><a class="pr_name" href="#">${orderItem.name}</a>
							</td>
							<td class="align_center vline">￥${orderItem.price}</td>
							<td class="align_center vline">${orderItem.number}</td>
							<td class="align_center vline">￥${orderItem.price*orderItem.number}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="sum">
					<div class="fr">
						<span>SUM：</span><b>￥${sessionScope.order.total}</b>
					</div>
				</div>
			</div>
			<!-- 订购人确认 (订单与订单项级联入库)-->
			<form action="${shop}/OrderController/save.mvc" method="post">
				<div class="person-check check">
					<h1>Order Person</h1>
					<div class="person-checkinner">
						<div>
							<label style="width: 120px">Shipper Name:</label> <input
								type="text" name="name" />
						</div>
						<div>
							<label style="width: 120px">Mobile Phone:</label> <input
								type="text" name="phone" />
						</div>
						<div>
							<label style="width: 120px">Postal Code:</label> <input
								type="text" name="post" />
						</div>
						<div>
							<label style="width: 120px">Address:</label> <input type="text"
								name="address" />
						</div>
					</div>
				</div>
				<!-- 卖家留言 -->
				<div class="person-check check">
					<h1>Remarks</h1>
					<textarea style="margin: 5px;" name="remark" cols="120" rows="2">You are welcome to leave us a message.</textarea>
					<div class="submit">
						<input type="submit" class="sub-logo fr"
							style="margin: 0px; padding: 0px; border: 0px;"
							value="Confirm Purchase" />
					</div>
				</div>
			</form>
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
					<div class="col-md-6 col-sm-6"></div>
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