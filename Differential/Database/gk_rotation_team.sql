select t1.name, t2.name, sum(CASE WHEN t1conc < t2conc THEN t1conc ELSE t2conc END)/100.0 conc, (ps1.price + ps2.price)/10.0 price from
--(
--select t1.name t1name, t2.name t2name, (ps1.price + ps2.price) price
, CASE WHEN f1.team_home_id = t1._id THEN f1.pred_goals_away ELSE f1.pred_goals_home END t1conc
, CASE WHEN f2.team_home_id = t2._id THEN f2.pred_goals_away ELSE f2.pred_goals_home END t2conc
from team t1, team t2, gameweek g, team_season ts1, team_season ts2, player p1, player p2, player_season ps1, player_season ps2
, fixture f1, fixture f2
where t1._id < t2._id
and g.num >= 23
and g.num <= 38
and t1.active = 1 and t2.active = 1
and p1._id = ts1.gk_player_id and ps1.player_id = p1._id
and p2._id = ts2.gk_player_id and ps2.player_id = p2._id
and ps1.season = 12 and ps2.season = 12
and ts1.season = 12 and ts2.season = 12
and ts1.team_id = t1._id and ts2.team_id = t2._id
and f1.gameweek = g.num and f2.gameweek = g.num
and f2.season = 12 and f2.season = 12
and (f1.team_home_id = t1._id OR f1.team_away_id = t1._id)
and (f2.team_home_id = t2._id OR f2.team_away_id = t2._id)
--)
group by t1name, t2name
order by conc asc