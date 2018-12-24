$(document).ready(function() {
	$("#btnSignInAdmin").click(function () {
		checkSignInAdmin();
	});

	$("#btnSignIn").click(function () {
		checkSignIn();
	});

	$('.dangxuat').click(function() {
		signout();
	});
});

function checkSignInAdmin() {
	var username = $("input[name*='usernameAdmin']").val();
	var password = $("input[name*='passwordAdmin']").val();
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

		redirectAdmin(res.data.accessToken);
	}).catch(function (error) {
		console.log(error);
		var e = error.response.status;
		if(e === 404) {
			confirm('You are not admin');
		} else if(e === 401) {
			confirm('Invalid Password!');
		}
	});
}

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

		Cookies.set('user-name', username, { expires: 7, path: '/' }); // set cookie to print info

		redirectUser(res.data.accessToken);
	}).catch(function (error) {
		console.log(error);
		var e = error.response.status;
		// if(e === 404) {
		// 	confirm('You are not admin');
		// } else if(e === 401) {
		// 	confirm('Invalid Password!');
		// }

		if(e === 403) {
			confirm('Cannot login !!');
		} else if(e === 500) {
			confirm('Can not access User !');
		}
	});
}

function redirectUser(value) {
	axios({
		method: 'get',
		url: 'http://localhost:3000/api/user',
		headers: {'x-access-token': value}
	}).then(function (res) {
		console.log("login user");
		console.log(res.data);

		Cookies.set('login-user', value, { expires: 7, path: '/' });
		location.href = "/";
	}).catch(function (error) {
		console.log(error);
	});
}

function redirectAdmin(value) {
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
	Cookies.remove('login-user', { path: '/' });
	Cookies.remove('user-name', { path: '/' });
	location.href = "/";
}