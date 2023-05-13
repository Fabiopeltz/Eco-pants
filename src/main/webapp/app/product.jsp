<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User"%>
<%@ page import ="model.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.nio.file.Paths"%>
<%@ page import="java.nio.file.Files"%>
<%
	User user = (User) session.getAttribute("user");

	@SuppressWarnings ("unchecked")
	ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
	
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produtos</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/img/logo.jpg" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS -->
    <link rel="stylesheet" href="/css/product.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <!-- nav bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
          <a class="navbar-brand" href="home">Eco Pants</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item active">
                <a class="nav-link" href="home">Inicial</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about">Sobre nós</a>
              </li>
              <%
              	if (user != null) {
              %>
              <li class="nav-item">
                <a class="nav-link" href="#"><%= user.getName() %></a>
              </li>
              <li class="nav-item">
                	<a href="logout" class="btn btn-outline-dark">Logout</a>
              </li>
              <%
              	} else {
              %>
              <li class="nav-item">
                	<a href="login_page" class="btn btn-outline-dark">Login</a>
              </li>
              <%
              	}
              %>
               <!--<li class="nav-item">
            <a class="nav-link" href="./shopping-cart.html">Shopping Cart</a>
          </li> -->
              
            </ul>
          </div>
        </div>
      </nav>
      
    <div class="container mt-5 mb-2">
        <div class="row d-flex justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="images p-3">
                                <div class="text-center p-4 product-img">
                                	<img id="main-image" src="<% out.print(request.getAttribute("img")); %>" width="250"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product p-4">
                                <div class="mt-4 mb-3"> <span class="text-uppercase text-muted brand">eco pants world</span>
                                    <h5 class="text-uppercase product-name"><%out.print(request.getAttribute("name"));%></h5>
                                    <div class="price d-flex flex-row align-items-center"> 
                                        <span class="act-price product-price">$<%out.print(request.getAttribute("price"));%></span>
                                    </div>
                                </div>
                                <p class="about product-desc"><%out.print(request.getAttribute("description"));%></p>
                                <div class="sizes mt-5">
                                    <h6 class="text-uppercase">Size</h6> <label class="radio"> <input type="radio" name="size" value="S" checked> <span>S</span> </label> <label class="radio"> <input type="radio" name="size" value="M"> <span>M</span> </label> <label class="radio"> <input type="radio" name="size" value="L"> <span>L</span> </label> <label class="radio"> <input type="radio" name="size" value="XL"> <span>XL</span> </label> <label class="radio"> <input type="radio" name="size" value="XXL"> <span>XXL</span> </label>
                                </div>
                                <div class=".d-grid gap-2 col-6 mx-auto btn-act-container ">
                                    <button type="button" class="btn btn-outline-dark m-3 btn-act">Comprar</button>
                                    <button type="button" class="btn btn-outline-dark btn-act add-to-cart">Adicionar ao carrinho</button>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- seÃ§ao prdutos-->
    <section class="py-5">
        <div class="container px-4 px-lg-5">
            <div class="text-start section-h2 mb-5">
                <h2 class="section-heading text-uppercase">Produtos Relacionados</h2>
            </div>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center section-products">
                 <%
                	for (Product p : products) {
                %>
	                <div class="col mb-5">
	                    <div class="card h-100">
	                        <!-- Product image-->
	                        <img class="card-img-top" src="<% out.println(p.getImg()); %>" alt="..." />
	                        <!-- Product details-->
	                        <div class="card-body p-4">
	                            <div class="text-center">
	                                <!-- Product name-->
	                                <h5 class="fw-bolder"><%= p.getName() %></h5>
	                                <!-- Product price-->
	                                R$<%= p.getPrice() %>
	                            </div>
	                        </div>
	                        <!-- Product actions-->
	                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                            <div class="text-center"><a class="btn btn-outline-dark mt-auto btn-show-product" href="view_product?id=<%=p.getId()%>">Ver Produto</a></div>
	                        </div>
	                    </div>
	                </div>
                <%
                	}
				%>
            </div>
        </div>
    </section>
    <!-- rodape-->
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy; Eco Pants World 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="https://www.twitter.com" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.linkedin.com" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" href="about.html">PolÃ­tica de Privacidade</a>
                    <a class="link-dark text-decoration-none" href="about.html">CondiÃ§Ãµes de Uso</a>
                </div>
            </div>
        </div>
    </footer>
    <script src="../js/product.js" async></script>
</body>
</html>
