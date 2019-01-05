$(document).ready(function() {
	$("#btn-sign-up").click(function () {
        var url = 'http://localhost:3000/api/auth/signup';
        signup(url);
	});
});

function signup(url) {
    var name = $("input[name*='name-sign-in']").val();
    var username = $("input[name*='username-sign-in']").val();
    var email = $("input[name*='email-sign-in']").val();
    var password = $("input[name*='password-sign-in']").val();
    var gender = $("input[name*='gender-sign-in']").val();

    axios({
        method: 'post',
        url: url,
        data: {
            name: name,
            username: username,
            email: email,
            password: password,
            roles: ['user'],
            gender: gender
        }
    }).then(function (res) {
        console.log(res);
        alert('Sign up Success !!');
        location.href = '/';
    }).catch(function (error) {
        console.log(error);
        let e = error.response.status;
		if(e === 404 || e === 500 || e === 403) {
			alert('You are not admin');
		} else if(e === 401) {
			alert('Invalid Password!');
		} else if(e === 400) {
            alert('User name or email is already in use !!');
        }
    });
}