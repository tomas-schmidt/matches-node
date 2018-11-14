const Database = require('./database/database.js');
let express = require('express'),
  app = express(),
  port = process.env.PORT || 8080;

let database = new Database({ host: '127.0.0.1', port: 3306, user: 'root', password: 'pass', database: 'db' });
let baseQuery = "select h.team_name as 'home', v.team_name as 'visiting', match_date from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where c.competition_name = ";
let todayQuery = "select h.team_name as 'home', v.team_name as 'visiting', match_date, competition_name from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where match_date = (select CURDATE())"

app.get('/', (req, res) => {
  database.query(todayQuery).then( rows => { res.send(rows) });
});

app.get('/libertadores', (req, res) => {
  database.query(`${baseQuery}'Copa Libertadores'`).then(rows => { res.send(rows) });
});

app.get('/sudamericana', (req, res) => {
  database.query(`${baseQuery}'Copa Sudamericana'`).then(rows => { res.send(rows) });
});

app.get('/superliga', (req, res) => {
  database.query(`${baseQuery}'Superliga'`).then(rows => { res.send(rows) });
});

app.get('/argentina', (req, res) => {
  database.query(`${baseQuery}'Copa Argentina'`).then(rows => { res.send(rows) });
});

app.get('/competitions', (req, res) => {
  database.query('SELECT * FROM competitions').then(rows => { res.send(rows) });
});

app.listen(port, () => {
  console.log("Listening on port 8080");
});
