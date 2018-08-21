-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : FourClass_10
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.3505492 * "IL"."Feature_0" + 1.865239 * "IL"."Feature_1" + -0.1255328 * "IL"."Feature_2" + 1.654871 * "IL"."Feature_3" + -1.279925 * "IL"."Feature_4" + 0.8106348 * "IL"."Feature_5" + -0.5546137 * "IL"."Feature_6" + -0.3236328 * "IL"."Feature_7" + -0.643855 * "IL"."Feature_8" + 0.2623641 * "IL"."Feature_9" + -1.017262 AS "NEUR_1_1", -1.489223 * "IL"."Feature_0" + 0.1620535 * "IL"."Feature_1" + 0.863884 * "IL"."Feature_2" + 0.6528619 * "IL"."Feature_3" + 1.127442 * "IL"."Feature_4" + 0.4912737 * "IL"."Feature_5" + -0.2033933 * "IL"."Feature_6" + 0.0351032 * "IL"."Feature_7" + -0.3048719 * "IL"."Feature_8" + -2.460177 * "IL"."Feature_9" + 0.8907269 AS "NEUR_1_2", -0.6560006 * "IL"."Feature_0" + -1.403468 * "IL"."Feature_1" + -0.8286367 * "IL"."Feature_2" + -0.5147078 * "IL"."Feature_3" + -0.6220879 * "IL"."Feature_4" + 0.4517627 * "IL"."Feature_5" + -0.1167767 * "IL"."Feature_6" + 2.277508 * "IL"."Feature_7" + 0.4980965 * "IL"."Feature_8" + -0.4207867 * "IL"."Feature_9" + -0.8622514 AS "NEUR_1_3", -1.200011 * "IL"."Feature_0" + 0.7397367 * "IL"."Feature_1" + 0.21903 * "IL"."Feature_2" + -0.1548004 * "IL"."Feature_3" + -0.9561206 * "IL"."Feature_4" + -0.3950214 * "IL"."Feature_5" + 0.227678 * "IL"."Feature_6" + -2.221053 * "IL"."Feature_7" + -0.2465599 * "IL"."Feature_8" + -0.3044202 * "IL"."Feature_9" + -1.977572 AS "NEUR_1_4", -0.4383092 * "IL"."Feature_0" + -0.6176107 * "IL"."Feature_1" + -0.6603423 * "IL"."Feature_2" + -1.110021 * "IL"."Feature_3" + -0.373669 * "IL"."Feature_4" + -0.6538791 * "IL"."Feature_5" + 0.398386 * "IL"."Feature_6" + -0.1190931 * "IL"."Feature_7" + -0.06793404 * "IL"."Feature_8" + -0.4387946 * "IL"."Feature_9" + -3.137989 AS "NEUR_1_5" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -4.786982 * "HL_1_logistic_1"."NEUR_1_1" + 0.7012698 * "HL_1_logistic_1"."NEUR_1_2" + 1.41959 * "HL_1_logistic_1"."NEUR_1_3" + 0.1450663 * "HL_1_logistic_1"."NEUR_1_4" + -2.295473 * "HL_1_logistic_1"."NEUR_1_5" + 2.334904 AS "NEUR_2_1", 1.240934 * "HL_1_logistic_1"."NEUR_1_1" + 2.402433 * "HL_1_logistic_1"."NEUR_1_2" + -2.326909 * "HL_1_logistic_1"."NEUR_1_3" + -3.024909 * "HL_1_logistic_1"."NEUR_1_4" + -0.5598624 * "HL_1_logistic_1"."NEUR_1_5" + -0.2593941 AS "NEUR_2_2", 0.4912961 * "HL_1_logistic_1"."NEUR_1_1" + -2.064378 * "HL_1_logistic_1"."NEUR_1_2" + 3.148657 * "HL_1_logistic_1"."NEUR_1_3" + 0.3606773 * "HL_1_logistic_1"."NEUR_1_4" + 3.221059 * "HL_1_logistic_1"."NEUR_1_5" + -0.7321111 AS "NEUR_2_3", 3.054903 * "HL_1_logistic_1"."NEUR_1_1" + -1.039504 * "HL_1_logistic_1"."NEUR_1_2" + -2.241302 * "HL_1_logistic_1"."NEUR_1_3" + 2.519273 * "HL_1_logistic_1"."NEUR_1_4" + -0.3659293 * "HL_1_logistic_1"."NEUR_1_5" + -1.343437 AS "NEUR_2_4" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1", "OL_BA"."NEUR_2_2" AS "NEUR_2_2", "OL_BA"."NEUR_2_3" AS "NEUR_2_3", "OL_BA"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1", "OL_softmax"."NEUR_2_2" AS "NEUR_2_2", "OL_softmax"."NEUR_2_3" AS "NEUR_2_3", "OL_softmax"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", "OL_softmax_1"."NEUR_2_1" AS "Score_0", "OL_softmax_1"."NEUR_2_2" AS "Score_1", "OL_softmax_1"."NEUR_2_3" AS "Score_2", "OL_softmax_1"."NEUR_2_4" AS "Score_3", CAST(NULL AS FLOAT) AS "Proba_0", CAST(NULL AS FLOAT) AS "Proba_1", CAST(NULL AS FLOAT) AS "Proba_2", CAST(NULL AS FLOAT) AS "Proba_3", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS FLOAT) AS "LogProba_2", CAST(NULL AS FLOAT) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(max(-100.0, score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(max(-100.0, score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1", exp(max(-100.0, score_max."Score_2" - score_max."max_Score")) AS "exp_delta_Score_2", exp(max(-100.0, score_max."Score_3" - score_max."max_Score")) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS class, score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS class, score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", CAST(NULL AS FLOAT) AS "Score_2", CAST(NULL AS FLOAT) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 0.0) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 0.0) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > 0.0) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > 0.0) THEN ln(arg_max_cte."SoftProba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", max(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2", arg_max_cte."SoftProba_3") AS "DecisionProba" 
FROM arg_max_cte