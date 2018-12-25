$(document).ready(function() {
	$(document).on('click','.btnTest', function(){
		console.log($(this).val());
		deleteNX($(this).val());
	});
});

function deleteNX(idNX) {
	if(idNX) {
		var r = confirm("Do you want to delete it!");
		if (r === true) {
			executeDeleteNX(idNX);
		}
	}
}

function executeDeleteNX(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/nhanxet/delete/'+id+''
	}).then(function (res) {
		console.log(res);
		getFeedBackViewAdmin();
	}).catch(function (error) {
		console.log(error);
	});
}

function GetURLParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}