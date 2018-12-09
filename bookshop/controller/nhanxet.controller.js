var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT * FROM nhanxet";
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
	var sql = "SELECT * FROM nhanxet WHERE idnhanxet = "+id+"";
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
	var sql = "SELECT * FROM nhanxet WHERE hoten LIKE '%"+search+"%' OR tensach LIKE '%"+search+"%'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Insert new Product
module.exports.create = function (req, res) {
	var hoten = req.body.hoten;
	var tensach = req.body.tensach;
	var nhanxet = req.body.nhanxet;
	var sql = "INSERT INTO nhanxet (hoten, tensach, nhanxet) VALUES ('"+hoten+"', '"+tensach+"', '"+nhanxet+"')";
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
	var hoten = req.body.hoten;
	var tensach = req.body.tensach;
	var nhanxet = req.body.nhanxet;
	var sql = "UPDATE nhanxet SET hoten = '"+hoten+"', tensach = '"+tensach+"', nhanxet = '"+nhanxet+"' WHERE idnhanxet = "+id+"";
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
	var sql = "DELETE FROM nhanxet WHERE idnhanxet = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Delete Success !!'});
	});
};