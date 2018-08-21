-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart_pca
-- Dataset : iris_str_tgt
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 3.036666666666667) / 0.4380885397125232 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 3.845) / 1.7169863181769165 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 1.245) / 0.7530163434118665 AS "Feature_3" 
FROM iris_str_tgt AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.5280479447451925 + "CenteredDataForPCA"."Feature_1" * 0.2412399033565022 + "CenteredDataForPCA"."Feature_2" * -0.5832535878260505 + "CenteredDataForPCA"."Feature_3" * -0.5681407654507491 AS caret_preprocess_output_2, "CenteredDataForPCA"."Feature_0" * 0.3508850618777821 + "CenteredDataForPCA"."Feature_1" * 0.9341096803264928 + "CenteredDataForPCA"."Feature_2" * 0.004843882287815959 + "CenteredDataForPCA"."Feature_3" * 0.06553865482098675 AS caret_preprocess_output_3, "CenteredDataForPCA"."Feature_0" * 0.7288458907341283 + "CenteredDataForPCA"."Feature_1" * -0.2288706459708456 + "CenteredDataForPCA"."Feature_2" * -0.1411795151358562 + "CenteredDataForPCA"."Feature_3" * -0.6296588278416076 AS caret_preprocess_output_4, "CenteredDataForPCA"."Feature_0" * -0.2585124928535911 + "CenteredDataForPCA"."Feature_1" * 0.1298485331521732 + "CenteredDataForPCA"."Feature_2" * 0.7999125787224665 + "CenteredDataForPCA"."Feature_3" * -0.5257856177934361 AS caret_preprocess_output_5 
FROM "CenteredDataForPCA"), 
"DT_node_lookup" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_car_1_OUT".caret_preprocess_output_2 >= 1.2664238557260223) THEN 2 ELSE CASE WHEN ("ADS_car_1_OUT".caret_preprocess_output_2 >= -0.8364677078840411) THEN 6 ELSE 7 END END AS node_id_2 
FROM "ADS_car_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_CLASS_0" AS "P_CLASS_0", "Values"."P_CLASS_1" AS "P_CLASS_1", "Values"."P_CLASS_2" AS "P_CLASS_2", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 1.0 AS "P_CLASS_0", 0.0 AS "P_CLASS_1", 0.0 AS "P_CLASS_2", 'CLASS_0' AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_CLASS_0", 0.9696969696969697 AS "P_CLASS_1", 0.030303030303030304 AS "P_CLASS_2", 'CLASS_1' AS "D", 0.9696969696969697 AS "DP" UNION ALL SELECT 7 AS nid, 0.0 AS "P_CLASS_0", 0.16 AS "P_CLASS_1", 0.84 AS "P_CLASS_2", 'CLASS_2' AS "D", 0.84 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_CLASS_0" AS "P_CLASS_0", "DT_node_data"."P_CLASS_1" AS "P_CLASS_1", "DT_node_data"."P_CLASS_2" AS "P_CLASS_2", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_CLASS_0", CAST(NULL AS FLOAT) AS "Score_CLASS_1", CAST(NULL AS FLOAT) AS "Score_CLASS_2", "DT_Output"."P_CLASS_0" AS "Proba_CLASS_0", "DT_Output"."P_CLASS_1" AS "Proba_CLASS_1", "DT_Output"."P_CLASS_2" AS "Proba_CLASS_2", CASE WHEN ("DT_Output"."P_CLASS_0" IS NULL OR "DT_Output"."P_CLASS_0" > 0.0) THEN ln("DT_Output"."P_CLASS_0") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_0", CASE WHEN ("DT_Output"."P_CLASS_1" IS NULL OR "DT_Output"."P_CLASS_1" > 0.0) THEN ln("DT_Output"."P_CLASS_1") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_1", CASE WHEN ("DT_Output"."P_CLASS_2" IS NULL OR "DT_Output"."P_CLASS_2" > 0.0) THEN ln("DT_Output"."P_CLASS_2") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_2", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"