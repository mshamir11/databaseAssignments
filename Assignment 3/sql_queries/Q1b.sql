use ipl;

select player_name as name,count(player_out) as frequency 
from player inner join wicket_taken on
player.player_id=wicket_taken.player_out 
and wicket_taken.kind_out='caught' group by player_out 
order by Frequency DESC,player_name ASC;