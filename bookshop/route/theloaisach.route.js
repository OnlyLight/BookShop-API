var express = require('express');
var router = express.Router();

var controller = require('../controller/theloaisach.controller');

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.get('/search', controller.searchName);

router.post('/create', controller.create);
router.patch('/update/:id', controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;