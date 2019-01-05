var express = require('express');
var multer = require('multer');
var router = express.Router();

var controller = require('../controller/slide.controller');
var upload = multer({dest: './public/uploads/images/slide-upload'});

router.get('/list', controller.list);
router.get('/list/:id', controller.listByID);

router.post('/create', upload.single('file-slide'), controller.create);
router.patch('/update/:id', upload.single('file-slide'), controller.update);

module.exports = router;