select *, overperformed/(pred_pts*1.0)*100 over_pct, pred_pts * (minutes_percent/100.0) pred_pts_from_mins from
(select p.name, t.name, ps.position, sum(pm.total) points, sum(pm.pred_total_pts/100) pred_pts, sum(pm.minutes) minutes
, sum(pm.total) - sum(pm.pred_total_pts/100) overperformed, count(*) games, sum(pm.minutes) / (count(*)*90.0) * 100 minutes_percent
from player_season ps, player p, team t, player_match pm, team t2
where p._id = ps.player_id and t._id = p.team_id
and pm.player_player_id = p._id and pm.season=12 and ps.season=12
and pm.gameweek >= 20 and pm.gameweek <=34
and t2._id = pm.opp_team_id
and pm.minutes>0
group by p._id
order by points desc) where minutes >= 1000