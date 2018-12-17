$(document).ready(function() {
	// redirect('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTQ1MDE0NzU1LCJleHAiOjE1NDUxMDExNTV9.Md8P0GIz6p2bMPUEGaUBlI7xvBpZaHWO46pJa8D88ms');

	$("#btnSignIn").click(function () {

		checkSignIn();
	});
});

function checkSignIn() {
	var username = $("input[name*='username']").val();
	var password = $("input[name*='password']").val();

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
		url: 'http://localhost:3000/api/user',
		headers: {'x-access-token': value}
	}).then(function (res) {
		console.log("redirect user !!!");
		console.log(res.data);
		location.href = "/"
	}).catch(function (error) {
		console.log(error);
	});
}