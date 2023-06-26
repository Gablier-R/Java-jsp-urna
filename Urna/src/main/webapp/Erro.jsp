<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 Error Page</title>
    <link rel="stylesheet" href="<%request.getContextPath();%>/src/css/bootstrap.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
  </head>

  <body>
    <div class="d-flex align-items-center justify-content-center vh-100 bg-primary">

        <h1 class="display-1 fw-bold text-white">404</h1>
        <%-- Exibir mensagem de erro, se houver --%>
    <c:if test="${not empty error}">
        <p>${error}</p>
    </c:if>
    </div>
  </body>

</html>