select s._id, s.name, sgp.gameweek, sum(pm.pred_total_pts)/100.0 pts
from squad_gameweek_player sgp, player_match pm, player_season ps, squad s
where pm.gameweek >= 29
and pm.player_player_id = ps.player_id
and ps.season = 12 and ps.fpl_id = sgp.fpl_player_id
and pm.season = 12 and s._id = sgp.squad_id
and sgp.gameweek >= (29-1)
group by sgp.squad_id, sgp.gameweek
order by pts desc