select pm.gameweek, psp.position, p.name, sum(pm.pred_total_pts)/100.0 pts
, group_concat(t.name || replace(ifnull(pm.is_home, ' (a)'), '1', ' (h)'), ' / ') opp
from player_match pm, player p, team t, fixture f, gameweek g, player_season psp
where g.num = 8 and pm.gameweek >= g.num and f._id = pm.fixture_id
and pm.player_player_id = p._id and pm.season = 13 and t._id = pm.opp_team_id
and psp.player_id = p._id and psp.season = pm.season
and (   p._id IN (SELECT ps.player_id FROM player_season ps, squad_gameweek_player sgp
               WHERE ps.season = 13 and ps.fpl_id = sgp.fpl_player_id
                 AND sgp.gameweek = g.num and sgp.squad_id = 791)
      OR p._id IN (0)   )
group by pm.gameweek, p._id
order by pm.gameweek asc, position asc, pts desc