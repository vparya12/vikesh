<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- text/css -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<!-- text/javascript -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/index.js"/>"></script>
<title>Anand_ATM</title>
</head>
<body onload="getWelcome();">
<div id="header" class="navbar-fixed-top text-center">
Anand Center
</div>
<div id="mainContainer" class="container text-center">
<div class="container-fluid">
<h1><a href="/anand_atm/welcome"> WELCOME </a></h1>
<!-- <button class="btn-primary" onclick="location.href='/anand_atm/mobiles'">Mobile</button> -->
<!-- <button class="btn-primary" onclick="location.href='/anand_atm/dths'">DTH</button> -->
</div>
</div>
<div id="footer" class="navbar-fixed-bottom text-center">
&copy; Ved Arakash Arya</div>
</body>
</html>