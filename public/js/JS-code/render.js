$(document).ready(function() {
	loadBookDataNoiBat();
	loadBookDataKH();
	getBookData().then(function(values) {
		// console.log(values);
		render(values);
	}).catch(function(err) {
		console.log(err);
	});

	getListCategory().then(function(values) {
		// console.log(values);
		renderListCategory(values);
	}).catch(function(err) {
		console.log(err);
	});
	// async - await
	$('#btn-search').click(function() {
		getInfoSearch();
	});

	// $("input[name*='search']").input(function() {
	// 	getInfoSearch();
	// });
});

async function getInfoSearch() {
	var search = $("input[name*='search']").val();
	var url = "http://localhost:3000/api/sach/search?search="+search+"";
	const res = await axios.get(url);
	renderInfoSearch(res.data);
}

async function getBookData() {
	var url = "http://localhost:3000/api/sach/filter?matheloai=13";
	const res = await axios.get(url);
	return res.data;
}

async function getBookDataKH() {
	var url = "http://localhost:3000/api/giohang/top-sellers?limit=5";
	const res = await axios.get(url);
	return res.data;
}

async function getBookDataNoiBat() {
	var url = "http://localhost:3000/api/sach/filter-sachnoibat?noibat=1";
	const res = await axios.get(url);
	return res.data;
}

async function getListCategory() {
	var url = "http://localhost:3000/api/theloaisach/list";
	const res = await axios.get(url);
	return res.data;
}

function functionSearch() {
	getInfoSearch();
}

function loadBookDataKH() {
	getBookDataKH().then(function(values) {
		renderBookDataKH(values);
	}).catch(function(err) {
		console.log(err);
	});
}

function loadBookDataNoiBat() {
	getBookDataNoiBat().then(function(values) {
		renderBookDataNoiBat(values);
	}).catch(function(err) {
		console.log(err);
	});
}

function renderInfoSearch(items) {
	var content = '<div><h3 class="text-center">KẾT QUẢ TÌM KIẾM</h3></div>';
	for(var item of items) {
		content += '<div class="col-xs-3"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" style="width:100%" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#info-search').html(content);
}

function renderBookDataKH(items) {
	var content = '';
	for(var item of items) {
		content += '<div class="item"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#render-sachkh').html(content);
}

function renderBookDataNoiBat(items) {
	var content = '';
	for(var item of items) {
		content += '<div class="item"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#render-sachnoibat').html(content);
}

function renderListCategory(items) {
	var content = '';
	for(var item of items) {
		content += '<li><a href="/category?category='+item.matheloai+'" class="link-left">'+item.tentheloai+'</a></li>';
	}

	$('.list-category').html(content);
}

function render(items) {
	var content = '';
	for(var item of items) {
		content += '<div class="item"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#render-sachtv').html(content);
}
