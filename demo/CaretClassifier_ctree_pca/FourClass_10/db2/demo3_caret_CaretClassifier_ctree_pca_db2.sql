-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree_pca
-- Dataset : FourClass_10
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - -0.003903374463034224) / 0.985685974308334 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 0.6152232215702326) / 1.398851036008891 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.04279623691429167) / 1.5057087871323842 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.770981955890407) / 2.3480777416797296 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - -0.43300733624893323) / 1.4118274472656485 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - -0.04249569657940362) / 0.961839508883184 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - -0.29809080119845444) / 1.0234297313191445 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.14672241507251668) / 1.610898315451602 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - 0.01746942384662041) / 1.1559772136551034 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 0.11507331415602873) / 0.975205386360447 AS "Feature_9" 
FROM "FOURCLASS_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.04932772619908273 + "ADS_sca_1_OUT"."Feature_1" * -0.30424192738374856 + "ADS_sca_1_OUT"."Feature_2" * -0.3679687561849888 + "ADS_sca_1_OUT"."Feature_3" * -0.5380769831115797 + "ADS_sca_1_OUT"."Feature_4" * 0.10802988742400396 + "ADS_sca_1_OUT"."Feature_5" * 0.13910407016754714 + "ADS_sca_1_OUT"."Feature_6" * 0.5384086347891889 + "ADS_sca_1_OUT"."Feature_7" * -0.3713071820395216 + "ADS_sca_1_OUT"."Feature_8" * 0.0483137135579316 + "ADS_sca_1_OUT"."Feature_9" * 0.13772539520944088 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4566046379002287 + "ADS_sca_1_OUT"."Feature_1" * 0.22867203934764516 + "ADS_sca_1_OUT"."Feature_2" * -0.2673956790968541 + "ADS_sca_1_OUT"."Feature_3" * 0.01671202428135116 + "ADS_sca_1_OUT"."Feature_4" * -0.7163497555230034 + "ADS_sca_1_OUT"."Feature_5" * 0.3501083253113648 + "ADS_sca_1_OUT"."Feature_6" * -0.02365108420686553 + "ADS_sca_1_OUT"."Feature_7" * -0.15293556467571348 + "ADS_sca_1_OUT"."Feature_8" * -0.04278465473081572 + "ADS_sca_1_OUT"."Feature_9" * -0.07700365586043896 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.4595639307438372 + "ADS_sca_1_OUT"."Feature_1" * 0.3158880900516212 + "ADS_sca_1_OUT"."Feature_2" * -0.23051961282840416 + "ADS_sca_1_OUT"."Feature_3" * -0.0044376721269756845 + "ADS_sca_1_OUT"."Feature_4" * -0.16274384812665132 + "ADS_sca_1_OUT"."Feature_5" * -0.27453767262313855 + "ADS_sca_1_OUT"."Feature_6" * 0.06030524407436345 + "ADS_sca_1_OUT"."Feature_7" * -0.14174903890838467 + "ADS_sca_1_OUT"."Feature_8" * -0.7115147418569482 + "ADS_sca_1_OUT"."Feature_9" * -0.06338366606522455 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.12741284788275034 + "ADS_sca_1_OUT"."Feature_1" * 0.08549541136134871 + "ADS_sca_1_OUT"."Feature_2" * -0.3821190712444285 + "ADS_sca_1_OUT"."Feature_3" * -0.10433262844841386 + "ADS_sca_1_OUT"."Feature_4" * 0.08250986211203802 + "ADS_sca_1_OUT"."Feature_5" * -0.36296260084226667 + "ADS_sca_1_OUT"."Feature_6" * 0.10962886388759648 + "ADS_sca_1_OUT"."Feature_7" * 0.2426374781882909 + "ADS_sca_1_OUT"."Feature_8" * 0.2287736877363014 + "ADS_sca_1_OUT"."Feature_9" * -0.7468451366164522 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.5052628362580355 + "ADS_sca_1_OUT"."Feature_1" * 0.5459531848285842 + "ADS_sca_1_OUT"."Feature_2" * -0.22747468245471705 + "ADS_sca_1_OUT"."Feature_3" * 0.10502795983753949 + "ADS_sca_1_OUT"."Feature_4" * 0.09502215073405063 + "ADS_sca_1_OUT"."Feature_5" * 0.36269377695620797 + "ADS_sca_1_OUT"."Feature_6" * 0.0045813170830969465 + "ADS_sca_1_OUT"."Feature_7" * -0.05707137281293255 + "ADS_sca_1_OUT"."Feature_8" * 0.4879473635061551 + "ADS_sca_1_OUT"."Feature_9" * 0.04384333678041198 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * -0.364462956028093 + "ADS_sca_1_OUT"."Feature_1" * -0.4012918066249357 + "ADS_sca_1_OUT"."Feature_2" * 0.1851889259404308 + "ADS_sca_1_OUT"."Feature_3" * -0.03041929320097767 + "ADS_sca_1_OUT"."Feature_4" * -0.1029513075574872 + "ADS_sca_1_OUT"."Feature_5" * 0.5811919009803136 + "ADS_sca_1_OUT"."Feature_6" * -0.060907389766695234 + "ADS_sca_1_OUT"."Feature_7" * 0.12041134521888586 + "ADS_sca_1_OUT"."Feature_8" * -0.186159059340367 + "ADS_sca_1_OUT"."Feature_9" * -0.5192923770633756 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.20119583886282807 + "ADS_sca_1_OUT"."Feature_1" * 0.0677442703839704 + "ADS_sca_1_OUT"."Feature_2" * -0.41277620208310173 + "ADS_sca_1_OUT"."Feature_3" * -0.019873248265688318 + "ADS_sca_1_OUT"."Feature_4" * 0.327357356668028 + "ADS_sca_1_OUT"."Feature_5" * 0.3399166161542765 + "ADS_sca_1_OUT"."Feature_6" * 0.007401751370061409 + "ADS_sca_1_OUT"."Feature_7" * 0.6352452099253666 + "ADS_sca_1_OUT"."Feature_8" * -0.3190683902934043 + "ADS_sca_1_OUT"."Feature_9" * 0.23674831363349555 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 2.107677912434) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -0.258608671624) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.269390888119) THEN 5 ELSE 6 END END ELSE 7 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.05882352941176471 AS "P_0", 0.5294117647058821 AS "P_1", 0.14705882352941202 AS "P_2", 0.26470588235294107 AS "P_3", 1 AS "D", 0.5294117647058821 AS "DP" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 0.6363636363636361 AS "P_0", 0.09090909090909091 AS "P_1", 0.18181818181818202 AS "P_2", 0.09090909090909091 AS "P_3", 0 AS "D", 0.6363636363636361 AS "DP" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS nid, 0.125 AS "P_0", 0.0 AS "P_1", 0.1875 AS "P_2", 0.6875 AS "P_3", 3 AS "D", 0.6875 AS "DP" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 7 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 1.0 AS "P_2", 0.0 AS "P_3", 2 AS "D", 1.0 AS "DP" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > 0.0) THEN ln("DT_Output"."P_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > 0.0) THEN ln("DT_Output"."P_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"