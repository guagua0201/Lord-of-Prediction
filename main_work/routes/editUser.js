var express = require('express')
var router = express.Router();

var db = require('../config/db.js');
var sql = require('mssql');

router.get('/editUser',function(req, res, next){
    res.render('editUser',{
        route: 'editUser'
    });
});

router.get('/editUser/delete/:id',function(req, res, next){
    sql.connect(db, function(err){
        if(err) console.log(err);

        var request = new sql.Request();
        request.input('id', sql.Int,req.params.id);
        request.query('delete from Userlist where UserID=@id', function(err, result){
            if(err){
                console.log(err);
                res.send(err);
            }
            sql.close();
            res.redirect('/editUser');
        });
    });
});

module.exports = router;
