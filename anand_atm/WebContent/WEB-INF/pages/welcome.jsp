<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">


<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/index.js"/>"></script>
<title>Anand_ATM</title>
</head>
<body>
<div id="header" class="navbar-fixed-top text-center">
Anand Center
</div>
<div id="mainContainer" class="container text-center">
<div class="container-fluid" style="display: -webkit-inline-box;">
<div class="text-center" id="dataBox">
			<h3>	DTH</h3>
	<table class="table-bordered table-condensed table-hover">
			<tr style="background:#cccccc;">
				<th>DTH Number</th>
				<th>Number</th>
				<th>Name</th>
				<th>Network</th>
				<th>Date</th>
				<th>Amount</th>
				<th>Days Left</th>
			</tr>
			<c:forEach items="${dthList}" var="dth">
			<tr>
				<td>${dth.dthNumber}</td>
				<td>${dth.mobileNumber}</td>
				<td>${dth.userName}</td>
				<td>${dth.network}</td>
				<td>${dth.lastRecharedDate}</td>
				<td>${dth.lastRechargedAmount}</td>
				<td>${dth.remainingDays}</td>
			</tr>
			</c:forEach>
		</table><br>
	</div>
	<div style="width:20px;"></div>
<div class="text-center" id="dataBox">
		<h3>	Mobile</h3>
	<table class="table-bordered table-condensed table-hover">
			<tr style="background:#cccccc;">
				<th>Number</th>
				<th>Name</th>
				<th>Network</th>
				<th>Date</th>
				<th>Amount</th>
				<th>Days Left</th>
			</tr>
			<c:forEach items="${mobileList}" var="mobile">
			<tr>
				<td>${mobile.mobileNumber}</td>
				<td>${mobile.userName}</td>
				<td>${mobile.network}</td>
				<td>${mobile.lastRecharedDate}</td>
				<td>${mobile.lastRechargedAmount}</td>
				<td>${mobile.remainingDays}</td>
			</tr>
			</c:forEach>
		</table><br>
	</div>
</div>
<!-- <button class="btn-primary" onclick="openMobile()">Mobile</button> -->
<button class="btn-primary" onclick="location.href='/anand_atm/mobiles'">Mobile</button>
<button class="btn-primary" onclick="location.href='/anand_atm/dths'">DTH</button>
</div>
<div id="footer" class="navbar-fixed-bottom text-center">
&copy; Ved Arakash Arya</div>
</body>
</html>