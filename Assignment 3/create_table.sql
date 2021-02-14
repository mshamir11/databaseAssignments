drop database if exists ipl; 

CREATE database ipl;

use ipl;


CREATE TABLE `team` (
  `team_id` int,
  `team_name` varchar(80),
  PRIMARY KEY (`team_id`)
);

CREATE TABLE `player` (
  `player_id` int,
  `player_name` varchar(80),
  `dob` date,
  `batting_hand` varchar(80),
  `bowling_skill` varchar(80),
  `country_name` varchar(80),
  PRIMARY KEY (`player_id`)
);

CREATE TABLE `ball_by_ball` (
  `match_id` int,
  `over_id` int,
  `ball_id` int,
  `innings_no` int,
  `team_batting` int,
  `team_bowling` int,
  `striker_batting_position` int,
  `striker` int,
  `non_striker` int,
  `bowler` int,
  PRIMARY KEY (`match_id`, `over_id`, `ball_id`, `innings_no`)
);


CREATE TABLE `match_details` (
  `match_id` int,
  `team_1` int,
  `team_2` int,
  `match_date` date,
  `season_id` int,
  `venue` varchar(100),
  `toss_winner` int,
  `toss_decision` varchar(50),
  `win_type` varchar(50),
  `win_margin` int,
  `outcome_type` varchar(50),
  `match_winner` int,
  `man_of_the_match` int,
  PRIMARY KEY (`match_id`)
);


 CREATE TABLE `wicket_taken` (
  `match_id` int,
  `over_id` int,
  `ball_id` int,
  `player_out` int,
  `kind_out` varchar(50),
  `innings_no` int,
  PRIMARY KEY (`match_id`, `over_id`, `ball_id`, `innings_no`)
);


CREATE TABLE `batsman_scored` (
  `match_id` int,
  `over_id` int,
  `ball_id` int,
  `runs_scored` int,
  `innings_no` int,
  PRIMARY KEY (`match_id`, `over_id`, `ball_id`,`innings_no`)
);





CREATE TABLE `player_match` (
  `match_id` int,
  `player_id` int,
  `role` varchar(50),
  `team_id` int,
  PRIMARY KEY (`match_id`, `player_id`)
);

CREATE TABLE `extra_runs` (
  `match_id` int,
  `over_id` int,
  `ball_id` int,
  `extra_type` varchar(50),
  `extra_runs` int,
  `innings_no` int,
  PRIMARY KEY (`match_id`, `over_id`, `ball_id`, `innings_no`)
);


 
