<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de candidatos</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
			<h3>Lista de candidatos</h3>
			
			<div class="d-flex justify-content-end">
			<a href="CreateCandidato.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Cadastrar candidatos</a>
			</div>
			

			<hr>
			<table class="table">
				<thead>
					<tr>
						<th>Nome </th>
						<th>Numero </th>
						<th>Categoria</th>
						<th>Partido </th>
						<th>Votos </th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${candidatos}" var="candidato">
							<tr>
								<td>${candidato.nome}</td>
								<td>${candidato.numero}</td>
								<td>${candidato.tipo}</td>
								<td>${candidato.partido}</td>
								<td>${candidato.votos}</td>
								<td>
									
								</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>