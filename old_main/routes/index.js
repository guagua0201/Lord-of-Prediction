var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

/* GET home page. */
router.get('/', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
  }

  res.render('index', {
    route: 'index',
    member: name,
    log_status: is_login
  });
});

module.exports = router;
