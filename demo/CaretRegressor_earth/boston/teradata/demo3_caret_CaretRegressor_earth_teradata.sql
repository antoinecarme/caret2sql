-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : boston
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9", CAST("ADS"."Feature_10" AS DOUBLE PRECISION) AS "Feature_10", CAST("ADS"."Feature_11" AS DOUBLE PRECISION) AS "Feature_11", CAST("ADS"."Feature_12" AS DOUBLE PRECISION) AS "Feature_12" 
FROM boston AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", CAST(-0.406081159506749 AS DOUBLE PRECISION) * greatest(earth_input."Feature_12" - CAST(6.27 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(1.821985070864845 AS DOUBLE PRECISION) * greatest(CAST(6.27 AS DOUBLE PRECISION) - earth_input."Feature_12", CAST(0 AS DOUBLE PRECISION)) + CAST(8.102839378852753 AS DOUBLE PRECISION) * greatest(earth_input."Feature_5" - CAST(6.405 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-1.337546571777008 AS DOUBLE PRECISION) * greatest(earth_input."Feature_10" - CAST(18.6 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-2174.119590379631 AS DOUBLE PRECISION) * greatest(earth_input."Feature_4" - CAST(0.631 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-0.082805783862362 AS DOUBLE PRECISION) * greatest(earth_input."Feature_0" - CAST(4.64689 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-0.475785433928314 AS DOUBLE PRECISION) * greatest(CAST(4.64689 AS DOUBLE PRECISION) - earth_input."Feature_0", CAST(0 AS DOUBLE PRECISION)) + CAST(-64.24639711697155 AS DOUBLE PRECISION) * greatest(earth_input."Feature_7" - CAST(2.4091 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(63.28487456764845 AS DOUBLE PRECISION) * greatest(CAST(2.4091 AS DOUBLE PRECISION) - earth_input."Feature_7", CAST(0 AS DOUBLE PRECISION)) + CAST(-0.11966925331943 AS DOUBLE PRECISION) * greatest(earth_input."Feature_11" - CAST(386.75 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-0.009360563263472 AS DOUBLE PRECISION) * greatest(CAST(386.75 AS DOUBLE PRECISION) - earth_input."Feature_11", CAST(0 AS DOUBLE PRECISION)) + CAST(64.01660322028944 AS DOUBLE PRECISION) * greatest(earth_input."Feature_7" - CAST(1.3861 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(0.019213972420861 AS DOUBLE PRECISION) * greatest(CAST(304.0 AS DOUBLE PRECISION) - earth_input."Feature_9", CAST(0 AS DOUBLE PRECISION)) + CAST(448.4185453751145 AS DOUBLE PRECISION) * greatest(earth_input."Feature_4" - CAST(0.671 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(1741.124136361098 AS DOUBLE PRECISION) * greatest(earth_input."Feature_4" - CAST(0.624 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-24.29837676587215 AS DOUBLE PRECISION) * greatest(earth_input."Feature_5" - CAST(7.922999999999999 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(10.21166880430397 AS DOUBLE PRECISION) * greatest(earth_input."Feature_5" - CAST(7.327000000000001 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-38.42265356800034 AS DOUBLE PRECISION) AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte