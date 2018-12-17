var express = require('express');
var app = express();
var bodyParser = require('body-parser');


app.use(bodyParser.json())
 
require('./app/router/router.js')(app);

const db = require('./app/config/db.config.js');

const Role = db.role;
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

app.use(express.static("public")); // vào đây để tìm file

app.set("view engine", "pug");
app.set("views", "./FAHASA");

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Credentials", "true");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization, x-access-token");
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
  next();
});

app.use("/api/giohang", giohang);
app.use("/api/users", users);
app.use("/api/nhanxet", nhanxet);
app.use("/api/sach", sach);
app.use("/api/theloaisach", theloaisach);

app.get('/', function(req, res){
	//tra ket qua cho client
	res.render("index");
});

app.get('/detail-book', function(req, res){
	//tra ket qua cho client
	res.render("detail-book");
});

app.get('/category', function(req, res){
	//tra ket qua cho client
	res.render("category");
});

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