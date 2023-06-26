<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The meeting</title>

   
    <link rel="stylesheet" href="<%request.getContextPath();%>/src/css/bootstrap.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
    
</head>
<body data-bs-theme="dark">


<div class="position-fixed top-0 end-0 p-3">

    <c:if test="${not empty mensagem}">
    	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  			<strong>${mensagem} </strong> 
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>
	
	<c:if test="${not empty mensagemUpdate}">
    	<div class="alert alert-primary alert-dismissible fade show" role="alert">
  			<strong>${mensagemUpdate} </strong> 
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>
	
	<c:if test="${not empty mensagemCadastro}">
    	<div class="alert alert-primary alert-dismissible fade show" role="alert">
  			<strong>${mensagemCadastro} </strong> 
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>
	
</div>


<section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Verifique suas credencias, e realize seu login no The meeting</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                 <form action="LoginUsuario" method="post">
              <div class="form-floating mb-3">
                <input name="login" type="email" class="form-control" id="floatingInput" placeholder="name@example.com" required="required">
                <label for="floatingInput">Email</label>
              </div>
              <div class="form-floating mb-3">
                <input name="senha" type="password" class="form-control" id="floatingPassword" placeholder="Password" required="required">
                <label for="floatingPassword">Senha</label>
              </div>
              
              <p id="mensagem"></p>

              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit"> Entrar </button>
                  <br>
                   <p>Ainda não tem uma conta? <a href="CreateUsuario.jsp" class="link-info">Cadastre-se</a></p>
              </div>
              
            </form>



            
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            

  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script> rel="stylesheet" href="<%request.getContextPath();%>/src/js/jquery.min.js"  </script>
<script> rel="stylesheet" href="<%request.getContextPath();%>/src/js/bootstrap.min.js"  </script>


</body>
</html>