select p.name, pm.gameweek, pm.goals, pm.team_goals_on_pitch, pm.minutes
from player p, player_match pm
where pm.season=12 
and p._id = pm.player_player_id
and ((pm.goals > pm.team_goals_on_pitch OR (pm.goals is not null and pm.goals > 0 and pm.team_goals_on_pitch is null)))
order by pm.gameweek desc, pm.goals desc