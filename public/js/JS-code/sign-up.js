$(document).ready(function() {
	$("#submit").submit(function (e) {
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
        confirm('Sign Up Success !!');        
    }).catch(function (error) {
        console.log(error);
    });
}