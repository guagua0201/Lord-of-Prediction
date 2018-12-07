var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

var EventEmitter = require('events').EventEmitter;
var userid = new EventEmitter();

/* GET regist   page. */
router.get('/addArticle', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.Username && req.cookies.Password) {
    name = req.cookies.Username;
    is_login = true;
    res.render('addArticle', {
      route: 'addArticle',
      member: name, 
      log_status: is_login
    });
  } else {
    res.redirect('/login');
  }
});

/* POST register page. */
router.post('/addArticle', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    if (req.cookies.Username && req.cookies.Password) {
      var request = new sql.Request();
      request.input('username', sql.NVarChar(20), req.cookies.Username)
        .query('select ID from Userlist where Username=@username', function(err, result) {
          if (err) {
            res.send(err);
            console.log(err);
          }
          userid.data = result.recordset[0]["ID"];
          userid.emit('update');
        });

      userid.once('update', function() {
        request.input('title', sql.NVarChar(30), req.body.title)
          .input('content', sql.NVarChar(4000), req.body.content)
          .input('author', sql.Int, userid.data)
          .query('insert into Article (Title, Content, AuthorID) values (@title, @content, @author)', function(err, result) {
            if (err) {
              res.send(err);
              console.log(err);
            }
            sql.close();
            res.redirect('/');
          });
      });
    } else {
      res.redirect('/login');
      sql.close();
    }
  });
});

module.exports = router;
