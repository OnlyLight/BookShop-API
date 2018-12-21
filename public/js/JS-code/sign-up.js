$(document).ready(function() {
	$("#btn-sign-up").click(function () {
		signup();
	});
});

function signup() {
    var name = $("input[name*='name']").val();
    var username = $("input[name*='username']").val();
    var email = $("input[name*='email']").val();
    var password = $("input[name*='password']").val();
    var gender = $("input[name*='gender']").val();
	console.log(name + ' - ' + username + ' - ' + email + ' - ' + password + ' - ' + gender);
}