select p._id, p.name, t.name, ps.position, ps.price, ps.fpl_id, p.fpl_news, p.fpl_red_flag, p.fpl_yellow_flag
, p2._id, p2.name, t2.name, ps2.position, ps2.price, ps2.fpl_id, p2.fpl_news, p2.fpl_red_flag, p2.fpl_yellow_flag
from player p, player p2, team t, team t2, player_season ps, player_season ps2
where p.name = p2.name and p._id < p2._id and t._id = p.team_id and t2._id = p2.team_id
and ps.season = 13 and ps2.season = ps.season and ps.player_id = p._id and ps2.player_id = p2._id
and p.team_id = p2.team_id