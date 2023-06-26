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
<body>


<%

if (session.getAttribute("id") == null) {

	response.sendRedirect("Login.jsp");
} 
%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script> rel="stylesheet" href="<%request.getContextPath();%>/src/js/jquery.min.js"  </script>
<script> rel="stylesheet" href="<%request.getContextPath();%>/src/js/bootstrap.min.js"  </script>

</body>
</html>