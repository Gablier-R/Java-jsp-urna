<%@page import="dao.UsuarioDao"%>
<%@page import="model.Usuario"%>
<%@page import="model.Reuniao"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReuniaoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Autorizacao.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criar reunião</title>
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
          <a class="navbar-brand" aria-current="page" href="ListaReuniao.jsp">Listar</a>
        </li>
      </ul>
      <!-- Left links -->
    </div>
    <a class="nav-link active" aria-current="page" href="LogoutUsuario">Logout</a>
  </div>
  <!-- Container wrapper -->
</nav>

             
             <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Aqui voce pode ver, todas as listas de reuniões</h2></div>
                        <div class="col-lg-8">
                        
                            <div class="row gx-5 row-cols-1 row-cols-md-flex">
                            
                            <%
                            List<Reuniao> dao = ReuniaoDao.listaTodos();
                            
                            for(Reuniao reuniao: dao){
                   	
                            %>
                            
                            <div class="accordion mb-5">
                                <div class=" accordion-item">
                                    <h3 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" 
                                    data-bs-toggle="collapse" 
                                    data-bs-target="#collapseTwo<%=reuniao.getIdReuniao() %>" aria-expanded="false" 
                                    aria-controls="collapseTwo"> <strong><%= reuniao.getTitulo()%></strong> 
                                    </button>
                                    </h3>
                                    <div class="accordion-collapse collapse show" id="collapseTwo<%=reuniao.getIdReuniao() %>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                        Ola tudo bem, uma reunião no dia <strong> <code> <%= reuniao.getData()%></code></strong>, com inicio as 
                                        <strong> <code> <%= reuniao.getHora()%></code></strong> tendo como local de discussão o(a) 
                                        <strong> <code> <%= reuniao.getLocal()%></code></strong>
                                        <br>
                                            
                                            <%
                                            	List<Usuario> participantes = UsuarioDao.getUsuariosDaReuniao(reuniao);
                                            	for(Usuario participante : participantes){
                                            %>
                                            <br>
                                            <strong><%=participante.getNome() %></strong> < <%=participante.getLogin() %> >
                                            <br>
                                            <%
                                            	}
                                            %>
                                        </div>
                                    </div>
                                </div>
  
                            </div>
                            <%
                            }
                            %>
                                
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
<body>

	


</body>
</html>