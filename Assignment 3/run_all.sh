sudo mysql < create_table.sql
echo "Completed Create Table"
sudo mysql < ./insert/team.sql
echo "Inserting Team completed"
sudo mysql < ./insert/player.sql
echo "Inserting Player Completed"
sudo mysql < ./insert/ball_by_ball.sql
echo "Inserting Ball By ball Completed" 
sudo mysql <./insert/match.sql
echo "Inserting Match Completed"
sudo mysql < ./insert/wicket_taken.sql
echo "Inserting Wicket Taken Completed"
sudo mysql < ./insert/extra_runs.sql
echo "Inserting Extra Runs Completed" 
sudo mysql < ./insert/batsman_scored.sql
echo "Inserting Batsman Scored Completed" 
sudo mysql < ./insert/player_match.sql
echo "Inserting Player Match Completed" 


