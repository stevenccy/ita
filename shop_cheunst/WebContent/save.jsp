<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>添加商品</title>
<%@include file="/public.jspf"%>
</head>
<body>
	<!-- 
	    get與post的區別: 
	       1: get不能夠提交多媒體數據(聲音、圖像、視頻)
	       2: get提交的數據會通過url,此方式不安全
	       3： post是通過form表單提交的數據,比較安全
	    Web開發常見的三種訪問錯誤：
	       1： 无法访问此网站   說明tomcat未啟動,或者訪問port錯誤
	       2: 404 說明tomcat可以正常訪問,但是url地址不正確
	       3: 500 tomcat已啟動,且url地址正確,但是在解析java代碼時出錯,我們應該查找出錯代碼行數
	           可以采用两种方式获取类别数据:
	       1: 頁面加載完畢的時候發送ajax請求,從服務器獲取數據,返回JSON
	       2: 如果數據不經常更新,就應該在啟動的時候獲取數據,然後存儲在全局變量中   
	 -->
	<%
	   out.println(application);
	%>
	<div class="container" style="margin-top: 10px">
		<form class="form-horizontal" action="${shop}/ProductServlet"
			method="post">

			<div class="form-group">
				<label class="col-sm-2 control-label">商品名:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="name"
						placeholder="请输入商品名">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">价格:</label>
				<div class="col-sm-2">
					<input type="number" class="form-control" name="price" step="0.01"
						placeholder="请输入价格">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">图片:</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" name="imgUrl">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">所属类别:</label>
				<div class="col-sm-3">
					<select class="form-control" name="cid">
						<c:forEach items="${applicationScope.catList}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">商品备注:</label>
				<div class="col-sm-5">
					<textarea rows="5" class="form-control" name="remark"></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">添加商品</button>
					<input type="hidden" name="type" value="save" />
				</div>
			</div>
		</form>
	</div>



</body>
</html>




