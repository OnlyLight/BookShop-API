$(document).ready(function() {
	var pathname = window.location.pathname;
	if(!checkLoginAdmin()) {
		if(pathname === '/admin') {
			confirm('You dont admin !!');
			location.href = "/";
		}
	} else {
		renderHeaderAdminLogin();
	}

	if(checkLoginUser()) {
		renderHeaderUserLogin();
	}
});

function renderHeaderUserLogin() {
	$('.admin').addClass('hide');
	$('.info').removeClass('hide');
	$('.dangky').addClass('hide');
	$('.dangnhap').addClass('hide');
}

function renderHeaderAdminLogin() {
	$('.dangky').addClass('hide');
	$('.dangnhap').addClass('hide');
}

function checkLoginUser() {
    var cookie = Cookies.get('login-user');
    console.log(cookie);
	if(cookie) {
		return true;
	}
	return false;
}

function checkLoginAdmin() {
    var cookie = Cookies.get('login-admin');
    console.log(cookie);
	if(cookie) {
		return true;
	}
	return false;
}