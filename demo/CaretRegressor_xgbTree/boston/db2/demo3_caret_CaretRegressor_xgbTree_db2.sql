-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree
-- Dataset : boston
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_5" < 6.82499981) THEN CASE WHEN ("ADS"."Feature_4" < 0.669499993) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_5" < 7.43700027) THEN 5 ELSE 6 END END AS node_id_2 
FROM "BOSTON" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 8.40346432 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 5.29650021 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 11.6297874 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS nid, 17.1540737 AS "Estimator" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_12" < 9.72500038) THEN CASE WHEN ("ADS"."Feature_12" < 5.15499973) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_12" < 16.0849991) THEN 5 ELSE 6 END END AS node_id_2 
FROM "BOSTON" AS "ADS"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 9.42059135 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 6.45432901 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 4.66252089 AS "Estimator" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS nid, 2.81009173 AS "Estimator" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Estimator" AS "Estimator" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."Estimator" AS "Estimator" 
FROM "DT_Output_1"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_Model_0"."KEY" AS "KEY", CAST("XGB_Model_0"."Estimator" AS DOUBLE) AS "Estimator" 
FROM "XGB_Model_0" UNION ALL SELECT "XGB_Model_1"."KEY" AS "KEY", CAST("XGB_Model_1"."Estimator" AS DOUBLE) AS "Estimator" 
FROM "XGB_Model_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Estimator" AS DOUBLE) AS "Estimator" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS DOUBLE) AS "Estimator" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Estimator") AS "Estimator" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T")
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + 0.5 AS "Estimator" 
FROM "XGB_sum"