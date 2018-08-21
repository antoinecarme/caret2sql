-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : BreastCancer
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9", CAST("ADS"."Feature_10" AS FLOAT) AS "Feature_10", CAST("ADS"."Feature_11" AS FLOAT) AS "Feature_11", CAST("ADS"."Feature_12" AS FLOAT) AS "Feature_12", CAST("ADS"."Feature_13" AS FLOAT) AS "Feature_13", CAST("ADS"."Feature_14" AS FLOAT) AS "Feature_14", CAST("ADS"."Feature_15" AS FLOAT) AS "Feature_15", CAST("ADS"."Feature_16" AS FLOAT) AS "Feature_16", CAST("ADS"."Feature_17" AS FLOAT) AS "Feature_17", CAST("ADS"."Feature_18" AS FLOAT) AS "Feature_18", CAST("ADS"."Feature_19" AS FLOAT) AS "Feature_19", CAST("ADS"."Feature_20" AS FLOAT) AS "Feature_20", CAST("ADS"."Feature_21" AS FLOAT) AS "Feature_21", CAST("ADS"."Feature_22" AS FLOAT) AS "Feature_22", CAST("ADS"."Feature_23" AS FLOAT) AS "Feature_23", CAST("ADS"."Feature_24" AS FLOAT) AS "Feature_24", CAST("ADS"."Feature_25" AS FLOAT) AS "Feature_25", CAST("ADS"."Feature_26" AS FLOAT) AS "Feature_26", CAST("ADS"."Feature_27" AS FLOAT) AS "Feature_27", CAST("ADS"."Feature_28" AS FLOAT) AS "Feature_28", CAST("ADS"."Feature_29" AS FLOAT) AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", -0.0956517249311492 * linear_input."Feature_0" + -0.06759278534000933 * linear_input."Feature_1" + -0.010339403607269959 * linear_input."Feature_2" + -0.0007562880939677751 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + -1.559254489863436 * linear_input."Feature_6" + -19.71425727219786 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + -3.593140728896727 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + -0.1853491447911897 * linear_input."Feature_12" + -0.006792721785738788 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 13.549579834926641 * linear_input."Feature_15" + 0.0 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 111.04297686710449 * linear_input."Feature_19" + -0.1623147191271774 * linear_input."Feature_20" + -0.1108469304591097 * linear_input."Feature_21" + -0.0169539207459948 * linear_input."Feature_22" + -0.0009630509413423213 * linear_input."Feature_23" + -17.249582231109713 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + -1.9174189757115 * linear_input."Feature_26" + -14.40995583745694 * linear_input."Feature_27" + -8.596478052140366 * linear_input."Feature_28" + 0.0 * linear_input."Feature_29" + 22.49154848972973 AS lincomb 
FROM linear_input), 
dot_prod_logistic AS 
(SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte.lincomb AS dot_prod, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -linear_model_cte.lincomb)))) AS logistic 
FROM linear_model_cte)
 SELECT dot_prod_logistic."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", 1.0 - dot_prod_logistic.logistic AS "Proba_0", dot_prod_logistic.logistic AS "Proba_1", CASE WHEN (1.0 - dot_prod_logistic.logistic IS NULL OR 1.0 - dot_prod_logistic.logistic > 0.0) THEN ln(1.0 - dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > 0.0) THEN ln(dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (dot_prod_logistic.dot_prod > 0.0) THEN 1 ELSE 0 END AS "Decision", greatest(1.0 - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS "DecisionProba" 
FROM dot_prod_logistic