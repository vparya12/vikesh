<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link href="/resources/css/style.css" rel="stylesheet"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/mobile.css" />" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/mobile.js"/>"></script>
<title>Anand_ATM</title>
</head>
<body class="text-center">
<div id="overlay">
	<div id="mobileForm">
		<form class="overlayform form-contro">
			Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="mobileNumber" onblur="validateMobileNumber('mobileNumber','mobileNumberImg',this)"/><span><img src="" id="mobileNumberImg"></span><br>
			Network&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="network" onblur="validateNetwork('network','networkImg',this)"/><span><img src="" id="networkImg"></span> <br>
			Alternative&nbsp;:<input type="text" id="altNumber" onblur="validateAltNumber('altNumber','altNumberImg',this)" /><span><img src="" id="altNumberImg"></span><br> 
			User Name&nbsp;:<input type="text" id="userName"  onblur="validateUserName('userName','userNameImg',this)"/><span><img src="" id="userNameImg"></span> <br>
			Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="amount"  onblur="validateAmount('amount','amountImg',this)" /><span><img src="" id="amountImg"></span> <br>
			Validity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="validity"  onblur="validateValidity('validity','validityImg',this)"/><span><img src="" id="validityImg"></span> <br>
			Payment	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="radio" name="payment" id="paid" value="true"/>Yes<input type="radio" name="payment" checked="checked" id="paid" value="false" />No<br>
			<input type="button" value="Save" class="btn-primary" onclick="saveNewMobile();">
			<input type="reset" value="Clear" id="resetButton" class="btn-primary">
			<input type="button" value="Close" class="btn-primary" onclick="closeMobileOverlay();">
		</form>
	</div>
</div>
<div id="editOverlay">
	<div id="mobileEditForm">
		<form class="overlayform form-contro">
			Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="editMobileNumber" onblur="validateMobileNumber('editMobileNumber','editMobileNumberImg',this)"/><span><img src="" id="editMobileNumberImg"></span><br>
			Network&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="editNetwork" onblur="validateNetwork('editNetwork','editNetworkImg',this)"/><span><img src="" id="editNetworkImg"></span> <br>
			Alternative&nbsp;:<input type="text" id="editAltNumber" onblur="validateAltNumber('editAltNumber','editAtNumberImg',this)" /><span><img src="" id="editAtNumberImg"></span><br> 
			User Name&nbsp;:<input type="text" id="editUserName"  onblur="validateUserName('editUserName','editUserNameImg',this)"/><span><img src="" id="editUserNameImg"></span> <br>
			Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="editAmount"  onblur="validateAmount('editAmount','editAmountImg',this)" /><span><img src="" id="editAmountImg"></span> <br>
			Validity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="editValidity"  onblur="validateValidity('editValidity','editValidityImg',this)"/><span><img src="" id="editValidityImg"></span> <br>
			<input type="hidden" id="editId" />
			Payment	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="radio" name="editPayment" id="radioYes" value="true"/>Yes<input type="radio" id="radioNo" name="editPayment" checked="checked" value="false" />No<br>
			<input type="button" value="Update" class="btn-primary" onclick="updateMobile();">
			<input type="reset" value="Clear" id="editResetButton" class="btn-primary">
			<input type="button" value="Close" class="btn-primary" onclick="closeEditMobileOverlay();">
		</form>
	</div>
</div>
	<div id="header" class="navbar-fixed-top text-center">Anand	Center</div>
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
				<td id="editColumn"><img src="<c:url value="/resources/img/checked.gif" />"></td>
				<td style="visibility:hidden;">${mobile.id}</td>
				
			</tr>
			</c:forEach>
		</table><br>
		
	</div>
<button type="button" class="btn-primary" onclick='openMobileForm()'>New</button><br><br>
		<button class="btn-primary" onclick="location.href='/anand_atm/dths'">DTH</button>
	<div id="footer" class="navbar-fixed-bottom text-center">&copy;
		Ved Arakash Arya</div>
</body>
</html>