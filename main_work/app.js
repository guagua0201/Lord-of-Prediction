var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var MssqlStore = require('mssql-session-store')(session);
var db = require('./config/db');
var sql = require('mssql');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var registerRouter = require('./routes/register');
var loginRouter = require('./routes/login');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

sql.connect(db, function(err) {
  if (err)
    console.log(err);
  app.use(session({
    secret: '991E6B44882C4593A46C0DDFCA23E06A',
    resave: true,
    saveUninitialized: true,
    store: new MssqlStore({reapInterval: 3600, ttl: 3600}),
    cookie: {maxAge: 600 * 1000}
  }));
  console.log('generate');
  sql.close();
});

app.use('/', indexRouter);
app.use('/', usersRouter);
app.use('/', registerRouter);
app.use('/', loginRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
/*
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});
*/

module.exports = app;
