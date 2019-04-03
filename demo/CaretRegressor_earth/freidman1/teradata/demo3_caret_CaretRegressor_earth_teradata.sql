-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : freidman1
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM freidman1 AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", CAST(-8.380629989376796 AS DOUBLE PRECISION) * greatest(CAST(0.823163293258958 AS DOUBLE PRECISION) - earth_input."Feature_1", CAST(0 AS DOUBLE PRECISION)) + CAST(9.793918514381321 AS DOUBLE PRECISION) * greatest(earth_input."Feature_3" - CAST(0.324447892560423 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-10.51380138268884 AS DOUBLE PRECISION) * greatest(CAST(0.324447892560423 AS DOUBLE PRECISION) - earth_input."Feature_3", CAST(0 AS DOUBLE PRECISION)) + CAST(-13.116395395966398 AS DOUBLE PRECISION) * greatest(CAST(0.434845721225814 AS DOUBLE PRECISION) - earth_input."Feature_0", CAST(0 AS DOUBLE PRECISION)) + CAST(8.96110156348265 AS DOUBLE PRECISION) * greatest(earth_input."Feature_2" - CAST(0.456289950739034 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(11.840075442823172 AS DOUBLE PRECISION) * greatest(CAST(0.456289950739034 AS DOUBLE PRECISION) - earth_input."Feature_2", CAST(0 AS DOUBLE PRECISION)) + CAST(6.607671635461544 AS DOUBLE PRECISION) * greatest(earth_input."Feature_4" - CAST(0.409365890523751 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(13.435555385443774 AS DOUBLE PRECISION) AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte