<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>電商首頁</title>
<%@ include file="WEB-INF/public.jspf"%>

</head>
<body>
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

			<div class="login-help">
				<a href="#">Register</a> - <a href="#">Forgot Password</a>
			</div>
		</div>
	</div>
</body>
</html>




