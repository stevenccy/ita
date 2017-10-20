<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/public.jspf"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Admin Login</title>
</head>

<!-- 
	Create bootstrap UI
	redirect to UserServlet's doPost method
	User servlet ==> UserService ==> UserDaoImpl.login(User user)
	If login successfully, data return to user servlet and save the user object to session 
 -->
<body>
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Admin Tools</h1>
			<h6 align="center">Login to Your Account</h6>
			<br>
			<form action="${shop}/UserServlet" method="post">
				<input type="text" name="user_name" placeholder="Username">
				<input type="password" name="password" placeholder="Password">
				<input type="hidden" name="role" value="admin" /> <input
					type="submit" name="login" class="login loginmodal-submit"
					value="Login">
			</form>
		</div>
	</div>
	<!-- 
		<a href="${pageContext.request.contextPath}/admin/admin.jsp">Enter
		Admin</a>
	 -->


</body>

</html>