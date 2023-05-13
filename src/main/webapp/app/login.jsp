<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="model.User"%>
<% 
	@SuppressWarnings ("unchecked")
	String status = (String) request.getAttribute("status");

	User user = (User) session.getAttribute("user");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Link do icon-->
    <link rel="shortcut icon" href="assets/img/logo.jpg">
</head>
<style>
	body {
		height: 100vh;
		widht: 100vw;
		background-color:#F8F9FA;
	}
	
	.login-dark {
    height:1000px;
    background-size:cover;
    background-color:#F8F9FA;
  }
  
  .login-dark form {
    max-width:320px;
    width:90%;
    /*background-color:#F8F9FA;*/
    padding:40px;
    border-radius:4px;
    transform:translate(-50%, -50%);
    position:absolute;
    top:50%;
    left:50%;
    box-shadow:3px 3px 4px rgba(0,0,0,0.2);
  }
  
  .login-dark .illustration {
    text-align:center;
    padding:15px 0 20px;
    font-size:100px;
    color:#2980ef;
  }
  
  .login-dark form .form-control {
    background:none;
    border:none;
    border-bottom:1px solid #434a52;
    border-radius:0;
    box-shadow:none;
    outline:none;
    color:inherit;
  }
  
  .login-dark form .btn-primary {
    background:#214a80;
    border:none;
    border-radius:4px;
    padding:11px;
    box-shadow:none;
    margin-top:26px;
    text-shadow:none;
    outline:none;
  }
  
  .login-dark form .btn-primary:hover, .login-dark form .btn-primary:active {
    background:#214a80;
    outline:none;
  }
  
  .login-dark form .forgot {
    display:block;
    text-align:center;
    font-size:12px;
    color:#6f7a85;
    opacity:0.9;
    text-decoration:none;
  }
  
  .login-dark form .forgot:hover, .login-dark form .forgot:active {
    opacity:1;
    text-decoration:none;
  }
  
  .login-dark form .btn-primary:active {
    transform:translateY(1px);
  }
</style>
<body>
<!--  
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
		<h2>User: <%= user.getId()%></h2>
	<%
		}
	%>
	-->
	<div class="login-dark">
        <form method="post" name="frmProduct" action="authenticateUser" method="post" id="frmProduct">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" value="Submit" form="frmProduct">Log In</button></div>
            <%
				if(status != null) {
			%>
				<span><%= status %></span>
			<%
				}
			%>
            <a href="register_page" class="forgot">New here? Sign up</a>
		</form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>