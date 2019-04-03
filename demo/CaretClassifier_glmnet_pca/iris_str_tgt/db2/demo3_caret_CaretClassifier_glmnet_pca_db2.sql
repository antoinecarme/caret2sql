-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet_pca
-- Dataset : iris_str_tgt
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM "IRIS_STR_TGT" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.5263014514387969 + "ADS_sca_1_OUT"."Feature_1" * 0.2495430740050257 + "ADS_sca_1_OUT"."Feature_2" * -0.5822562654142306 + "ADS_sca_1_OUT"."Feature_3" * -0.5671972124538438 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.35797855187209515 + "ADS_sca_1_OUT"."Feature_1" * 0.9312088394674648 + "ADS_sca_1_OUT"."Feature_2" * 0.009350349831007576 + "ADS_sca_1_OUT"."Feature_3" * 0.06792661227568664 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.7268387018817979 + "ADS_sca_1_OUT"."Feature_1" * -0.2319858665682916 + "ADS_sca_1_OUT"."Feature_2" * -0.142090941958786 + "ADS_sca_1_OUT"."Feature_3" * -0.6306331924126783 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.2579993024404442 + "ADS_sca_1_OUT"."Feature_1" * 0.1294639302135427 + "ADS_sca_1_OUT"."Feature_2" * 0.8004376156560707 + "ADS_sca_1_OUT"."Feature_3" * -0.5253332981610163 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
linear_input AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) AS "PC4" 
FROM "ADS_pre_1_OUT"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 0.15986176876130936 * linear_input."PC1" + 0.0006068643811295388 * linear_input."PC2" + 0.0 * linear_input."PC3" + 0.0 * linear_input."PC4" + -0.08943677876939068 AS "Score_CLASS_0", 0.0 * linear_input."PC1" + -0.08314166127433004 * linear_input."PC2" + 0.0 * linear_input."PC3" + 0.0 * linear_input."PC4" + 0.01869087227870819 AS "Score_CLASS_1", -0.11306290162491192 * linear_input."PC1" + 0.0 * linear_input."PC2" + -0.06153452363958975 * linear_input."PC3" + 0.0 * linear_input."PC4" + 0.07074590649068249 AS "Score_CLASS_2" 
FROM linear_input), 
linear_model_cte_logistic AS 
(SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Score_CLASS_0" AS "Score_CLASS_0", linear_model_cte."Score_CLASS_1" AS "Score_CLASS_1", linear_model_cte."Score_CLASS_2" AS "Score_CLASS_2" 
FROM linear_model_cte), 
orig_cte AS 
(SELECT linear_model_cte_logistic."KEY" AS "KEY", linear_model_cte_logistic."Score_CLASS_0" AS "Score_CLASS_0", linear_model_cte_logistic."Score_CLASS_1" AS "Score_CLASS_1", linear_model_cte_logistic."Score_CLASS_2" AS "Score_CLASS_2", CAST(NULL AS DOUBLE) AS "Proba_CLASS_0", CAST(NULL AS DOUBLE) AS "Proba_CLASS_1", CAST(NULL AS DOUBLE) AS "Proba_CLASS_2", CAST(NULL AS DOUBLE) AS "LogProba_CLASS_0", CAST(NULL AS DOUBLE) AS "LogProba_CLASS_1", CAST(NULL AS DOUBLE) AS "LogProba_CLASS_2", NULL AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM linear_model_cte_logistic), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_0' AS class, orig_cte."LogProba_CLASS_0" AS "LogProba", orig_cte."Proba_CLASS_0" AS "Proba", orig_cte."Score_CLASS_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_1' AS class, orig_cte."LogProba_CLASS_1" AS "LogProba", orig_cte."Proba_CLASS_1" AS "Proba", orig_cte."Score_CLASS_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 'CLASS_2' AS class, orig_cte."LogProba_CLASS_2" AS "LogProba", orig_cte."Proba_CLASS_2" AS "Proba", orig_cte."Score_CLASS_2" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_CLASS_0" AS "Score_CLASS_0", orig_cte."Score_CLASS_1" AS "Score_CLASS_1", orig_cte."Score_CLASS_2" AS "Score_CLASS_2", orig_cte."Proba_CLASS_0" AS "Proba_CLASS_0", orig_cte."Proba_CLASS_1" AS "Proba_CLASS_1", orig_cte."Proba_CLASS_2" AS "Proba_CLASS_2", orig_cte."LogProba_CLASS_0" AS "LogProba_CLASS_0", orig_cte."LogProba_CLASS_1" AS "LogProba_CLASS_1", orig_cte."LogProba_CLASS_2" AS "LogProba_CLASS_2", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_CLASS_0" AS "Score_CLASS_0", score_max."Score_CLASS_1" AS "Score_CLASS_1", score_max."Score_CLASS_2" AS "Score_CLASS_2", score_max."Proba_CLASS_0" AS "Proba_CLASS_0", score_max."Proba_CLASS_1" AS "Proba_CLASS_1", score_max."Proba_CLASS_2" AS "Proba_CLASS_2", score_max."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_max."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_max."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(-100.0, score_max."Score_CLASS_0" - score_max."max_Score")) AS "exp_delta_Score_CLASS_0", exp(greatest(-100.0, score_max."Score_CLASS_1" - score_max."max_Score")) AS "exp_delta_Score_CLASS_1", exp(greatest(-100.0, score_max."Score_CLASS_2" - score_max."max_Score")) AS "exp_delta_Score_CLASS_2" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 'CLASS_0' AS class, score_soft_max_deltas."exp_delta_Score_CLASS_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 'CLASS_1' AS class, score_soft_max_deltas."exp_delta_Score_CLASS_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 'CLASS_2' AS class, score_soft_max_deltas."exp_delta_Score_CLASS_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_CLASS_0" AS "Score_CLASS_0", score_soft_max_deltas."Score_CLASS_1" AS "Score_CLASS_1", score_soft_max_deltas."Score_CLASS_2" AS "Score_CLASS_2", score_soft_max_deltas."Proba_CLASS_0" AS "Proba_CLASS_0", score_soft_max_deltas."Proba_CLASS_1" AS "Proba_CLASS_1", score_soft_max_deltas."Proba_CLASS_2" AS "Proba_CLASS_2", score_soft_max_deltas."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_soft_max_deltas."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_soft_max_deltas."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_CLASS_0" AS "exp_delta_Score_CLASS_0", score_soft_max_deltas."exp_delta_Score_CLASS_1" AS "exp_delta_Score_CLASS_1", score_soft_max_deltas."exp_delta_Score_CLASS_2" AS "exp_delta_Score_CLASS_2", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_CLASS_0" AS "Score_CLASS_0", score_soft_max."Score_CLASS_1" AS "Score_CLASS_1", score_soft_max."Score_CLASS_2" AS "Score_CLASS_2", score_soft_max."Proba_CLASS_0" AS "Proba_CLASS_0", score_soft_max."Proba_CLASS_1" AS "Proba_CLASS_1", score_soft_max."Proba_CLASS_2" AS "Proba_CLASS_2", score_soft_max."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_soft_max."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_soft_max."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_CLASS_0" AS "exp_delta_Score_CLASS_0", score_soft_max."exp_delta_Score_CLASS_1" AS "exp_delta_Score_CLASS_1", score_soft_max."exp_delta_Score_CLASS_2" AS "exp_delta_Score_CLASS_2", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_CLASS_0" AS "Score_CLASS_0", score_soft_max."Score_CLASS_1" AS "Score_CLASS_1", score_soft_max."Score_CLASS_2" AS "Score_CLASS_2", score_soft_max."Proba_CLASS_0" AS "Proba_CLASS_0", score_soft_max."Proba_CLASS_1" AS "Proba_CLASS_1", score_soft_max."Proba_CLASS_2" AS "Proba_CLASS_2", score_soft_max."LogProba_CLASS_0" AS "LogProba_CLASS_0", score_soft_max."LogProba_CLASS_1" AS "LogProba_CLASS_1", score_soft_max."LogProba_CLASS_2" AS "LogProba_CLASS_2", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_CLASS_0" AS "exp_delta_Score_CLASS_0", score_soft_max."exp_delta_Score_CLASS_1" AS "exp_delta_Score_CLASS_1", score_soft_max."exp_delta_Score_CLASS_2" AS "exp_delta_Score_CLASS_2", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_CLASS_0" AS "SoftProba_CLASS_0", soft_max_comp."SoftProba_CLASS_1" AS "SoftProba_CLASS_1", soft_max_comp."SoftProba_CLASS_2" AS "SoftProba_CLASS_2" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_CLASS_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_CLASS_0", score_soft_max."exp_delta_Score_CLASS_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_CLASS_1", score_soft_max."exp_delta_Score_CLASS_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_CLASS_2" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_CLASS_0", CAST(NULL AS DOUBLE) AS "Score_CLASS_1", CAST(NULL AS DOUBLE) AS "Score_CLASS_2", arg_max_cte."SoftProba_CLASS_0" AS "Proba_CLASS_0", arg_max_cte."SoftProba_CLASS_1" AS "Proba_CLASS_1", arg_max_cte."SoftProba_CLASS_2" AS "Proba_CLASS_2", CASE WHEN (arg_max_cte."SoftProba_CLASS_0" IS NULL OR arg_max_cte."SoftProba_CLASS_0" > 0.0) THEN ln(arg_max_cte."SoftProba_CLASS_0") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_0", CASE WHEN (arg_max_cte."SoftProba_CLASS_1" IS NULL OR arg_max_cte."SoftProba_CLASS_1" > 0.0) THEN ln(arg_max_cte."SoftProba_CLASS_1") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_1", CASE WHEN (arg_max_cte."SoftProba_CLASS_2" IS NULL OR arg_max_cte."SoftProba_CLASS_2" > 0.0) THEN ln(arg_max_cte."SoftProba_CLASS_2") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_2", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_CLASS_0", arg_max_cte."SoftProba_CLASS_1", arg_max_cte."SoftProba_CLASS_2") AS "DecisionProba" 
FROM arg_max_cte