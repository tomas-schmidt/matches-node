-- docker run --name mysql-instance -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_ROOT_HOST=% -d mysql/mysql-server:5.6
-- docker exec -it mysql-instance mysql -uroot -p
-- console: mysql -h 127.0.0.1 -u root -p
-- show databases; // use 'db';

create table teams (
	id_team int primary key auto_increment,
	team_name varchar(100),
	team_logo varchar(200)
);

create table competitions (
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
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team)
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
	team_group char(1),
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team)
);

create table brackets (
	id_competition int,
	id_instance int,
	bracket int NOT NULL, -- 1 or 2, 3 final
	id_team_1 int,
	id_team_2 int,
	foreign key (id_instance) references instances(id_instance),
	foreign key (id_team_1) references teams(id_team),
	foreign key (id_team_2) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_instance, bracket)
);

/******************************************************** TESTING INSERTS ********************************************************************/

-- TEAMS
insert into teams (team_name, team_logo) values ('River', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Boca', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Racing', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Independiente', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');

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
insert into instances (instance_name, instance_detail) values ('4vos', '1');
insert into instances (instance_name, instance_detail) values ('4vos', '2');
insert into instances (instance_name, instance_detail) values ('Semifinal', null);
insert into instances (instance_name, instance_detail) values ('Final', null);
insert into instances (instance_name, instance_detail) values ('Fecha', null);
insert into instances (instance_name, instance_detail) values ('Fase de grupos', null);

-- MATCHES
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 2, 3, '2017-06-30 17:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 2, 3, '2017-07-30 19:30:00');

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 1, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 1, 9, (select curdate()));

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 3, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 3, 9, (select curdate()));	

insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 4, 9, '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, id_instance, match_date) values (1, 2, 4, 9, (select curdate()));	

-- POSITIONS_TABLE
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (2, 1, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (2, 2, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (2, 3, 10, 10, 10, 10, null);
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (2, 4, 10, 10, 10, 10, null);

insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (1, 1, 10, 10, 10, 10, 'A');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (1, 2, 10, 10, 10, 10, 'B');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (1, 3, 10, 10, 10, 10, 'C');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (1, 4, 10, 10, 10, 10, 'D');

insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (3, 1, 10, 10, 10, 10, 'A');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (3, 2, 10, 10, 10, 10, 'B');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (3, 3, 10, 10, 10, 10, 'C');
insert into positions_table (id_competition, id_team, goals, goals_recieved, matches_played, points, team_group) values (3, 4, 10, 10, 10, 10, 'D');

-- BRACKETS
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 1, 1, 1, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 2, 1, 2, 1);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 3, 1, 3, 1);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 4, 1, 4, 1);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 5, 1, 4, 1);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 6, 1, 3, 1);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 7, 1, 2, 1);

insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 1, 2, 1, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 2, 2, 2, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 3, 2, 3, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 4, 2, 4, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 5, 2, 3, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 6, 2, 3, 2);
insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 7, 2, 4, 2);

insert into brackets (id_competition, id_instance, bracket, id_team_1, id_team_2) values (1, 8, 3, 1, 2);
