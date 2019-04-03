-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : BreastCancer
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9", CAST("ADS"."Feature_10" AS DOUBLE PRECISION) AS "Feature_10", CAST("ADS"."Feature_11" AS DOUBLE PRECISION) AS "Feature_11", CAST("ADS"."Feature_12" AS DOUBLE PRECISION) AS "Feature_12", CAST("ADS"."Feature_13" AS DOUBLE PRECISION) AS "Feature_13", CAST("ADS"."Feature_14" AS DOUBLE PRECISION) AS "Feature_14", CAST("ADS"."Feature_15" AS DOUBLE PRECISION) AS "Feature_15", CAST("ADS"."Feature_16" AS DOUBLE PRECISION) AS "Feature_16", CAST("ADS"."Feature_17" AS DOUBLE PRECISION) AS "Feature_17", CAST("ADS"."Feature_18" AS DOUBLE PRECISION) AS "Feature_18", CAST("ADS"."Feature_19" AS DOUBLE PRECISION) AS "Feature_19", CAST("ADS"."Feature_20" AS DOUBLE PRECISION) AS "Feature_20", CAST("ADS"."Feature_21" AS DOUBLE PRECISION) AS "Feature_21", CAST("ADS"."Feature_22" AS DOUBLE PRECISION) AS "Feature_22", CAST("ADS"."Feature_23" AS DOUBLE PRECISION) AS "Feature_23", CAST("ADS"."Feature_24" AS DOUBLE PRECISION) AS "Feature_24", CAST("ADS"."Feature_25" AS DOUBLE PRECISION) AS "Feature_25", CAST("ADS"."Feature_26" AS DOUBLE PRECISION) AS "Feature_26", CAST("ADS"."Feature_27" AS DOUBLE PRECISION) AS "Feature_27", CAST("ADS"."Feature_28" AS DOUBLE PRECISION) AS "Feature_28", CAST("ADS"."Feature_29" AS DOUBLE PRECISION) AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", CAST(-0.022782582462136 AS DOUBLE PRECISION) * linear_input."Feature_0" + CAST(-0.002352170901369 AS DOUBLE PRECISION) * linear_input."Feature_1" + CAST(-0.003392051714577 AS DOUBLE PRECISION) * linear_input."Feature_2" + CAST(-0.000197441302174 AS DOUBLE PRECISION) * linear_input."Feature_3" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_4" + CAST(-0.863959481941534 AS DOUBLE PRECISION) * linear_input."Feature_5" + CAST(-0.802948085643199 AS DOUBLE PRECISION) * linear_input."Feature_6" + CAST(-2.532859179901522 AS DOUBLE PRECISION) * linear_input."Feature_7" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_8" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_9" + CAST(-0.134476144832779 AS DOUBLE PRECISION) * linear_input."Feature_10" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_11" + CAST(-0.014724824753794 AS DOUBLE PRECISION) * linear_input."Feature_12" + CAST(-0.000445400441738 AS DOUBLE PRECISION) * linear_input."Feature_13" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_14" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_15" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_16" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_17" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_18" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_19" + CAST(-0.020604960905429 AS DOUBLE PRECISION) * linear_input."Feature_20" + CAST(-0.004664955269626 AS DOUBLE PRECISION) * linear_input."Feature_21" + CAST(-0.002921476607102 AS DOUBLE PRECISION) * linear_input."Feature_22" + CAST(-0.000143410372782 AS DOUBLE PRECISION) * linear_input."Feature_23" + CAST(-1.12922992535257 AS DOUBLE PRECISION) * linear_input."Feature_24" + CAST(-0.363900204317448 AS DOUBLE PRECISION) * linear_input."Feature_25" + CAST(-0.309098698046368 AS DOUBLE PRECISION) * linear_input."Feature_26" + CAST(-1.709405450956753 AS DOUBLE PRECISION) * linear_input."Feature_27" + CAST(-0.428265513830522 AS DOUBLE PRECISION) * linear_input."Feature_28" + CAST(0.0 AS DOUBLE PRECISION) * linear_input."Feature_29" + CAST(3.413328882812064 AS DOUBLE PRECISION) AS lincomb 
FROM linear_input), 
dot_prod_logistic AS 
(SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte.lincomb AS dot_prod, CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -linear_model_cte.lincomb)))) AS logistic 
FROM linear_model_cte)
 SELECT dot_prod_logistic."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic AS "Proba_0", dot_prod_logistic.logistic AS "Proba_1", CASE WHEN (CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic IS NULL OR CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (dot_prod_logistic.dot_prod > CAST(0.0 AS DOUBLE PRECISION)) THEN 1 ELSE 0 END AS "Decision", greatest(CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS "DecisionProba" 
FROM dot_prod_logistic