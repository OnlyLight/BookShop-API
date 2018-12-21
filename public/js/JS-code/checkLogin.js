$(document).ready(function() {
	var pathname = window.location.pathname;
	if(!checkLoginAdmin()) {
		if(pathname === '/admin') {
			confirm('You dont admin !!');
			location.href = "/";
		}
	} else {
		renderHeader();
	}
});

function renderHeader() {
	$('#admin').removeClass('hide');
	$('#dangky').addClass('hide');
	$('#dangnhap').addClass('hide');
}

function checkLoginAdmin() {
    var cookie = Cookies.get('login-admin');
    console.log(cookie);
	if(cookie) {
		return true;
	}
	return false;
}