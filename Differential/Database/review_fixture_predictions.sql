select f.gameweek, t1.name, f.res_goals_home, (f.pred_goals_home/10/10.0) pred_home, f.pred_ratio_home
     , t2.name, f.res_goals_away, (f.pred_goals_away/10/10.0) pred_away, f.pred_ratio_away
from fixture f, team t1, team t2
where f.season=12 and f.gameweek <= 20 and t1._id = f.team_home_id and t2._id = f.team_away_id
and gameweek >=12
order by pred_home desc