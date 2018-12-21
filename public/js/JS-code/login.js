$(document).ready(function() {
	$("#btnSignIn").click(function () {

		checkSignIn();
	});

	$('#dangxuat').click(function() {
		signout();
	});
});

function checkSignIn() {
	var username = $("input[name*='username']").val();
	var password = $("input[name*='password']").val();
	console.log(username + ' - ' + password);

	axios({
		method: 'post',
		url: 'http://localhost:3000/api/auth/signin',
		data: {
			username: username,
			password: password
		}
	}).then(function (res) {
		console.log(res);

		redirect(res.data.accessToken);
	}).catch(function (error) {
		console.log(error);
	});
}

function redirect(value) {
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/admin',
		headers: {'x-access-token': value}
	}).then(function (res) {
		console.log(res.data);
		location.href = "/admin";
		Cookies.set('login-admin', value, { expires: 7, path: '/' });
	}).catch(function (error) {
		console.log(error);
	});
}

function signout() {
	Cookies.remove('login-admin', { path: '/' });
	location.href = "/";
}