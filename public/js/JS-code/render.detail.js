$(document).ready(function() {
	getBookDetail().then(function(values) {
		console.log(values);
		render(values);
	}).catch(function(err) {
		console.log(err);
	});
	// async - await
	getFeedback().then(function(values) {
		console.log(values);
		renderFeedback(values);
	}).catch(function(err) {
		console.log(err);
	});
});

async function getBookDetail() {
	var id = GetURLParameter('id');
	var url = "http://localhost:3000/api/sach/list/"+id+"";
	const res = await axios.get(url);
	return res.data;
}

async function getFeedback() {
	var id = GetURLParameter('id');
	var url = "http://localhost:3000/api/nhanxet/filter?idsach="+id+"";
	const res = await axios.get(url);
	return res.data;
}

function render(items) {
	var content = '';
	var showImg = '';
	var showDetail = '';
	var listDetail = '';
	for(var item of items) {
		content += '<tr><th>Mã hàng</th><td>'+item.idsach+'</td></tr><tr><th>Tên nhà cung cấp</th><td>'+item.tennhacc+'</td></tr><tr><th>Tác giả</th><td>'+item.tacgia+'</td></tr><tr><th>Nhà xuất bản</th><td>'+item.nxb+'</td></tr><th>Năm xuất bảng</th><td>'+item.namxuatban+'</td></tr><tr><th>Kích thước</th><td>'+item.kichthuoc+'</td></tr><tr><th>Số trang</th><td>'+item.sotrang+'</td></tr><tr><th>Hình thức</th><td>'+item.hinhthuc+'</td></tr><tr><th>Ngôn ngữ</th><td>'+item.ngonngu+'</td></tr>';
		showImg += '<img src="'+item.hinhanh+'" class="img-responsive">';
		showImg += '<span class="tensach">'+item.tensach+'</span><br><span class="gia">'+item.gia+'đ</span>';
		listDetail += '<br/><div class="link-col-right"><span>Tên Nhà Cung Cấp: '+item.tennhacc+' </span></div><hr/><div class="link-col-right"><span>Hình Thức: '+item.hinhthuc+'</span></div><hr/><div class="link-col-right"><span>Tình Trạng: '+item.tinhtrang+'</span></div><hr/>';
	}

	$('#load-detail').html(content);
	$('#show-img').html(showImg);
	$('#show-detail').html(showDetail);
	$('#list-detail').html(listDetail);
}

function renderFeedback(items) {
	var nhanXet = '';
	for(var item of items) {
		nhanXet += '<span>Nhận xét bởi</span><span style="color: #2aabd2;"> '+item.hoten+'</span><span> Vào Ngày: '+item.ngayhientai+'</span><br/><span>Nhận Xét: '+item.nhanxet+'</span><br /><br />';
	}
	$('#nhan-xet-cua-kh').html(nhanXet);
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
