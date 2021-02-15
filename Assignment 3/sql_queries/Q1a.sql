use ipl;

select player.player_name as bowler_name, last.runs_scored
from
(select FINAL.bowler,min(FINAL.runs_given) runs_scored
from
(select C.bowler,C.match_id,C.innings_no,C.over_id,
SUM(C.runs) runs_given
from
(select B.match_id,B.over_id,B.ball_id,B.innings_no,B.runs,
ball_by_ball.bowler
from
(select A.match_id,A.over_id,A.ball_id,A.innings_no,A.runs
from
(select batsman_scored.match_id,batsman_scored.over_id,
batsman_scored.ball_id,batsman_scored.innings_no,
batsman_scored.runs_scored+ifnull(0,extra_runs.extra_runs) runs
 from batsman_scored left outer join extra_runs
on batsman_scored.match_id=extra_runs.match_id
and batsman_scored.over_id=extra_runs.over_id
and batsman_scored.ball_id=extra_runs.ball_id
and batsman_scored.innings_no=extra_runs.innings_no) as A 
inner join match_details on
match_details.match_id=A.match_id) as B
inner join ball_by_ball
on
ball_by_ball.match_id=B.match_id
and ball_by_ball.over_id=B.over_id
and ball_by_ball.innings_no=B.innings_no
and ball_by_ball.ball_id=B.ball_id) as C
group by C.bowler,C.match_id,C.innings_no,C.over_id 
order by runs_given asc,C.match_id,C.innings_no,C.over_id) as FINAL
group by FINAL.bowler) as last
inner join player
on
player.player_id=last.bowler order by runs_scored;