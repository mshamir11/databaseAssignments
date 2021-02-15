use ipl;



select player.player_name as batsman_name,D.value
from
(select C.striker,SUM(C.runs_scored)/COUNT(C.match_id) value
from
(select B.match_id,B.striker,SUM(B.runs_scored) runs_scored
from
(select A.match_id,A.striker,batsman_scored.runs_scored
from
(select ball_by_ball.match_id,ball_by_ball.over_id,
ball_by_ball.ball_id, ball_by_ball.innings_no,
ball_by_ball.striker
from ball_by_ball inner join match_details
on ball_by_ball.match_id=match_details.match_id
and match_details.season_id=2) as A
inner join batsman_scored
on 
A.match_id=batsman_scored.match_id
and A.over_id=batsman_scored.over_id
and A.ball_id=batsman_scored.ball_id
and A.innings_no = batsman_scored.innings_no) as B
group by B.match_id,B.striker) as C
group by C.striker order by value desc limit 3) as D
inner join
player on
player.player_id=D.striker;