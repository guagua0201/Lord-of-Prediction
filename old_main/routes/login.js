var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

/* GET login page. */
router.get('/login', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
  }

  res.render('login', {
    route: 'login',
    member: name,
    log_status: is_login
  });
});

router.post('/login', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('username', sql.NVarChar(20), req.body.username)
      .query('select * from Userlist where Username=@username', function(err, result) {
        if (err) {
          console.log(err);
          res.send(err);
        }
        sql.close();

        if (req.body.username == "" || req.body.password == "") {
          res.redirect('/login');
        } else if (result.recordset.length == 0) {
          res.redirect('/login');
        } else if (result.recordset[0].Password != req.body.password) {
          res.redirect('/login');
        } else {
          res.cookie('Username', req.body.username, {path: '/', signed: false, maxAge: 600 * 1000});
          res.cookie('Password', req.body.password, {path: '/', signed: false, maxAge: 600 * 1000});
          res.redirect('/');
        }
      });
  });
});

router.get('/logout', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
  }

  res.clearCookie('Username', {path: '/'});
  res.clearCookie('Password', {path: '/'});
  res.redirect('/');
});

module.exports = router;