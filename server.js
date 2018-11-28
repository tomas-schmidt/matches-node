const Database = require('./database/database.js');
const environment = require('./environments/environment.js');
let queries = require('./database/queries.js');
let database = new Database(environment.databaseConfig);
let express = require('express'), app = express(), port = environment.port;

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', environment.frontEndUrl);
  next();
});

app.get('/', (req, res) => {
  database.query(queries.today).then( rows => { res.send(rows) });
});

app.get('/matches/:codComp', (req, res) => {
  database.query(`${queries.base}'${req.params.codComp}'`).then(rows => { res.send(rows) });
});

app.get('/positions/:codComp', (req, res) => {
  res.send(req.params.codComp);
});

app.listen(port, () => {
  console.log("Listening on port 8080");
});
