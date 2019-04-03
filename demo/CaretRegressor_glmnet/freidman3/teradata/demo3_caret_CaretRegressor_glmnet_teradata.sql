-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : freidman3
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3" 
FROM freidman3 AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_0" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_1" + CAST(0.045302106461219 AS DOUBLE PRECISION) * linear_input."Feature_2" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_3" + CAST(1.337178743270207 AS DOUBLE PRECISION) AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte