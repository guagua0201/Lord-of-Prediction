var express = require('express');
var router = express.Router();

var db = require('../config/db');
var sql = require('mssql');

var result;

/* GET home page. */
router.get('/', function(req, res, next) {
  var name = 'guest';
  var is_login = false;

  if (req.cookies.UserName && req.cookies.Password) {
    name = req.cookies.UserName;
    is_login = true;
  }

  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.query('select * from UserList', function(err, result) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();
      res.render('index', {
        route: 'home',
        data: result.recordset,
        member: name,
        log_status: is_login
      });
    });
  });

});

/* GET edit page. */
router.get('/edit/:id', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('id', sql.Int, req.params.id);
    request.query('select * from UserList where UserID=@id', function(err, result) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();
      res.render('edit', {
        route: 'edit',
        data: result.recordset[0]
      });
    });
  });
});

/* POST edit page. */
router.post('/update', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);
    
    var request = new sql.Request();
    request.input('id', sql.Int, req.body.id)
      .input('username', sql.NVarChar(255), req.body.username)
      .input('pwd', sql.NVarChar(255), req.body.pwd)
      .input('email', sql.NVarChar(255), req.body.email)
      .query('update UserList set UserName=@username,Password=@pwd,Email=@email where UserId=@id', function(err, result) {
        if (err) {
          console.log(err);
          res.send(err);
        }
        sql.close();
        res.redirect('/');
      });
  });
});

/* GET add page. */
router.get('/add', function(req, res, next) {
  res.render('add', {
    route: 'add'
  });
});

/* POST add page. */
router.post('/add', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('username', sql.NVarChar(255), req.body.username)
      .input('pwd', sql.NVarChar(255), req.body.pwd)
      .input('email', sql.NVarChar(255), req.body.email)
      .query('insert into UserList (UserName, Password, Email) values (@username, @pwd, @email)', function(err, result) {
        if (err) {
          console.log(err);
          res.send(err);
        }
        sql.close();
        res.redirect('/');
      });
  });
});

/* GET delete page. */
router.get('/delete/:id', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('id', sql.Int, req.params.id);
    request.query('delete from UserList where UserID=@id', function(err, reuslt) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();
      res.redirect('/');
    });
  });
});

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login', {
    route: 'login'
  });
});

/* POST login page. */
router.post('/login', function(req, res, next) {
  sql.connect(db, function(err) {
    if (err)
      console.log(err);

    var request = new sql.Request();
    request.input('username', sql.NVarChar(255), req.body.username);
    request.query('select * from UserList where UserName=@username', function(err, result) {
      if (err) {
        console.log(err);
        res.send(err);
      }
      sql.close();

      if (result.recordset[0].Password != req.body.pwd) {
        res.redirect('/login');
      } else {
        res.cookie('UserName', req.body.username, {path: '/', singed: false, maxAge: 600000});
        res.cookie('Password', req.body.pwd, {path: '/', signed: false, maxAge: 600000});
        res.redirect('/');
      }
    });
  });
});

/* GET logout page. */
router.get('/logout', function(req, res, next) {
  res.clearCookie('UserName', {path: '/'});
  res.clearCookie('Password', {path: '/'});
  res.redirect('/');
});

module.exports = router;
