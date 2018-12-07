var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

/* GET register page. */
router.get('/register', function(req, res, next) {  
  res.render('register', {
    route: 'register'
  });
});

/* POST register page. */
router.post('/register', function(req, res, next) {
  if (req.cookies.Username && req.cookies.Password) {
    res.redirect('/');
  } else {
    sql.connect(db, function(err) {
      if (err)
        console.log(err);

      /* 
       * do some check about input 
       * 1. no same username
       * 2. password == confirmed_password
       * 3. check email with regular expression
       * 4. username only include char, '_', and digit
       * check inside html form box 
       * https://www.w3schools.com/js/tryit.asp?filename=tryjs_validation_js
      */
      
      var request = new sql.Request();
      request.input('nickname', sql.NVarChar(20), req.body.nickname)
        .input('email', sql.NVarChar(50), req.body.email)
        .input('gender', sql.Bit, req.body.gender)
        .input('username', sql.NVarChar(20), req.body.username)
        .input('password', sql.NVarChar(20), req.body.password)
        .query('insert into UserList (Nickname, Email, Gender, Username, Password) values(@nickname, @email, @gender, @username, @password)', function(err, result) {
          if (err) {
            console.log(err);
            res.send(err);
          }
          sql.close();
          res.redirect('/');
        });
    });
  }
});

module.exports = router;
