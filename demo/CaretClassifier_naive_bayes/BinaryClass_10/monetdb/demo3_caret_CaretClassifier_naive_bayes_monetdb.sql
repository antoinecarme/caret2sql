-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_naive_bayes
-- Dataset : BinaryClass_10
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH centered_data AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) - 0.873654099723867 AS "Feature_0_0", CAST("ADS"."Feature_1" AS DOUBLE) - 0.224178233225322 AS "Feature_1_0", CAST("ADS"."Feature_2" AS DOUBLE) - 0.0523804017328524 AS "Feature_2_0", CAST("ADS"."Feature_3" AS DOUBLE) - 0.00819429211215264 AS "Feature_3_0", CAST("ADS"."Feature_4" AS DOUBLE) - 0.0424485335140869 AS "Feature_4_0", CAST("ADS"."Feature_5" AS DOUBLE) - -0.0117759292946001 AS "Feature_5_0", CAST("ADS"."Feature_6" AS DOUBLE) - 0.385052285364005 AS "Feature_6_0", CAST("ADS"."Feature_7" AS DOUBLE) - 0.346265469014169 AS "Feature_7_0", CAST("ADS"."Feature_8" AS DOUBLE) - -0.114049479811569 AS "Feature_8_0", CAST("ADS"."Feature_9" AS DOUBLE) - -0.8981761455859459 AS "Feature_9_0", CAST("ADS"."Feature_0" AS DOUBLE) - -0.7499956892475981 AS "Feature_0_1", CAST("ADS"."Feature_1" AS DOUBLE) - 0.129871042118345 AS "Feature_1_1", CAST("ADS"."Feature_2" AS DOUBLE) - 0.0303872983652165 AS "Feature_2_1", CAST("ADS"."Feature_3" AS DOUBLE) - 0.25301864400479 AS "Feature_3_1", CAST("ADS"."Feature_4" AS DOUBLE) - -0.161564742953749 AS "Feature_4_1", CAST("ADS"."Feature_5" AS DOUBLE) - -0.0860822504456115 AS "Feature_5_1", CAST("ADS"."Feature_6" AS DOUBLE) - -0.00301632812974252 AS "Feature_6_1", CAST("ADS"."Feature_7" AS DOUBLE) - -0.30216627554882003 AS "Feature_7_1", CAST("ADS"."Feature_8" AS DOUBLE) - -0.00141014825671085 AS "Feature_8_1", CAST("ADS"."Feature_9" AS DOUBLE) - 0.793076961481881 AS "Feature_9_1" 
FROM "BinaryClass_10" AS "ADS"), 
"NaiveBayes_data" AS 
(SELECT "Values"."KEY" AS "KEY", "Values"."Feature" AS "Feature", "Values".log_proba_0 AS log_proba_0, "Values".log_proba_1 AS log_proba_1 
FROM (SELECT centered_data."KEY" AS "KEY", 0 AS "Feature", -0.5 * 1.1912596961080522 - (0.5 * centered_data."Feature_0_0" * centered_data."Feature_0_0") / 0.5238146543518568 AS log_proba_0, -0.5 * 2.036320680524215 - (0.5 * centered_data."Feature_0_1" * centered_data."Feature_0_1") / 1.2195032627047029 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 1 AS "Feature", -0.5 * 1.6592999445236407 - (0.5 * centered_data."Feature_1_0" * centered_data."Feature_1_0") / 0.8364595450523575 AS log_proba_0, -0.5 * 1.8122128982842653 - (0.5 * centered_data."Feature_1_1" * centered_data."Feature_1_1") / 0.9746623573390848 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 2 AS "Feature", -0.5 * 1.7579933837054573 - (0.5 * centered_data."Feature_2_0" * centered_data."Feature_2_0") / 0.9232237270290362 AS log_proba_0, -0.5 * 2.204904128644029 - (0.5 * centered_data."Feature_2_1" * centered_data."Feature_2_1") / 1.443436981216958 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 3 AS "Feature", -0.5 * 2.1498100565018334 - (0.5 * centered_data."Feature_3_0" * centered_data."Feature_3_0") / 1.3660631501970255 AS log_proba_0, -0.5 * 1.8302271620647186 - (0.5 * centered_data."Feature_3_1" * centered_data."Feature_3_1") / 0.9923792817027038 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 4 AS "Feature", -0.5 * 2.136138956996935 - (0.5 * centered_data."Feature_4_0" * centered_data."Feature_4_0") / 1.3475146430744704 AS log_proba_0, -0.5 * 1.983409210483882 - (0.5 * centered_data."Feature_4_1" * centered_data."Feature_4_1") / 1.156654913586399 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 5 AS "Feature", -0.5 * 2.414308191165397 - (0.5 * centered_data."Feature_5_0" * centered_data."Feature_5_0") / 1.779675643160882 AS log_proba_0, -0.5 * 2.5863159875703086 - (0.5 * centered_data."Feature_5_1" * centered_data."Feature_5_1") / 2.11369779087248 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 6 AS "Feature", -0.5 * 1.7284631283309446 - (0.5 * centered_data."Feature_6_0" * centered_data."Feature_6_0") / 0.8963593034467904 AS log_proba_0, -0.5 * 1.8079639760062465 - (0.5 * centered_data."Feature_6_1" * centered_data."Feature_6_1") / 0.970529878243772 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 7 AS "Feature", -0.5 * -0.9986996333119655 - (0.5 * centered_data."Feature_7_0" * centered_data."Feature_7_0") / 0.058626017298809494 AS log_proba_0, -0.5 * 0.165492841666519 - (0.5 * centered_data."Feature_7_1" * centered_data."Feature_7_1") / 0.18779877694993738 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 8 AS "Feature", -0.5 * 1.8203741431610194 - (0.5 * centered_data."Feature_8_0" * centered_data."Feature_8_0") / 0.9826493631327688 AS log_proba_0, -0.5 * 2.1273662936906366 - (0.5 * centered_data."Feature_8_1" * centered_data."Feature_8_1") / 1.335745051623841 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 9 AS "Feature", -0.5 * 0.6900800310308718 - (0.5 * centered_data."Feature_9_0" * centered_data."Feature_9_0") / 0.31733507787191134 AS log_proba_0, -0.5 * 2.093823429990704 - (0.5 * centered_data."Feature_9_1" * centered_data."Feature_9_1") / 1.291683444807673 AS log_proba_1 
FROM centered_data) AS "Values"), 
"NaiveBayes_Scores" AS 
(SELECT nb_sums."KEY" AS "KEY", nb_sums."Score_0" AS "Score_0", nb_sums."Score_1" AS "Score_1" 
FROM (SELECT "NaiveBayes_data"."KEY" AS "KEY", -0.6931471805599453 + sum("NaiveBayes_data".log_proba_0) AS "Score_0", -0.6931471805599453 + sum("NaiveBayes_data".log_proba_1) AS "Score_1" 
FROM "NaiveBayes_data" GROUP BY "NaiveBayes_data"."KEY") AS nb_sums), 
orig_cte AS 
(SELECT "NaiveBayes_Scores"."KEY" AS "KEY", "NaiveBayes_Scores"."Score_0" AS "Score_0", "NaiveBayes_Scores"."Score_1" AS "Score_1", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM "NaiveBayes_Scores"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(CASE WHEN (-100.0 <= score_max."Score_0" - score_max."max_Score") THEN score_max."Score_0" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_0", exp(CASE WHEN (-100.0 <= score_max."Score_1" - score_max."max_Score") THEN score_max."Score_1" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_1" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", log(CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 1e-100) THEN arg_max_cte."SoftProba_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 1e-100) THEN arg_max_cte."SoftProba_1" ELSE 1e-100 END) AS "LogProba_1", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."SoftProba_0" <= arg_max_cte."SoftProba_1") THEN arg_max_cte."SoftProba_1" ELSE arg_max_cte."SoftProba_0" END AS "DecisionProba" 
FROM arg_max_cte