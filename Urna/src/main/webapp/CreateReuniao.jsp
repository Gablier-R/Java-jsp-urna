<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Autorizacao.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<div class="position-fixed top-0 end-0 p-3" id="alertContainer">
	
</div>

<section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Preencha seus dados de sua meeting, e adicione participantes que iram com voce.</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                 <form action="ReuniaoCreate" method="POST">
                            
            
            <div class="form-floating mb-3">
                <input name="titulo"  type="text" class="form-control" placeholder="de um titulo a sua reunião" required="required">
                <label for="floatingInput">Titulo</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="local"  type="text" class="form-control" placeholder="links, local ..." required="required">
                <label for="floatingInput">Local</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="data" id="nascimento" type="date" class="form-control" required="required">
                <label for="floatingPassword">Data da reunião</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="hora"  type="time" class="form-control" placeholder="hh:mm" required="required">
                <label for="floatingInput">Hora</label>
              </div>
              
 
		<select name="participantes" multiple class="form-select" size="5">
			<%
			List<Usuario> dao = UsuarioDao.listaTodos();
			for (Usuario usuario : dao){
			%>
				<option value="<%=usuario.getId()%>"> <%=usuario.getNome()%></option>
			<%
			}
			%>
		</select>
		<p class="text-muted font-italic">Segure a tecla <strong>Ctrl</strong>  e clique com o mouse nas opções que deseja selecionar</p>
		

              
<br>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Cadastrar</button>
                  
              </div>
              
            </form>
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

<script>
  var dataAtual = new Date().toISOString().split('T')[0];

  var campoData = document.getElementById("nascimento");

  campoData.addEventListener("blur", function() {
    var inputData = campoData.value;

    if (inputData < dataAtual) {
      var mensagem = "A data não pode ser menor que a data atual.";

      // Exibir a mensagem em um alert do Bootstrap
      var alertContainer = document.getElementById("alertContainer");
      alertContainer.innerHTML = '<div class="alert alert-warning alert-dismissible fade show" role="alert">' +
        mensagem +
        '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
        '</div>';

      campoData.value = "";
    }
  });
</script>

<!-- Container para exibir o alert do Bootstrap -->



</body>

</html>