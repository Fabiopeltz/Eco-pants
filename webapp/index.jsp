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
	
	for(Product p : products) {
		System.out.println(p.getName());
	}
	
	String path = (String) request.getServletContext().getRealPath("/");
	System.out.println(path);
	
%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EcoPants</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Link do icon-->
    <link rel="shortcut icon" href="/assets/img/logo.jpg">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS -->
    <link rel="stylesheet" href="/css/style.css">
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
                <a class="nav-link" href="#">Inicial</a>
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
                	<a href="logout" class="nav-link">Logout</a>
              </li>
              <%
              	} else {
              %>
              <li class="nav-item">
                	<a href="login_page" class="nav-link">Login</a>
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
      
    <!-- header -->
    <header>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100 img-fluid" src="/assets/img/felipe-galvan-AhfrA5VQNpM-unsplash.jpg">
              <div class="carousel-caption d-none d-md-block">
                <h5>A Eco Pants Tem</h5>
                <p>Conforto</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100 img-fluid" src="/assets/img/keagan-henman-Won79_9oUEk-unsplash.jpg">
              <div class="carousel-caption d-none d-md-block ">
                <h5>A Eco Pants Tem</h5>
                <p>Custo beneficio</p>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100 img-fluid" src="/assets/img/lan-deng-quddu_dZKkQ-unsplash.jpg">
              <div class="carousel-caption d-none d-md-block">
                <h5>A Eco Pants Tem</h5>
                <p> Durabilidade</p>
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </header>
       <!-- SeÃ§ao produtos-->
       <section class="py-5  ">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="text-start section-h2">
                <h2 class="section-heading text-uppercase">OFERTAS</h2>
                
                
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
     
     <!-- ServiÃ§os-->
     <section class="page-section" id="services">
        <div class="container">
            <div class="text-center section-h2">
                <h2 class="section-heading text-uppercase">Serviços</h2>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3"> Produtos </h4>
                    
                    
                    <p class="text-muted">A World eco pants espera o melhor tipo de experiência, conforto e durabilidade de nossos produtos para o cliente. </p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3"> Nosso Site</h4>
                    <p class="text-muted">Esperamos que o nosso site tenha agradado todo o tipo de cliente e que fique de fácil acesso para a sua compra.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3"> Segurança </h4>
                    <p class="text-muted">A Eco Pants World garantia 
                     que seus dados estarão seguros.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Secao produtos-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="text-start section-h2">
                <h2 class="section-heading text-uppercase">Produtos</h2>
            </div>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center section-all-products">
                
                
                
            </div>
            </div>
        </div>
    </section>
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
