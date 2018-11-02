var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

var EventEmitter = require('events').EventEmitter;
var userid = new EventEmitter();

/* GET regist   page. */
router.get('/addArticle', function(req, res, next) {  
  res.render('addArticle', {
    route: 'addArticle'
  });
});

/* POST register page. */
router.post('/addArticle', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('username', sql.NVarChar(20), req.cookies.Username)
      .query('select * from Userlist where Username=@username', function(err, result) {
        if (err) {
          res.send(err);
          console.log(err);
        }
        userid.data = result.recordset[0]["ID"];
        userid.emit('update');
      });

    userid.on('update', function() {
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

  });
});

module.exports = router;
