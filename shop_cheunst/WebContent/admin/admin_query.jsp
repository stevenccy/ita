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
	<c:out value="${user}" />
	<c:out value="${sessionScope}" />

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
						<li><a href="${shop}/admin/admin_add.jsp"><i class="fa fa-tasks"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Add
									Item</span></a></li>
						<li class="active"><a href="#"><i class="fa fa-tasks" aria-hidden="true"></i><span
								class="hidden-xs hidden-sm">Query Product</span></a></li>
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
													<span>"${user.name}"</span>
													<p class="text-muted small">me@jskrishna.com</p>
													<div class="divider"></div>
													<a href="#" class="view btn-sm active">View Profile</a>
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
						<form class="" action="${shop}/ProductServlet" method="get">
						<div class="form-group"style:margin:"20px 0px">
							<input class="flipkart-navbar-input col-xs-11" type="text"
								placeholder="Search for Products, Brands and more"
								name="keyword" value="${sessionScope.keyword}"> <input
								type="hidden" name="type" value="query" /> <input type="hidden"
								name="currentPage" value="1" />
						</div>
						<button class="flipkart-navbar-button col-xs-1">
							<svg width="15px" height="15px">
                            <path
									d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
                        </svg>
						</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty requestScope.proList}">
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Type</th>
			<th>Remarks</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${requestScope.proList}" var="product"
			varStatus="num">
			<tr>
				<td>${num.count}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.category.name}</td>
				<td>${product.remark}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${product.pdate}" /></td>
				<td><a
					href="/${shop}/ProductServlet?type=getById&id=${product.id}">update</a>|<a
					href="/${shop}/ProductServlet?type=delete&id=${product.id}">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<nav aria-label="Page navigation" style:text-align:centre>
		<ul class="pagination">
			<li
				<c:if test="${pageMap.currentPage==1}">
                class="disabled"
</c:if>>
				<a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a>
			</li>
			<c:forEach begin="1" end="${pageMap.pageCount}" var="num">
				<li
					<c:if test="${pageMap.currentPage==num}">
        class="active"
        </c:if>><a
					href="${shop}/ProductServlet?type=query&currentPage=${num}">${num}</a></li>
			</c:forEach>
			<li
				<c:if test="${pageMap.currentPage==pageMap.pageCount}">
    class="disabled"
    </c:if>>
				<a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a>
			</li>
		</ul>
	</nav>
</c:if>
</body>
</html>