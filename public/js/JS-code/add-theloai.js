$(document).ready(function() {
    $('#btnAddTheLoai').click(function() {
        addTheLoai();
    });
});

function addTheLoai() {
	var tentheloai = $("input[name*='tentheloai']").val();

	axios({
		method: 'post',
		url: 'http://localhost:3000/api/theloaisach/create',
		data: {
			tentheloai: tentheloai
		}
	}).then(function (res) {
		console.log(res);
	}).catch(function (error) {
		console.log(error);
	});
}