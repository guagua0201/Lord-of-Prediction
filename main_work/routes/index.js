var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');
var session = require('express-session');

/* GET home page. */
router.get('/', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  sql.connect(db, function(err) {
    if (err)
      console.log(err);
    
    if (req.session!=undefined) {
      console.log(req.session.username + req.session.password);
      name = req.session.username;
      is_login = true;
    }
    else console.log("boom");
    sql.close();
  });

  res.render('index', {
    route: 'index',
    member: name,
    log_status: is_login
  });
});

module.exports = router;
