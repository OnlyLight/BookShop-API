var express = require('express');
var router = express.Router();

var controller = require('../controller/giohang.controller');

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.post('/create', controller.create);
router.put('/update/:id', controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;