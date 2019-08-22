-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : FourClass_100
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE) AS "Feature_9", CAST("ADS"."Feature_10" AS DOUBLE) AS "Feature_10", CAST("ADS"."Feature_11" AS DOUBLE) AS "Feature_11", CAST("ADS"."Feature_12" AS DOUBLE) AS "Feature_12", CAST("ADS"."Feature_13" AS DOUBLE) AS "Feature_13", CAST("ADS"."Feature_14" AS DOUBLE) AS "Feature_14", CAST("ADS"."Feature_15" AS DOUBLE) AS "Feature_15", CAST("ADS"."Feature_16" AS DOUBLE) AS "Feature_16", CAST("ADS"."Feature_17" AS DOUBLE) AS "Feature_17", CAST("ADS"."Feature_18" AS DOUBLE) AS "Feature_18", CAST("ADS"."Feature_19" AS DOUBLE) AS "Feature_19", CAST("ADS"."Feature_20" AS DOUBLE) AS "Feature_20", CAST("ADS"."Feature_21" AS DOUBLE) AS "Feature_21", CAST("ADS"."Feature_22" AS DOUBLE) AS "Feature_22", CAST("ADS"."Feature_23" AS DOUBLE) AS "Feature_23", CAST("ADS"."Feature_24" AS DOUBLE) AS "Feature_24", CAST("ADS"."Feature_25" AS DOUBLE) AS "Feature_25", CAST("ADS"."Feature_26" AS DOUBLE) AS "Feature_26", CAST("ADS"."Feature_27" AS DOUBLE) AS "Feature_27", CAST("ADS"."Feature_28" AS DOUBLE) AS "Feature_28", CAST("ADS"."Feature_29" AS DOUBLE) AS "Feature_29", CAST("ADS"."Feature_30" AS DOUBLE) AS "Feature_30", CAST("ADS"."Feature_31" AS DOUBLE) AS "Feature_31", CAST("ADS"."Feature_32" AS DOUBLE) AS "Feature_32", CAST("ADS"."Feature_33" AS DOUBLE) AS "Feature_33", CAST("ADS"."Feature_34" AS DOUBLE) AS "Feature_34", CAST("ADS"."Feature_35" AS DOUBLE) AS "Feature_35", CAST("ADS"."Feature_36" AS DOUBLE) AS "Feature_36", CAST("ADS"."Feature_37" AS DOUBLE) AS "Feature_37", CAST("ADS"."Feature_38" AS DOUBLE) AS "Feature_38", CAST("ADS"."Feature_39" AS DOUBLE) AS "Feature_39", CAST("ADS"."Feature_40" AS DOUBLE) AS "Feature_40", CAST("ADS"."Feature_41" AS DOUBLE) AS "Feature_41", CAST("ADS"."Feature_42" AS DOUBLE) AS "Feature_42", CAST("ADS"."Feature_43" AS DOUBLE) AS "Feature_43", CAST("ADS"."Feature_44" AS DOUBLE) AS "Feature_44", CAST("ADS"."Feature_45" AS DOUBLE) AS "Feature_45", CAST("ADS"."Feature_46" AS DOUBLE) AS "Feature_46", CAST("ADS"."Feature_47" AS DOUBLE) AS "Feature_47", CAST("ADS"."Feature_48" AS DOUBLE) AS "Feature_48", CAST("ADS"."Feature_49" AS DOUBLE) AS "Feature_49", CAST("ADS"."Feature_50" AS DOUBLE) AS "Feature_50", CAST("ADS"."Feature_51" AS DOUBLE) AS "Feature_51", CAST("ADS"."Feature_52" AS DOUBLE) AS "Feature_52", CAST("ADS"."Feature_53" AS DOUBLE) AS "Feature_53", CAST("ADS"."Feature_54" AS DOUBLE) AS "Feature_54", CAST("ADS"."Feature_55" AS DOUBLE) AS "Feature_55", CAST("ADS"."Feature_56" AS DOUBLE) AS "Feature_56", CAST("ADS"."Feature_57" AS DOUBLE) AS "Feature_57", CAST("ADS"."Feature_58" AS DOUBLE) AS "Feature_58", CAST("ADS"."Feature_59" AS DOUBLE) AS "Feature_59", CAST("ADS"."Feature_60" AS DOUBLE) AS "Feature_60", CAST("ADS"."Feature_61" AS DOUBLE) AS "Feature_61", CAST("ADS"."Feature_62" AS DOUBLE) AS "Feature_62", CAST("ADS"."Feature_63" AS DOUBLE) AS "Feature_63", CAST("ADS"."Feature_64" AS DOUBLE) AS "Feature_64", CAST("ADS"."Feature_65" AS DOUBLE) AS "Feature_65", CAST("ADS"."Feature_66" AS DOUBLE) AS "Feature_66", CAST("ADS"."Feature_67" AS DOUBLE) AS "Feature_67", CAST("ADS"."Feature_68" AS DOUBLE) AS "Feature_68", CAST("ADS"."Feature_69" AS DOUBLE) AS "Feature_69", CAST("ADS"."Feature_70" AS DOUBLE) AS "Feature_70", CAST("ADS"."Feature_71" AS DOUBLE) AS "Feature_71", CAST("ADS"."Feature_72" AS DOUBLE) AS "Feature_72", CAST("ADS"."Feature_73" AS DOUBLE) AS "Feature_73", CAST("ADS"."Feature_74" AS DOUBLE) AS "Feature_74", CAST("ADS"."Feature_75" AS DOUBLE) AS "Feature_75", CAST("ADS"."Feature_76" AS DOUBLE) AS "Feature_76", CAST("ADS"."Feature_77" AS DOUBLE) AS "Feature_77", CAST("ADS"."Feature_78" AS DOUBLE) AS "Feature_78", CAST("ADS"."Feature_79" AS DOUBLE) AS "Feature_79", CAST("ADS"."Feature_80" AS DOUBLE) AS "Feature_80", CAST("ADS"."Feature_81" AS DOUBLE) AS "Feature_81", CAST("ADS"."Feature_82" AS DOUBLE) AS "Feature_82", CAST("ADS"."Feature_83" AS DOUBLE) AS "Feature_83", CAST("ADS"."Feature_84" AS DOUBLE) AS "Feature_84", CAST("ADS"."Feature_85" AS DOUBLE) AS "Feature_85", CAST("ADS"."Feature_86" AS DOUBLE) AS "Feature_86", CAST("ADS"."Feature_87" AS DOUBLE) AS "Feature_87", CAST("ADS"."Feature_88" AS DOUBLE) AS "Feature_88", CAST("ADS"."Feature_89" AS DOUBLE) AS "Feature_89", CAST("ADS"."Feature_90" AS DOUBLE) AS "Feature_90", CAST("ADS"."Feature_91" AS DOUBLE) AS "Feature_91", CAST("ADS"."Feature_92" AS DOUBLE) AS "Feature_92", CAST("ADS"."Feature_93" AS DOUBLE) AS "Feature_93", CAST("ADS"."Feature_94" AS DOUBLE) AS "Feature_94", CAST("ADS"."Feature_95" AS DOUBLE) AS "Feature_95", CAST("ADS"."Feature_96" AS DOUBLE) AS "Feature_96", CAST("ADS"."Feature_97" AS DOUBLE) AS "Feature_97", CAST("ADS"."Feature_98" AS DOUBLE) AS "Feature_98", CAST("ADS"."Feature_99" AS DOUBLE) AS "Feature_99" 
FROM "FOURCLASS_100" AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 0.0 * linear_input."Feature_0" + 0.0 * linear_input."Feature_1" + 0.0 * linear_input."Feature_2" + 0.0 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + 0.0 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + 0.0 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + 0.0 * linear_input."Feature_12" + 0.0 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 0.0 * linear_input."Feature_15" + 0.0 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 0.0 * linear_input."Feature_19" + -0.025867107367340353 * linear_input."Feature_20" + 0.0 * linear_input."Feature_21" + 0.0 * linear_input."Feature_22" + 0.0 * linear_input."Feature_23" + 0.0 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + 0.0 * linear_input."Feature_26" + 0.0 * linear_input."Feature_27" + 0.0 * linear_input."Feature_28" + -0.009596673607059287 * linear_input."Feature_29" + 0.0 * linear_input."Feature_30" + 0.0 * linear_input."Feature_31" + 0.0 * linear_input."Feature_32" + 0.0 * linear_input."Feature_33" + 0.0 * linear_input."Feature_34" + 0.0 * linear_input."Feature_35" + 0.0 * linear_input."Feature_36" + 0.0 * linear_input."Feature_37" + 0.0 * linear_input."Feature_38" + 0.0 * linear_input."Feature_39" + 0.0 * linear_input."Feature_40" + 0.0 * linear_input."Feature_41" + 0.0 * linear_input."Feature_42" + 0.0 * linear_input."Feature_43" + 0.0 * linear_input."Feature_44" + 0.0 * linear_input."Feature_45" + 0.0 * linear_input."Feature_46" + 0.0 * linear_input."Feature_47" + 0.0 * linear_input."Feature_48" + 0.0 * linear_input."Feature_49" + 0.0 * linear_input."Feature_50" + 0.0 * linear_input."Feature_51" + 0.0 * linear_input."Feature_52" + 0.0 * linear_input."Feature_53" + 0.0 * linear_input."Feature_54" + 0.0 * linear_input."Feature_55" + 0.0 * linear_input."Feature_56" + 0.0 * linear_input."Feature_57" + 0.0 * linear_input."Feature_58" + 0.0 * linear_input."Feature_59" + 0.0 * linear_input."Feature_60" + 0.0 * linear_input."Feature_61" + 0.0 * linear_input."Feature_62" + 0.0 * linear_input."Feature_63" + 0.0 * linear_input."Feature_64" + 0.0 * linear_input."Feature_65" + 0.0 * linear_input."Feature_66" + 0.0 * linear_input."Feature_67" + 0.0 * linear_input."Feature_68" + 0.0 * linear_input."Feature_69" + 0.0 * linear_input."Feature_70" + 0.0 * linear_input."Feature_71" + 0.0 * linear_input."Feature_72" + 0.0 * linear_input."Feature_73" + 0.0 * linear_input."Feature_74" + 0.0 * linear_input."Feature_75" + -0.0004903899150050837 * linear_input."Feature_76" + 0.0 * linear_input."Feature_77" + 0.01776741018832406 * linear_input."Feature_78" + 0.0 * linear_input."Feature_79" + 0.0 * linear_input."Feature_80" + 0.0 * linear_input."Feature_81" + 0.0 * linear_input."Feature_82" + 0.0 * linear_input."Feature_83" + 0.0 * linear_input."Feature_84" + 0.0 * linear_input."Feature_85" + 0.0 * linear_input."Feature_86" + 0.0 * linear_input."Feature_87" + 0.0 * linear_input."Feature_88" + 0.0 * linear_input."Feature_89" + 0.0 * linear_input."Feature_90" + 0.0 * linear_input."Feature_91" + -0.007676828670824413 * linear_input."Feature_92" + 0.0 * linear_input."Feature_93" + 0.0 * linear_input."Feature_94" + 0.0 * linear_input."Feature_95" + 0.0 * linear_input."Feature_96" + 0.0 * linear_input."Feature_97" + 0.0 * linear_input."Feature_98" + 0.0 * linear_input."Feature_99" + 0.011169568531222048 AS "Score_0", 0.0 * linear_input."Feature_0" + 0.0 * linear_input."Feature_1" + 0.0 * linear_input."Feature_2" + 0.0 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + 0.0 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + 0.0 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + 0.0 * linear_input."Feature_12" + 0.0 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 0.0 * linear_input."Feature_15" + 0.0 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 0.0 * linear_input."Feature_19" + 0.0 * linear_input."Feature_20" + 0.0 * linear_input."Feature_21" + 0.0 * linear_input."Feature_22" + 0.0 * linear_input."Feature_23" + 0.0 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + 0.0 * linear_input."Feature_26" + 0.0 * linear_input."Feature_27" + 0.0 * linear_input."Feature_28" + 0.0 * linear_input."Feature_29" + 0.0 * linear_input."Feature_30" + 0.0 * linear_input."Feature_31" + 0.0 * linear_input."Feature_32" + 0.0 * linear_input."Feature_33" + 0.0 * linear_input."Feature_34" + 0.0 * linear_input."Feature_35" + 0.0 * linear_input."Feature_36" + 0.0 * linear_input."Feature_37" + 0.0 * linear_input."Feature_38" + 0.0 * linear_input."Feature_39" + 0.0 * linear_input."Feature_40" + 0.0 * linear_input."Feature_41" + 0.0 * linear_input."Feature_42" + 0.0 * linear_input."Feature_43" + 0.0 * linear_input."Feature_44" + 0.0 * linear_input."Feature_45" + 0.0 * linear_input."Feature_46" + 0.0 * linear_input."Feature_47" + 0.0 * linear_input."Feature_48" + 0.0 * linear_input."Feature_49" + 0.0 * linear_input."Feature_50" + 0.0 * linear_input."Feature_51" + 0.0 * linear_input."Feature_52" + 0.0 * linear_input."Feature_53" + 0.0 * linear_input."Feature_54" + 0.0 * linear_input."Feature_55" + 0.0 * linear_input."Feature_56" + 0.0 * linear_input."Feature_57" + 0.0 * linear_input."Feature_58" + 0.0 * linear_input."Feature_59" + 0.0 * linear_input."Feature_60" + 0.0 * linear_input."Feature_61" + 0.0 * linear_input."Feature_62" + 0.0 * linear_input."Feature_63" + 0.0 * linear_input."Feature_64" + 0.0 * linear_input."Feature_65" + 0.0 * linear_input."Feature_66" + 0.0 * linear_input."Feature_67" + 0.0 * linear_input."Feature_68" + 0.0 * linear_input."Feature_69" + 0.0 * linear_input."Feature_70" + 0.0 * linear_input."Feature_71" + 0.0 * linear_input."Feature_72" + 0.0 * linear_input."Feature_73" + 0.0 * linear_input."Feature_74" + 0.0 * linear_input."Feature_75" + 0.0 * linear_input."Feature_76" + 0.0 * linear_input."Feature_77" + 0.0 * linear_input."Feature_78" + 0.0 * linear_input."Feature_79" + 0.0 * linear_input."Feature_80" + 0.0 * linear_input."Feature_81" + 0.0 * linear_input."Feature_82" + 0.0 * linear_input."Feature_83" + 0.0 * linear_input."Feature_84" + 0.0 * linear_input."Feature_85" + 0.0 * linear_input."Feature_86" + 0.0 * linear_input."Feature_87" + 0.0 * linear_input."Feature_88" + 0.0 * linear_input."Feature_89" + 0.0 * linear_input."Feature_90" + 0.0 * linear_input."Feature_91" + 0.0 * linear_input."Feature_92" + 0.0 * linear_input."Feature_93" + 0.01941122818183147 * linear_input."Feature_94" + 0.0 * linear_input."Feature_95" + 0.0 * linear_input."Feature_96" + 0.0 * linear_input."Feature_97" + 0.0 * linear_input."Feature_98" + 0.0 * linear_input."Feature_99" + 0.047866526821727866 AS "Score_1", 0.0 * linear_input."Feature_0" + 0.0 * linear_input."Feature_1" + 0.0 * linear_input."Feature_2" + 0.0 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + 0.0 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + 0.0 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + 0.0 * linear_input."Feature_12" + 0.0 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 0.0 * linear_input."Feature_15" + 0.0 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 0.0 * linear_input."Feature_19" + 0.0 * linear_input."Feature_20" + 0.0 * linear_input."Feature_21" + 0.0 * linear_input."Feature_22" + 0.0 * linear_input."Feature_23" + 0.0 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + 0.0 * linear_input."Feature_26" + 0.0 * linear_input."Feature_27" + 0.0 * linear_input."Feature_28" + 0.0 * linear_input."Feature_29" + 0.0 * linear_input."Feature_30" + 0.0 * linear_input."Feature_31" + 0.0 * linear_input."Feature_32" + 0.0 * linear_input."Feature_33" + 0.0 * linear_input."Feature_34" + 0.0 * linear_input."Feature_35" + 0.0 * linear_input."Feature_36" + 0.0 * linear_input."Feature_37" + 0.007275346320574224 * linear_input."Feature_38" + 0.0 * linear_input."Feature_39" + 0.0 * linear_input."Feature_40" + 0.0 * linear_input."Feature_41" + 0.0 * linear_input."Feature_42" + 0.0 * linear_input."Feature_43" + -0.04538052673519268 * linear_input."Feature_44" + 0.0 * linear_input."Feature_45" + 0.0 * linear_input."Feature_46" + 0.0 * linear_input."Feature_47" + 0.0 * linear_input."Feature_48" + 0.0 * linear_input."Feature_49" + 0.0 * linear_input."Feature_50" + 0.0 * linear_input."Feature_51" + 0.0 * linear_input."Feature_52" + 0.0 * linear_input."Feature_53" + 0.0 * linear_input."Feature_54" + 0.0 * linear_input."Feature_55" + -0.014187796008251931 * linear_input."Feature_56" + 0.0 * linear_input."Feature_57" + 0.00291017442097032 * linear_input."Feature_58" + 0.0 * linear_input."Feature_59" + 0.0 * linear_input."Feature_60" + 0.0 * linear_input."Feature_61" + 0.0 * linear_input."Feature_62" + 0.0 * linear_input."Feature_63" + 0.0 * linear_input."Feature_64" + 0.0 * linear_input."Feature_65" + 0.0 * linear_input."Feature_66" + 0.0 * linear_input."Feature_67" + -0.004295752530139448 * linear_input."Feature_68" + 0.0 * linear_input."Feature_69" + 0.0 * linear_input."Feature_70" + 0.007908933378172323 * linear_input."Feature_71" + 0.0 * linear_input."Feature_72" + 0.0 * linear_input."Feature_73" + 0.0 * linear_input."Feature_74" + 0.0 * linear_input."Feature_75" + 0.0 * linear_input."Feature_76" + 0.0 * linear_input."Feature_77" + -0.013531390279410336 * linear_input."Feature_78" + 0.0 * linear_input."Feature_79" + 0.0 * linear_input."Feature_80" + 0.0 * linear_input."Feature_81" + 0.0 * linear_input."Feature_82" + 0.0 * linear_input."Feature_83" + 0.0 * linear_input."Feature_84" + 0.0 * linear_input."Feature_85" + 0.0 * linear_input."Feature_86" + 0.0 * linear_input."Feature_87" + 0.0 * linear_input."Feature_88" + 0.0 * linear_input."Feature_89" + 0.0 * linear_input."Feature_90" + 0.0 * linear_input."Feature_91" + 0.0 * linear_input."Feature_92" + 0.0 * linear_input."Feature_93" + 0.0 * linear_input."Feature_94" + 0.0 * linear_input."Feature_95" + 0.0 * linear_input."Feature_96" + 0.0 * linear_input."Feature_97" + 0.0 * linear_input."Feature_98" + 0.0 * linear_input."Feature_99" + -0.0582091434877602 AS "Score_2", 0.0 * linear_input."Feature_0" + 0.0 * linear_input."Feature_1" + 0.0 * linear_input."Feature_2" + 0.0 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + 0.0 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + 0.0 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + 0.0 * linear_input."Feature_12" + 0.0 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 0.0 * linear_input."Feature_15" + 0.0 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 0.0 * linear_input."Feature_19" + 0.019321231496210883 * linear_input."Feature_20" + 0.0 * linear_input."Feature_21" + 0.0 * linear_input."Feature_22" + 0.0 * linear_input."Feature_23" + 0.0 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + 0.0 * linear_input."Feature_26" + 0.0 * linear_input."Feature_27" + 0.0 * linear_input."Feature_28" + 0.010350317634343357 * linear_input."Feature_29" + 0.0 * linear_input."Feature_30" + 0.0 * linear_input."Feature_31" + 0.0 * linear_input."Feature_32" + 0.0 * linear_input."Feature_33" + 0.0 * linear_input."Feature_34" + 0.0 * linear_input."Feature_35" + 0.0 * linear_input."Feature_36" + 0.0 * linear_input."Feature_37" + 0.0 * linear_input."Feature_38" + 0.0 * linear_input."Feature_39" + 0.0 * linear_input."Feature_40" + 0.0 * linear_input."Feature_41" + 0.0 * linear_input."Feature_42" + 0.0 * linear_input."Feature_43" + 0.020015966519535754 * linear_input."Feature_44" + 0.0 * linear_input."Feature_45" + 0.0 * linear_input."Feature_46" + 0.0 * linear_input."Feature_47" + 0.0 * linear_input."Feature_48" + 0.0 * linear_input."Feature_49" + 0.0 * linear_input."Feature_50" + 0.0001992022186146647 * linear_input."Feature_51" + 0.0 * linear_input."Feature_52" + 0.0 * linear_input."Feature_53" + 0.0 * linear_input."Feature_54" + 0.0 * linear_input."Feature_55" + 0.0 * linear_input."Feature_56" + 0.0 * linear_input."Feature_57" + 0.0 * linear_input."Feature_58" + 0.0 * linear_input."Feature_59" + 0.0 * linear_input."Feature_60" + 0.0 * linear_input."Feature_61" + 0.0 * linear_input."Feature_62" + 0.0 * linear_input."Feature_63" + 0.0 * linear_input."Feature_64" + 0.0 * linear_input."Feature_65" + 0.0 * linear_input."Feature_66" + 0.0 * linear_input."Feature_67" + 0.0 * linear_input."Feature_68" + 0.0 * linear_input."Feature_69" + 0.0 * linear_input."Feature_70" + 0.0 * linear_input."Feature_71" + 0.0 * linear_input."Feature_72" + 0.0 * linear_input."Feature_73" + 0.0 * linear_input."Feature_74" + 0.0 * linear_input."Feature_75" + 0.0 * linear_input."Feature_76" + 0.0 * linear_input."Feature_77" + 0.0 * linear_input."Feature_78" + 0.0 * linear_input."Feature_79" + 0.0 * linear_input."Feature_80" + 0.0 * linear_input."Feature_81" + 0.0 * linear_input."Feature_82" + 0.0 * linear_input."Feature_83" + 0.0 * linear_input."Feature_84" + 0.0 * linear_input."Feature_85" + 0.0 * linear_input."Feature_86" + 0.0 * linear_input."Feature_87" + -0.004117165155079638 * linear_input."Feature_88" + 0.0 * linear_input."Feature_89" + 0.0 * linear_input."Feature_90" + 0.0 * linear_input."Feature_91" + 0.0 * linear_input."Feature_92" + 0.0 * linear_input."Feature_93" + 0.0 * linear_input."Feature_94" + 0.0 * linear_input."Feature_95" + 0.0 * linear_input."Feature_96" + 0.0 * linear_input."Feature_97" + 0.0 * linear_input."Feature_98" + -0.01908701308176087 * linear_input."Feature_99" + -0.000826951865189707 AS "Score_3" 
FROM linear_input), 
linear_model_cte_logistic AS 
(SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Score_0" AS "Score_0", linear_model_cte."Score_1" AS "Score_1", linear_model_cte."Score_2" AS "Score_2", linear_model_cte."Score_3" AS "Score_3" 
FROM linear_model_cte), 
orig_cte AS 
(SELECT linear_model_cte_logistic."KEY" AS "KEY", linear_model_cte_logistic."Score_0" AS "Score_0", linear_model_cte_logistic."Score_1" AS "Score_1", linear_model_cte_logistic."Score_2" AS "Score_2", linear_model_cte_logistic."Score_3" AS "Score_3", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "Proba_2", CAST(NULL AS DOUBLE) AS "Proba_3", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CAST(NULL AS DOUBLE) AS "LogProba_2", CAST(NULL AS DOUBLE) AS "LogProba_3", NULL AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM linear_model_cte_logistic), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(-100.0, score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(greatest(-100.0, score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1", exp(greatest(-100.0, score_max."Score_2" - score_max."max_Score")) AS "exp_delta_Score_2", exp(greatest(-100.0, score_max."Score_3" - score_max."max_Score")) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS class, score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS class, score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 0.0) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 0.0) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > 0.0) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > 0.0) THEN ln(arg_max_cte."SoftProba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2", arg_max_cte."SoftProba_3") AS "DecisionProba" 
FROM arg_max_cte