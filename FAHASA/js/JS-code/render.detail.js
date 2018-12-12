$(document).ready(function() {
	getBookData().then(function(values) {
		console.log(values);
		render(values);
	}).catch(function(err) {
		console.log(err);
	});
	// async - await
});

async function getBookData() {
	var id = GetURLParameter('id');
	console.log(id);
	var url = "http://localhost:3000/api/sach/list/"+id+"";
	const res = await axios.get(url);
	return res.data;
}

function render(items) {
	var content = '';
	var showImg = '';
	var showDetail = '';
	for(var item of items) {
		content += '<tr><th>Mã hàng</th><td>'+item.idsach+'</td></tr><tr><th>Tên nhà cung cấp</th><td>'+item.tennhacc+'</td></tr><tr><th>Tác giả</th><td>'+item.tacgia+'</td></tr><tr><th>Nhà xuất bản</th><td>'+item.nxb+'</td></tr><th>Năm xuất bảng</th><td>'+item.namxuatban+'</td></tr><tr><th>Kích thước</th><td>'+item.kichthuoc+'</td></tr><tr><th>Số trang</th><td>'+item.sotrang+'</td></tr><tr><th>Hình thức</th><td>'+item.hinhthuc+'</td></tr><tr><th>Ngôn ngữ</th><td>'+item.ngonngu+'</td></tr>';
		showImg += '<img src="'+item.hinhanh+'" class="img-responsive">';
		showImg += '<span class="tensach">'+item.tensach+'</span><br><span class="gia">'+item.gia+'đ</span>';
	}

	$('#load-detail').html(content);
	$('#show-img').html(showImg);
	$('#show-detail').html(showDetail);
}

function GetURLParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}
