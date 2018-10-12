var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login', {
    route: 'login'
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

        if (result.recordset[0].Password != req.body.password) {
          res.redirect('/login');
        } else {
          res.cookie('Username', req.body.username, {path: '/', signed: false, maxAge: 600 * 1000});
          res.cookie('Password', req.body.password, {path: '/', signed: false, maxAge: 600 * 1000});
          res.redirect('/');
        }
      });
  });
});

module.exports = router;
