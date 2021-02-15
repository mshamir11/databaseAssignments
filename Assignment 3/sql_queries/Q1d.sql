use ipl;




select player.player_name,FINAL.average
from
(select RUNS_GIVEN.bowler,RUNS_GIVEN.runs_given/ifnull(1,WICKET_TAKEN.wickets)
average
from
(select C.bowler, SUM(C.runs) runs_given
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
match_details.season_id=5
and
match_details.match_id=A.match_id) as B
inner join ball_by_ball
on
ball_by_ball.match_id=B.match_id
and ball_by_ball.over_id=B.over_id
and ball_by_ball.innings_no=B.innings_no
and ball_by_ball.ball_id=B.ball_id) as C
group by C.bowler) as RUNS_GIVEN
left outer join
(select B.bowler,COUNT(B.match_id) wickets
from
(select A.match_id,A.over_id,
A.ball_id,A.innings_no,ball_by_ball.bowler
from
(select wicket_taken.match_id,wicket_taken.over_id,
wicket_taken.ball_id,wicket_taken.innings_no
from wicket_taken inner join match_details
on wicket_taken.match_id=match_details.match_id
and match_details.season_id=5) as A
inner join ball_by_ball
on
ball_by_ball.match_id=A.match_id
and ball_by_ball.over_id=A.over_id
and ball_by_ball.innings_no=A.innings_no
and ball_by_ball.ball_id=A.ball_id) as B
group by B.bowler) as WICKET_TAKEN on
WICKET_TAKEN.bowler=RUNS_GIVEN.bowler) as FINAL
inner join player on 
FINAL.bowler= player.player_id order by
FINAL.average ASC,player.player_name ASC;