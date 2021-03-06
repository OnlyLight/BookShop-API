var express = require('express');
var multer = require('multer');
var router = express.Router();

var controller = require('../controller/sach.controller');
var upload = multer({dest: './public/uploads/images/sach-upload'});

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);
router.get('/list-kho', controller.listKho);

router.get('/search', controller.searchName);
router.get('/filter', controller.filter);
router.get('/filter-sachnoibat', controller.filterNoiBat);

router.get('/pager', controller.pager);

router.post('/create', upload.single('file'), controller.create);
router.patch('/update/:id', upload.single('file'), controller.update);
router.delete('/delete/:id', controller.delete);

module.exports = router;