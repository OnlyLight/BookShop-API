$(document).ready(function() {
    userInfo();
    $('#btn-donhang').click(function() {
        getInfoPay();
    });
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

async function getInfoPay() {
	var url = "http://localhost:3000/api/giohang/list";
    const res = await axios.get(url);
    renderPay(res.data);
}

function renderInfoUser(items) {
    var content = '';
    for(var item of items) {
		content += '<div id="render-info"><span>Họ và tên: '+item.name+'</span><br/><span>Email: '+item.email+'</span><br/><span><strong>User name: </strong>'+item.username+'</span></div>';
    }
    
    $('#render-info').html(content);
}

function renderPay(items) {
    let idUserCookie = Cookies.get('id-user-login');
    var content = '<div id="content-cart"><table><tr><th>Hình Ảnh</th><th>Tên Sản Phẩm</th><th>Giá</th><th>Số Lượng</th></tr>';
    
    for(var item of items) {
        if(parseInt(item.pay.data[0]) === 1) {
            if(item.idUser === parseInt(idUserCookie)) {
                content += '<tr><td><img class="img-cart" src="'+item.hinhanh+'" /></td><td>'+item.tensach+'</td><td>'+item.gia+'</td><td><span class="ipSoLuong" style="width: 40px; height: 40px;">'+item.soluong+'</span></td></tr>';
            }
        }
    }
    $('.info-pay').html(content+'</table></div>');
}