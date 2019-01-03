$(document).ready(function() {
	getListCategoryViewAdmin();    

	//////////////////////
	getBookViewAdmin();
	
    //////////////////////
    gettUsersViewAdmin();
    
    // ////////////////////////
    getFeedBackViewAdmin();
    
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

function getFeedBackViewAdmin() {
	getFeedback().then(function(values) {
        console.log(values);
		renderFeedback(values);
	}).catch(function(err) {
		console.log(err);
	});
}

function gettUsersViewAdmin() {
	getUsers().then(function(values) {
        console.log(values);
		renderUsers(values);
	}).catch(function(err) {
		console.log(err);
    });
}

function getBookViewAdmin() {
	getBook().then(function(values) {
        console.log(values);
		renderBook(values);
	}).catch(function(err) {
		console.log(err);
    });
}

function getListCategoryViewAdmin() {
	getListCategory().then(function(values) {
		console.log('Category');
        console.log(values);
		renderTheLoai(values);
	}).catch(function(err) {
		console.log(err);
	});
}

function renderTheLoai(items) {
	var loadCategory = '';
	var content = '<tr><th>Mã Thể Loại</th><th>Tên Thể Loại</th><th>Action</th></tr>';
	for(var item of items) {
		loadCategory += '<option value="'+item.matheloai+'">'+item.tentheloai+'</option>';
		content += '<tr><td>'+item.matheloai+'</td><td>'+item.tentheloai+'</td><td><a style="margin-right: 1rem; width: 80px;" class="btn btn-sm btn-warning" href="/edit-theloai?id='+item.matheloai+'">EDIT</a><button value="'+item.matheloai+'" style="width: 80px;" class="btn btn-sm btn-danger btnDeleteTheLoai">DELETE</button></td></tr>';
	}

	$('#render-theloai').html(content);
	$('#load-category').html(loadCategory);
}

function renderBook(items) {
	var content = '<tr><th>ID Sách</th><th>Tên Sách</th><th>Hình ảnh</th><th>Giá</th><th>Tên Tác Giả</th><th>Hình Thức</th><th>Số Trang</th><th>Thể Loại</th><th>Action</th></tr>';
	for(var item of items) {
		content += '<tr><td>'+item.idsach+'</td><td>'+item.tensach+'</td><td><div class="col-sm-4"></div><img class="img-responsive col-sm-4" src="'+item.hinhanh+'" /><div class="col-sm-4"></div></td><td>'+item.gia+'</td><td>'+item.tacgia+'</td><td>'+item.hinhthuc+'</td><td>'+item.sotrang+'</td><td>'+item.tentheloai+'</td><td><a style="width: 80px;" class="btn btn-sm btn-warning" href="/edit-sach?id='+item.idsach+'">EDIT</a><button value="'+item.idsach+'" style="width: 80px;" class="btn btn-sm btn-danger btnDeleteSach">DELETE</button></td></tr>';
	}

	$('#render-book').html(content);
}

// Continute
function renderUsers(items) {
	var giotinh = '';
	var content = '<tr><th>Email</th><th>Họ Tên</th><th>User name</th><th>Giới Tính</th><th>Quyền Truy Cập</th><th>Action</th></tr>';
	for(var item of items) {
		if(item.gender == 0) giotinh = 'Nam';
		else giotinh = 'Nữ';
		content += '<tr><td>'+item.email+'</td><td>'+item.name+'</td><td>'+item.username+'</td><td>'+giotinh+'</td><td>'+item.role_name+'</td><td><a style="width: 80px;" class="btn btn-sm btn-warning" href="/edit-user?id='+item.id+'">EDIT</a><button value="'+item.id+'" style="width: 80px;" class="btn btn-sm btn-danger btnDeleteUser">DELETE</button></td></tr>';
	}

	$('#render-users').html(content);
}

function renderFeedback(items) {
	var content = '<tr><th>Tên Khách Hàng</th><th>Ngày Nhận Xét</th><th>Lời Nhận Xét</th><th>Action</th></tr>';
	for(var item of items) {
		content += '<tr><td>'+item.name+'</td><td>'+item.ngayhientai+'</td><td>'+item.nhanxet+'</td><td><button value="'+item.idnhanxet+'" style="width: 80px;" class="btn btn-sm btn-danger btnTest">DELETE</button></td></tr></td></tr>';
	}

	$('#render-feedback').html(content);
}