select t1name, t2name, count(*) cs, price/10.0 price from
(
select t1.name t1name, t2.name t2name, g.num gw, (ps1.price + ps2.price) price
, (SELECT CASE WHEN f.team_home_id = t1._id THEN f.pred_goals_away ELSE f.pred_goals_home END FROM fixture f
   WHERE f.gameweek = g.num AND f.season = 12 AND (f.team_home_id = t1._id OR f.team_away_id = t1._id)) t1conc
, (SELECT CASE WHEN f.team_home_id = t2._id THEN f.pred_goals_away ELSE f.pred_goals_home END FROM fixture f
   WHERE f.gameweek = g.num AND f.season = 12 AND (f.team_home_id = t2._id OR f.team_away_id = t2._id)) t2conc
from team t1, team t2, gameweek g, team_season ts1, team_season ts2, player p1, player p2, player_season ps1, player_season ps2
where t1._id < t2._id
and g.num >= 23
and g.num <= 30
and t1.active = 1 and t2.active = 1
and p1._id = ts1.gk_player_id and ps1.player_id = p1._id
and p2._id = ts2.gk_player_id and ps2.player_id = p2._id
and ps1.season = 12 and ps2.season = 12
and ts1.season = 12 and ts2.season = 12
and ts1.team_id = t1._id and ts2.team_id = t2._id
)
where (CASE WHEN t1conc < t2conc THEN t1conc ELSE t2conc END) <= 100
group by t1name, t2name
order by cs desc