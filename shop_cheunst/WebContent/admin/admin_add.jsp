<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Page</title>
<%@include file="/WEB-INF/public.jspf"%>
<script src="${shop}/assets/plugins/js/image-picker-min.js"></script>
<script src="${shop}/assets/plugins/js/masonry.pkgd.min.js"></script>
<script src="${shop}/assets/plugins/js/imagesloaded.pkgd.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<link href="${shop}/css/admin_style.css" rel="stylesheet">
<script type="text/javascript">
	function getImage(obj) {
		console.log(obj);
		//$("#selectImages").imagespicker({
		//	hide_select : true
		//});
		if (obj.value) {
			$.ajax({
				url : "${shop}/ImageController/search.mvc",
				type : "GET",
				data : {
					searchTerm : obj.value
				},
				dataType : "json",
				success : function(data) {
					console.log(data.jsonResponse);
					var selectImages = $('#selectImages');
					var result = JSON.parse(data.jsonResponse);
					console.log(result);
					for (var i = 0; i < 5; i++) {
						selectImages.append('<option data-img-src="'
								+ result.value[i].contentUrl + '"value="'
								+ result.value[i].contentUrl + '"'
								+ result.value[i].contentUrl + '</option>');
					}
					selectImages.imagepicker();
					var $container = $('.image_picker_selector');
					$container.imagesLoaded(function() {
						$container.masonry({
							columnWidth : 30,
							itemSelector : '.thumbnail'
						});
					});
				}
			});
		}
	}
</script>

</head>

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
						<li class="active"><a href="#"><i class="fa fa-tasks"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Add
									Item</span></a></li>
						<li><a href="${shop}/admin/admin_query.jsp"><i
								class="fa fa-tasks" aria-hidden="true"></i><span
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
					<h1>Add Item</h1>
					<h3>Welcome ${user.user_name}.</h3>
					<div class="container" style="margin-top: 10px">
						<form class="form-horizontal"
							action="${shop}/ProductController/save.mvc" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label class="col-sm-2 control-label">Name:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="name"
										placeholder="Please enter the product name."
										onblur="getImage(this)">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Price:</label>
								<div class="col-sm-4">
									<input type="number" class="form-control" name="price"
										step="0.01" placeholder="Please enter the price.">
								</div>
							</div>
							<select id="selectImages" class="image-picker" name="imgurl">
							</select>

							<div id="selectImages"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Photo:</label>
								<div class="col-sm-4">
									<input type="file" class="form-control" name="file">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Category:</label>
								<div class="col-sm-4">
									<select class="form-control" name="category.id">
										<c:forEach items="${applicationScope.catList}" var="category">
											<option value="${category.id}">${category.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Remarks:</label>
								<div class="col-sm-4">
									<textarea rows="5" class="form-control" name="remark"></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="add-project">Add Product</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>