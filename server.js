const Database = require('./database/database.js');
let express = require('express'),
  app = express(),
  port = process.env.PORT || 8080;
let database = new Database({ host: '127.0.0.1', port: 3306, user: 'root', password: 'pass', database: 'db' });
let baseQuery = "select h.team_name as 'home', v.team_name as 'visiting', match_date from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where c.competition_name = ";

function getMatches(competition) {
	let deferred = $q.defer();
	let matches = [];
	let matchesQuery = `${baseQuery}'${competition}'`;
	connection.query(matchesQuery, (err, rows, fields) => {
		if(err) console.log(err);
		if (rows) {
			for (let i = 0; i < rows.length; i ++) {
				matches.push({
					home: rows[i].home_team,
          visiting: rows[i].visiting_team,
          date: `${rows[i].match_date.getDate()}/${rows[i].match_date.getMonth()}`,
					time: `${rows[i].match_date.getHours()}/${rows[i].match_date.getMinutes()}`
				});
			}
      console.log('Matches found:');
      console.log(matches);
    } else console.log("No matches found")
	});
	deferred.resolve(matches);
	return deferred.promise;
}

app.get('/', (req, res) => {
  console.log('GET /');
  let promise = getMatches('*');
	promise.then(data => { res.send(data); });
});

app.get('/libertadores', (req, res) => {
  console.log('GET /libertadores');
  let promise = getMatches('Copa Libertadores');
	promise.then(data => { res.send(data); });
});

app.get('/sudamericana', (req, res) => {
  console.log('GET /sudamericana');
  let promise = getMatches('Sudamericana');
	promise.then(data => { res.send(data); });
});

app.get('/superliga', (req, res) => {
  console.log('GET /superliga');
  let promise = getMatches('Superliga');
	promise.then(data => { res.send(data); });
});

app.get('/argentina', (req, res) => {
  console.log('GET /argentina');
  let promise = getMatches('Argentina');
	promise.then(data => { res.send(data); });
});

app.get('/competitions', (req, res) => {
  database.query( 'SELECT * FROM competitions' ).then( rows => { res.send(rows) });
});

app.listen(port, () => {
  console.log("listening on port 8080");
});
