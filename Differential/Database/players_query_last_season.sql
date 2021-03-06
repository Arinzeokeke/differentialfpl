--explain query plan
SELECT p._id _id, p.name name, p.team_id team_id, ps.position position, p.fpl_yellow_flag fpl_yellow_flag, p.fpl_red_flag fpl_red_flag
, p.diff_flag diff_flag, '£'||ps.price||'M' price, ps.points points, p.picture_code picture_code, (ps.assists * 3) assist_pts, ps.bonus bonus_pts
, (CASE WHEN ps.position <= 2 THEN ps.goals * 6 WHEN ps.position = 3 THEN ps.goals * 5 WHEN ps.position = 4 THEN ps.goals * 4 END) goal_pts
, ps.assists, ps.c_assists_perc_team, p.ticker_string, ps.fpl_id 
FROM player p, player_season ps, player_season pls
WHERE ps.player_id = p._id AND ps.season = 12 AND pls.season = 11 AND pls.player_id = p._id
AND p.team_id = 12
ORDER BY ps.points DESC
LIMIT 50