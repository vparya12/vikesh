jQuery(document).ready(function($) {
	
	$("#search-form").submit(function(event) {

		searchViaAjax();

	});
});

function searchViaAjax(){
var search = {}
$.ajax({
	type : "POST",
	contentType : "application/json",
	url : "/anand_atm/testAjax",
	data : JSON.stringify(search),
	dataType : 'json',
	timeout : 100000,
	success : function(data) {
		
		console.log("SUCCESS: ", data);
		alert("Hi Beauti "+ data.statusMessage+" "+data.result[0].userName)
		
	},
	error : function(e) {
		console.log("ERROR: ", e);
		
	},
	done : function(e) {
		console.log("DONE");
		
	}
});

}
