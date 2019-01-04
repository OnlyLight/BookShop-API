var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT sach.*, theloaisach.tentheloai FROM sach JOIN theloaisach ON sach.matheloai = theloaisach.matheloai";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.listKho = function (req, res) {
	var sql = "SELECT sach.*, sach.soluong-giohang.soluong AS soluongton, giohang.pay FROM sach LEFT JOIN giohang ON giohang.idsach = sach.idsach";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Get Data by ID
module.exports.listByID = function (req, res) {
	var id = req.params.id;
	var sql = "SELECT sach.*, theloaisach.tentheloai, sach.soluong-giohang.soluong AS soluongton FROM sach JOIN theloaisach ON sach.matheloai = theloaisach.matheloai LEFT JOIN giohang ON giohang.idsach = sach.idsach WHERE sach.idsach = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Search Name Product have in list products
module.exports.searchName = function (req, res) {
	var search = req.query.search;
	var sql = "SELECT * FROM sach WHERE tensach LIKE '%"+search+"%'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.filter = function (req, res) {
	var matheloai = req.query.matheloai;
	var sql = "SELECT * FROM sach WHERE matheloai = "+matheloai+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.filterNoiBat = function (req, res) {
	var noibat = req.query.noibat;
	var sql = "SELECT * FROM sach WHERE noibat = "+noibat+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.pager = function (req, res) {
	var matheloai = req.query.matheloai;
	var _limit = req.query._limit;
	var _page = req.query._page;
	var sql = "SELECT * FROM sach WHERE matheloai = "+matheloai+" ORDER BY matheloai DESC LIMIT "+_page+", "+_limit+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Insert new Product
module.exports.create = function (req, res) {
	var tensach = req.body.tensach;
	var sotrang = req.body.sotrang;
	var hinhanh = req.file.path.split('\\').slice(1).join('/');
	var gia = req.body.gia;
	var tennhacc = req.body.tennhacc;
	var tacgia = req.body.tacgia;
	var nxb = req.body.nxb;
	var namxuatban = req.body.namxuatban;
	var kichthuoc = req.body.kichthuoc;
	var hinhthuc = req.body.hinhthuc;
	var ngonngu = req.body.ngonngu;
	var review = req.body.review;
	var matheloai = req.body.matheloai;
	var noibat = req.body.noibat;
	var soluong = req.body.soluong;
	var sql = "INSERT INTO sach (tensach, sotrang, hinhanh, gia, tennhacc, tacgia, nxb, namxuatban, kichthuoc, hinhthuc, ngonngu, review, matheloai, noibat, soluong) VALUES ('"+tensach+"', "+sotrang+", '"+hinhanh+"', "+gia+", '"+tennhacc+"', '"+tacgia+"', '"+nxb+"', "+namxuatban+", '"+kichthuoc+"', '"+hinhthuc+"', '"+ngonngu+"', '"+review+"', "+matheloai+", "+noibat+", "+soluong+")";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Create Success !!'});
	});
};

// Update Product By Id
module.exports.update = function (req, res) {
	var id = req.params.id;
	var tensach = req.body.tensach;
	var sotrang = req.body.sotrang;
	var hinhanh = req.file.path.split('\\').slice(1).join('/');
	var gia = req.body.gia;
	var tennhacc = req.body.tennhacc;
	var tacgia = req.body.tacgia;
	var nxb = req.body.nxb;
	var namxuatban = req.body.namxuatban;
	var kichthuoc = req.body.kichthuoc;
	var hinhthuc = req.body.hinhthuc;
	var ngonngu = req.body.ngonngu;
	var review = req.body.review;
	var matheloai = req.body.matheloai;
	var noibat = req.body.noibat;
	var soluong = req.body.soluong;
	var sql = "UPDATE sach SET tensach = '"+tensach+"', sotrang = "+sotrang+", hinhanh = '"+hinhanh+"', gia = '"+gia+"', tennhacc = '"+tennhacc+"', tacgia = '"+tacgia+"', nxb = '"+nxb+"', namxuatban = '"+namxuatban+"', kichthuoc = '"+kichthuoc+"', hinhthuc = '"+hinhthuc+"', ngonngu = '"+ngonngu+"', review = '"+review+"', matheloai= "+matheloai+", noibat = "+noibat+", soluong = "+soluong+" WHERE idsach = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Update Success !!'});
	});
};

// Delete Product By Id
module.exports.delete = function (req, res) {
	var id = req.params.id;
	var sql = "DELETE FROM sach WHERE idsach = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Delete Success !!'});
	});
};