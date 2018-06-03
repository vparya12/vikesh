<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Stylesheet -->

<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">

<!-- Script -->
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
	<img src="<c:url value="/resources/img/dth.PNG" />" width="20%"/>
	<table class="table-bordered table-condensed">
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
				<c:choose>
					<c:when test="${dth.remainingDays < 0}">
						<tr class="belowZero"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 0}"> 
						<tr class="zero"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 1}"> 
						<tr class="one"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 2}"> 
						<tr class="two"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 3}"> 
						<tr class="three"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 4}"> 
						<tr class="four"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${dth.remainingDays == 5}"> 
						<tr class="five"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="aboveFive"> 
							<%@include file="html/dthDataList.html" %>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table><br>
	</div>
	<div style="width:20px;"></div>
<div class="text-center" id="dataBox">
		<img src="<c:url value="/resources/img/mobile.PNG" />" width="13.5%"/>
	<table class="table-bordered table-condensed">
			<tr style="background:#cccccc;">
				<th>Number</th>
				<th>Name</th>
				<th>Network</th>
				<th>Date</th>
				<th>Amount</th>
				<th>Days Left</th>
			</tr>
			<c:forEach items="${mobileList}" var="mobile">
				<c:choose>
					<c:when test="${mobile.remainingDays < 0}">
						<tr class="belowZero"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 0}"> 
						<tr class="zero"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 1}"> 
						<tr class="one"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 2}"> 
						<tr class="two"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 3}"> 
						<tr class="three"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 4}"> 
						<tr class="four"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:when test="${mobile.remainingDays == 5}"> 
						<tr class="five"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="aboveFive"> 
							<%@include file="html/mobileDataList.html" %>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table><br>
	</div>
</div>
<img class="imgDthButton" src="<c:url value="/resources/img/dth.PNG" />" width="10%" onclick="location.href='/anand_atm/dths'"/>
<img class="imgMobileButton" src="<c:url value="/resources/img/mobile.PNG" />" width="5.5%" onclick="location.href='/anand_atm/mobiles'"/>
</div>
<div id="footer" class="navbar-fixed-bottom text-center">
&copy; Ved Arakash Arya</div>
</body>
</html>