<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.User"%>
<%
	User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sobre</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/img/logo.jpg" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/about.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&family=Montserrat&display=swap');
    </style>
    <!-- Favicons -->
    <!-- <link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico"> -->
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

  <section id="aboutUs">
    <div class="container">
      <div class="container-left">
        <div class="top">
        <br>
        <h1>Sobre nós</h1><br>
          <p>A World Eco Pants é uma marca que nasceu em 2022 com o desejo de unir moda a ideias de sustentabilidade, assim desenvolvendo produtos feitos através de materiais ecologicamente corretos. </p>
            <p>A marca não busca apenas ter algumas linhas de produtos ecologicamente corretos, mas sim todas as peças produzidas pela empresa, ou seja, ecolha por inteiro, trazendo aos nossos clientes toda a qualidade dos produtos juntamente com uma grande preocupação com o meio ambiente.</p>
            <p>Ser ecologico está em nosso DNA, mas fazer diferente não é tarefa fácil, por conta da escassez de matéria-prima, tendo em vista que os processos produtivos de roupas sustentaveis ainda são relativamente novos. Buscamos trazer o conceito ecológico para toda nossa marca e empresa.</p>
        </div>
        <div class="bottom">
          <div class="content">
            <div class="left">
             
            </div>
            <div class="right">
              <div class="top">
              </div>
              <div class="bottom">
              
              </div>
            </div>
          </div>

          <div class="content">
            <div class="left">
             
            </div>
            <div class="right">
              <div class="top">
              </div>
              <div class="bottom">
                
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container-right">
      </div>
    </div>
  </section>

  <div class="container-line">
    <div class="line"></div>
  </div>
<!-- as 3 bolas estao aqui-->
 <!--  <section id="services">
    <div class="header">
      <h1>ServiÃ§os</h1>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore ullam ipsam reiciendis fugit voluptates impedit!</p>
    </div>
    <div class="content">
      <div class="box">
        <div class="left">
          <div class="icon"></div>
        </div>
        <div class="right">
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste illum reiciendis dignissimos quos incidunt? Accusantium nostrum aperiam nam molestias aliquid.</p>
        </div>
      </div>
      <div class="box">
        <div class="left">
          <div class="icon"></div>
        </div>
        <div class="right">
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste illum reiciendis dignissimos quos incidunt? Accusantium nostrum aperiam nam molestias aliquid.</p>
        </div>
      </div>
      <div class="box">
        <div class="left">
          <div class="icon"></div>
        </div>
        <div class="right">
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste illum reiciendis dignissimos quos incidunt? Accusantium nostrum aperiam nam molestias aliquid.</p>
        </div>
      </div>
    </div>
  </section> 

  <div class="container-line"> -->

    <div class="line"></div>
  </div>

  <section id="contactUs">
    <div class="header">
      <h1>Entre em Contato</h1>
      <!-- <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Perferendis corrupti id tenetur in necessitatibus ducimus?</p> -->
    </div>
      <form action="" id="contactForm">
        
        <div class="col">
          <label for="name">Nome:</label>
        <input type="text" id="name" placeholder="Nome">
        </div>

        <div class="col">
          <label for="email">Email:</label>
          <input type="email" id="email" placeholder="Email">
        </div>

        <div class="col">
          <label for="message">Mensagem:</label>
          <textarea name="message" id="message" cols="30" rows="10" placeholder="Mensagem"></textarea>
        </div>

        <button type="submit">Enviar</button>
      </form>
  </section>
  <!-- Footer-->
  <footer class="footer py-4">
      <div class="container">
          <div class="row align-items-center">
              <div class="col-lg-4 text-lg-start">Copyright &copy;Eco pants</div>
              <div class="col-lg-4 my-3 my-lg-0">
                  <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
              </div>
              <div class="col-lg-4 text-lg-end">
                  <a class="link-dark text-decoration-none me-3" href="#!">Politica de privacidade</a>
                  <a class="link-dark text-decoration-none" href="#!">Termos de uso</a>
              </div>
          </div>
      </div>
  </footer> 
  <script src="/js/about.js"></script>
</body>
</html>