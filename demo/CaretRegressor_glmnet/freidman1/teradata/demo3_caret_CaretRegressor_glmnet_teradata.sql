-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : freidman1
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM freidman1 AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", CAST(4.029896906477498 AS DOUBLE PRECISION) * linear_input."Feature_0" + CAST(8.481910913094431 AS DOUBLE PRECISION) * linear_input."Feature_1" + CAST(-0.002990493631766 AS DOUBLE PRECISION) * linear_input."Feature_2" + CAST(7.692715342749534 AS DOUBLE PRECISION) * linear_input."Feature_3" + CAST(4.057627449474546 AS DOUBLE PRECISION) * linear_input."Feature_4" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_5" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_6" + CAST(0.71761204462301 AS DOUBLE PRECISION) * linear_input."Feature_7" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_8" + CAST(-0.753244183656552 AS DOUBLE PRECISION) * linear_input."Feature_9" + CAST(3.245988193857114 AS DOUBLE PRECISION) AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte