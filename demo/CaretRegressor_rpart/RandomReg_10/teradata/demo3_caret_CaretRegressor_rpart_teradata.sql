-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart
-- Dataset : RandomReg_10
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" < CAST(0.486488893575246 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS"."Feature_5" < CAST(-0.667066857634491 AS DOUBLE PRECISION)) THEN 4 ELSE 5 END ELSE 3 END AS node_id_2 
FROM "RandomReg_10" AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, CAST(158.64050214470126 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 4 AS nid, CAST(-239.51291581710444 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 5 AS nid, CAST(5.984424839905532 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"