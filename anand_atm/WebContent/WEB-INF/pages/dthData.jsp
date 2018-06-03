<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Stylesheet -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"	rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/dth.css" />" rel="stylesheet">

<!-- Script -->
<script type="text/javascript"	src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/common.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/dth.js"/>"></script>

<title>Anand_ATM</title>
</head>
<body>
<div id="overlay">
	<div id="dthForm" class="text-center">	
		<%@include file="html/dthNewForm.html" %>
	</div>
</div>
<div id="editOverlay">
	<div id="dthEditForm" class="text-center">
		<%@include file="html/dthUpdateForm.html" %>
	</div>
</div>
	<div id="header" class="navbar-fixed-top text-center">Anand	Center</div>
	<div class="text-center">
	<div class="text-center" id="dataBox">
	<table class="table-bordered table-condensed" style="border:none" id="dthTable">
			<tr style="background:#cccccc;">
				<th>DTH Number</th>
				<th>Number</th>
				<th>Name</th>
				<th>Network</th>
				<th>Alt Number</th>
				<th>Recharged Date</th>
				<th>Recharged Amount</th>
				<th>Validity</th>
				<th>Paid</th>
				<th>Days Left</th>
			</tr>
			<c:forEach items="${dthList}" var="dth">
			<tr>
				<td>${dth.dthNumber}</td>
				<td>${dth.mobileNumber}</td>
				<td>${dth.userName}</td>
				<td>${dth.network}</td>
				<td>${dth.alternativeNumber}</td>
				<td>${dth.lastRecharedDate}</td>
				<td>${dth.lastRechargedAmount}</td>
				<td>${dth.validDays}</td>
				<td>${dth.payment}</td>
				<td>${dth.remainingDays}</td>
				<td class="editColumn"><img src="<c:url value="/resources/img/edit.png" />"></td>
				<td style="visibility:hidden;">${dth.id}</td>
			</tr>
			</c:forEach>
		</table><br>
		
	</div>
<button type="button" class="btn-primary" onclick='openDthForm()'>New</button><br><br>
<img class="imgMobileButton" src="<c:url value="/resources/img/mobile.PNG" />" width="5.5%" onclick="location.href='/anand_atm/mobiles'"/>
</div>	
	<div id="footer" class="navbar-fixed-bottom text-center">&copy;
		Ved Arakash Arya</div>
</body>
</html>