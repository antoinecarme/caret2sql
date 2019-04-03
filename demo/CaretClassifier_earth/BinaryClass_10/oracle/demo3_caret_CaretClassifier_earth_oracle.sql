-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth
-- Dataset : BinaryClass_10
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS BINARY_DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS BINARY_DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS BINARY_DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS BINARY_DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS BINARY_DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS BINARY_DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS BINARY_DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS BINARY_DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS BINARY_DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS BINARY_DOUBLE) AS "Feature_9" 
FROM "BINARYCLASS_10" "ADS"), 
earth_cte AS 
(SELECT earth_input."KEY" AS "KEY", -2.6730128206194 * greatest(1.14281924773009 - earth_input."Feature_9", 0) + 3.7137130158392786 AS earth 
FROM earth_input), 
dot_prod_logistic AS 
(SELECT earth_cte."KEY" AS "KEY", earth_cte.earth AS dot_prod, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_cte.earth)))) AS logistic 
FROM earth_cte)
 SELECT dot_prod_logistic."KEY" AS "KEY", CAST(NULL AS BINARY_DOUBLE) AS "Score_0", CAST(NULL AS BINARY_DOUBLE) AS "Score_1", 1.0 - dot_prod_logistic.logistic AS "Proba_0", dot_prod_logistic.logistic AS "Proba_1", CASE WHEN (1.0 - dot_prod_logistic.logistic IS NULL OR 1.0 - dot_prod_logistic.logistic > 0.0) THEN ln(1.0 - dot_prod_logistic.logistic) ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_0", CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > 0.0) THEN ln(dot_prod_logistic.logistic) ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_1", CASE WHEN (dot_prod_logistic.dot_prod > 0.0) THEN 1 ELSE 0 END AS "Decision", greatest(1.0 - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS "DecisionProba" 
FROM dot_prod_logistic