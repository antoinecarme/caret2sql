-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree
-- Dataset : iris_date_tgt
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 1.9) THEN 2 ELSE CASE WHEN ("ADS"."Feature_3" <= 1.7) THEN CASE WHEN ("ADS"."Feature_2" <= 4.8) THEN 5 ELSE 6 END ELSE 7 END END AS node_id_2 
FROM iris_date_tgt AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000000000", "Values"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000000000", "Values"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000000000", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 1.0 AS "P_1789-07-14T00:00:00.000000000", 0.0 AS "P_1789-08-14T00:00:00.000000000", 0.0 AS "P_1789-09-14T00:00:00.000000000", '1789-07-14T00:00:00.000000000' AS "D", 1.0 AS "DP" FROM rdb$database UNION ALL SELECT 5 AS nid, 0.0 AS "P_1789-07-14T00:00:00.000000000", 0.972972972972973 AS "P_1789-08-14T00:00:00.000000000", 0.027027027027027 AS "P_1789-09-14T00:00:00.000000000", '1789-08-14T00:00:00.000000000' AS "D", 0.972972972972973 AS "DP" FROM rdb$database UNION ALL SELECT 6 AS nid, 0.0 AS "P_1789-07-14T00:00:00.000000000", 0.428571428571429 AS "P_1789-08-14T00:00:00.000000000", 0.571428571428571 AS "P_1789-09-14T00:00:00.000000000", '1789-09-14T00:00:00.000000000' AS "D", 0.571428571428571 AS "DP" FROM rdb$database UNION ALL SELECT 7 AS nid, 0.0 AS "P_1789-07-14T00:00:00.000000000", 0.02564102564102561 AS "P_1789-08-14T00:00:00.000000000", 0.9743589743589745 AS "P_1789-09-14T00:00:00.000000000", '1789-09-14T00:00:00.000000000' AS "D", 0.9743589743589745 AS "DP" FROM rdb$database) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_1789-07-14T00:00:00.000000000" AS "P_1789-07-14T00:00:00.000_1", "DT_node_data"."P_1789-08-14T00:00:00.000000000" AS "P_1789-08-14T00:00:00.000_2", "DT_node_data"."P_1789-09-14T00:00:00.000000000" AS "P_1789-09-14T00:00:00.000_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-09-14T00:00:00.000000000", "DT_Output"."P_1789-07-14T00:00:00.000_1" AS "Proba_1789-07-14T00:00:00.000000000", "DT_Output"."P_1789-08-14T00:00:00.000_2" AS "Proba_1789-08-14T00:00:00.000000000", "DT_Output"."P_1789-09-14T00:00:00.000_3" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-07-14T00:00:00.000_1" IS NULL OR "DT_Output"."P_1789-07-14T00:00:00.000_1" > 0.0) THEN ln("DT_Output"."P_1789-07-14T00:00:00.000_1") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-08-14T00:00:00.000_2" IS NULL OR "DT_Output"."P_1789-08-14T00:00:00.000_2" > 0.0) THEN ln("DT_Output"."P_1789-08-14T00:00:00.000_2") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN ("DT_Output"."P_1789-09-14T00:00:00.000_3" IS NULL OR "DT_Output"."P_1789-09-14T00:00:00.000_3" > 0.0) THEN ln("DT_Output"."P_1789-09-14T00:00:00.000_3") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"