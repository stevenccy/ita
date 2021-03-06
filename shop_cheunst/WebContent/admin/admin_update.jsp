<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Page</title>
<%@include file="/WEB-INF/public.jspf"%>
</head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<link href="${shop}/css/admin_style.css" rel="stylesheet">
<body class="home">
	<div class="container-fluid display-table">
		<div class="row display-table-row">
			<div
				class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box"
				id="navigation">
				<div class="logo">
					<a hef="home.html"><img src="${shop}/assets/images/flogo.png"
						alt="Shop X" class="hidden-xs hidden-sm"> <img
						src="${shop}/assets/images/flogo.png" alt="Shop X"
						class="visible-xs visible-sm circle-logo"> </a>
				</div>
				<div class="navi">
					<ul>
						<li><a href="${shop}/admin/admin_add.jsp"><i
								class="fa fa-tasks" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm">Add Item</span></a></li>
						<li class="active"><a href="#"><i class="fa fa-tasks"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Query
									Product</span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>
						<li><a href="#"><i class="fa" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm"></span></a></li>

						<!-- 
                        <li><a href="#"><i class="fa fa-tasks" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Workflow</span></a></li>
                        <li><a href="#"><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Statistics</span></a></li>
                        <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Calender</span></a></li>
                        <li><a href="#"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Users</span></a></li>
                        <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Setting</span></a></li>
                         -->
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-11 display-table-cell v-align">
				<!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
				<div class="row">
					<header>
						<div class="col-md-7">
							<nav class="navbar-default pull-left">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="offcanvas" data-target="#side-menu"
										aria-expanded="false">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
							</nav>
							<div class="search hidden-xs hidden-sm">
								<h1>Admin Tools</h1>
							</div>
						</div>
						<div class="col-md-5">
							<div class="header-rightside">
								<ul class="list-inline header-top pull-right">

									<!-- <li class="hidden-xs"><a href="#" class="add-project"
										data-toggle="modal" data-target="#add_project">Add Project</a></li>									
									<li><a href="#"><i class="fa fa-envelope"
											aria-hidden="true"></i></a></li>
									<li><a href="#" class="icon-info"> <i
											class="fa fa-bell" aria-hidden="true"></i> <span
											class="label label-primary">3</span>
									</a></li>
									 -->

									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><img
											src="${shop}/assets/images/emoji.jpg" alt="user"> <b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li>
												<div class="navbar-content">
													<span>User: ${user.user_name}</span></br> <span>Role:
														${user.role}</span>
												</div>
											</li>
										</ul></li>
								</ul>
							</div>
						</div>
					</header>
				</div>
				<div class="user-dashboard">
					<div class="container" style="margin-top: 10px">
						<form action="/shop/ProductController/update.mvc" method="get">
							<div class="form-group">
								商品名： <input type="text" class="form-control" name="name"
									value="${requestScope.product.name}" /><br /> 價格：<input
									type="text" class="form-control" name="price"
									value="${requestScope.product.price}" /><br /> 備註：<input
									type="text" class="form-control" name="remark"
									value="${requestScope.product.remark}" /><br /> Category: <select
									class="form-control" name="category.id" value="${requestScope.product.category.id}">
									<c:forEach items="${applicationScope.catList}" var="category">
										<option value="${category.id}" ${category.id == requestScope.product.category.id ? 'selected' : ''}>${category.name}</option>
									</c:forEach>
								</select> <br />
								<br>

								<button type="submit" class="add-project">提交</button>
								<input type="hidden" name="id"
									value="${requestScope.product.id}" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>