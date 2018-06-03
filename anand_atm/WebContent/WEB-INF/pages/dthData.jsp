<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBpC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"	rel="stylesheet">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/dth.css" />" rel="stylesheet">
<script type="text/javascript"	src="<c:url value="/resources/js/jquery-3.2.0.min.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/resources/js/dth.js"/>"></script>
<title>Anand_ATM</title>
</head>
<body>
<div id="overlay">
	<div id="dthForm" class="text-center">	
		<form>
			Dth Number:<input type="text" id="dthNumber" onblur="validateDthNumber('dthNumber','dthNumberImg',this)"/><span><img src="" id="dthNumberImg"></span><br>
			Number:<input type="text" id="mobileNumber" onblur="validateMobileNumber('mobileNumber','mobileNumberImg',this)"/><span><img src="" id="mobileNumberImg"></span><br>
			Network:<input type="text" id="network" onblur="validateNetwork('network','networkImg',this)"/><span><img src="" id="networkImg"></span> <br>
			Alternative:<input type="text" id="altNumber" onblur="validateAltNumber('altNumber','altNumberImg',this)" /><span><img src="" id="altNumberImg"></span><br> 
			User Name:<input type="text" id="userName"  onblur="validateUserName('userName','userNameImg',this)"/><img src="" id="userNameImg"><br>
			Amount:<input type="text" id="amount"  onblur="validateAmount('amount','amountImg',this)" /><span><img src="" id="amountImg"></span> <br>
			Validity:<input type="text" id="validity"  onblur="validateValidity('validity','validityImg',this)"/><span><img src="" id="validityImg"></span> <br>
			Payment	:<input type="radio" name="payment" id="paid" value="true"/>Yes<input type="radio" name="payment" checked="checked" id="paid" value="false" />No<br>
			<input type="button" value="Save" class="btn-primary" onclick="saveNewDth();">
			<input type="reset" value="Clear" id="resetButton"  class="btn-primary">
			<input type="button" value="Close" class="btn-primary" onclick="closeDthOverlay();">
		</form>
	</div>
</div>
<div id="editOverlay">
	<div id="dthEditForm" class="text-center">
		<form class="overlayform">
			Dth Number:<input type="text" id="editDthNumber" onblur="validateDthNumber('editDthNumber','editDthNumberImg',this)"/><span><img src="" id="editDthNumberImg"></span><br>
			Number:<input type="text" id="editMobileNumber" onblur="validateMobileNumber('editMobileNumber','editMobileNumberImg',this)"/><span><img src="" id="editMobileNumberImg"></span><br>
			Network:<input type="text" id="editNetwork" onblur="validateNetwork('editNetwork','editNetworkImg',this)"/><span><img src="" id="editNetworkImg"></span> <br>
			Alternative:<input type="text" id="editAltNumber" onblur="validateAltNumber('editAltNumber','editAtNumberImg',this)" /><span><img src="" id="editAtNumberImg"></span><br> 
			User Name:<input type="text" id="editUserName"  onblur="validateUserName('editUserName','editUserNameImg',this)"/><span><img src="" id="editUserNameImg"></span> <br>
			Amount:<input type="text" id="editAmount"  onblur="validateAmount('editAmount','editAmountImg',this)" /><span><img src="" id="editAmountImg"></span> <br>
			Validity:<input type="text" id="editValidity"  onblur="validateValidity('editValidity','editValidityImg',this)"/><span><img src="" id="editValidityImg"></span> <br>
			<input type="hidden" id="editId" />
			Payment	:<input type="radio" name="editPayment" id="radioYes" value="true"/>Yes<input type="radio" id="radioNo" name="editPayment" checked="checked" value="false" />No<br>
			<input type="button" value="Update" class="btn-primary" onclick="updateDth();">
			<input type="reset" value="Clear" id="editResetButton" class="btn-primary">
			<input type="button" value="Close" class="btn-primary" onclick="closeEditDthOverlay();">
		</form>
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
				<td id="editColumn"><img src="<c:url value="/resources/img/checked.gif" />"></td>
				<td style="visibility:hidden;">${dth.id}</td>
			</tr>
			</c:forEach>
		</table><br>
		
	</div>
<button type="button" class="btn-primary" onclick='openDthForm()'>New</button><br><br>
<button class="btn-primary" onclick="location.href='/anand_atm/mobiles'">Mobile</button>
</div>	
	<div id="footer" class="navbar-fixed-bottom text-center">&copy;
		Ved Arakash Arya</div>
</body>
</html>