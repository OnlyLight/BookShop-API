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

// Get Data by ID
module.exports.listByID = function (req, res) {
	var id = req.params.id;
	var sql = "SELECT * FROM sach WHERE idsach = "+id+"";
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
	var sql = "SELECT * FROM sach WHERE tensach LIKE '%"+search+"%' OR tennhacc LIKE '%"+search+"%' OR tacgia LIKE '%"+search+"%' OR nxb LIKE '%"+search+"%' OR hinhthuc LIKE '%"+search+"%' OR ngonngu LIKE '%"+search+"%' OR tinhtrang LIKE '%"+search+"%'";
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
	var tinhtrang = req.body.tinhtrang;
	var review = req.body.review;
	var matheloai = req.body.matheloai;
	var noibat = req.body.noibat;
	var sql = "INSERT INTO sach (tensach, sotrang, hinhanh, gia, tennhacc, tacgia, nxb, namxuatban, kichthuoc, hinhthuc, ngonngu, tinhtrang, review, matheloai, noibat) VALUES ('"+tensach+"', "+sotrang+", '"+hinhanh+"', "+gia+", '"+tennhacc+"', '"+tacgia+"', '"+nxb+"', "+namxuatban+", '"+kichthuoc+"', '"+hinhthuc+"', '"+ngonngu+"', '"+tinhtrang+"', '"+review+"', "+matheloai+", "+noibat+")";
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
	var tinhtrang = req.body.tinhtrang;
	var review = req.body.review;
	var matheloai = req.body.matheloai;
	var noibat = req.body.noibat;
	var sql = "UPDATE sach SET tensach = '"+tensach+"', sotrang = "+sotrang+", hinhanh = '"+hinhanh+"', gia = '"+gia+"', tennhacc = '"+tennhacc+"', tacgia = '"+tacgia+"', nxb = '"+nxb+"', namxuatban = '"+namxuatban+"', kichthuoc = '"+kichthuoc+"', hinhthuc = '"+hinhthuc+"', ngonngu = '"+ngonngu+"', tinhtrang = '"+tinhtrang+"', review = '"+review+"', matheloai= '"+matheloai+"', noibat = '"+noibat+"' WHERE idsach = "+id+"";
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