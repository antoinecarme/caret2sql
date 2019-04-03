-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree_pca
-- Dataset : freidman1
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(0.562984648480959 AS DOUBLE PRECISION)) / CAST(0.260001588411854 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(0.456064424233759 AS DOUBLE PRECISION)) / CAST(0.289688419309962 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.471138174814748 AS DOUBLE PRECISION)) / CAST(0.312883349587944 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.533968020094518 AS DOUBLE PRECISION)) / CAST(0.284403095827715 AS DOUBLE PRECISION) AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(0.478093626237387 AS DOUBLE PRECISION)) / CAST(0.287945812011123 AS DOUBLE PRECISION) AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(0.568284922417233 AS DOUBLE PRECISION)) / CAST(0.299552169607502 AS DOUBLE PRECISION) AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(0.479143747142805 AS DOUBLE PRECISION)) / CAST(0.27525726503364 AS DOUBLE PRECISION) AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(0.459415247722321 AS DOUBLE PRECISION)) / CAST(0.28902357134177 AS DOUBLE PRECISION) AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(0.490110699680965 AS DOUBLE PRECISION)) / CAST(0.28080924864055 AS DOUBLE PRECISION) AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(0.537880693370754 AS DOUBLE PRECISION)) / CAST(0.297685615548656 AS DOUBLE PRECISION) AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(0.010780442063987 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.202756724250353 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.303209595911507 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.280369464515091 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.456472170133784 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.36405052299186 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.477939841502184 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.249953723713424 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.085532497512897 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.386149721653981 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.248650106034372 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.185386884643713 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.234091106127542 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.531221596775717 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.034157117099709 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.114030091601103 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.039138460920202 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.319328186366125 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.649732149782441 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.164274314155082 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(0.529444486853135 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.042432305775754 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.467456082445249 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.121133490702262 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.351661543596604 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.054563969207843 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.016972140106659 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.447962737978362 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.099512316550893 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.38366011768223 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(0.189670623576609 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.673999742941582 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.051427564803003 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.42408875691579 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.175361755417044 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.237309991191909 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.349291707330322 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.240159171999498 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.245787218558971 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.009647497508174 AS DOUBLE PRECISION) AS "PC4", "ADS_sca_1_OUT"."Feature_0" * CAST(0.223601203935867 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.27882706563202 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.332515914531683 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.032312931246734 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.311763288283017 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.584634387327848 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.225634443474902 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.454423940412506 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.139992622357474 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.211289709505319 AS DOUBLE PRECISION) AS "PC5", "ADS_sca_1_OUT"."Feature_0" * CAST(0.334635197355464 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.067378641118281 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.257816878697171 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.126427644593726 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.407298318829594 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.455689833219327 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.431159310924849 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.1062393952274 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.004192902519121 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.479872926518441 AS DOUBLE PRECISION) AS "PC6", "ADS_sca_1_OUT"."Feature_0" * CAST(0.534563168181978 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.291620910405103 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.42739631594523 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.219530136304283 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.235065733216965 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.129596101044357 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.337340483835482 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.155084355337176 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.285475102455194 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.327019159137772 AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 0 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 0 AS nid, CAST(5.69907141 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 0 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 0 AS nid, CAST(3.4888196 AS DOUBLE PRECISION) AS "Estimator" 
FROM dummy_cte) AS "Values"), 
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
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + CAST(0.5 AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_sum"