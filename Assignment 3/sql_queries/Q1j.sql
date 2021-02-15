use ipl;


select player.player_name as name,D.runs
from
(select C.striker,max(C.runs) runs
from
(select B.striker,SUM(B.runs_scored) runs
from
(select A.match_id,A.striker,batsman_scored.runs_scored
from
(select ball_by_ball.match_id,ball_by_ball.over_id,
ball_by_ball.ball_id, ball_by_ball.innings_no,
ball_by_ball.striker
from ball_by_ball inner join match_details
on ball_by_ball.match_id=match_details.match_id
and match_details.season_id=3) as A
inner join batsman_scored
on 
A.match_id=batsman_scored.match_id
and A.over_id=batsman_scored.over_id
and A.ball_id=batsman_scored.ball_id
and A.innings_no = batsman_scored.innings_no) as B
group by B.striker) as C
inner join player_match on
C.striker = player_match.player_id
and player_match.role="Captain"
and C.runs>50 group by C.striker) as D
inner join player on
player.player_id = D.striker order by player_name;


