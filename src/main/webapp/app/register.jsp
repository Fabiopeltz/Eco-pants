<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String status = (String) request.getAttribute("status");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Sign Up</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
     <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Link do icon-->
    <link rel="shortcut icon" href="/assets/img/logo.jpg">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<!-- Link do icon-->
    <link rel="shortcut icon" href="assets/img/logo.jpg">
</head>
<style>
	body {
		height: 100vh;
		width: 100vw;
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
    color:#272828;
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
    background:#383d40;
    border:none;
    border-radius:4px;
    padding:11px;
    box-shadow:none;
    margin-top:26px;
    text-shadow:none;
    outline:none;
  }
  
  .login-dark form .btn-primary:hover, .login-dark form .btn-primary:active {
    background:#272828;
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
	<div class="login-dark">
        <form method="post" name="frmProduct" action="insertUser" method="post" id="frmProduct">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="name" placeholder="Name" required></div>
            <div class="form-group"><input class="form-control" type="text" name="lastname" placeholder="Last name" required></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email" required></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" required></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" value="Submit" form="frmProduct">Sign Up</button></div>
			<%
				if(status != null) {
			%>
				<span><%= status %></span>
			<%
				}
			%>
            <a href="login_page" class="forgot">Already have an account? Sign in'</a>
		</form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <!-- Rodape-->
     <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy;Eco Pants 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="https://www.twitter.com" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.linkedin.com" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
          	      </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" href="app/about.jsp">Politicas de Privacidade</a>
                   <a class="link-dark text-decoration-none" href="app/about.jsp">Condições de Uso</a>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
    <script src="js/index.js" async></script>
</body>
</html>