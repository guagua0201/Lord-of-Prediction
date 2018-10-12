

router.get('/', function(req,res,next){
    res.render('backstage', {
        route: 'backstage'
    });
});
