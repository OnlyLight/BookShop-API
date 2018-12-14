var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json())
 
require('./app/router/router.js')(app);

const db = require('./app/config/db.config.js');

const Role = db.role;
  
// force: true will drop the table if it already exists
// db.sequelize.sync({force: true}).then(() => {
//   console.log('Drop and Resync with { force: true }');
//   initial();
// });
 
//require('./app/route/project.route.js')(app);
 
// Create a Server
var server = app.listen(3000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("App listening at http://%s:%s", host, port)
});

var giohang = require('./bookshop/route/giohang.route'); // done
var users = require('./bookshop/route/users.route'); // done
var nhanxet = require('./bookshop/route/nhanxet.route'); // done
var sach = require('./bookshop/route/sach.route');
var theloaisach = require('./bookshop/route/theloaisach.route');

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  next();
});

app.use("/api/giohang", giohang);
app.use("/api/users", users);
app.use("/api/nhanxet", nhanxet);
app.use("/api/sach", sach);
app.use("/api/theloaisach", theloaisach);

function initial(){
	Role.create({
		id: 1,
		name: "USER"
	});
	
	Role.create({
		id: 2,
		name: "ADMIN"
	});
	
	Role.create({
		id: 3,
		name: "PM"
	});
}