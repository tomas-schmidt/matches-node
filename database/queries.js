const queries = {
  base: "select id_match as 'id', h.team_name as 'homeTeam', h.team_logo as 'homeTeamLogo', v.team_name as 'visitingTeam', v.team_logo as 'visitingTeamLogo',  TIME_FORMAT(match_date," + '"%H:%i"' + ") as 'time', DATE_FORMAT(match_date," + '"%d/%m"' + ") as 'day' from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where c.id_competition = ",
  today: "select id_match as 'id', h.team_name as 'homeTeam', h.team_logo as 'homeTeamLogo', v.team_name as 'visitingTeam', v.team_logo as 'visitingTeamLogo', TIME_FORMAT(match_date," + '"%H:%i"' + ") as 'time', DATE_FORMAT(match_date," + '"%d/%m"' + ") as 'day', competition_name from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) where match_date = (select CURDATE())",
  competitions: "SELECT id_competition as 'key', competition_name as 'name', competition_type as 'type' FROM competitions"
}

module.exports = queries;
