var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT * FROM slide";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.listByID = function (req, res) {
	var id = req.params.id;
	var sql = "SELECT * FROM slide WHERE id = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Insert new Product
module.exports.create = function (req, res) {
	var hinhanh = req.file.path.split('\\').slice(1).join('/');
	var sql = "INSERT INTO slide (hinhanh) VALUES ('"+hinhanh+"')";
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
	var hinhanh = req.file.path.split('\\').slice(1).join('/');
	var active = req.body.active;
	var sql = "UPDATE slide SET hinhanh = '"+hinhanh+"', active = "+active+" WHERE id = '"+id+"'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Update Success !!'});
	});
};