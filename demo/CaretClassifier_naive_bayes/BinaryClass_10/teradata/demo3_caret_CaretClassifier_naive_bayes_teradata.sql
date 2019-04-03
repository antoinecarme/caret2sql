-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_naive_bayes
-- Dataset : BinaryClass_10
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH centered_data AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(0.873654099723867 AS DOUBLE PRECISION) AS "Feature_0_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(0.224178233225322 AS DOUBLE PRECISION) AS "Feature_1_0", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.052380401732852 AS DOUBLE PRECISION) AS "Feature_2_0", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.008194292112153 AS DOUBLE PRECISION) AS "Feature_3_0", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(0.042448533514087 AS DOUBLE PRECISION) AS "Feature_4_0", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(-0.0117759292946 AS DOUBLE PRECISION) AS "Feature_5_0", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(0.385052285364005 AS DOUBLE PRECISION) AS "Feature_6_0", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(0.346265469014169 AS DOUBLE PRECISION) AS "Feature_7_0", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(-0.114049479811569 AS DOUBLE PRECISION) AS "Feature_8_0", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(-0.898176145585946 AS DOUBLE PRECISION) AS "Feature_9_0", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(-0.749995689247598 AS DOUBLE PRECISION) AS "Feature_0_1", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(0.129871042118345 AS DOUBLE PRECISION) AS "Feature_1_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.030387298365216 AS DOUBLE PRECISION) AS "Feature_2_1", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.25301864400479 AS DOUBLE PRECISION) AS "Feature_3_1", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(-0.161564742953749 AS DOUBLE PRECISION) AS "Feature_4_1", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(-0.086082250445612 AS DOUBLE PRECISION) AS "Feature_5_1", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(-0.003016328129743 AS DOUBLE PRECISION) AS "Feature_6_1", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(-0.30216627554882 AS DOUBLE PRECISION) AS "Feature_7_1", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(-0.001410148256711 AS DOUBLE PRECISION) AS "Feature_8_1", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(0.793076961481881 AS DOUBLE PRECISION) AS "Feature_9_1" 
FROM "BinaryClass_10" AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"NaiveBayes_data" AS 
(SELECT "Values"."KEY" AS "KEY", "Values"."Feature" AS "Feature", "Values".log_proba_0 AS log_proba_0, "Values".log_proba_1 AS log_proba_1 
FROM (SELECT centered_data."KEY" AS "KEY", 0 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.191259696108052 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_0_0" * centered_data."Feature_0_0") / CAST(0.523814654351857 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.036320680524215 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_0_1" * centered_data."Feature_0_1") / CAST(1.219503262704703 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 1 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.659299944523641 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_1_0" * centered_data."Feature_1_0") / CAST(0.836459545052358 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.812212898284265 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_1_1" * centered_data."Feature_1_1") / CAST(0.974662357339085 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 2 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.757993383705457 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_2_0" * centered_data."Feature_2_0") / CAST(0.923223727029036 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.204904128644029 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_2_1" * centered_data."Feature_2_1") / CAST(1.443436981216958 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 3 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.149810056501834 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_3_0" * centered_data."Feature_3_0") / CAST(1.366063150197026 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.830227162064718 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_3_1" * centered_data."Feature_3_1") / CAST(0.992379281702704 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 4 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.136138956996935 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_4_0" * centered_data."Feature_4_0") / CAST(1.34751464307447 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.983409210483882 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_4_1" * centered_data."Feature_4_1") / CAST(1.156654913586399 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 5 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.414308191165397 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_5_0" * centered_data."Feature_5_0") / CAST(1.779675643160882 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.586315987570308 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_5_1" * centered_data."Feature_5_1") / CAST(2.11369779087248 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 6 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.728463128330944 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_6_0" * centered_data."Feature_6_0") / CAST(0.89635930344679 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.807963976006246 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_6_1" * centered_data."Feature_6_1") / CAST(0.970529878243772 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 7 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(-0.998699633311966 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_7_0" * centered_data."Feature_7_0") / CAST(0.058626017298809 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(0.165492841666519 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_7_1" * centered_data."Feature_7_1") / CAST(0.187798776949937 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 8 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(1.82037414316102 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_8_0" * centered_data."Feature_8_0") / CAST(0.982649363132769 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.127366293690636 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_8_1" * centered_data."Feature_8_1") / CAST(1.335745051623841 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte UNION ALL SELECT centered_data."KEY" AS "KEY", 9 AS "Feature", CAST(-0.5 AS DOUBLE PRECISION) * CAST(0.690080031030872 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_9_0" * centered_data."Feature_9_0") / CAST(0.317335077871911 AS DOUBLE PRECISION) AS log_proba_0, CAST(-0.5 AS DOUBLE PRECISION) * CAST(2.093823429990704 AS DOUBLE PRECISION) - (CAST(0.5 AS DOUBLE PRECISION) * centered_data."Feature_9_1" * centered_data."Feature_9_1") / CAST(1.291683444807673 AS DOUBLE PRECISION) AS log_proba_1 
FROM centered_data, dummy_cte) AS "Values"), 
"NaiveBayes_Scores" AS 
(SELECT nb_sums."KEY" AS "KEY", nb_sums."Score_0" AS "Score_0", nb_sums."Score_1" AS "Score_1" 
FROM (SELECT "NaiveBayes_data"."KEY" AS "KEY", CAST(-0.693147180559945 AS DOUBLE PRECISION) + sum("NaiveBayes_data".log_proba_0) AS "Score_0", CAST(-0.693147180559945 AS DOUBLE PRECISION) + sum("NaiveBayes_data".log_proba_1) AS "Score_1" 
FROM "NaiveBayes_data" GROUP BY "NaiveBayes_data"."KEY") AS nb_sums), 
orig_cte AS 
(SELECT "NaiveBayes_Scores"."KEY" AS "KEY", "NaiveBayes_Scores"."Score_0" AS "Score_0", "NaiveBayes_Scores"."Score_1" AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "NaiveBayes_Scores"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu."class" AS "class", scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS "class", orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS "class", orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu."class" AS "class", soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS "class", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS "class", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union."class" AS "class", score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max."class") AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1") AS "DecisionProba" 
FROM arg_max_cte