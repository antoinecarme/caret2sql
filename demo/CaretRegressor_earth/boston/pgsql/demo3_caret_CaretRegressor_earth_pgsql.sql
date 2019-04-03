-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : boston
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9", CAST("ADS"."Feature_10" AS FLOAT) AS "Feature_10", CAST("ADS"."Feature_11" AS FLOAT) AS "Feature_11", CAST("ADS"."Feature_12" AS FLOAT) AS "Feature_12" 
FROM boston AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", -0.4060811595067486 * greatest(earth_input."Feature_12" - 6.27, 0) + 1.8219850708648448 * greatest(6.27 - earth_input."Feature_12", 0) + 8.102839378852753 * greatest(earth_input."Feature_5" - 6.405, 0) + -1.337546571777008 * greatest(earth_input."Feature_10" - 18.6, 0) + -2174.119590379631 * greatest(earth_input."Feature_4" - 0.631, 0) + -0.08280578386236158 * greatest(earth_input."Feature_0" - 4.64689, 0) + -0.4757854339283139 * greatest(4.64689 - earth_input."Feature_0", 0) + -64.24639711697155 * greatest(earth_input."Feature_7" - 2.4091, 0) + 63.28487456764845 * greatest(2.4091 - earth_input."Feature_7", 0) + -0.1196692533194297 * greatest(earth_input."Feature_11" - 386.75, 0) + -0.009360563263472428 * greatest(386.75 - earth_input."Feature_11", 0) + 64.01660322028944 * greatest(earth_input."Feature_7" - 1.3861, 0) + 0.01921397242086099 * greatest(304.0 - earth_input."Feature_9", 0) + 448.4185453751145 * greatest(earth_input."Feature_4" - 0.6709999999999999, 0) + 1741.124136361098 * greatest(earth_input."Feature_4" - 0.624, 0) + -24.29837676587215 * greatest(earth_input."Feature_5" - 7.922999999999999, 0) + 10.21166880430397 * greatest(earth_input."Feature_5" - 7.327000000000001, 0) + -38.42265356800034 AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte