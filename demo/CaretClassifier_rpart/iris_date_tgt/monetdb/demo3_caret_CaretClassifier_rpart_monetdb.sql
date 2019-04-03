-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : iris_date_tgt
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" < 2.45) THEN 2 ELSE CASE WHEN ("ADS"."Feature_2" < 4.85) THEN 6 ELSE 7 END END AS node_id_2 
FROM iris_date_tgt AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000000000", "Values"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000000000", "Values"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000000000", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 1.0 AS "P_1789-07-14T00:00:00.000000000", 0.0 AS "P_1789-08-14T00:00:00.000000000", 0.0 AS "P_1789-09-14T00:00:00.000000000", '1789-07-14T00:00:00.000000000' AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_1789-07-14T00:00:00.000000000", 0.9487179487179488 AS "P_1789-08-14T00:00:00.000000000", 0.05128205128205128 AS "P_1789-09-14T00:00:00.000000000", '1789-08-14T00:00:00.000000000' AS "D", 0.9487179487179488 AS "DP" UNION ALL SELECT 7 AS nid, 0.0 AS "P_1789-07-14T00:00:00.000000000", 0.06818181818181819 AS "P_1789-08-14T00:00:00.000000000", 0.9318181818181818 AS "P_1789-09-14T00:00:00.000000000", '1789-09-14T00:00:00.000000000' AS "D", 0.9318181818181818 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000000000", "DT_node_data"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000000000", "DT_node_data"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000000000", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE) AS "Score_1789-09-14T00:00:00.000000000", "DT_Output"."P_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", "DT_Output"."P_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", "DT_Output"."P_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", log(CASE WHEN ("DT_Output"."P_1789-07-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-07-14T00:00:00.000000000" > 1e-100) THEN "DT_Output"."P_1789-07-14T00:00:00.000000000" ELSE 1e-100 END) AS "LogProba_1789-07-14T00:00:00.000000000", log(CASE WHEN ("DT_Output"."P_1789-08-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-08-14T00:00:00.000000000" > 1e-100) THEN "DT_Output"."P_1789-08-14T00:00:00.000000000" ELSE 1e-100 END) AS "LogProba_1789-08-14T00:00:00.000000000", log(CASE WHEN ("DT_Output"."P_1789-09-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-09-14T00:00:00.000000000" > 1e-100) THEN "DT_Output"."P_1789-09-14T00:00:00.000000000" ELSE 1e-100 END) AS "LogProba_1789-09-14T00:00:00.000000000", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"