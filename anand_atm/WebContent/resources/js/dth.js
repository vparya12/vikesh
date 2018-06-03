var prefix = '/anand_atm';
var dthNumberFlag = false;
var mobileNumberFlag = false;
var networkFlag = false;
var userNameFlag = false;
var altNumberFlag = false;
var amountFlag = false;
var validityFlag = false;
var paymentFlag = false;

var openDth = function() {
	if(true){}else{}
        $.ajax({
        type: 'GET',
        url:  prefix + '/dths',
        dataType: 'json',
        timeout: 100000,
        async: true,
        success: function(result) {
          //  alert(result.data);
            //window.location.href="mobileData.jsp";
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        },
        done: function(e){
        	alert("Done!");
        }
   });
}

var openDthForm = function(){
	$("#overlay").css("display","block");
}

var saveNewDth = function(){
	if(dthNumberFlag && mobileNumberFlag && networkFlag && userNameFlag && altNumberFlag && amountFlag && validityFlag){
		var dthData ={};
		dthData["dthNumber"]= $("#dthNumber").val();
		dthData["mobileNumber"]=$("#mobileNumber").val();
		dthData["network"]=$("#network").val();
		dthData["alternativeNumber"]=$("#altNumber").val();
		dthData["userName"]=$("#userName").val();
		dthData["validDays"]=$("#validity").val();
		dthData["payment"]=$('input[name=payment]:checked').val();
		dthData["rechargeAmount"]=$("#amount").val();
		$.ajax({
			type: 'POST',
			url:  prefix + '/saveDth',
			data: JSON.stringify(dthData),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			timeout: 100000,
			async: true,
			success: function(result) {
				$("#overlay").css("display","none");
				alert(result.data);
				window.location.reload(false); 
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.status + ' ' + jqXHR.responseText);
			},
			done: function(e){
				alert("Done!");
			}
	   });
	}else{
		alert("Please fill the form properly.")
	}
	
}


var updateDth = function(){
		var dthData ={};
		dthData["dthNumber"]= $("#editDthNumber").val();
		dthData["mobileNumber"]=$("#editMobileNumber").val();
		dthData["network"]=$("#editNetwork").val();
		dthData["alternativeNumber"]=$("#editAltNumber").val();
		dthData["userName"]=$("#editUserName").val();
		dthData["validDays"]=$("#editValidity").val();
		dthData["payment"]=$('input[name=editPayment]:checked').val();
		dthData["lastRechargedAmount"]=$("#editAmount").val();
		dthData["id"] = $("#editId").val();
		$.ajax({
			type: 'POST',
			url:  prefix + '/updateDth',
			data: JSON.stringify(dthData),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			timeout: 100000,
			async: true,
			success: function(result) {
				$("#overlay").css("display","none");
				alert(result.data);
				window.location.reload(false); 
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.status + ' ' + jqXHR.responseText);
			},
			done: function(e){
				alert("Done!");
			}
	   });
	
}
var closeDthOverlay = function(){
	$("#dthForm form img").attr("src","");
	$("#resetButton").click();
	$("#overlay").css("display","none");
}

var closeEditDthOverlay = function(){
	$("#dthEditForm form img").attr("src","");
	$("#editResetButton").click();
	$("#editOverlay").css("display","none");
}


function checkNumber(data){
	var reg = /^\d+$/;
	if(data==null || data==""){
		return false;
	}else{
		if(reg.test(data)){
			return true;
		}else{
			return false;
		}
	}
}

function checkAlphabets(){
	var reg = /^[a-zA-Z]*$/;
	var data = $("#network").val();
	if(reg.test(data)){
		return true;
	}else{
		return false;
	}
}

function countDigits(data){
	if(data.length==10){
		return true;
	}else{
		return false;
	}
}

function validateDthNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(checkNumber(data)){
		if(data.length==16){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			dthNumberFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}

function validateMobileNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(checkNumber(data)){
		if(countDigits(data)){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			mobileNumberFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}
function validateNetwork(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0){
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}else{
		if(checkAlphabets()){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			networkFlag= true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
	
}
function validateAltNumber(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0 || data==0){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		altNumberFlag = true;
	}else{
		if(checkNumber(data)){
			if(countDigits(data)){
				$("#"+imgId).attr("src","./resources/img/checked.gif");
				altNumberFlag = true;
			}else{
				$("#"+imgId).attr("src","./resources/img/unchecked.gif");
				return false;
			}
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
}
function validateUserName(value,imgId,object){
	var data = $("#"+value).val();
	if(data.length==0){
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}else{
		if(checkAlphabets()){
			$("#"+imgId).attr("src","./resources/img/checked.gif");
			userNameFlag = true;
		}else{
			$("#"+imgId).attr("src","./resources/img/unchecked.gif");
			return false;
		}
	}
}
function validateAmount(value,imgId,object){
	var data = $("#"+value).val();
	if( checkNumber(data)){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		amountFlag = true;
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}
function validateValidity(value,imgId,object){
	var data = $("#"+value).val();
	if( checkNumber(data)){
		$("#"+imgId).attr("src","./resources/img/checked.gif");
		validityFlag = true;
	}else{
		$("#"+imgId).attr("src","./resources/img/unchecked.gif");
		return false;
	}
}

$(document).ready(function() {
	$("#dthTable tr td img").mouseenter(function(e) {
		 $("#dthTable tr").removeClass("highlight");
		 $(e.target).closest("tr").addClass("highlight");
	});
	$("#dthTable tr td img").mouseout(function(e) {
		 $("#dthTable tr").removeClass("highlight");
	});
	$("#dthTable tr td img").click(function(e) {
		 $("#dthTable tr").removeClass("highlight");
		 var mobile = $(e.target).closest("tr").text();
		 var data = mobile.split('				');
		 var dth =data[1].substr(0,(data[1].length-1));
		 var mobileNumber =data[2].substr(0,(data[2].length-1));
		 var userName =data[3].substr(0,(data[3].length-1));
		 var network =data[4].substr(0,(data[4].length-1));
		 var altNumber =data[5].substr(0,(data[5].length-1));
		 var amount =data[7].substr(0,(data[7].length-1));
		 var validity =data[8].substr(0,(data[8].length-1));
		 var paid =data[9].substr(0,(data[9].length-1));
		 var id =data[12].substr(0,(data[12].length-1));
		 $("#editOverlay").css("display","block");
		 $("#editDthNumber").val(dth);
		 $("#editMobileNumber").val(mobileNumber);
		 $("#editNetwork").val(network);
		 $("#editUserName").val(userName);
		 $("#editAltNumber").val(altNumber);
		 $("#editAmount").val(amount);
		 $("#editValidity").val(validity);
		 $("#editId").val(id);
		 if(paid){
			 $("#radioYes").prop("checked",true);
		 }else{
			 $("#radioNo").prop("checked",true);
		 }

	});
});