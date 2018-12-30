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

app.get('/groups/:idComp', (req, res) => {
  let groupsRes = {};
  async.parallel([
    pd => { database.query(`${queries.groups}${req.params.idComp}`).then(rows => { groupsRes.groups = rows; pd(); });},
    pd => { database.query(`${queries.groupsTeams}${req.params.idComp}`).then(rows => { groupsRes.teams = rows; pd(); });}
  ], () => {
    let groups = {};
    for (g of groupsRes.groups) {
      groups[g.group] = groupsRes.teams.filter(team => team.team_group === g.group);
    }
    res.send(groups);
  });
});

app.get('/brackets/:idComp', (req, res) => {
  let brackets = {};
  async.parallel([
    pd => { database.query(`${queries.bracketOne}${req.params.idComp}`).then(rows => { brackets.one = rows; pd(); });},
    pd => { database.query(`${queries.bracketTwo}${req.params.idComp}`).then(rows => { brackets.two = rows; pd(); });},
    pd => { database.query(`${queries.bracketsFinal}${req.params.idComp}`).then(rows => { brackets.final = rows; pd(); });}
  ], () => { res.send(brackets); });
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
