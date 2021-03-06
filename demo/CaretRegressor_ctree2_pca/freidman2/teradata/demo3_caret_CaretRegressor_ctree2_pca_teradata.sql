-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree2_pca
-- Dataset : freidman2
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(43.791281222074 AS DOUBLE PRECISION)) / CAST(26.1998878150635 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(945.96728330844 AS DOUBLE PRECISION)) / CAST(464.3666952541536 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.531000909997521 AS DOUBLE PRECISION)) / CAST(0.292017174945916 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(6.139967152050498 AS DOUBLE PRECISION)) / CAST(3.092304925382 AS DOUBLE PRECISION) AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.61216507491007 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.546478290332943 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.570867748564476 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.026933490380143 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.488881338042008 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.274519258456139 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.223844999535911 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.797199868435587 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.024686176636209 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.709191857651851 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.703881747208946 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.031432271147406 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.620998833378688 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.350781362064452 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.358544161544677 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.602294752752124 AS DOUBLE PRECISION) AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(0.194823595254 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(-0.905094313164 AS DOUBLE PRECISION)) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(1.037115344875 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(0.5941410037 AS DOUBLE PRECISION)) THEN 7 ELSE 8 END ELSE 9 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, CAST(107.41065284636 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 4 AS nid, CAST(279.189348802644 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 7 AS nid, CAST(627.6802853576071 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 8 AS nid, CAST(797.0357767557801 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 9 AS nid, CAST(1100.66478470431 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"