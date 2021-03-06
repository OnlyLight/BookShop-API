var express = require('express');
var router = express.Router();

var controller = require('../controller/nhanxet.controller');

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.get('/search', controller.searchName);
router.get('/filter', controller.filter);

router.post('/create', controller.create);
router.put('/update/:id', controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;