-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree_pca
-- Dataset : freidman3
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(43.791281222074 AS DOUBLE PRECISION)) / CAST(26.1998878150635 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(945.96728330844 AS DOUBLE PRECISION)) / CAST(464.3666952541536 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.531000909997521 AS DOUBLE PRECISION)) / CAST(0.292017174945916 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(6.139967152050498 AS DOUBLE PRECISION)) / CAST(3.092304925382 AS DOUBLE PRECISION) AS "Feature_3" 
FROM freidman3 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.61216507491007 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.546478290332943 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.570867748564476 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.026933490380143 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.488881338042008 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.274519258456139 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.223844999535911 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.797199868435587 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.024686176636209 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.709191857651851 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.703881747208946 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.031432271147406 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.620998833378688 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.350781362064452 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.358544161544677 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.602294752752124 AS DOUBLE PRECISION) AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < CAST(-0.897249341 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 1 AS nid, CAST(0.204552919 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.373086601 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < CAST(-0.0291280448 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" < CAST(0.414597571 AS DOUBLE PRECISION)) THEN 3 ELSE 4 END ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 2 AS nid, CAST(0.24979268 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte UNION ALL SELECT 3 AS nid, CAST(0.125014514 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte UNION ALL SELECT 4 AS nid, CAST(0.21346572 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Estimator" AS "Estimator" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."Estimator" AS "Estimator" 
FROM "DT_Output_1"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_Model_0"."KEY" AS "KEY", CAST("XGB_Model_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_0" UNION ALL SELECT "XGB_Model_1"."KEY" AS "KEY", CAST("XGB_Model_1"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Estimator") AS "Estimator" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T")
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + CAST(0.5 AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_sum"