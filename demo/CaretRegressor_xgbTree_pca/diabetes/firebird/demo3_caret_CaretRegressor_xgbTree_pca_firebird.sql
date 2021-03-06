-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree_pca
-- Dataset : diabetes
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 0.0002686932066652983) / 0.04730915349390602 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 0.0007239580580639588) / 0.047673150284254465 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.0007280719825586781) / 0.04700253448417295 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.0010135652210843957) / 0.04840388131203584 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - 0.0009763580732882078) / 0.04811896752594957 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - 0.0017643808242337245) / 0.048129028508581584 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - -0.0016512815450565033) / 0.04626798564989309 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.0013905501983388132) / 0.04743032244703379 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.001272648254809092) / 0.04595800380394428 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.0010344250056816262) / 0.04782938024075454 AS "Feature_9" 
FROM diabetes AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.2290778852038531 + "ADS_sca_1_OUT"."Feature_1" * -0.1753752188773297 + "ADS_sca_1_OUT"."Feature_2" * -0.3101462867523008 + "ADS_sca_1_OUT"."Feature_3" * -0.2626680617954629 + "ADS_sca_1_OUT"."Feature_4" * -0.3479056910483734 + "ADS_sca_1_OUT"."Feature_5" * -0.3559311512395374 + "ADS_sca_1_OUT"."Feature_6" * 0.2700667896053253 + "ADS_sca_1_OUT"."Feature_7" * -0.4281896059050315 + "ADS_sca_1_OUT"."Feature_8" * -0.3817554053543343 + "ADS_sca_1_OUT"."Feature_9" * -0.319118586083605 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.09937121658133408 + "ADS_sca_1_OUT"."Feature_1" * -0.3974071373222933 + "ADS_sca_1_OUT"."Feature_2" * -0.0955290657434 + "ADS_sca_1_OUT"."Feature_3" * -0.10428227480233908 + "ADS_sca_1_OUT"."Feature_4" * 0.5519944936080498 + "ADS_sca_1_OUT"."Feature_5" * 0.44169748621486143 + "ADS_sca_1_OUT"."Feature_6" * 0.5359791630654337 + "ADS_sca_1_OUT"."Feature_7" * -0.09747648126824032 + "ADS_sca_1_OUT"."Feature_8" * -0.06464571596604123 + "ADS_sca_1_OUT"."Feature_9" * -0.1069735796588606 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.447334397656141 + "ADS_sca_1_OUT"."Feature_1" * 0.06517171310859735 + "ADS_sca_1_OUT"."Feature_2" * -0.1813228857818792 + "ADS_sca_1_OUT"."Feature_3" * -0.5633053550809429 + "ADS_sca_1_OUT"."Feature_4" * 0.10998840407137493 + "ADS_sca_1_OUT"."Feature_5" * 0.2893639101113097 + "ADS_sca_1_OUT"."Feature_6" * -0.3533722834611607 + "ADS_sca_1_OUT"."Feature_7" * 0.3825782441157001 + "ADS_sca_1_OUT"."Feature_8" * -0.04470455133576475 + "ADS_sca_1_OUT"."Feature_9" * -0.2763840995943125 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.3821475868520689 + "ADS_sca_1_OUT"."Feature_1" * -0.6833479183061256 + "ADS_sca_1_OUT"."Feature_2" * 0.5241820976738465 + "ADS_sca_1_OUT"."Feature_3" * -0.03681239814871951 + "ADS_sca_1_OUT"."Feature_4" * -0.08445010736913261 + "ADS_sca_1_OUT"."Feature_5" * -0.16994357503869012 + "ADS_sca_1_OUT"."Feature_6" * -0.07693340159969728 + "ADS_sca_1_OUT"."Feature_7" * 0.017466366084080358 + "ADS_sca_1_OUT"."Feature_8" * 0.2554449000560565 + "ADS_sca_1_OUT"."Feature_9" * 0.05820877690254081 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.7351365637973705 + "ADS_sca_1_OUT"."Feature_1" * 0.3763855813795456 + "ADS_sca_1_OUT"."Feature_2" * 0.1420393394491647 + "ADS_sca_1_OUT"."Feature_3" * 0.3926718700192453 + "ADS_sca_1_OUT"."Feature_4" * 0.1428650665541864 + "ADS_sca_1_OUT"."Feature_5" * 0.1276726308786394 + "ADS_sca_1_OUT"."Feature_6" * 0.245950649429653 + "ADS_sca_1_OUT"."Feature_7" * -0.1284011919823951 + "ADS_sca_1_OUT"."Feature_8" * -0.1367980851890121 + "ADS_sca_1_OUT"."Feature_9" * 0.1055401494998786 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * -0.12368487725974045 + "ADS_sca_1_OUT"."Feature_1" * -0.06284387588101352 + "ADS_sca_1_OUT"."Feature_2" * -0.2953969232053042 + "ADS_sca_1_OUT"."Feature_3" * -0.3412960311712761 + "ADS_sca_1_OUT"."Feature_4" * -0.01656449034153671 + "ADS_sca_1_OUT"."Feature_5" * -0.04587438751367261 + "ADS_sca_1_OUT"."Feature_6" * 0.08082110381516423 + "ADS_sca_1_OUT"."Feature_7" * -0.030199014358925625 + "ADS_sca_1_OUT"."Feature_8" * -0.0053457810566821425 + "ADS_sca_1_OUT"."Feature_9" * 0.8758760898858822 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.18093645279344808 + "ADS_sca_1_OUT"."Feature_1" * -0.06987137416766502 + "ADS_sca_1_OUT"."Feature_2" * -0.5789173338500514 + "ADS_sca_1_OUT"."Feature_3" * 0.2280204737784956 + "ADS_sca_1_OUT"."Feature_4" * 0.10126984562459923 + "ADS_sca_1_OUT"."Feature_5" * -0.2246202656518164 + "ADS_sca_1_OUT"."Feature_6" * 0.06544614151024082 + "ADS_sca_1_OUT"."Feature_7" * 0.03808580365663454 + "ADS_sca_1_OUT"."Feature_8" * 0.6979315085634531 + "ADS_sca_1_OUT"."Feature_9" * -0.147273260741705 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < -0.688706696) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" < -0.910936117) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" < 0.661205113) THEN 5 ELSE 6 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 60.2083321 AS "Estimator" FROM rdb$database UNION ALL SELECT 4 AS nid, 86.302269 AS "Estimator" FROM rdb$database UNION ALL SELECT 5 AS nid, 42.8278694 AS "Estimator" FROM rdb$database UNION ALL SELECT 6 AS nid, 65.8041687 AS "Estimator" FROM rdb$database) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" < -0.465674222) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" < 0.395179033) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" < 1.2384119) THEN 5 ELSE 6 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 56.0983162 AS "Estimator" FROM rdb$database UNION ALL SELECT 4 AS nid, 26.6974316 AS "Estimator" FROM rdb$database UNION ALL SELECT 5 AS nid, 27.6771088 AS "Estimator" FROM rdb$database UNION ALL SELECT 6 AS nid, 46.6368332 AS "Estimator" FROM rdb$database) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Estimator" AS "Estimator" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."Estimator" AS "Estimator" 
FROM "DT_Output_1"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_Model_0"."KEY" AS "KEY", CAST("XGB_Model_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_0" UNION ALL SELECT "XGB_Model_1"."KEY" AS "KEY", CAST("XGB_Model_1"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Estimator") AS "Estimator" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T")
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + 0.5 AS "Estimator" 
FROM "XGB_sum"