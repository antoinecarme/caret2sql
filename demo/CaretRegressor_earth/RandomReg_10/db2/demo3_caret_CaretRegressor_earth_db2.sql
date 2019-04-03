-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : RandomReg_10
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE) AS "Feature_9" 
FROM "RANDOMREG_10" AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", 106.04160189726336 * greatest(earth_input."Feature_2" - 0.1888688624711014, 0) + -81.05134384779302 * greatest(0.1888688624711014 - earth_input."Feature_2", 0) + 87.23611786667415 * greatest(earth_input."Feature_8" - -1.5186674977575243, 0) + 72.17863083737255 * greatest(earth_input."Feature_1" - 0.2405781237046412, 0) + -77.90330074386392 * greatest(0.2405781237046412 - earth_input."Feature_1", 0) + 41.37950548838466 * greatest(earth_input."Feature_7" - -0.03234069773072427, 0) + -36.62543538994574 * greatest(-0.03234069773072427 - earth_input."Feature_7", 0) + 85.33812575024568 * greatest(earth_input."Feature_5" - 0.2044803340708102, 0) + -83.50106466131398 * greatest(0.2044803340708102 - earth_input."Feature_5", 0) + 55.93413756201722 * greatest(earth_input."Feature_4" - -1.138791153477606, 0) + -47.456476823786154 * greatest(-1.138791153477606 - earth_input."Feature_4", 0) + -37.887412964281026 * greatest(0.7629042454446997 - earth_input."Feature_3", 0) + -64.025113142711 * greatest(0.9567405573635612 - earth_input."Feature_9", 0) + 33.70030651860954 * greatest(earth_input."Feature_6" - -1.077416816377944, 0) + -41.57666422620228 * greatest(-1.077416816377944 - earth_input."Feature_6", 0) + 31.03285832145719 * earth_input."Feature_0" + -93.17961478988 AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte