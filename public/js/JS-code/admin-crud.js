$(document).ready(function() {
	getListCategory().then(function(values) {
        console.log(values);
		renderTheLoai(values);
	}).catch(function(err) {
		console.log(err);
	});
    // async - await
    
    getBook().then(function(values) {
        console.log(values);
		renderBook(values);
	}).catch(function(err) {
		console.log(err);
    });
    //////////////////////
    
    getUsers().then(function(values) {
        console.log(values);
		renderUsers(values);
	}).catch(function(err) {
		console.log(err);
    });
    // ////////////////////////
    
    // getFeedback().then(function(values) {
    //     console.log(values);
	// 	renderTheLoai(values);
	// }).catch(function(err) {
	// 	console.log(err);
	// });
});

async function getListCategory() {
	var url = "http://localhost:3000/api/theloaisach/list";
	const res = await axios.get(url);
	return res.data;
}

async function getBook() {
	var url = "http://localhost:3000/api/sach/list";
	const res = await axios.get(url);
	return res.data;
}

async function getUsers() {
	var url = "http://localhost:3000/api/users/list";
	const res = await axios.get(url);
	return res.data;
}

async function getFeedback() {
	var url = "http://localhost:3000/api/nhanxet/list";
	const res = await axios.get(url);
	return res.data;
}

function renderTheLoai(items) {
	var content = '<tr><th>Mã Thể Loại</th><th>Tên Thể Loại</th><th>Action</th></tr>';
	for(var item of items) {
		content += '<tr><td>'+item.matheloai+'</td><td>'+item.tentheloai+'</td><td><a style="margin-right: 1rem; width: 80px;" class="btn btn-sm btn-warning" href="edit-theloai.html">EDIT</a><a style="width: 80px;" class="btn btn-sm btn-danger" href="">DELETE</a></td></tr>';
	}

	$('#render-theloai').html(content);
}

function renderBook(items) {
	var content = '<tr><th>ID Sách</th><th>Tên Sách</th><th>Giá</th><th>Tên Tác Giả</th><th>Hình Thức</th><th>Số Trang</th><th>Mã Thể Loại</th><th>Action</th></tr>';
	for(var item of items) {
		content += '<tr><td>'+item.idsach+'</td><td>'+item.tensach+'</td><td>'+item.gia+'</td><td>'+item.tacgia+'</td><td>'+item.hinhthuc+'</td><td>'+item.sotrang+'</td><td>'+item.matheloai+'</td><td><a style="width: 80px;" class="btn btn-sm btn-warning" href="edit-sach.html">EDIT</a><a style="width: 80px;" class="btn btn-sm btn-danger" href="">DELETE</a></td></tr>';
	}

	$('#render-book').html(content);
}


// Continute
function renderUsers(items) {
	var content = '<tr><th>Email</th><th>Họ Tên</th><th>Giới Tính</th><th>Quyền Truy Cập</th><th>Action</th></tr>';
	for(var item of items) {
		content += '';
	}

	$('#render-book').html(content);
}