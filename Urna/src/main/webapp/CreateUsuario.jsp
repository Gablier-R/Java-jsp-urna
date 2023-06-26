<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The meeting</title>

<link rel="stylesheet" href="<%request.getContextPath();%>/src/css/bootstrap.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
</head>
<body data-bs-theme="dark">

<div class="position-fixed top-0 end-0 p-3" id="alertContainer">
	
</div>

<section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0">
                        <h2 class="fw-bolder mb-0">Preencha seus dados corretamente, e utilize the meeting</h2>
                        
                        </div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                 <form action="UsuarioCreate" method="POST">
            
            <div class="form-floating mb-3">
                <input name="nome"  type="text" class="form-control" placeholder="nome" required="required">
                <label for="floatingInput">Nome completo</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="login"  type="email" class="form-control" id="email" placeholder="name@example.com" required="required">
                <label for="floatingInput">Email</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="cpf"
                id="cpf"
                minlength="11"
                maxlength="11"  type="text" class="form-control"  placeholder="00000000000" required="required">
                <label for="floatingInput">Cpf (somente numeros)</label>
              </div>
              
              <div class="form-floating mb-3">
                <input name="nascimento" 
                id="nascimento"
                type="date" class="form-control" id="floatingPassword" placeholder="Data de nascimento" required="required">
                <label for="floatingInput">Data de nascimeto</label>
               <p class="text-muted font-italic">Data não pode ser maior que atual</p>

              </div>
              
              <div class="form-floating mb-3">
                <input name="senha" 
                id="senha"
                pattern="(?=(.*[0-9]))((?=.*[A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z]))^.{8,}$"
                type="password" class="form-control" id="floatingPassword" placeholder="senha" required="required">
                <label for="floatingInput">Senha</label>
                <p class="text-muted font-italic">Senha deve conter <strong>8</strong>  caracteres: 
                numeros de <strong>0</strong>  a <strong>9</strong> , letras maisculas e minusculas 
                (<strong>AZ</strong>  - <strong>az</strong>)</p>
              </div>

              
<br>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Cadastrar</button>
                <p>Ja tem sua conta? <a href="Login.jsp" class="link-info">Logar</a></p>
                  
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

<script>
  var dataAtual = new Date().toISOString().split('T')[0];

  var campoData = document.getElementById("nascimento");

  campoData.addEventListener("blur", function() {
    var inputData = campoData.value;

    if (inputData > dataAtual) {
      var mensagem = "A sua data de nascimento não pode ser maior que a data atual.";

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

</body>
</html>