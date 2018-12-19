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
});

async function getBookData() {
	var url = "http://localhost:3000/api/sach/filter?matheloai=13";
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

function checkLogin() {
	var cookie = Cookies.get('login');
	if(cookie) {
		$('#dangky').addClass('hide');
		$('#dangnhap').addClass('hide');
	}
}

function render(items) {
	checkLogin();
	var content = '';
	for(var item of items) {
		content += '<div class="item"><a href="/detail-book?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#render-sachtv').html(content);
}
