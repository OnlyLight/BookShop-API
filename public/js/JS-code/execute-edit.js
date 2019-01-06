$(document).ready(function() {
	getDataTheLoaiByID();
	getDataUsersByID();
	getDataBooksByID();
	getDataSlidesByID();

    $("#data").submit(function (e) {
		e.preventDefault();
		var formData = new FormData(this);
		editSach(formData);
	});

	$("#data-slide").submit(function (e) {
		e.preventDefault();
		var formData = new FormData(this);
		editSlide(formData);
	});

	$("#btnEditTheLoai").click(function () {
		editTheLoai();
	});

	$('#btnEditAdmin').click(function() {
		editUsers();
	});
});

function getDataTheLoaiByID() {
	var id = GetURLParameter('id');
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/theloaisach/list/'+id+''
	}).then(function (res) {
		console.log(res.data);
		loadDataToEdit(res.data[0]);
	}).catch(function (error) {
		console.log(error);
	});
}

function getDataUsersByID() {
	var id = GetURLParameter('id');
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/users/list/'+id+''
	}).then(function (res) {
		console.log(res.data);
		loadDataToUsers(res.data[0]);
	}).catch(function (error) {
		console.log(error);
	});
}

function getDataBooksByID() {
	var id = GetURLParameter('id');
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/sach/list/'+id+''
	}).then(function (res) {
		console.log(res.data);
		loadDataToBooks(res.data[0]);
	}).catch(function (error) {
		console.log(error);
	});
}

function getDataSlidesByID() {
	var id = GetURLParameter('id');
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/slide/list/'+id+''
	}).then(function (res) {
		console.log(res.data);
		loadDataEditSlide(res.data[0]);
	}).catch(function (error) {
		console.log(error);
	});
}

function loadDataToBooks(item) {
	$("input[name*='tensach']").val(item.tensach);
	$("#show-img").attr("src",""+item.hinhanh+"");
	// $("input[name*='file']").val(item.hinhanh);
	$("input[name*='gia']").val(item.gia);
	$("input[name*='tacgia']").val(item.tacgia);
	$("input[name*='sotrang']").val(item.sotrang);
	$("input[name*='kichthuoc']").val(item.kichthuoc);
	$("input[name*='hinhthuc']").val(item.hinhthuc);
	$("input[name*='tennhacc']").val(item.tennhacc);
	$("input[name*='nxb']").val(item.nxb);
	$("input[name*='namxuatban']").val(item.namxuatban);
	$("input[name*='ngonngu']").val(item.ngonngu);
	$("input[name*='tinhtrang']").val(item.tinhtrang);
	$("input[name*='soluong']").val(item.soluong);
	$("textarea[name*='review']").val(item.review);
	$("input:radio[name*='noibat']").filter('[value="'+item.noibat+'"]').attr('checked', true);
	$("#load-category option[value='"+item.matheloai+"']").prop('selected', true);
}

function loadDataEditSlide(item) {
	$("#load-status option[value='"+parseInt(item.active.data[0])+"']").prop('selected', true);
	$("#show-slide").attr("src",""+item.hinhanh+"");
}

function loadDataToUsers(item) {
	$("input[name*='email-admin']").val(item.email);
	$("input[name*='username-admin']").val(item.username);
	$("input[name*='name-admin']").val(item.name);
	$("input:radio[name*='gender-admin']").filter('[value="'+item.gender+'"]').attr('checked', true);
}

function loadDataToEdit(item) {
	$("input[name*='tentheloai']").val(item.tentheloai);
}

function editUsers() {
    var id = GetURLParameter('id');
	var name = $("input[name*='name-admin']").val();
    var username = $("input[name*='username-admin']").val();
    var email = $("input[name*='email-admin']").val();
    var password = $("input[name*='pass-admin']").val();
    var gender = $("input[name*='gender-admin']").val();

	axios({
		method: 'patch',
		url: 'http://localhost:3000/api/users/update/'+id+'',
		data: {
			name: name,
            username: username,
            email: email,
            password: password,
            roles: ['admin'],
            gender: gender
		}
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

function editTheLoai() {
    var id = GetURLParameter('id');
	var tentheloai = $("input[name*='tentheloai']").val();

	axios({
		method: 'patch',
		url: 'http://localhost:3000/api/theloaisach/update/'+id+'',
		data: {
			tentheloai: tentheloai
		}
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

function editSlide(formData) {
    var id = GetURLParameter('id');
	axios({
		method: 'patch',
		url: 'http://localhost:3000/api/slide/update/'+id+'',
		data: formData
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

function editSach(formData) {
    var id = GetURLParameter('id');
	axios({
		method: 'patch',
		url: 'http://localhost:3000/api/sach/update/'+id+'',
		data: formData
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}