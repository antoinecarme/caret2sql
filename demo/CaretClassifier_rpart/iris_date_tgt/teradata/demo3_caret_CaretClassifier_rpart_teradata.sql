-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : iris_date_tgt
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" < CAST(2.45 AS DOUBLE PRECISION)) THEN 2 ELSE CASE WHEN ("ADS"."Feature_2" < CAST(4.85 AS DOUBLE PRECISION)) THEN 6 ELSE 7 END END AS node_id_2 
FROM iris_date_tgt AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000000000", "Values"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000000000", "Values"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000000000", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, CAST(1.0 AS DOUBLE PRECISION) AS "P_1789-07-14T00:00:00.000000000", CAST(0.0 AS DOUBLE PRECISION) AS "P_1789-08-14T00:00:00.000000000", CAST(0.0 AS DOUBLE PRECISION) AS "P_1789-09-14T00:00:00.000000000", '1789-07-14T00:00:00.000000000' AS "D", CAST(1.0 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 6 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_1789-07-14T00:00:00.000000000", CAST(0.948717948717949 AS DOUBLE PRECISION) AS "P_1789-08-14T00:00:00.000000000", CAST(0.051282051282051 AS DOUBLE PRECISION) AS "P_1789-09-14T00:00:00.000000000", '1789-08-14T00:00:00.000000000' AS "D", CAST(0.948717948717949 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 7 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_1789-07-14T00:00:00.000000000", CAST(0.068181818181818 AS DOUBLE PRECISION) AS "P_1789-08-14T00:00:00.000000000", CAST(0.931818181818182 AS DOUBLE PRECISION) AS "P_1789-09-14T00:00:00.000000000", '1789-09-14T00:00:00.000000000' AS "D", CAST(0.931818181818182 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000000000", "DT_node_data"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000000000", "DT_node_data"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000000000", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-09-14T00:00:00.000000000", "DT_Output"."P_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", "DT_Output"."P_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", "DT_Output"."P_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-07-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-07-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_1789-07-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-08-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-08-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_1789-08-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-09-14T00:00:00.000000000" IS NULL OR "DT_Output"."P_1789-09-14T00:00:00.000000000" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_1789-09-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"