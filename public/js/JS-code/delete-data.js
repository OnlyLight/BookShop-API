$(document).ready(function() {
    $('.btnDeleteNX').click(function() {
        var id = $(this).val();
        alert(id);
        // deleteNX(id);
    });
});

function deleteNX(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/nhanxet/delete/'+id+''
	}).then(function (res) {
		console.log(res);
	}).catch(function (error) {
		console.log(error);
	});
}