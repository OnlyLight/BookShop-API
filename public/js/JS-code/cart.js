$(document).on('focusout','.ipSoLuong', function(){
    var id = $(this).attr('data-id');
    var soluong = $(this).val();
    var dongia = $(this).attr('data-price');
    console.log('id: ' + id + ' - soluong: ' + soluong + ' - dongia: ' + dongia);
    updateQuality(id, soluong, dongia);
});

$(document).on('click','.btnDeleteCart', function(){
    var id = $(this).val();
    console.log('id: ' + id);
    deleteItem(id);
});

var arrId = [];

$(document).ready(function() {
    getInfoCart();
    addProductDistint();
    $('#btn-pay').click(function() {
        let idUserCookie = Cookies.get('id-user-login');
        Pay(idUserCookie);
    });
});

function Pay(id) {
    var url = "http://localhost:3000/api/giohang/updatePay/"+id+"";
    axios({
		method: 'patch',
        url: url,
        data: {
            pay: 1
        }
	}).then(function (res) {
        console.log(res);
        getInfoCart();
	}).catch(function (error) {
		console.log(error);
	});
}

function addProductDistint() {
    let soluong = 1;
    let idUserCookie = Cookies.get('id-user-login');
    var idsachAdd = GetURLParameter('id');

    $('.mua').click(function() {
        let arrCart = JSON.parse(localStorage.getItem('cart'));
        // test return index in array
        var findIndex = _.findIndex(arrCart, function(item) { return item.idsach === parseInt(idsachAdd); });
        
        if(findIndex === -1) {
            addProduct(soluong, idsachAdd, idUserCookie);
        } else {
            updateQuality(arrCart[findIndex].id, (arrCart[findIndex].soluong + 1), arrCart[findIndex].dongia);
        }
    });
}

function addProduct(soluong, idsach, idUser) {
    axios({
		method: 'post',
        url: 'http://localhost:3000/api/giohang/create',
        data: {
            soluong: soluong,
            idsach: idsach,
            idUser: idUser
        }
	}).then(function (res) {
        console.log(res);
        getInfoCart();
	}).catch(function (error) {
		console.log(error);
	});
}

function updateQuality(id, soluong, dongia) {
    var total = soluong * dongia;
    axios({
		method: 'patch',
        url: 'http://localhost:3000/api/giohang/update/'+id+'',
        data: {
            soluong: soluong,
            thanhtien: total
        }
	}).then(function (res) {
        console.log(res);
        getInfoCart();
	}).catch(function (error) {
		console.log(error);
	});
}

function deleteItem(id) {
    axios({
		method: 'delete',
        url: 'http://localhost:3000/api/giohang/delete/'+id+''
	}).then(function (res) {
        console.log(res);
        getInfoCart();
	}).catch(function (error) {
		console.log(error);
	});
}

function getInfoCart() {
    axios({
		method: 'get',
		url: 'http://localhost:3000/api/giohang/list'
	}).then(function (res) {
        console.log(res.data);
        renderCart(res.data);

        let arrCart = JSON.stringify(res.data);
        localStorage.setItem('cart', arrCart);
	}).catch(function (error) {
		console.log(error);
	});
}

function renderCart(items) {
    var content = '<tr><th>Gỡ Bỏ</th><th>Hình Ảnh</th><th>Tên Sản Phẩm</th><th>Giá</th><th>Số Lượng</th></tr>';
    var total = 0;
    var quality = 0;
    var idUserCookie = Cookies.get('id-user-login');

	for(var item of items) {
        if(parseInt(item.pay.data[0]) === 0) {
            if(item.idUser == idUserCookie) {
                content += '<tr><td><button value="'+item.id+'" class="btn btn-danger btnDeleteCart"><span class="glyphicon glyphicon-remove"></span></button></td><td><img class="img-cart" src="'+item.hinhanh+'" /></td><td>'+item.tensach+'</td><td>'+item.gia+'</td><td><input class="ipSoLuong" style="width: 40px; height: 40px;" type="number" value="'+item.soluong+'" data-price="'+item.gia+'" data-id="'+item.id+'" min="0" name="soluong" /></td></tr>';
                total += item.thanhtien;
                quality++;
            }
        }
    }
    var iconCart = '<span class="glyphicon glyphicon-shopping-cart"> '+quality+' Sản phẩm</span>';
    var showBill = '<strong>TỔNG SỐ TIỀN &nbsp;</strong><span>'+total+'</span>';

    $('#render-cart').html(content);
    $('#bill').html(showBill);

    if(checkLoginUser()) {
        $('#icon-cart').html(iconCart);
    }
}