select t.name, f.gameweek, f.pred_goals_away, 1 home
from team t, fixture f
where f.team_home_id = t._id and f.season = 12
and f.gameweek >= 23
and f.pred_goals_away <= 100
union all
select t.name, f.gameweek, f.pred_goals_home, 0 home
from team t, fixture f
where f.team_away_id = t._id and f.season = 12
and f.gameweek >= 23
and f.pred_goals_home <= 100
order by t.name asc