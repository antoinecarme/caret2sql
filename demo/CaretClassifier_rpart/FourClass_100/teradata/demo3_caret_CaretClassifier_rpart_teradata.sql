-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : FourClass_100
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_44" >= CAST(-2.10926340716348 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS"."Feature_78" >= CAST(-0.6111561031401 AS DOUBLE PRECISION)) THEN 4 ELSE 5 END ELSE 3 END AS node_id_2 
FROM "FourClass_100" AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_0", CAST(0.133333333333333 AS DOUBLE PRECISION) AS "P_1", CAST(0.866666666666667 AS DOUBLE PRECISION) AS "P_2", CAST(0.0 AS DOUBLE PRECISION) AS "P_3", 2 AS "D", CAST(0.866666666666667 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 4 AS nid, CAST(0.468085106382979 AS DOUBLE PRECISION) AS "P_0", CAST(0.319148936170213 AS DOUBLE PRECISION) AS "P_1", CAST(0.021276595744681 AS DOUBLE PRECISION) AS "P_2", CAST(0.191489361702128 AS DOUBLE PRECISION) AS "P_3", 0 AS "D", CAST(0.468085106382979 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 5 AS nid, CAST(0.058823529411765 AS DOUBLE PRECISION) AS "P_0", CAST(0.235294117647059 AS DOUBLE PRECISION) AS "P_1", CAST(0.264705882352941 AS DOUBLE PRECISION) AS "P_2", CAST(0.441176470588235 AS DOUBLE PRECISION) AS "P_3", 3 AS "D", CAST(0.441176470588235 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"