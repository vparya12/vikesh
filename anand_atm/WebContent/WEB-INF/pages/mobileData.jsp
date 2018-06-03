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
<link href="<c:url value="/resources/css/mobile.css" />" rel="stylesheet">

<!-- Script -->
<script type="text/javascript"	src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/common.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/mobile.js"/>"></script>

<title>Anand_ATM</title>
</head>
<body>
<div id="overlay">
	<div id="mobileForm">
		<%@include file="html/mobileNewForm.html" %>
	</div>
</div>
<div id="editOverlay">
	<div id="mobileEditForm">
		<%@include file="html/mobileUpdateForm.html" %>
	</div>
</div>
	<div id="header" class="navbar-fixed-top text-center">Anand	Center</div>
	<div class="text-center">
	<div class="text-center" id="dataBox">
	<table class="table-bordered table-condensed" style="border:none" id="mobileTable">
			<tr style="background:#cccccc;">
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
			<c:forEach items="${mobileList}" var="mobile">
			<tr>
				<td>${mobile.mobileNumber}</td>
				<td>${mobile.userName}</td>
				<td>${mobile.network}</td>
				<td>${mobile.alternativeNumber}</td>
				<td>${mobile.lastRecharedDate}</td>
				<td>${mobile.lastRechargedAmount}</td>
				<td>${mobile.validDays}</td>
				<td>${mobile.payment}</td>
				<td>${mobile.remainingDays}</td>
				<td class="editColumn"><img src="<c:url value="/resources/img/edit.png" />"></td>
				<td style="visibility:hidden;">${mobile.id}</td>
				
			</tr>
			</c:forEach>
		</table><br>
		
	</div>
	<button type="button" class="btn-primary" onclick='openMobileForm()'>New</button><br><br>
	<img class="imgDthButton" src="<c:url value="/resources/img/dth.PNG" />" width="10%" onclick="location.href='/anand_atm/dths'"/>
</div>
<div id="footer" class="navbar-fixed-bottom text-center">&copy;
		Ved Arakash Arya
</div>
</body>
</html>