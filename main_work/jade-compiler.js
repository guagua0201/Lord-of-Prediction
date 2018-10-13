var jade = require('jade-compiler');

var opts = {
  pretty: true
};

jade.fromFile('./views/register.jade', opts, function(err, html) {
  console.log(html);
});
