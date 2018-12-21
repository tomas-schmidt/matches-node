-- docker run --name mysql-instance -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_ROOT_HOST=% -d mysql/mysql-server:5.6
-- docker exec -it mysql-instance mysql -uroot -p
-- console: mysql -h 127.0.0.1 -u root -p
-- show databases; // use 'db';

create table teams (
	id_team int primary key auto_increment,
	team_name varchar(100),
	team_logo varchar(200)
);

create table competitions(
	id_competition int primary key auto_increment,
	competition_name varchar(100),
	is_local boolean,
	has_brackets boolean,
	has_positions_table boolean,
	has_groups boolean
);

create table instances (
	id_instance int primary key auto_increment,
	instance_name varchar(50),
	instance_detail varchar(50)
);

create table team_competitions (
	id_competition int,
	id_team int,
	goals int,
	goals_recieved int,
	matches_played int,
	points int,
	id_instance int,
	bracket int,
	foreign key (id_instance) references instances(id_instance),
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team, id_instance)
);

create table matches (
	id_match int primary key auto_increment,
	id_visiting_team int,
	id_home_team int,
	id_competition int,
	id_instance int,
	match_date datetime,
	home_team_goals int,
	visiting_team_goals int,
	foreign key (id_instance) references instances(id_instance),
	foreign key (id_home_team) references teams(id_team),
	foreign key (id_visiting_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition)
);

create table positions_table (
	id_competition int,
	id_team int,
	goals int,
	goals_recieved int,
	matches_played int,
	points int,
	group char,
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team)
);

create table brackets (
	id_competition int,
	id_team_1 int,
	id_team_2 int,
	id_instance int,
	bracket int, -- 1 or 2
	foreign key (id_instance) references instances(id_instance),
	foreign key (id_team_1) references teams(id_team),
	foreign key (id_team_2) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_instance)
);

/******************************************************** TESTING INSERTS ********************************************************************/

-- TEAMS
insert into teams (team_name, team_logo) values ('River', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Boca', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Racing', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Independiente', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team5', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team6', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team7', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team8', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team9', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team10', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team11', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team12', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team13', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team14', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team15', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team16', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team17', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team18', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team19', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team20', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team21', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team22', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team23', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team24', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team25', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team26', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team27', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team28', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team29', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team30', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team31', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Team32', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');

-- COMPETITIONS
insert into competitions (competition_name, is_local, has_brackets, has_positions_table, has_groups) values ('Copa Libertadores', false, true, false, true);
insert into competitions (competition_name, is_local, has_brackets, has_positions_table, has_groups) values ('Superliga', true, false, true, false);
insert into competitions (competition_name, is_local, has_brackets, has_positions_table, has_groups) values ('Copa Sudamericana', false, true, false, true);
insert into competitions (competition_name, is_local, has_brackets, has_positions_table, has_groups) values ('Copa Argentina', true, true, false, false);

-- INSTANCES
insert into instances (instance_name, instance_detail) values ('8vos', '1');
insert into instances (instance_name, instance_detail) values ('8vos', '2');
insert into instances (instance_name, instance_detail) values ('8vos', '3');
insert into instances (instance_name, instance_detail) values ('8vos', '4');
insert into instances (instance_name, instance_detail) values ('8vos', '5');
insert into instances (instance_name, instance_detail) values ('8vos', '6');
insert into instances (instance_name, instance_detail) values ('8vos', '7');
insert into instances (instance_name, instance_detail) values ('8vos', '8');
insert into instances (instance_name, instance_detail) values ('4vos', '1');
insert into instances (instance_name, instance_detail) values ('4vos', '2');
insert into instances (instance_name, instance_detail) values ('4vos', '3');
insert into instances (instance_name, instance_detail) values ('4vos', '4');
insert into instances (instance_name, instance_detail) values ('Semifinal', '1');
insert into instances (instance_name, instance_detail) values ('Semifinal', '2');
insert into instances (instance_name, instance_detail) values ('Final', '1');
insert into instances (instance_name, instance_detail) values ('Fecha', '2');
insert into instances (instance_name, instance_detail) values ('Fecha', '3');
insert into instances (instance_name, instance_detail) values ('Fecha', '4');
insert into instances (instance_name, instance_detail) values ('Fecha', '5');
insert into instances (instance_name, instance_detail) values ('Fecha', '6');
insert into instances (instance_name, instance_detail) values ('Fecha', '7');
insert into instances (instance_name, instance_detail) values ('Fecha', '8');
insert into instances (instance_name, instance_detail) values ('Fecha', '9');
insert into instances (instance_name, instance_detail) values ('Fecha', '10');
insert into instances (instance_name, instance_detail) values ('Final', '11');
insert into instances (instance_name, instance_detail) values ('Fecha', '12');
insert into instances (instance_name, instance_detail) values ('Fecha', '13');
insert into instances (instance_name, instance_detail) values ('Fecha', '14');
insert into instances (instance_name, instance_detail) values ('Fecha', '15');
insert into instances (instance_name, instance_detail) values ('Fecha', '16');
insert into instances (instance_name, instance_detail) values ('Fecha', '17');
insert into instances (instance_name, instance_detail) values ('Fecha', '18');
insert into instances (instance_name, instance_detail) values ('Fecha', '19');
insert into instances (instance_name, instance_detail) values ('Fecha', '20');
insert into instances (instance_name, instance_detail) values ('Final', '21');
insert into instances (instance_name, instance_detail) values ('Fecha', '22');
insert into instances (instance_name, instance_detail) values ('Fecha', '23');
insert into instances (instance_name, instance_detail) values ('Fecha', '24');
insert into instances (instance_name, instance_detail) values ('Fecha', '25');
insert into instances (instance_name, instance_detail) values ('Fecha', '26');
insert into instances (instance_name, instance_detail) values ('Fecha', '27');
insert into instances (instance_name, instance_detail) values ('Fecha', '28');
insert into instances (instance_name, instance_detail) values ('Fecha', '29');
insert into instances (instance_name, instance_detail) values ('Fecha', '30');
insert into instances (instance_name, instance_detail) values ('Grupos', 'A');
insert into instances (instance_name, instance_detail) values ('Grupos', 'B');
insert into instances (instance_name, instance_detail) values ('Grupos', 'C');
insert into instances (instance_name, instance_detail) values ('Grupos', 'D');
insert into instances (instance_name, instance_detail) values ('Grupos', 'E');
insert into instances (instance_name, instance_detail) values ('Grupos', 'F');
insert into instances (instance_name, instance_detail) values ('Grupos', 'G');
insert into instances (instance_name, instance_detail) values ('Grupos', 'H');

-- MATCHES
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 2, 33, '2017-06-30 17:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 2, 34, '2017-07-30 19:30:00');

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 1, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 1, 9, (select curdate()));

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 3, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 3, 9, (select curdate()));	

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 4, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 4, 9, (select curdate()));	

-- TEAM_COMPETITIONS
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (1, 1, 10, 10, 10, 10, 10, 1);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (1, 2, 10, 10, 10, 10, 10, 1);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (1, 3, 10, 10, 10, 10, 10, 2);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (1, 4, 10, 10, 10, 10, 10, 2);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (2, 1, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (2, 2, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (2, 4, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (2, 3, 10, 10, 10, 10, 10, null);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (3, 1, 10, 10, 10, 10, 10, 1);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (3, 2, 10, 10, 10, 10, 10, 1);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (3, 3, 10, 10, 10, 10, 10, 2);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (3, 4, 10, 10, 10, 10, 10, 2);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (4, 1, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (4, 2, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (4, 3, 10, 10, 10, 10, 10, null);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, id_instance, bracket) values (4, 4, 10, 10, 10, 10, 10, null);

-- POSITIONS_TABLE
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (2, 1, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (2, 2, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (2, 3, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (2, 4, 10, 10, 10, 10, null);

insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (1, 1, 10, 10, 10, 10, 'A');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (1, 2, 10, 10, 10, 10, 'B');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (1, 3, 10, 10, 10, 10, 'C');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (1, 4, 10, 10, 10, 10, 'D');

insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (3, 1, 10, 10, 10, 10, 'A');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (3, 2, 10, 10, 10, 10, 'B');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (3, 3, 10, 10, 10, 10, 'C');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, group) values (3, 4, 10, 10, 10, 10, 'D');

-- BRACKETS
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 1, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 2, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 3, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 4, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 5, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 6, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 7, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 8, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 9, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 10, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 11, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 12, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 13, 1);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 14, 1);

insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 1, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 2, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 3, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 4, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 5, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 6, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 7, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 8, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 9, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 10, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 11, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 12, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 13, 2);
insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 14, 2);

insert into brackets (id_competition, id_team_1, id_team_2, id_instance, bracket) values (1, 1, 2, 15, null);