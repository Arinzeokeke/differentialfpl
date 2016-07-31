select t._id, t.name, ts.gk_player_id, p.name
from team t, team_season ts, player p
where t._id = ts.team_id and ts.season = 12
and p._id = ts.gk_player_id