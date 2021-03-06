select sgp.squad_id, sgp.gameweek, p.name, t.name team
from dbMoi.squad_gameweek_player sgp, player p, team t, player_season ps
where ps.season = 12
and ps.fpl_id = sgp.fpl_player_id
and p._id = ps.player_id
and t._id = p.team_id
and sgp.autosub = 1
order by sgp.squad_id asc, sgp.gameweek asc