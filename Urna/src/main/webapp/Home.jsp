<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="Autorizacao.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The meeting</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body data-bs-theme="dark">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
     
  <div class="container-fluid">
  <a class="navbar-brand" 

  href="UsuarioUpdate?usuarioId=<%= session.getAttribute("id") %>"> <small>Ola</small> <%= session.getAttribute("nome") %></a>


    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse justify-content-center" id="navbarCenteredExample" >
      <!-- Left links -->
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="navbar-brand" aria-current="page" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="navbar-brand" aria-current="page" href="ReuniaoDto">Criar</a>
        </li>

        <li class="nav-item">
          <a class="navbar-brand" aria-current="page" href="ReuniaoLista">Listar</a>
        </li>
      </ul>
      <!-- Left links -->
    </div>
    <a class="nav-link active" aria-current="page" href="LogoutUsuario">Logout</a>
  </div>
  <!-- Container wrapper -->
</nav>

<header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">The meeting</h1>
                                <p class="lead fw-normal text-white-50 mb-4">Comece a criar suas reuniões, adicione seus topicos de discussão, prepare seu local e adicione seus participantes</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="ReuniaoDto">Criar</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                        <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">"Projeto pratico construido para a obtenção de nota parcial na material de programação III, sob a orientação do professor Ronaldo Ferreira, aplicando conhecimentos das aulas, como Java com auxilio de Servlet e JSP para as regras de negocio, SQL com MySQL Workbench para a base de dados e Bootstrap para a criação de templemtes e elementos visuais  "</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    
                                    <div class="fw-bold">
                                    Carlos Eduardo
                                        
                                        <span class="fw-bold mx-1">/</span>
                                        Gabriel Rodrigues 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Tecnologias utilizadas no projeto</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">Java/Servlet</h2>
                                    <p class="mb-0">Java Servlet é uma tecnologia que permite criar aplicativos web dinâmicos em Java. Ele é uma classe Java que estende as funcionalidades de um servidor web para processar requisições HTTP, gerar respostas e fornecer serviços web.</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">JSP</h2>
                                    <p class="mb-0">JSP (JavaServer Pages) é uma tecnologia de programação web que permite a criação de páginas dinâmicas usando Java como linguagem de programação.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">SQL / Mysql</h2>
                                    <p class="mb-0">SQL (Structured Query Language) é uma linguagem de programação utilizada para gerenciar e manipular bancos de dados relacionais. O MySQL é um sistema de gerenciamento de banco de dados (SGBD) baseado em SQL.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Bootstrap</h2>
                                    <p class="mb-0">
Bootstrap é um framework de desenvolvimento front-end que fornece um conjunto de componentes e estilos pré-construídos, facilitando a criação de interfaces responsivas e visualmente atraentes para sites e aplicativos. Ele usa HTML, CSS e JavaScript para ajudar os desenvolvedores a criar layouts responsivos e otimizados.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
           
            
  <footer class="absolute py-4 bg-dark text-white-50">
    <div class="container text-center">
      <small>Copyright &copy; UEG - Posse</small>
    </div>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>