-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_xgbTree_pca
-- Dataset : iris_date_tgt
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM "IRIS_DATE_TGT" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.5263014514387969 + "ADS_sca_1_OUT"."Feature_1" * 0.2495430740050257 + "ADS_sca_1_OUT"."Feature_2" * -0.5822562654142306 + "ADS_sca_1_OUT"."Feature_3" * -0.5671972124538438 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.35797855187209515 + "ADS_sca_1_OUT"."Feature_1" * 0.9312088394674648 + "ADS_sca_1_OUT"."Feature_2" * 0.009350349831007576 + "ADS_sca_1_OUT"."Feature_3" * 0.06792661227568664 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.7268387018817979 + "ADS_sca_1_OUT"."Feature_1" * -0.2319858665682916 + "ADS_sca_1_OUT"."Feature_2" * -0.142090941958786 + "ADS_sca_1_OUT"."Feature_3" * -0.6306331924126783 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.2579993024404442 + "ADS_sca_1_OUT"."Feature_1" * 0.1294639302135427 + "ADS_sca_1_OUT"."Feature_2" * 0.8004376156560707 + "ADS_sca_1_OUT"."Feature_3" * -0.5253332981610163 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < -0.274001449) THEN 1 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" < 0.229576156) THEN 3 ELSE 4 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, -0.237623796 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS nid, 0.12563175 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, -0.16744189 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Score" AS "Score" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Score" AS "Score_1789-07-14T00:00:00.000000000", 0.0 AS "Score_1789-08-14T00:00:00.000000000", 0.0 AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < 0.241090566) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" < -0.0401627235) THEN 3 ELSE 4 END ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 2 AS nid, 0.182399988 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS nid, -0.225563928 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 0.0289156474 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Score" AS "Score" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1_0" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", 0.0 AS "Score_1789-07-14T00:00:00.000000000", "DT_Output_1"."Score" AS "Score_1789-08-14T00:00:00.000000000", 0.0 AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < -0.191769838) THEN 1 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" < 0.229576156) THEN 3 ELSE 4 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, 0.315789461 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS nid, -0.127346963 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, -1.66338552e-08 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."Score" AS "Score" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"XGB_Model_2_0" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", 0.0 AS "Score_1789-07-14T00:00:00.000000000", 0.0 AS "Score_1789-08-14T00:00:00.000000000", "DT_Output_2"."Score" AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC2" < 0.100133076) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" < -0.655304909) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" < 0.574598253) THEN 5 ELSE 6 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 3 AS nid, -0.172184289 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, -0.0476522744 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 0.145468071 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS nid, 0.0177319553 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."Score" AS "Score" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"XGB_Model_0_1" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", "DT_Output_3"."Score" AS "Score_1789-07-14T00:00:00.000000000", 0.0 AS "Score_1789-08-14T00:00:00.000000000", 0.0 AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < 1.25870407) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" < -0.8365978) THEN 3 ELSE 4 END ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 2 AS nid, -0.279554129 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS nid, -0.149403363 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 0.52153945 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."Score" AS "Score" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"XGB_Model_1_1" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", 0.0 AS "Score_1789-07-14T00:00:00.000000000", "DT_Output_4"."Score" AS "Score_1789-08-14T00:00:00.000000000", 0.0 AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < -0.8365978) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" < -1.39769268) THEN 3 ELSE 4 END ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 2 AS nid, -0.274172038 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS nid, 0.509228647 AS "Score" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 0.216362521 AS "Score" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."Score" AS "Score" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"XGB_Model_2_1" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", 0.0 AS "Score_1789-07-14T00:00:00.000000000", 0.0 AS "Score_1789-08-14T00:00:00.000000000", "DT_Output_5"."Score" AS "Score_1789-09-14T00:00:00.000000000" 
FROM "DT_Output_5"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", "XGB_esu_0"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", "XGB_esu_0"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000" 
FROM (SELECT "XGB_Model_0_0"."KEY" AS "KEY", CAST("XGB_Model_0_0"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_0_0"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_0_0"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_0_0" UNION ALL SELECT "XGB_Model_1_0"."KEY" AS "KEY", CAST("XGB_Model_1_0"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_1_0"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_1_0"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_1_0" UNION ALL SELECT "XGB_Model_2_0"."KEY" AS "KEY", CAST("XGB_Model_2_0"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_2_0"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_2_0"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_2_0" UNION ALL SELECT "XGB_Model_0_1"."KEY" AS "KEY", CAST("XGB_Model_0_1"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_0_1"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_0_1"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_0_1" UNION ALL SELECT "XGB_Model_1_1"."KEY" AS "KEY", CAST("XGB_Model_1_1"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_1_1"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_1_1"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_1_1" UNION ALL SELECT "XGB_Model_2_1"."KEY" AS "KEY", CAST("XGB_Model_2_1"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_Model_2_1"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_Model_2_1"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_Model_2_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", "XGBbig_esu"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", "XGBbig_esu"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("XGB_0"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("XGB_0"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Score_1789-07-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST("T"."Score_1789-08-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST("T"."Score_1789-09-14T00:00:00.000000000" AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Score_1789-07-14T00:00:00.000000000") AS "Score_1789-07-14T00:00:00.000000000", sum("XGB"."Score_1789-08-14T00:00:00.000000000") AS "Score_1789-08-14T00:00:00.000000000", sum("XGB"."Score_1789-09-14T00:00:00.000000000") AS "Score_1789-09-14T00:00:00.000000000" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T"), 
orig_cte AS 
(SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", "XGB_sum"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", "XGB_sum"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Proba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Proba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "LogProba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "LogProba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "LogProba_1789-09-14T00:00:00.000000000", NULL AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM "XGB_sum"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", '1789-07-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-08-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-09-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(-100.0, score_max."Score_1789-07-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-07-14T00:00:00.000000000", exp(greatest(-100.0, score_max."Score_1789-08-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-08-14T00:00:00.000000000", exp(greatest(-100.0, score_max."Score_1789-09-14T00:00:00.000000000" - score_max."max_Score")) AS "exp_delta_Score_1789-09-14T00:00:00.000000000" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-07-14T00:00:00.000000000' AS class, score_soft_max_deltas."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-08-14T00:00:00.000000000' AS class, score_soft_max_deltas."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", '1789-09-14T00:00:00.000000000' AS class, score_soft_max_deltas."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max_deltas."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max_deltas."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max_deltas."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max_deltas."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max_deltas."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max_deltas."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_soft_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_soft_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_soft_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_soft_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_soft_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_soft_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_soft_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_soft_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" AS "exp_delta_Score_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" AS "exp_delta_Score_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" AS "exp_delta_Score_1789-09-14T00:00:00.000000000", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_1789-07-14T00:00:00.000000000" AS "SoftProba_1789-07-14T00:00:00.000000000", soft_max_comp."SoftProba_1789-08-14T00:00:00.000000000" AS "SoftProba_1789-08-14T00:00:00.000000000", soft_max_comp."SoftProba_1789-09-14T00:00:00.000000000" AS "SoftProba_1789-09-14T00:00:00.000000000" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", min(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_1789-07-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-07-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-08-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-08-14T00:00:00.000000000", score_soft_max."exp_delta_Score_1789-09-14T00:00:00.000000000" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1789-09-14T00:00:00.000000000" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN (arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" IS NULL OR arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_1789-07-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-08-14T00:00:00.000000000", arg_max_cte."SoftProba_1789-09-14T00:00:00.000000000") AS "DecisionProba" 
FROM arg_max_cte