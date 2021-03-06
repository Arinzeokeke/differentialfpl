select t1, t2, price/10.0 price, sum(min(t1_conc, t2_conc))/100.0 conc
, group_concat(min(t1_conc, t2_conc)) games, sum(cs) good, sum(bad) bad from (
select *, case when min(t1_conc, t2_conc) <= 90 then 1 else 0 end cs
, case when min(t1_conc, t2_conc) >= 120 then 1 else 0 end bad from (
-- gw by gw conc by pair
select t1.name||' ('||t1._id||' '||p1.name||')' t1 , t2.name||' ('||t2._id||' '||p2.name||')' t2, g.num gw, ps1.price+ps2.price price
, case when f1.team_home_id = t1._id then f1.pred_goals_away else f1.pred_goals_home end t1_conc
, case when f2.team_home_id = t2._id then f2.pred_goals_away else f2.pred_goals_home end t2_conc
from team t1, team t2, fixture f1, fixture f2, gameweek g, team_season ts1, team_season ts2, player p1, player p2, player_season ps1, player_season ps2
where t1.active = 1 and t2.active = 1 and ps1.season = f1.season and ps2.season = f1.season and ps1.player_id = p1._id and ps2.player_id = p2._id
and t1._id < t2._id and f1.season = 13 and f2.season = f1.season
and g.season = f1.season and f1.gameweek = g.num and f2.gameweek = g.num
and (f1.team_home_id = t1._id or f1.team_away_id = t1._id)
and (f2.team_home_id = t2._id or f2.team_away_id = t2._id)
and ts1.season = f1.season and ts2.season = f1.season and ts1.team_id = t1._id and ts2.team_id = t2._id
and g.num <= 15 and p1._id = ts1.gk_player_id and p2._id = ts2.gk_player_id
--and t1._id != 11 and t2._id != 11
)
) group by t1, t2
order by conc asc
--order by good desc
--order by bad asc