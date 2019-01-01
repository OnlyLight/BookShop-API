var express = require('express');
var router = express.Router();

var controller = require('../controller/giohang.controller');

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.get('/filter', controller.filter);
router.get('/top-sellers', controller.top);

router.post('/create', controller.create);
router.patch('/update/:id', controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;