var express = require('express'),
  app = express(),
  port = process.env.PORT || 8080;

app.get('/', function(req, res) {
  console.log('GET /');
  res.send('home');
});

app.get('/libertadores', function(req, res ){
  console.log('GET /libertadores');
  res.send('libertadores');
});

app.get('/sudamericana', function(req, res ){
  console.log('GET /sudamericana');
  res.send('sudamericana');
});

app.get('/superliga', function(req, res ){
  console.log('GET /superliga');
  res.send('superliga');
});

app.get('/argentina', function(req, res ){
  console.log('GET /argentina');
  res.send('argentina');
});

app.listen(port, function(){
  console.log("listening on port 8080");
});
