const Database = require('./database/database.js');
const Environment = require('./environments/environment.js');
let queries = require('./database/queries.js');
let database = new Database(Environment.databaseConfig);
let express = require('express'), app = express(), port = Environment.port;

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', Environment.frontEndUrl);
  next();
});

app.get('/', (req, res) => {
  database.query(queries.today).then( rows => { res.send(rows) });
});

app.get('/libertadores', (req, res) => {
  database.query(`${queries.base}'Copa Libertadores'`).then(rows => { res.send(rows) });
});

app.get('/sudamericana', (req, res) => {
  database.query(`${queries.base}'Copa Sudamericana'`).then(rows => { res.send(rows) });
});

app.get('/superliga', (req, res) => {
  database.query(`${queries.base}'Superliga'`).then(rows => { res.send(rows) });
});

app.get('/argentina', (req, res) => {
  database.query(`${queries.base}'Copa Argentina'`).then(rows => { res.send(rows) });
});

app.get('/competitions', (req, res) => {
  database.query(queries.competitions).then(rows => { res.send(rows) });
});

app.listen(port, () => {
  console.log("Listening on port 8080");
});
