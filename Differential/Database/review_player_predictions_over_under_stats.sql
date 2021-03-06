--drop view review_player_preds_grouped_v;
create view review_player_preds_grouped_v as
select diff_rounded, count(*) total
, round((count(*) * 100.0) / (select count(*) from review_player_predictions_v), 1) perc
from review_player_predictions_v group by diff_rounded
order by total desc