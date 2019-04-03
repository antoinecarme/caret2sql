-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth
-- Dataset : BinaryClass_100
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS BINARY_DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS BINARY_DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS BINARY_DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS BINARY_DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS BINARY_DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS BINARY_DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS BINARY_DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS BINARY_DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS BINARY_DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS BINARY_DOUBLE) AS "Feature_9", CAST("ADS"."Feature_10" AS BINARY_DOUBLE) AS "Feature_10", CAST("ADS"."Feature_11" AS BINARY_DOUBLE) AS "Feature_11", CAST("ADS"."Feature_12" AS BINARY_DOUBLE) AS "Feature_12", CAST("ADS"."Feature_13" AS BINARY_DOUBLE) AS "Feature_13", CAST("ADS"."Feature_14" AS BINARY_DOUBLE) AS "Feature_14", CAST("ADS"."Feature_15" AS BINARY_DOUBLE) AS "Feature_15", CAST("ADS"."Feature_16" AS BINARY_DOUBLE) AS "Feature_16", CAST("ADS"."Feature_17" AS BINARY_DOUBLE) AS "Feature_17", CAST("ADS"."Feature_18" AS BINARY_DOUBLE) AS "Feature_18", CAST("ADS"."Feature_19" AS BINARY_DOUBLE) AS "Feature_19", CAST("ADS"."Feature_20" AS BINARY_DOUBLE) AS "Feature_20", CAST("ADS"."Feature_21" AS BINARY_DOUBLE) AS "Feature_21", CAST("ADS"."Feature_22" AS BINARY_DOUBLE) AS "Feature_22", CAST("ADS"."Feature_23" AS BINARY_DOUBLE) AS "Feature_23", CAST("ADS"."Feature_24" AS BINARY_DOUBLE) AS "Feature_24", CAST("ADS"."Feature_25" AS BINARY_DOUBLE) AS "Feature_25", CAST("ADS"."Feature_26" AS BINARY_DOUBLE) AS "Feature_26", CAST("ADS"."Feature_27" AS BINARY_DOUBLE) AS "Feature_27", CAST("ADS"."Feature_28" AS BINARY_DOUBLE) AS "Feature_28", CAST("ADS"."Feature_29" AS BINARY_DOUBLE) AS "Feature_29", CAST("ADS"."Feature_30" AS BINARY_DOUBLE) AS "Feature_30", CAST("ADS"."Feature_31" AS BINARY_DOUBLE) AS "Feature_31", CAST("ADS"."Feature_32" AS BINARY_DOUBLE) AS "Feature_32", CAST("ADS"."Feature_33" AS BINARY_DOUBLE) AS "Feature_33", CAST("ADS"."Feature_34" AS BINARY_DOUBLE) AS "Feature_34", CAST("ADS"."Feature_35" AS BINARY_DOUBLE) AS "Feature_35", CAST("ADS"."Feature_36" AS BINARY_DOUBLE) AS "Feature_36", CAST("ADS"."Feature_37" AS BINARY_DOUBLE) AS "Feature_37", CAST("ADS"."Feature_38" AS BINARY_DOUBLE) AS "Feature_38", CAST("ADS"."Feature_39" AS BINARY_DOUBLE) AS "Feature_39", CAST("ADS"."Feature_40" AS BINARY_DOUBLE) AS "Feature_40", CAST("ADS"."Feature_41" AS BINARY_DOUBLE) AS "Feature_41", CAST("ADS"."Feature_42" AS BINARY_DOUBLE) AS "Feature_42", CAST("ADS"."Feature_43" AS BINARY_DOUBLE) AS "Feature_43", CAST("ADS"."Feature_44" AS BINARY_DOUBLE) AS "Feature_44", CAST("ADS"."Feature_45" AS BINARY_DOUBLE) AS "Feature_45", CAST("ADS"."Feature_46" AS BINARY_DOUBLE) AS "Feature_46", CAST("ADS"."Feature_47" AS BINARY_DOUBLE) AS "Feature_47", CAST("ADS"."Feature_48" AS BINARY_DOUBLE) AS "Feature_48", CAST("ADS"."Feature_49" AS BINARY_DOUBLE) AS "Feature_49", CAST("ADS"."Feature_50" AS BINARY_DOUBLE) AS "Feature_50", CAST("ADS"."Feature_51" AS BINARY_DOUBLE) AS "Feature_51", CAST("ADS"."Feature_52" AS BINARY_DOUBLE) AS "Feature_52", CAST("ADS"."Feature_53" AS BINARY_DOUBLE) AS "Feature_53", CAST("ADS"."Feature_54" AS BINARY_DOUBLE) AS "Feature_54", CAST("ADS"."Feature_55" AS BINARY_DOUBLE) AS "Feature_55", CAST("ADS"."Feature_56" AS BINARY_DOUBLE) AS "Feature_56", CAST("ADS"."Feature_57" AS BINARY_DOUBLE) AS "Feature_57", CAST("ADS"."Feature_58" AS BINARY_DOUBLE) AS "Feature_58", CAST("ADS"."Feature_59" AS BINARY_DOUBLE) AS "Feature_59", CAST("ADS"."Feature_60" AS BINARY_DOUBLE) AS "Feature_60", CAST("ADS"."Feature_61" AS BINARY_DOUBLE) AS "Feature_61", CAST("ADS"."Feature_62" AS BINARY_DOUBLE) AS "Feature_62", CAST("ADS"."Feature_63" AS BINARY_DOUBLE) AS "Feature_63", CAST("ADS"."Feature_64" AS BINARY_DOUBLE) AS "Feature_64", CAST("ADS"."Feature_65" AS BINARY_DOUBLE) AS "Feature_65", CAST("ADS"."Feature_66" AS BINARY_DOUBLE) AS "Feature_66", CAST("ADS"."Feature_67" AS BINARY_DOUBLE) AS "Feature_67", CAST("ADS"."Feature_68" AS BINARY_DOUBLE) AS "Feature_68", CAST("ADS"."Feature_69" AS BINARY_DOUBLE) AS "Feature_69", CAST("ADS"."Feature_70" AS BINARY_DOUBLE) AS "Feature_70", CAST("ADS"."Feature_71" AS BINARY_DOUBLE) AS "Feature_71", CAST("ADS"."Feature_72" AS BINARY_DOUBLE) AS "Feature_72", CAST("ADS"."Feature_73" AS BINARY_DOUBLE) AS "Feature_73", CAST("ADS"."Feature_74" AS BINARY_DOUBLE) AS "Feature_74", CAST("ADS"."Feature_75" AS BINARY_DOUBLE) AS "Feature_75", CAST("ADS"."Feature_76" AS BINARY_DOUBLE) AS "Feature_76", CAST("ADS"."Feature_77" AS BINARY_DOUBLE) AS "Feature_77", CAST("ADS"."Feature_78" AS BINARY_DOUBLE) AS "Feature_78", CAST("ADS"."Feature_79" AS BINARY_DOUBLE) AS "Feature_79", CAST("ADS"."Feature_80" AS BINARY_DOUBLE) AS "Feature_80", CAST("ADS"."Feature_81" AS BINARY_DOUBLE) AS "Feature_81", CAST("ADS"."Feature_82" AS BINARY_DOUBLE) AS "Feature_82", CAST("ADS"."Feature_83" AS BINARY_DOUBLE) AS "Feature_83", CAST("ADS"."Feature_84" AS BINARY_DOUBLE) AS "Feature_84", CAST("ADS"."Feature_85" AS BINARY_DOUBLE) AS "Feature_85", CAST("ADS"."Feature_86" AS BINARY_DOUBLE) AS "Feature_86", CAST("ADS"."Feature_87" AS BINARY_DOUBLE) AS "Feature_87", CAST("ADS"."Feature_88" AS BINARY_DOUBLE) AS "Feature_88", CAST("ADS"."Feature_89" AS BINARY_DOUBLE) AS "Feature_89", CAST("ADS"."Feature_90" AS BINARY_DOUBLE) AS "Feature_90", CAST("ADS"."Feature_91" AS BINARY_DOUBLE) AS "Feature_91", CAST("ADS"."Feature_92" AS BINARY_DOUBLE) AS "Feature_92", CAST("ADS"."Feature_93" AS BINARY_DOUBLE) AS "Feature_93", CAST("ADS"."Feature_94" AS BINARY_DOUBLE) AS "Feature_94", CAST("ADS"."Feature_95" AS BINARY_DOUBLE) AS "Feature_95", CAST("ADS"."Feature_96" AS BINARY_DOUBLE) AS "Feature_96", CAST("ADS"."Feature_97" AS BINARY_DOUBLE) AS "Feature_97", CAST("ADS"."Feature_98" AS BINARY_DOUBLE) AS "Feature_98", CAST("ADS"."Feature_99" AS BINARY_DOUBLE) AS "Feature_99" 
FROM "BINARYCLASS_100" "ADS"), 
earth_cte AS 
(SELECT earth_input."KEY" AS "KEY", -2.788872254627751 * greatest(1.14281924773009 - earth_input."Feature_57", 0) + 3.648900957187342 AS earth 
FROM earth_input), 
dot_prod_logistic AS 
(SELECT earth_cte."KEY" AS "KEY", earth_cte.earth AS dot_prod, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_cte.earth)))) AS logistic 
FROM earth_cte)
 SELECT dot_prod_logistic."KEY" AS "KEY", CAST(NULL AS BINARY_DOUBLE) AS "Score_0", CAST(NULL AS BINARY_DOUBLE) AS "Score_1", 1.0 - dot_prod_logistic.logistic AS "Proba_0", dot_prod_logistic.logistic AS "Proba_1", CASE WHEN (1.0 - dot_prod_logistic.logistic IS NULL OR 1.0 - dot_prod_logistic.logistic > 0.0) THEN ln(1.0 - dot_prod_logistic.logistic) ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_0", CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > 0.0) THEN ln(dot_prod_logistic.logistic) ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_1", CASE WHEN (dot_prod_logistic.dot_prod > 0.0) THEN 1 ELSE 0 END AS "Decision", greatest(1.0 - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS "DecisionProba" 
FROM dot_prod_logistic