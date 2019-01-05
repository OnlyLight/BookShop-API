$(document).ready(function() {
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

	loadBookDataNoiBat();
	loadBookDataKH();
	loadArrayRecent();
	getSlide();
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

async function getSlide() {
	var url = "http://localhost:3000/api/slide/list";
	const res = await axios.get(url);
	renderSlide(res.data);
}

function renderSlide(items) {
	var content = '<div class="item active"><a href="#"><img class="img-responsive" src="'+items[0].hinhanh+'"/></a></div>';

	let length = items.length
	for(let i = 0; i < length; i++) {
		if(i > 0) {
			content += '<div class="item"><a href="#"><img class="img-responsive" src="'+items[i].hinhanh+'"/></a></div>';
		}
	}

	$('#show-slide').html(content);
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
	var content = '<div><h3 class="text-center">KẾT QUẢ TÌM KIẾM</h3></div><div><span>Tìm được '+items.length+' kết quả</span></div>';
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

function loadArrayRecent() {
	let arrRecent = JSON.parse(localStorage.getItem('arr-recent'));
	let idRecent = parseInt(localStorage.getItem('id-book-recent'));
	// if(!idRecent) idRecent = 1;

	if(arrRecent) {
		if(idRecent) {
			var findIndex = _.findIndex(arrRecent, function(item) { return item === idRecent; });
			if(findIndex === -1) {
				arrRecent.push(idRecent);
			}	
		}		
		
		if(arrRecent.length > 5) {
			arrRecent.shift();
		}
		localStorage.setItem('arr-recent', JSON.stringify(arrRecent));
	} else {
		if(idRecent) {
			localStorage.setItem('arr-recent', JSON.stringify([idRecent]));
		}
	}

	arrRecent = JSON.parse(localStorage.getItem('arr-recent'));

	let length = arrRecent.length;
	let content = '';

	if(length > 0) {
		for(let i = 0; i < length; i++) {
			axios({
				method: 'get',
				url: 'http://localhost:3000/api/sach/list/'+arrRecent[i]+''
			}).then(function (res) {
				console.log(res.data);
	
				let item = res.data[0];
				content += '<div class="item"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
				$('#render-recent').html(content);
			}).catch(function (error) {
				console.log(error);
			});
		}
	}
}