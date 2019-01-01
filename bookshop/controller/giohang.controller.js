var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT giohang.id, giohang.soluong, giohang.idUser, sach.hinhanh, sach.tensach, sach.gia, sach.gia*giohang.soluong AS thanhtien FROM giohang JOIN sach ON giohang.idsach = sach.idsach";
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
	var sql = "SELECT * FROM giohang WHERE id = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.filter = function (req, res) {
	var idUser = req.query.idUser;
	var sql = "SELECT * FROM giohang WHERE idUser = "+idUser+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.top = function (req, res) {
	var limit = req.query.limit;
	var sql = "SELECT sach.*, giohang.soluong, giohang.idsach FROM giohang JOIN sach ON giohang.idsach = sach.idsach LIMIT "+limit+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Insert new Product
module.exports.create = function (req, res) {
	var soluong = req.body.soluong;
	var idSach = req.body.idsach;
	var idUser = req.body.idUser;
	var sql = "INSERT INTO giohang (soluong, idsach, idUser) VALUES ("+soluong+", "+idSach+", "+idUser+")";
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
	var soluong = req.body.soluong;
	var thanhtien = req.body.thanhtien;
	var sql = "UPDATE giohang SET soluong = "+soluong+" WHERE id = "+id+"";
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
	var sql = "DELETE FROM giohang WHERE id = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Delete Success !!'});
	});
};