SELECT player_fpl_id, CASE WHEN ratio < 1 THEN 0 WHEN ratio >= 1 AND ratio < 2.5 THEN 1 ELSE 2.5 END ratio_group, SUM(total) points, COUNT(*) games
FROM
(
SELECT pm.player_fpl_id, CASE WHEN pm.is_home=1 THEN f.pred_ratio_home ELSE f.pred_ratio_away END ratio, total
FROM player_match pm, fixture f
WHERE f._id = pm.fixture_id
)
GROUP BY player_fpl_id, ratio_group