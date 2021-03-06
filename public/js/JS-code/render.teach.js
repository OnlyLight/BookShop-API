$(document).ready(function() {
	getDetail().then(function(values) {
		// console.log(values);
		render(values);
	}).catch(function(err) {
		console.log(err);
	});
	// async - await

	getSize().then(function(values) {
		// console.log(values.length);
		renderPag(values);
	}).catch(function(err) {
		console.log(err);
	});

	getListCategory().then(function(values) {
		// console.log(values);
		renderListCategory(values);
	}).catch(function(err) {
		console.log(err);
	});
});

async function getDetail() {
	var _page = GetURLParameter('_page') || 1;
	var _category = GetURLParameter('category');
	let total = parseInt(localStorage.getItem('total'));

	if (_page > total){
		_page = total;
	}
	else if (_page < 1){
		_page = 1;
	}
	 
	// Tìm Start
	let start = (_page - 1) * 4;

	var url = "http://localhost:3000/api/sach/pager?matheloai="+_category+"&_limit=4&_page="+start+"";
	const res = await axios.get(url);
	return res.data;
}

async function getSize() {
	var _category = GetURLParameter('category');
	var url = "http://localhost:3000/api/sach/filter?matheloai="+_category+"";
	const res = await axios.get(url);
	return res.data;
}

async function getListCategory() {
	var url = "http://localhost:3000/api/theloaisach/list";
	const res = await axios.get(url);
	return res.data;
}

function renderListCategory(items) {
	var content = '';
	for(var item of items) {
		content += '<li><a href="/category?category='+item.matheloai+'" class="link-left">'+item.tentheloai+'</a></li>';
	}

	$('.list-category').html(content);
}

function renderPag(items) {
	var content = '';
	var length = Math.ceil(items.length/4);
	localStorage.setItem('total', length);
	var _category = GetURLParameter('category');

	for(var i = 0; i < length; i++) {
		content += '<li><a href="/category?category='+_category+'&_page='+(i+1)+'" class="link-page">'+(i+1)+'</a></li>';
	}

	$('#render-pag').html(content);
}

function render(items) {
	var content = '';
	let contentXS = '';
	for(var item of items) {
		content += '<div class="col-sm-3"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail img-responsive"></a><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'đ</span></div></div>';
		contentXS += '<div class="col-xs-6"><a href="/detail-book?id='+item.idsach+'"><img class="thumbnail img-responsive" src="'+item.hinhanh+'"/><div class="caption"><span>'+item.tensach+'</span><br/><span>'+item.gia+'đ</span></div></a></div>';
	}

	$('#render-teach').html(content);
	
	$(window).resize(function() {
		var width = $(window).width();
		if (width < 768){
			$('#render-list-xs').html(contentXS);
		}
	});
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
