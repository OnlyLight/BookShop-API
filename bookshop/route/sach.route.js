var express = require('express');
var multer = require('multer');
var router = express.Router();

var controller = require('../controller/sach.controller');
var upload = multer({dest: './public/uploads/images'});

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.get('/search', controller.searchName);
router.get('/filter', controller.filter);

router.get('/pager', controller.pager);

router.post('/create', upload.single('file'), controller.create);
router.put('/update/:id', upload.single('file'), controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;