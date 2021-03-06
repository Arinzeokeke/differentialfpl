select t.name, count(*) games, 1 home
from team t, fixture f
where f.team_home_id = t._id and f.season = 12
and f.gameweek >= 23
and f.pred_goals_away <= 100
group by t.name, home
union all
select t.name, count(*) games, 0 home
from team t, fixture f
where f.team_away_id = t._id and f.season = 12
and f.gameweek >= 23
and f.pred_goals_home <= 100
group by t.name, home
order by home desc, games desc