var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT * FROM giohang";
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
	var sql = "SELECT * FROM giohang WHERE idgiohang = "+id+"";
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
	var sql = "SELECT * FROM giohang WHERE email LIKE '%"+search+"%'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Filter product with idLoai
module.exports.filter = function (req, res) {
	var idSach = req.query.idSach;
	var sql = "SELECT * FROM giohang WHERE idsach = "+idSach+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Pager Products
module.exports.pager = function (req, res) {
	var idSach = req.query.idSach;
	var _limit = req.query._limit;
	var _page = req.query._page;
	var sql = "SELECT * FROM giohang WHERE idsach = "+idSach+" ORDER BY idgiohang DESC LIMIT "+_page+", "+_limit+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Insert new Product
module.exports.create = function (req, res) {
	var email = req.body.email;
	var idSach = req.body.idsach;
	var soluong = req.body.soluong;
	var sql = "INSERT INTO giohang (email, idsach, soluong) VALUES ('"+email+"', "+idSach+", "+soluong+")";
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
	var email = req.body.email;
	var idSach = req.body.idsach;
	var soluong = req.body.soluong;
	var sql = "UPDATE giohang SET email = '"+email+"', idsach = "+idSach+", soluong = '"+soluong+"' WHERE idgiohang = "+id+"";
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
	var sql = "DELETE FROM giohang WHERE idgiohang = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Delete Success !!'});
	});
};