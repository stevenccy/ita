<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>添加商品</title>
</head>
<body>
	<!-- action:指定提交到服務器的地址 -->
	<!-- 
	get与post的区别：
	1： get 
	2：
	 -->
	<form action="/shop/ProductServlet" method="get">
		<div class="form-group">
			商品名： <input type="text" class="form-control" name="name"
				value="${requestScope.product.name}" /><br /> 價格：<input type="text"
				class="form-control" name="price"
				value="${requestScope.product.price}" /><br /> 備註：<input
				type="text" class="form-control" name="remark"
				value="${requestScope.product.remark}" /><br />
			<button type="submit" class="btn btn-primary">提交</button>
			<input type="hidden" name="type" value="update" /> <input
				type="hidden" name="id" value="${requestScope.product.id}" />
		</div>
	</form>
</body>
</html>