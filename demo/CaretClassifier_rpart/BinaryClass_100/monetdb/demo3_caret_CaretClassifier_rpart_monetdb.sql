-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : BinaryClass_100
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_57" < 0.03440605737600827) THEN 2 ELSE 3 END AS node_id_2 
FROM "BinaryClass_100" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.8333333333333334 AS "P_0", 0.16666666666666669 AS "P_1", 0 AS "D", 0.8333333333333334 AS "DP" UNION ALL SELECT 3 AS nid, 0.06250000000000001 AS "P_0", 0.9375 AS "P_1", 1 AS "D", 0.9375 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", log(CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 1e-100) THEN "DT_Output"."P_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 1e-100) THEN "DT_Output"."P_1" ELSE 1e-100 END) AS "LogProba_1", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"