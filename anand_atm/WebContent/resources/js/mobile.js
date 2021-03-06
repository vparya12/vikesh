

var openMobile = function() {
        $.ajax({
        type: 'GET',
        url:  prefix + '/mobiles',
        dataType: 'json',
        timeout: 100000,
        async: true,
        success: function(result) {
            alert(result.data);
            window.location.href="mobileData.jsp";
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(jqXHR.status + ' ' + jqXHR.responseText);
        },
        done: function(e){
        	alert("Done!");
        }
   });
}

var openMobileForm = function(){
	$("#overlay").css("display","block");
}

var saveNewMobile = function(){
	if(mobileNumberFlag && networkFlag && userNameFlag && altNumberFlag && amountFlag && validityFlag){
		var mobileData ={};
		mobileData["mobileNumber"]=$("#mobileNumber").val();
		mobileData["network"]=$("#network").val();
		mobileData["alternativeNumber"]=$("#altNumber").val();
		mobileData["userName"]=$("#userName").val();
		mobileData["validDays"]=$("#validity").val();
		mobileData["payment"]=$('input[name=payment]:checked').val();
		mobileData["rechargeAmount"]=$("#amount").val();
		$.ajax({
			type: 'POST',
			url:  prefix + '/saveMobile',
			data: JSON.stringify(mobileData),
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

var updateMobile = function(){
		var mobileData ={};
		mobileData["mobileNumber"]=$("#editMobileNumber").val();
		mobileData["network"]=$("#editNetwork").val();
		mobileData["alternativeNumber"]=$("#editAltNumber").val();
		mobileData["userName"]=$("#editUserName").val();
		mobileData["validDays"]=$("#editValidity").val();
		mobileData["payment"]=$('input[name=editPayment]:checked').val();
		mobileData["lastRechargedAmount"]=$("#editAmount").val();
		var id = $("#editId").val();
		mobileData["id"] = id.substr(3,(id.length));
		$.ajax({
			type: 'POST',
			url:  prefix + '/updateMobile',
			data: JSON.stringify(mobileData),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			timeout: 100000,
			async: true,
			success: function(result) {
				$("#editOverlay").css("display","none");
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

var rechargeMobile = function(){
	var mobileData = {};
	mobileData["validDays"]=$("#editValidity").val();
	mobileData["payment"]=$('input[name=editPayment]:checked').val();
	mobileData["rechargeAmount"]=$("#editAmount").val();
	var id = $("#editId").val();
	mobileData["id"] = id.substr(3,(id.length));
	
	$ajax({
		type: 'POST',
		url: prefix + '/rechargeMobile',
		data: JSON.stringify(mobileData),
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
		timeout: 100000,
		async: true,
		success: function(result){
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.status + ' ' + jqXHR.responseText);
		},
		done: function(e){
			alert("Done!");
		}
	});
}

var closeMobileOverlay = function(){
	$("#mobileForm form img").attr("src","");
	$("#resetButton").click();
	$("#overlay").css("display","none");
}

var closeEditMobileOverlay = function(){
	$("#mobileEditForm form img").attr("src","");
	$("#editResetButton").click();
	$("#editOverlay").css("display","none");
}


$(document).ready(function() {
	
	$("#mobileTable tr td img").mouseenter(function(e) {
		 $("#mobileTable tr").removeClass("highlight");
		 $(e.target).closest("tr").addClass("highlight");
	});
	
	$("#mobileTable tr td img").mouseout(function(e) {
		 $("#mobileTable tr").removeClass("highlight");
	});
	
	$("#mobileTable tr td img").click(function(e) {
		 $("#mobileTable tr").removeClass("highlight");
		 
		 var mobile = $(e.target).closest("tr").text();
		 var data = mobile.split('				');
		 
		 var id 			=data[1].substr(0,(data[1].length-1));
		 var mobileNumber 	=data[2].substr(0,(data[2].length-1));
		 var userName 		=data[3].substr(0,(data[3].length-1));
		 var network 		=data[4].substr(0,(data[4].length-1));
		 var altNumber 		=data[5].substr(0,(data[5].length-1));
		 var amount 		=data[8].substr(0,(data[8].length-1));
		 var validity 		=data[9].substr(0,(data[9].length-1));
		 var paid 			=data[10].substr(0,(data[10].length-1));
		 
		 $("#editOverlay").css("display","block");
		 
		 $("#editId").val(id);
		 $("#editMobileNumber").val(mobileNumber);
		 $("#editNetwork").val(network);
		 $("#editUserName").val(userName);
		 $("#editAltNumber").val(altNumber);
		 $("#editAmount").val(amount);
		 $("#editValidity").val(validity);
		
		 if(paid){
			 $("#radioYes").prop("checked",true);
		 }else{
			 $("#radioNo").prop("checked",true);
		 }

	});
});