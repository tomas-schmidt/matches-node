const queries = {
  base: "select id_match as 'id', h.team_name as 'homeTeam', h.team_logo as 'homeTeamLogo', v.team_name as 'visitingTeam', v.team_logo as 'visitingTeamLogo', TIME_FORMAT(match_date," + '"%H:%i"' + ") as 'time', DATE_FORMAT(match_date," + '"%d/%m"' + ") as 'day', i.instance_name as 'instanceName', i.instance_detail as 'instanceDetail' from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) join instances i on (i.id_instance = m.id_instance) where c.id_competition = ",
  today: "select id_match as 'id', h.team_name as 'homeTeam', h.team_logo as 'homeTeamLogo', v.team_name as 'visitingTeam', v.team_logo as 'visitingTeamLogo', TIME_FORMAT(match_date," + '"%H:%i"' + ") as 'time', DATE_FORMAT(match_date," + '"%d/%m"' + ") as 'day', competition_name, i.instance_name as 'instanceName', i.instance_detail as 'instanceDetail' from matches m join teams h on (h.id_team = m.id_home_team) join teams v on (v.id_team = m.id_visiting_team) join competitions c on (m.id_competition = c.id_competition) join instances i on (i.id_instance = m.id_instance) where match_date = (select CURDATE())",
  competitions: "select id_competition as 'key', competition_name as 'name', is_local as 'isLocal', has_brackets as 'hasBrackets' from competitions",
  table: "select tc.*, t.team_name, i.instance_name as 'instanceName', i.instance_detail as 'instanceDetail' from positions_table tc join teams t on (t.id_team = tc.id_team) where id_competition =",
  groups: "select * from groups where id_competition =",
  brackets: "select * from brackets where id_competition ="
}

module.exports = queries;
