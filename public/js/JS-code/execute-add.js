$(document).ready(function() {
    $('#btnAddTheLoai').click(function() {
		addTheLoai();
	});
	
	$('#btnAddAdmin').click(function() {
		addUser();
	});

	$('#btn-add-sach').click(function() {
		
		var file = $("input[name*='file']").files;
		alert(file);
		// addSach();
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
		location.href = '/admin';
	}).catch(function (error) {
		console.log(error);
	});
}

// Do after
function addSach() {
	var tensach = $("input[name*='tensach']").val();
	var file = $("input[name*='file']").files;
	var gia = $("input[name*='gia']").val();
	var tacgia = $("input[name*='tacgia']").val();
	var sotrang = $("input[name*='sotrang']").val();
	var kichthuoc = $("input[name*='kichthuoc']").val();
	var hinhthuc = $("input[name*='hinhthuc']").val();
	var tennhacc = $("input[name*='tennhacc']").val();
	var nxb = $("input[name*='nxb']").val();
	var namxb = $("input[name*='namxb']").val();
	var tinhtrang = $("input[name*='tinhtrang']").val();
	var noibat = $("input[name*='noibat']").val();
	var theloai = $("input[name*='theloai']").val();
	var review = $("input[name*='review']").val();
	var ngonngu = $("input[name*='ngonngu']").val();

	axios({
		method: 'post',
		url: 'http://localhost:3000/api/sach/create',
		data: {
			tensach: tensach,
			sotrang: sotrang,
			file: file,
			gia: gia,
			tennhacc: tennhacc,
			tacgia: tacgia,
			nxb: nxb,
			namxuatban: namxb,
			kichthuoc: kichthuoc,
			hinhthuc: hinhthuc,
			ngonngu: ngonngu,
			tinhtrang: tinhtrang,
			review: review,
			matheloai: theloai,
			noibat: noibat
		}
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