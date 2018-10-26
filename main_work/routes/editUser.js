var express = require('express')
var router = express.Router();

var db = require('../config/db.js');
var sql = require('mssql');

router.get('/editUser', function(req, res, next) {
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
      res.render('editUser',{
          route: 'editUser',
          data: result.recordset
      });
    });
  });
});

router.post('/editUser', function(req, res, next) {
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
      res.render('editUser', {
        route: 'editUser',
        data: result.recordset
      });
    });
  });
});

router.get('/editUser/delete/:id', function(req, res, next) {
  sql.connect(db, function(err) {
    if(err)
      console.log(err);

    var request = new sql.Request();
    request.input('id', sql.Int, req.params.id);
    request.query('delete from Userlist where ID=@id', function(err, result) {
      if(err) {
          console.log(err);
          res.send(err);
      }
      sql.close();
      res.redirect('/backstage/editUser');
    });
  });
});

module.exports = router;
