<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/home.js"/>"></script>


<title>Ajax Tutorial</title>
</head>
<body>
<h1>Welcome To REST With Ajax !!!</h1>
<input type="text" id="mobileNumber" value="123455"/>
<input type="text" id="userName" value="Ved Prakash Arya "/>
<button type='button' onclick='RestGet()'>GET</button>
<button type='button' onclick='RestPut()'>PUT</button>
<button type='button' onclick='RestPost()'>POST</button>
<button type='button' onclick='RestDelete()'>DELETE</button>
</body>
</html>