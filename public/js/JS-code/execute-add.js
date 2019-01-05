$(document).ready(function() {
    $('#btnAddTheLoai').click(function() {
		addTheLoai();
	});
	
	$('#btnAddAdmin').click(function() {
		addUser();
	});

	$("#data").submit(function (e) {
		e.preventDefault();    
		var formData = new FormData(this);
		addSach(formData);
	});

	$("#data-slide").submit(function (e) {
		e.preventDefault();    
		var formData = new FormData(this);
		addSlide(formData);
	});
});

function addSlide(formData) {
	axios({
		method: 'post',
		url: 'http://localhost:3000/api/slide/create',
		data: formData
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

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
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

// Do after
function addSach(formData) {
	axios({
		method: 'post',
		url: 'http://localhost:3000/api/sach/create',
		data: formData
	}).then(function (res) {
		console.log(res);
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

function addUser() {
	var name = $("input[name*='name-admin']").val();
    var username = $("input[name*='username-admin']").val();
    var email = $("input[name*='email-admin']").val();
    var password = $("input[name*='pass-admin']").val();
    var gender = $("input[name*='gender-admin']").val();

	axios({
		method: 'post',
		url: 'http://localhost:3000/api/auth/signup',
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