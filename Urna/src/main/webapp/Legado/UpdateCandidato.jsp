<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
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
        
        <li class="nav-item">
          <form action="UsuarioCreateAndFind" method="get" class="d-flex" role="search">
        <input name="pesquisa" class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search"
        style="visibility:hidden; display: none;">
        <button  class="nav-link" type="submit">Lista de usuarios</button>
      </form>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
	<div class="row">
		<div class="cold-md-7">
			<hr>
			<h3>Alterar candidatos</h3>
			<hr>
			<form action="CandidatoUpdate" method="POST">
			<input name="id" value="${candidato.id}" type="number" style=" visibility: hidden">
				<div class="form-floating mb-3">
						<input value ="${candidato.nome}" name="nome" maxlength="40" type="text" class="form-control" id="floatingInput1"> 
						<label>Nome completo</label>
					</div>
					<div class="form-floating mb-3">
						<input value ="${candidato.numero}" name="numero" maxlength="11" type="text" class="form-control"> 
						<label>Numero (apenas números)</label>
					</div>
					
					<select name="tipo" class="form-select mb-3" aria-label="Default select example" required="required">
						<option selected>${candidato.tipo}</option>
						<option value="Presidente">Presidente </option>
						<option value="Governador">Governador</option>
					</select>
					
					<select name="partido" class="form-select mb-3" aria-label="Default select example" required="required">
						<option selected>${candidato.partido}</option>
						<option value="Pt">Pt - Partido dos trabalhadores </option>
					</select>

					<button class="btn btn-success" type="submit">Atualizar candidato</button>

			</form>
		</div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>