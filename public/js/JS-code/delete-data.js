$(document).ready(function() {
	$(document).on('click','.btnTest', function(){
		// console.log($(this).val());
		deleteNX($(this).val());
	});
	
	$(document).on('click','.btnDeleteTheLoai', function(){
		// console.log($(this).val());
		deleteTheLoai($(this).val());
	});
	
	$(document).on('click','.btnDeleteSach', function(){
		// console.log($(this).val());
		deleteSach($(this).val());
	});

	$(document).on('click','.btnDeleteUser', function(){
		// console.log($(this).val());
		deleteUsers($(this).val());
	});
});

function deleteNX(idNX) {
	if(idNX) {
		var r = confirm("Do you want to delete it!");
		if (r === true) {
			executeDeleteNX(idNX);
		}
	}
}

function deleteTheLoai(idTheLoai) {
	if(idTheLoai) {
		var r = confirm("Do you want to delete it!");
		if (r === true) {
			executeDeleteTheLoai(idTheLoai);
		}
	}
}

function deleteSach(idSach) {
	if(idSach) {
		var r = confirm("Do you want to delete it!");
		if (r === true) {
			executeDeleteSach(idSach);
		}
	}
}

function deleteUsers(idUser) {
	if(idUser) {
		var r = confirm("Do you want to delete it!");
		if (r === true) {
			executeDeleteUsers(idUser);
		}
	}
}

function executeDeleteNX(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/nhanxet/delete/'+id+''
	}).then(function (res) {
		console.log(res);
		getFeedBackViewAdmin();
	}).catch(function (error) {
		console.log(error);
	});
}

function executeDeleteTheLoai(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/theloaisach/delete/'+id+''
	}).then(function (res) {
		console.log(res);
		getListCategoryViewAdmin();
	}).catch(function (error) {
		console.log(error);
	});
}

function executeDeleteSach(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/sach/delete/'+id+''
	}).then(function (res) {
		console.log(res);
		getBookViewAdmin();
	}).catch(function (error) {
		console.log(error);
	});
}

function executeDeleteUsers(id) {
    axios({
		method: 'delete',
		url: 'http://localhost:3000/api/users/delete/'+id+''
	}).then(function (res) {
		console.log(res);
		gettUsersViewAdmin();
	}).catch(function (error) {
		console.log(error);
	});
}