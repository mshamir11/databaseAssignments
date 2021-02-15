use ipl;



/*
select venue,count(venue) 
 from extra_runs inner join match_details on match_details.match_id=extra_runs.match_id 
 and extra_runs.extra_type='legbyes' group by venue having count(venue)=  (select max(Frequency ) from 
 (select match_details.venue,count(match_details.venue) as Frequency
 from extra_runs,match_details where match_details.match_id=extra_runs.match_id 
 and extra_runs.extra_type='legbyes' group by match_details.venue) as K);
*/


select venue as venue_name,SUM(extra_runs.extra_runs) number_of_legbye_runs
 from extra_runs inner join match_details on match_details.match_id=extra_runs.match_id 
 and extra_runs.extra_type='legbyes' group by venue having SUM(extra_runs.extra_runs)=
 (select max(Total_Legbye_Runs ) maximum_legbye from 
 (select match_details.venue,SUM(extra_runs.extra_runs) as Total_Legbye_Runs
 from extra_runs,match_details where match_details.match_id=extra_runs.match_id 
 and extra_runs.extra_type='legbyes' group by match_details.venue ) as K) order by venue;