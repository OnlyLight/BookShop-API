var express = require('express');
var router = express.Router();

var controller = require('../controller/users.controller');

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.get('/search', controller.searchEmail);

router.get('/filter', controller.filter);

router.delete('/delete/:id', controller.delete);

module.exports = router;