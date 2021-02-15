use ipl;

select C.player_name as batsmen_name,max(C.Total_runs) runs from
(select P.match_id,P.player_name,P.Total_runs from
(select K.match_id,K.player_name,SUM(K.runs_scored) Total_runs
from
(select B.match_id,B.runs_scored,player.player_name from
(select ball_by_ball.match_id,
batsman_scored.runs_scored, ball_by_ball.striker
from ball_by_ball left outer join batsman_scored
on batsman_scored.match_id=ball_by_ball.match_id
and batsman_scored.over_id=ball_by_ball.over_id
and batsman_scored.ball_id=ball_by_ball.ball_id
and batsman_scored.innings_no=ball_by_ball.innings_no) as B
left outer join player on
B.striker=player.player_id) as K
group by K.match_id,K.player_name) as P where P.Total_runs>100) as C
group by C.player_name order by C.player_name ASC;


/* select C.player_name,max(C.Total_runs) Max_runs from
(select P.match_id,P.player_name,P.Total_runs from
(select K.match_id,K.player_name,SUM(K.runs_scored) Total_runs
from
(select B.match_id,B.runs_scored,player.player_name from
(select ball_by_ball.match_id,
batsman_scored.runs_scored, ball_by_ball.striker
from ball_by_ball left outer join batsman_scored
on batsman_scored.match_id=ball_by_ball.match_id
and batsman_scored.over_id=ball_by_ball.over_id
and batsman_scored.ball_id=ball_by_ball.ball_id
and batsman_scored.innings_no=ball_by_ball.innings_no) as B
left outer join player on
B.striker=player.player_id) as K
group by K.match_id,K.player_name) as P where P.Total_runs>100) as C
group by C.player_name order by Max_runs DESC;
 */




/* batsman scored --> match_id,over_id,inningsno,ball_id,runs
ball_by_ball --> batsman,match_id */

/* select ball_by_ball.striker,batsman_scored.runs_scored from batsman_scored 
inner join ball_by_ball on 
ball_by_ball.match_id = batsman_scored.match_id;




select P.match_id,P.striker,P.Total_runs from
(select K.match_id,K.striker,SUM(K.runs_scored) Total_runs
from
(select ball_by_ball.match_id,
batsman_scored.runs_scored, ball_by_ball.striker
from ball_by_ball left outer join batsman_scored
on batsman_scored.match_id=ball_by_ball.match_id
and batsman_scored.over_id=ball_by_ball.over_id
and batsman_scored.ball_id=ball_by_ball.ball_id
and batsman_scored.innings_no=ball_by_ball.innings_no) as K 
group by K.match_id,K.striker) as P where P.Total_runs>100;



select P.match_id,P.player_name,P.Total_runs from
(select K.match_id,K.player_name,SUM(K.runs_scored) Total_runs
from
(select B.match_id,B.runs_scored,player.player_name from
(select ball_by_ball.match_id,
batsman_scored.runs_scored, ball_by_ball.striker
from ball_by_ball left outer join batsman_scored
on batsman_scored.match_id=ball_by_ball.match_id
and batsman_scored.over_id=ball_by_ball.over_id
and batsman_scored.ball_id=ball_by_ball.ball_id
and batsman_scored.innings_no=ball_by_ball.innings_no) as B
left outer join player on
B.striker=player.player_id) as K
group by K.match_id,K.player_name) as P where P.Total_runs>100;
group by P.player_name; */





