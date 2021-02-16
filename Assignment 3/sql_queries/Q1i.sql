use ipl;


create view Indian_Players as 
select player.player_name as name,A.runs
from
(select ball_by_ball.striker,
SUM(batsman_scored.runs_scored) as runs from
batsman_scored inner join ball_by_ball
on
batsman_scored.match_id=ball_by_ball.match_id
and batsman_scored.over_id=ball_by_ball.over_id
and batsman_scored.ball_id=ball_by_ball.ball_id
and batsman_scored.innings_no=ball_by_ball.innings_no
group by ball_by_ball.striker) as A
inner join player on
A.striker=player.player_id
order by name asc;

select * from Indian_Players;