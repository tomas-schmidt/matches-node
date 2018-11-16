-- docker run --name mysql-instance -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_ROOT_HOST=% -d mysql/mysql-server:5.6
-- docker exec -it mysql-instance mysql -uroot -p
-- console: mysql -h 127.0.0.1 -u root -p
-- show databases; // use 'db';

create table teams(
	id_team int primary key auto_increment,
	team_name varchar(100),
	team_logo varchar(200)
);

create table competitions(
	id_competition int primary key auto_increment,
	competition_name varchar(100)
);

create table team_competitions(
	id_competition int,
	id_team int,
	goals int,
	goals_recieved int,
	matches_played int,
	points int,
	instance int,
	foreign key (id_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition),
	primary key (id_competition, id_team)
);

create table matches(
	id_match int primary key auto_increment,
	id_visiting_team int,
	id_home_team int,
	id_competition int,
	instance varchar(100),
	match_date datetime,
	home_team_goals int,
	visiting_team_goals int,
	foreign key (id_home_team) references teams(id_team),
	foreign key (id_visiting_team) references teams(id_team),
	foreign key (id_competition) references competitions(id_competition)
);

insert into teams (team_name, team_logo) values ('River', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
insert into teams (team_name, team_logo) values ('Boca', 'https://cdn.bleacherreport.net/images/team_logos/328x328/portugal_national_football.png');
 
insert into competitions (competition_name) values ('Copa Libertadores');
insert into competitions (competition_name) values ('Superliga');
insert into competitions (competition_name) values ('Copa Sudamericana');
insert into competitions (competition_name) values ('Copa Argentina');

insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 2, 'Fecha 10', '2017-06-30 17:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 2, 'Fecha 11', '2017-07-30 19:30:00');

insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 1, '8vos', '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 1, '8vos', (select curdate()));

insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 3, '8vos', '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 3, '8vos', (select curdate()));	

insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 4, '8vos', '2017-07-30 19:30:00');
insert into matches (id_visiting_team, id_home_team, id_competition, instance, match_date) values (1, 2, 4, '8vos', (select curdate()));	
