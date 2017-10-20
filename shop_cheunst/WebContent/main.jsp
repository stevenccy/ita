<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>電商首頁</title>
<%@ include file="public.jspf"%>
</head>
<body>
	<table width="700" border="1">
		<!-- 此處是大循環用來獲取商品的集合 -->
		<c:forEach items="${applicationScope.bigList}" var="proList">
		<tr>
			<td colspan="4">${proList[0].category.name}</td>
		</tr>
		<tr>
			<!-- 此處小循環,用來顯示每個商品的信息 -->
			<c:forEach items="${proList}" var="product">
			<td>
				<div>
					<img src="${shop}/img/HK.png" />
				</div>
				<div>${product.name}</div>
				<div>${product.price}</div>
			</td>
			</c:forEach>
			<!-- 小循環結束 -->
		</tr>
		<!-- 大循環結束 -->
		</c:forEach>
	</table>
</body>
</html>




