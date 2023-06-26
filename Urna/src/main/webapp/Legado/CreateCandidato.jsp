<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestão urna</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>




<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
  
    <a class="navbar-brand" href="#"> <%= session.getAttribute("nome") %></a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        
        <li class="nav-item">
          <form action="CandidatoCreateAndFind" method="get" class="d-flex" role="search">
        <input name="pesquisa" class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search"
        style="visibility:hidden; display: none;">
        <button  class="nav-link" type="submit">Lista de candidatos</button>
      </form>
        </li>
        
        <li class="nav-item">
          <form action="EleitorCreateAndFind" method="get" class="d-flex" role="search">
        <input name="pesquisa" class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search"
        style="visibility:hidden; display: none;">
        <button  class="nav-link" type="submit">Lista de eleitores</button>
      </form>
        </li>
        
          <form action="UsuarioCreateAndFind" method="get">
        <input name="pesquisa" style="visibility:hidden; display: none;">
        <button  class="nav-link" type="submit">Lista de usuarios</button>
      </form>
        
        
        <a class="nav-link" href="ReuniaoDto">Criar Reuniao</a>
        
        
      </ul>
      
      
    </div>
  </div>

        <a class="nav-link" href="LogoutUsuario">Logout</a>

</nav>

<div class="container">
	<div class="row">
		<div class="cold-md-7">
			<hr>
			<h3>Cadastro de Clientes</h3>
			<hr>
			<form action="CandidatoCreateAndFind" method="POST">
				<div class="form-floating mb-3">
						<input name="nome" maxlength="40" type="text" class="form-control" id="floatingInput1"> 
						<label>Nome completo</label>
					</div>
					<div class="form-floating mb-3">
						<input name="numero" maxlength="11" type="text" class="form-control"> 
						<label>Numero (apenas números)</label>
					</div>
					
					<select name="tipo" class="form-select mb-3" aria-label="Default select example" required="required">
						<option selected>-- Selecione o tipo</option>
						<option value="Presidente">Presidente </option>
						<option value="Governador">Governador</option>
					</select>
					
					<select name="partido" class="form-select mb-3" aria-label="Default select example" required="required">
						<option selected>-- Selecione o partido</option>
						<option value="Pt">Pt </option>
					</select>
					
					<button class="btn btn-primary" type="submit">Cadastrar Candidato</button>
					<button class="btn btn-secondary" type="reset">Limpar
						Formulário</button>
			</form>
		</div>
		
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>