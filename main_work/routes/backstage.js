var express = require('express');
var router = express.Router();

var db = require('../config/db.js');
var sql = require('mssql');

router.get('/', function(req,res,next){
    res.render('backstage', {
        route: 'backstage'
    });
});

module.exports = router;
