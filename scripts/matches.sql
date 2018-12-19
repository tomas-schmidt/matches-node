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
	competition_type varchar(100)
);

create table team_competitions (
	id_competition int,
	id_team int,
	goals int,
	goals_recieved int,
	matches_played int,
	points int,
	id_instance int,
	foreign key (id_instance) references instances(id_instance),
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team)
);

create table instances (
	id_instance int primary key auto_increment,
	instance_name varchar(50),
	instance_detail varchar(50)
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

/******************************************************** TESTING INSERTS ********************************************************************/

-- TEAMS
insert into teams (team_name, team_logo) values ('River', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Boca', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Racing', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Independiente', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');

-- COMPETITIONS
insert into competitions (competition_name, competition_type) values ('Copa Libertadores', 'inter');
insert into competitions (competition_name, competition_type) values ('Superliga', 'local');
insert into competitions (competition_name, competition_type) values ('Copa Sudamericana', 'inter');
insert into competitions (competition_name, competition_type) values ('Copa Argentina', 'local');

-- INSTANCES
insert into instances (instance_name, instance_detail) values ('Grupos', 'A');
insert into instances (instance_name, instance_detail) values ('Grupos', 'B');
insert into instances (instance_name, instance_detail) values ('Grupos', 'C');
insert into instances (instance_name, instance_detail) values ('Grupos', 'D');
insert into instances (instance_name, instance_detail) values ('Grupos', 'E');
insert into instances (instance_name, instance_detail) values ('Grupos', 'F');
insert into instances (instance_name, instance_detail) values ('Grupos', 'G');
insert into instances (instance_name, instance_detail) values ('Grupos', 'H');
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
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (1, 1, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (1, 2, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (1, 3, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (1, 4, 10, 10, 10, 10, 10);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (2, 1, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (2, 2, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (2, 4, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (2, 3, 10, 10, 10, 10, 10);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (3, 1, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (3, 2, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (3, 3, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (3, 4, 10, 10, 10, 10, 10);

insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (4, 1, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (4, 2, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (4, 3, 10, 10, 10, 10, 10);
insert into team_competitions (id_competition, id_team, goals, goals_recieved, matches_played, points, instance) values (4, 4, 10, 10, 10, 10, 10);
