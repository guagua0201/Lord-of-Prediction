var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

var EventEmitter = require('events').EventEmitter;
var userid = new EventEmitter();

var EventEmitter = require('events').EventEmitter;
var userid = new EventEmitter();

router.get('/listArticle', function(req, res, next) {
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
    var type = req.query.type;
    var member = 'Guest';

    if (type == '1' && req.cookies.Username && req.cookies.Password) {
      member = req.cookies.Username;

      request.input('username', sql.NVarChar(20), member)
        .query('select ID from Userlist where Username=@username', function(err, result) {
          if (err) {
            console.log(err);
            res.send(err);
          }
          //console.log('emit!!!!!');
          userid.data = result.recordset[0]["ID"];
          userid.emit('update');
        });

      userid.once('update', function() {
        //console.log('update!!!!');
        request.input('author', sql.Int, userid.data)
          .query('select * from Article where AuthorID=@author', function(err, result) {
            if (err) {
              console.log(err);
              res.send(err);
            }
            //console.log('close!!!!!!');
            sql.close();

            res.render('listArticle', {
              route: 'listArticle',
              data: result.recordset,
              member: member,
              type: type
            });
          });
      });
    } else {
      type = '0';
      request.query('select * from Article', function(err, result) {
        if (err) {
          console.log(err);
          res.send(err);
        }
        sql.close();

        res.render('listArticle', {
          route: 'listArticle',
          data: result.recordset,
          member: member,
          type: type
        });
      });
    }

  });
});

module.exports = router;
