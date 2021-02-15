use ipl;

select player_name as names,count(player_out) as frequency 
from player left outer join wicket_taken on
player.player_id=wicket_taken.player_out 
and wicket_taken.kind_out='caught' group by names 
order by Frequency DESC,player_name ASC;