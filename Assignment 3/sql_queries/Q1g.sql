use ipl;



select E.country_name as country,sum(E.batting_average)/count(E.country_name) value
from
(select player.player_name as batsman_name,D.striker,D.batting_average,player.country_name
from
(select C.striker,SUM(C.runs_scored)/COUNT(C.match_id) batting_average
from
(select B.match_id,B.striker,SUM(B.runs_scored) runs_scored
from
(select A.match_id,A.striker,batsman_scored.runs_scored
from
ball_by_ball as A
inner join batsman_scored
on 
A.match_id=batsman_scored.match_id
and A.over_id=batsman_scored.over_id
and A.ball_id=batsman_scored.ball_id
and A.innings_no = batsman_scored.innings_no) as B
group by B.match_id,B.striker) as C
group by C.striker order by batting_average desc) as D
inner join
player on
player.player_id=D.striker) as E
group by E.country_name order by value DESC limit 3;


