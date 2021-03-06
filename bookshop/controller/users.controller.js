var con = require('../dbconnect');

// Get All Data
module.exports.list = function (req, res) {
	var sql = "SELECT users.*, roles.name as role_name FROM users JOIN user_roles ON users.id = user_roles.userId JOIN roles ON user_roles.roleId = roles.id";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.listByID = function (req, res) {
	var id = req.params.id;
	var sql = "SELECT * FROM users WHERE id = "+id+"";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

module.exports.searchUser = function (req, res) {
	var search = req.query.search;
	var sql = "SELECT * FROM users WHERE username LIKE '%"+search+"%'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Search Name Product have in list products
module.exports.searchEmail = function (req, res) {
	var search = req.query.search;
	var sql = "SELECT * FROM users WHERE email LIKE '%"+search+"%'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Filter product with idLoai
module.exports.filter = function (req, res) {
	var gender = req.query.gender;
	var sql = "SELECT * FROM users WHERE gender = '"+gender+"'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json(results);
	});
};

// Update Product By Id
module.exports.update = function (req, res) {
	var id = req.params.id;
	var username = req.body.username;
	var email = req.body.email;
	var name = req.body.name;
	var gender = req.body.gender;
	var sql = "UPDATE users SET name = '"+name+"', username = '"+username+"', email = '"+email+"', gender = '"+gender+"' WHERE id = '"+id+"'";
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
	var sql = "DELETE FROM users WHERE id = '"+id+"'";
	con.query(sql, function(err, results) {
		// If Error crash here
		if (err) throw err;
		// If don't have Error return results
		res.json({'message': 'Delete Success !!'});
	});
};