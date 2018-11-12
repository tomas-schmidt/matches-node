var express = require('express'),
  app = express(),
  port = process.env.PORT || 8080;

var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
  password: 'pass',
  database: 'db'
});
connection.connect();

let baseQuery = "select h.team_name as 'home', v.team_name as 'visiting', match_date from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where c.competition_name = "

function getMatches(competition){
	var deferred = $q.defer();
	var matches = [];
	var matchesQuery = queryBase + "'" + competencia + "'";
	connection.query(matchesQuery, function(err, rows, fields) {
		if(err) console.log(err);

		if (rows) {
			for (i=0; i < rows.length; i++) {
				matches.push({
					home: rows[i].home_team,
					visiting: rows[i].visiting_team,
					date: rows[i].match_date.getDate() + '/' + rows[i].match_date.getMonth(),
					time: rows[i].match_date.getHours() + ':' + rows[i].match_date.getMinutes()
				});
			}
      console.log('Matches found:')
      console.log(matches);
    } else console.log("No matches found")
	});
	deferred.resolve(matches);
	return deferred.promise;
}


app.get('/', function(req, res) {
  console.log('GET /');
  res.send('home');
});

app.get('/libertadores', function(req, res ){
  console.log('GET /libertadores');
  var promise = getMaches('Copa Libertadores');
	promise.then(function(data){
		res.send(data);
	});
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
