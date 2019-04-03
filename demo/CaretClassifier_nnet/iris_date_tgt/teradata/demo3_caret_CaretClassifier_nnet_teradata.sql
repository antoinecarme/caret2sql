-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : iris_date_tgt
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3" 
FROM iris_date_tgt AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", CAST(-1.885409 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-1.174366 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-1.168836 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.2784793 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.4467987 AS DOUBLE PRECISION) AS "NEUR_1_1", CAST(1.459676 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.594149 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.323253 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.5604826 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.1819213 AS DOUBLE PRECISION) AS "NEUR_1_2", CAST(0.5805478 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.713948 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-2.459465 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-1.303042 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.24497 AS DOUBLE PRECISION) AS "NEUR_1_3", CAST(0.413127 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.1545092 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.2426047 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.1457333 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.1219933 AS DOUBLE PRECISION) AS "NEUR_1_4", CAST(1.167972 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.483822 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.07962 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.2960008 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.1383511 AS DOUBLE PRECISION) AS "NEUR_1_5", CAST(-0.4300799 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-0.04024937 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-0.6322566 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.2755224 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.09982315 AS DOUBLE PRECISION) AS "NEUR_1_6", CAST(-0.7956096 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-2.179347 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(3.162282 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(1.523885 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.2856055 AS DOUBLE PRECISION) AS "NEUR_1_7", CAST(0.7584736 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.2290209 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.05071 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.4960505 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.05992346 AS DOUBLE PRECISION) AS "NEUR_1_8", CAST(0.6375304 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.1528121 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.8235994 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.3179903 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.09639296 AS DOUBLE PRECISION) AS "NEUR_1_9", CAST(-0.2920751 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-0.0577446 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-0.6593809 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.329122 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.006874495 AS DOUBLE PRECISION) AS "NEUR_1_10", CAST(1.222304 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.4435621 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.21171 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.4216454 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(0.1690145 AS DOUBLE PRECISION) AS "NEUR_1_11", CAST(11.11919 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(9.087761 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-17.60505 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-12.31491 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(12.34535 AS DOUBLE PRECISION) AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", CAST(0.05788471 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(-0.05252858 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(8.842134 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(0.2157186 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(-0.5035078 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(-0.5838529 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(-3.084433 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(-0.4500896 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(-0.6371119 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(0.2279303 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(-0.582718 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(3.519321 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(-0.1865858 AS DOUBLE PRECISION) AS "NEUR_2_1", CAST(-0.5985937 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(-2.758491 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(-8.730934 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(-0.9360425 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(-2.587736 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(-0.2501352 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(1.958796 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(-0.7244158 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(-0.389472 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(-0.6408762 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(-1.094376 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(18.98473 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(-1.073578 AS DOUBLE PRECISION) AS "NEUR_2_2", CAST(0.4576537 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(2.915333 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(-0.04219196 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(0.7384859 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(3.057686 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(0.8075117 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(1.026288 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(1.168407 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(1.150226 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(0.4117571 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(1.671699 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(-22.41542 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(1.293961 AS DOUBLE PRECISION) AS "NEUR_2_3" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1", "OL_BA"."NEUR_2_2" AS "NEUR_2_2", "OL_BA"."NEUR_2_3" AS "NEUR_2_3" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1", "OL_softmax"."NEUR_2_2" AS "NEUR_2_2", "OL_softmax"."NEUR_2_3" AS "NEUR_2_3" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", "OL_softmax_1"."NEUR_2_1" AS "Score_1789-07-14T00:00:00.000000000", "OL_softmax_1"."NEUR_2_2" AS "Score_1789-08-14T00:00:00.000000000", "OL_softmax_1"."NEUR_2_3" AS "Score_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-09-14T00:00:00.000000000", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu."class" AS "class", scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", '1789-07-14T00:00:00.000000000' AS "class", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-08-14T00:00:00.000000000' AS "class", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-09-14T00:00:00.000000000' AS "class", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1789-07-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-07-14T00:00:00.000000000", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1789-08-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-08-14T00:00:00.000000000", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1789-09-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-09-14T00:00:00.000000000" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu."class" AS "class", soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-07-14T00:00:00.000000000' AS "class", score_soft_max_deltas."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-08-14T00:00:00.000000000' AS "class", score_soft_max_deltas."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-09-14T00:00:00.000000000' AS "class", score_soft_max_deltas."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max_deltas."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max_deltas."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max_deltas."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max_deltas."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union."class" AS "class", score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_1789-07-14T00:00:00.000000000" AS "SoftProba_1789-07-14T00:00:00.000000000", soft_max_comp."SoftProba_1789-08-14T00:00:00.000000000" AS "SoftProba_1789-08-14T00:00:00.000000000", soft_max_comp."SoftProba_1789-09-14T00:00:00.000000000" AS "SoftProba_1789-09-14T00:00:00.000000000" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max."class") AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-09-14T00:00:00.000000000" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-09-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000") AS "DecisionProba" 
FROM arg_max_cte