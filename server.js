const Database = require('./database/database.js');
const environment = require('./environments/environment.js');
let queries = require('./database/queries.js');
let database = new Database(environment.databaseConfig);
let express = require('express'), app = express(), port = environment.port;
var async = require('async');

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', environment.frontEndUrl);
  next();
});

app.get('/', (req, res) => {
  database.query(queries.today).then( rows => { res.send(rows) });
});

app.get('/matches/:idComp', (req, res) => {
  database.query(`${queries.base}${req.params.idComp}`).then(rows => { res.send(rows) });
});

app.get('/table/:idComp', (req, res) => {
  database.query(`${queries.table}${req.params.idComp}`).then(rows => { res.send(rows) });
});

app.get('/competitions', (req, res) => {
  database.query(queries.competitions).then(rows => { res.send(rows) });
});

app.get('/competition/:idComp', (req, res) => {
  let competition = {};
  async.parallel([
    pd => { database.query(`${queries.base}${req.params.idComp}`).then(rows => { competition.matches = rows; pd(); });},
    pd => { database.query(`${queries.table}${req.params.idComp}`).then(rows => { competition.table = rows; pd(); });}
  ], () => { res.send(competition); });
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
