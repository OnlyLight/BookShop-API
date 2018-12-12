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
	var url = "http://localhost:3000/api/sach/filter?matheloai=13";
	const res = await axios.get(url);
	return res.data;
}

function render(items) {
	var content = '';
	for(var item of items) {
		content += '<div class="item"><a href="detail-book.html?id='+item.idsach+'"><img src="'+item.hinhanh+'" class="thumbnail"><div class="caption"><span>'+item.tensach+'</span><br><span>'+item.gia+'</span></div></a></div>';
	}

	$('#render-sachtv').html(content);
}
