$(document).ready(function() {
	showHeader();
	cart();
});

function showHeader() {
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
}

function cart() {
	$('#icon-cart, .mua').click(function() {
		if(!checkLoginUser()) {
			alert('You need login to buy !!');
		} else {
			location.href = "/cart";
		}
	});
}

function renderHeaderUserLogin() {
	$('.admin').addClass('hide');
	$('.info').removeClass('hide');
	$('.dangky').addClass('hide');
	$('.dangnhap').addClass('hide');
	$('.dangxuat').removeClass('hide');
	getInfoCart();
}

function renderHeaderAdminLogin() {
	$('.dangky').addClass('hide');
	$('.dangnhap').addClass('hide');
	$('.dangxuat').removeClass('hide');
	$('.cart-admin').addClass('hide');
	getInfoCart();
}

function checkLoginUser() {
    var cookie = Cookies.get('login-user');
    // console.log(cookie);
	if(cookie) {
		return true;
	}
	return false;
}

function checkLoginAdmin() {
    var cookie = Cookies.get('login-admin');
    // console.log(cookie);
	if(cookie) {
		return true;
	}
	return false;
}