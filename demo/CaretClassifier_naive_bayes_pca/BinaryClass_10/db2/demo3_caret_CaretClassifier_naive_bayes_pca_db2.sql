-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_naive_bayes_pca
-- Dataset : BinaryClass_10
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 0.06182920523813451) / 1.236134089597546 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 0.17702463767183327) / 0.946757498519011 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.041383850049034464) / 1.0809597326983538 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.13060646805847148) / 1.0860335106241017 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - -0.05955810471983085) / 1.1165897507633815 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - -0.048929089870105816) / 1.3868824547243672 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 0.19101797861713127) / 0.979670721363872 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.02204959673267471) / 0.4775973825125086 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - -0.05772981403414008) / 1.0713243581907332 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - -0.052549592052032364) / 1.2322587258530384 AS "Feature_9" 
FROM "BINARYCLASS_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.5661592321920361 + "ADS_sca_1_OUT"."Feature_1" * -0.035526328604152946 + "ADS_sca_1_OUT"."Feature_2" * -0.0467879363120513 + "ADS_sca_1_OUT"."Feature_3" * 0.008946515209953917 + "ADS_sca_1_OUT"."Feature_4" * 0.0829511888403661 + "ADS_sca_1_OUT"."Feature_5" * -0.10205221296100445 + "ADS_sca_1_OUT"."Feature_6" * 0.1424451507903749 + "ADS_sca_1_OUT"."Feature_7" * 0.5666566688831561 + "ADS_sca_1_OUT"."Feature_8" * -0.06631427728790784 + "ADS_sca_1_OUT"."Feature_9" * -0.5593289854950824 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.0767125800279515 + "ADS_sca_1_OUT"."Feature_1" * -0.40153794458328573 + "ADS_sca_1_OUT"."Feature_2" * 0.5677578250446825 + "ADS_sca_1_OUT"."Feature_3" * 0.2369735703010663 + "ADS_sca_1_OUT"."Feature_4" * -0.09632922916256215 + "ADS_sca_1_OUT"."Feature_5" * -0.5767787279161882 + "ADS_sca_1_OUT"."Feature_6" * -0.3216376934797878 + "ADS_sca_1_OUT"."Feature_7" * -0.006693968243624504 + "ADS_sca_1_OUT"."Feature_8" * -0.06421158945215161 + "ADS_sca_1_OUT"."Feature_9" * 0.06932008034543824 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.04428807917268944 + "ADS_sca_1_OUT"."Feature_1" * 0.02244286142288565 + "ADS_sca_1_OUT"."Feature_2" * -0.1709384323174772 + "ADS_sca_1_OUT"."Feature_3" * 0.4187938020309751 + "ADS_sca_1_OUT"."Feature_4" * 0.4638804547130563 + "ADS_sca_1_OUT"."Feature_5" * 0.12436384332391155 + "ADS_sca_1_OUT"."Feature_6" * -0.2491197630750001 + "ADS_sca_1_OUT"."Feature_7" * -0.02707014062139766 + "ADS_sca_1_OUT"."Feature_8" * -0.7066063892300462 + "ADS_sca_1_OUT"."Feature_9" * 0.01375528233133572 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.035505292609370916 + "ADS_sca_1_OUT"."Feature_1" * 0.4629415976318115 + "ADS_sca_1_OUT"."Feature_2" * 0.39703949728185695 + "ADS_sca_1_OUT"."Feature_3" * 0.108176435008563 + "ADS_sca_1_OUT"."Feature_4" * -0.5443880279914196 + "ADS_sca_1_OUT"."Feature_5" * 0.3886991214463785 + "ADS_sca_1_OUT"."Feature_6" * -0.3136270685510785 + "ADS_sca_1_OUT"."Feature_7" * 0.09412147953130984 + "ADS_sca_1_OUT"."Feature_8" * -0.2041303312264922 + "ADS_sca_1_OUT"."Feature_9" * -0.1369183431411648 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.02395611334530353 + "ADS_sca_1_OUT"."Feature_1" * 0.3059663067403714 + "ADS_sca_1_OUT"."Feature_2" * 0.1244148619727216 + "ADS_sca_1_OUT"."Feature_3" * 0.7205232130433498 + "ADS_sca_1_OUT"."Feature_4" * -0.010360887714254759 + "ADS_sca_1_OUT"."Feature_5" * -0.12313866467327145 + "ADS_sca_1_OUT"."Feature_6" * 0.5630711251768787 + "ADS_sca_1_OUT"."Feature_7" * -0.04287636501865158 + "ADS_sca_1_OUT"."Feature_8" * 0.18391692419974146 + "ADS_sca_1_OUT"."Feature_9" * 0.056520588594192574 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.048169250614026715 + "ADS_sca_1_OUT"."Feature_1" * 0.6239362496677012 + "ADS_sca_1_OUT"."Feature_2" * 0.20083118524117005 + "ADS_sca_1_OUT"."Feature_3" * -0.1618608106397551 + "ADS_sca_1_OUT"."Feature_4" * 0.5432007330496692 + "ADS_sca_1_OUT"."Feature_5" * -0.2436186036944093 + "ADS_sca_1_OUT"."Feature_6" * -0.3147233303086936 + "ADS_sca_1_OUT"."Feature_7" * 0.01337545211610092 + "ADS_sca_1_OUT"."Feature_8" * 0.29670903412359584 + "ADS_sca_1_OUT"."Feature_9" * 0.01296934529502586 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.06773590863463053 + "ADS_sca_1_OUT"."Feature_1" * -0.11758181773858208 + "ADS_sca_1_OUT"."Feature_2" * 0.6477095493436038 + "ADS_sca_1_OUT"."Feature_3" * -0.3112272823678729 + "ADS_sca_1_OUT"."Feature_4" * 0.33477688181210946 + "ADS_sca_1_OUT"."Feature_5" * 0.29496375499110145 + "ADS_sca_1_OUT"."Feature_6" * 0.4607366756100071 + "ADS_sca_1_OUT"."Feature_7" * -0.025868856528122847 + "ADS_sca_1_OUT"."Feature_8" * -0.2305082370268579 + "ADS_sca_1_OUT"."Feature_9" * -0.005964439285718312 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
centered_data AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) - 1.1736196751346002 AS "PC1_0", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) - -0.12724699642808301 AS "PC2_0", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) - -0.0712122294385137 AS "PC3_0", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) - 0.10536794969607399 AS "PC4_0", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE) - -0.0507271513174331 AS "PC5_0", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE) - 0.0483429774918012 AS "PC6_0", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE) - 0.119716869686503 AS "PC7_0", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) - -1.1736196751346002 AS "PC1_1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) - 0.12724699642808301 AS "PC2_1", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) - 0.0712122294385137 AS "PC3_1", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) - -0.10536794969607399 AS "PC4_1", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE) - 0.0507271513174331 AS "PC5_1", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE) - -0.0483429774918011 AS "PC6_1", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE) - -0.119716869686503 AS "PC7_1" 
FROM "ADS_pre_1_OUT"), 
"NaiveBayes_data" AS 
(SELECT "Values"."KEY" AS "KEY", "Values"."Feature" AS "Feature", "Values".log_proba_0 AS log_proba_0, "Values".log_proba_1 AS log_proba_1 
FROM (SELECT centered_data."KEY" AS "KEY", 0 AS "Feature", -0.5 * 1.6343068092778763 - (0.5 * centered_data."PC1_0" * centered_data."PC1_0") / 0.8158128856360136 AS log_proba_0, -0.5 * 2.780213285305234 - (0.5 * centered_data."PC1_1" * centered_data."PC1_1") / 2.5659690868206817 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 1 AS "Feature", -0.5 * 1.9228335085076138 - (0.5 * centered_data."PC2_0" * centered_data."PC2_0") / 1.0886696455001854 AS log_proba_0, -0.5 * 2.3756327759445495 - (0.5 * centered_data."PC2_1" * centered_data."PC2_1") / 1.7121599627410875 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 2 AS "Feature", -0.5 * 2.0287359331268013 - (0.5 * centered_data."PC3_0" * centered_data."PC3_0") / 1.2102886280202043 AS log_proba_0, -0.5 * 2.0585336277306134 - (0.5 * centered_data."PC3_1" * centered_data."PC3_1") / 1.2468951250056777 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 3 AS "Feature", -0.5 * 1.9813612328126928 - (0.5 * centered_data."PC4_0" * centered_data."PC4_0") / 1.154288534123345 AS log_proba_0, -0.5 * 1.8769076176855009 - (0.5 * centered_data."PC4_1" * centered_data."PC4_1") / 1.0398022504505977 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 4 AS "Feature", -0.5 * 1.8591913759968384 - (0.5 * centered_data."PC5_0" * centered_data."PC5_0") / 1.0215430819681302 AS log_proba_0, -0.5 * 1.8926284176722803 - (0.5 * centered_data."PC5_1" * centered_data."PC5_1") / 1.056277939844233 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 5 AS "Feature", -0.5 * 1.7279954077039046 - (0.5 * centered_data."PC6_0" * centered_data."PC6_0") / 0.8959401557409842 AS log_proba_0, -0.5 * 1.7459810775637754 - (0.5 * centered_data."PC6_1" * centered_data."PC6_1") / 0.91220002358855 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data."KEY" AS "KEY", 6 AS "Feature", -0.5 * 1.409087560578673 - (0.5 * centered_data."PC7_0" * centered_data."PC7_0") / 0.6512970089761675 AS log_proba_0, -0.5 * 1.3918643693647463 - (0.5 * centered_data."PC7_1" * centered_data."PC7_1") / 0.6401756436713449 AS log_proba_1 
FROM centered_data) AS "Values"), 
"NaiveBayes_Scores" AS 
(SELECT nb_sums."KEY" AS "KEY", nb_sums."Score_0" AS "Score_0", nb_sums."Score_1" AS "Score_1" 
FROM (SELECT "NaiveBayes_data"."KEY" AS "KEY", -0.6931471805599453 + sum("NaiveBayes_data".log_proba_0) AS "Score_0", -0.6931471805599453 + sum("NaiveBayes_data".log_proba_1) AS "Score_1" 
FROM "NaiveBayes_data" GROUP BY "NaiveBayes_data"."KEY") AS nb_sums), 
orig_cte AS 
(SELECT "NaiveBayes_Scores"."KEY" AS "KEY", "NaiveBayes_Scores"."Score_0" AS "Score_0", "NaiveBayes_Scores"."Score_1" AS "Score_1", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", NULL AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
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
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(-100.0, score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(greatest(-100.0, score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1" 
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
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 0.0) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 0.0) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1") AS "DecisionProba" 
FROM arg_max_cte