select pm.*, t.name 
from player_match pm, team t
where pm.season=12 and pm.player_player_id=486
and t._id = pm.opp_team_id
order by gameweek asc