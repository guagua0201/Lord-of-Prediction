var express = require('express')
var router = express.Router();

var db = require('../config/db.js');
var sql = require('mssql');

router.get('/searchUser', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
  }

  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.query('select * from Userlist', function(err, result) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();
      res.render('searchUser',{
        route: 'searchUser',
        data: result.recordset,
        member: name,
        log_status: is_login
      });
    });
  });
});

router.post('/searchUser', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
  }

  sql.connect(db, function(err) {
    if (err)
      console.log(err);
    
    var request = new sql.Request();
    request.input('search', sql.NVarChar(50), req.body.search);
    console.log(req.body.search);
    request.query("select * from Userlist where Username like '%'+@search+'%'", function(err, result) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();
      res.render('searchUser', {
        route: 'searchUser',
        member: name,
        log_status: is_login,
        data: result.recordset
      });
    });
  });
});

module.exports = router;
