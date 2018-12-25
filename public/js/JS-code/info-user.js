$(document).ready(function() {
    userInfo();
});

function userInfo() {
    getIdUser().then(function(values) {
        console.log(values); // Get ID
        renderInfoUser(values);
	}).catch(function(err) {
		console.log(err);
	});
}

async function getIdUser() {
    var cookieUser = Cookies.get('user-name');
	var url = "http://localhost:3000/api/users/search-user?search="+cookieUser+"";
	const res = await axios.get(url);
	return res.data;
}

function renderInfoUser(items) {
    var content = '';
    for(var item of items) {
		content += '<div id="render-info"><span>Họ và tên: '+item.name+'</span><br/><span>Email: '+item.email+'</span><br/><span><strong>User name: </strong>'+item.username+'</span></div>';
    }
    
    $('#render-info').html(content);
}