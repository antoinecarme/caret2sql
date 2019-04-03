-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree
-- Dataset : freidman3
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.104477294557) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 61.398788548602) THEN CASE WHEN ("ADS"."Feature_0" <= 35.204122625648) THEN 5 ELSE CASE WHEN ("ADS"."Feature_1" <= 880.62728820991) THEN 7 ELSE 8 END END ELSE CASE WHEN ("ADS"."Feature_1" <= 819.581543054548) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "FREIDMAN3" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.863548222894211 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 1.52887679091562 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 7 AS nid, 1.34597099595076 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 8 AS nid, 1.4824295838166397 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 10 AS nid, 1.16429231772357 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 11 AS nid, 1.42567425020628 AS "E" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"