<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	@SuppressWarnings ("unchecked")
	String status = (String) request.getAttribute("status");

	String user = (String) session.getAttribute("user");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
</head>
<body>
	<h1>Register:</h1>
	<form name="frmProduct" action="insertUser" method="post" id="frmProduct">
		<input type="text" name="name" placeholder="name">
		<input type="text" name="lastname" placeholder="lastname">
		<input type="text" name="email" placeholder="email">
		<input type="password" name="password" placeholder="password">
	
		<button type="submit" value="Submit" form="frmProduct">Register</button>
	</form>
	</br>
	<h1>Login:</h1>
	<form name="frmProduct2" action="authenticateUser" method="post" id="frmProduct2">
		<input type="text" name="email" placeholder="email">
		<input type="password" name="password" placeholder="password">
	
		<button type="submit" value="Submit" form="frmProduct2">Login</button>
	</form>
	</br>
	<%
		if(status != null) {
	%>
		<h2>Status: <%= status %></h1>
	<%
		}
	%>
	
	<%
		if(user != null) {
	%>
		<h2>User: <%= user%></h2>
	<%
		}
	%>
</body>
</html>