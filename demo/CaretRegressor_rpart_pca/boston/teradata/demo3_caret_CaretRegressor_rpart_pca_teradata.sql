-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart_pca
-- Dataset : boston
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(3.39360900990099 AS DOUBLE PRECISION)) / CAST(8.010536728867239 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(12.113861386138614 AS DOUBLE PRECISION)) / CAST(24.217647441147463 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(10.983613861386141 AS DOUBLE PRECISION)) / CAST(6.826200750364282 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.071782178217822 AS DOUBLE PRECISION)) / CAST(0.25844695944787 AS DOUBLE PRECISION) AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(0.554115346534653 AS DOUBLE PRECISION)) / CAST(0.11815441892621 AS DOUBLE PRECISION) AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(6.299148514851484 AS DOUBLE PRECISION)) / CAST(0.706917179366962 AS DOUBLE PRECISION) AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(67.85049504950496 AS DOUBLE PRECISION)) / CAST(28.14225428392539 AS DOUBLE PRECISION) AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(3.81984207920792 AS DOUBLE PRECISION)) / CAST(2.095968317662932 AS DOUBLE PRECISION) AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(9.559405940594061 AS DOUBLE PRECISION)) / CAST(8.73962685484057 AS DOUBLE PRECISION) AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(405.80198019801975 AS DOUBLE PRECISION)) / CAST(169.99638120813233 AS DOUBLE PRECISION) AS "Feature_9", (CAST("ADS"."Feature_10" AS DOUBLE PRECISION) - CAST(18.409158415841585 AS DOUBLE PRECISION)) / CAST(2.169479311043464 AS DOUBLE PRECISION) AS "Feature_10", (CAST("ADS"."Feature_11" AS DOUBLE PRECISION) - CAST(358.3797277227722 AS DOUBLE PRECISION)) / CAST(90.75931171894922 AS DOUBLE PRECISION) AS "Feature_11", (CAST("ADS"."Feature_12" AS DOUBLE PRECISION) - CAST(12.626584158415842 AS DOUBLE PRECISION)) / CAST(7.176826037708456 AS DOUBLE PRECISION) AS "Feature_12" 
FROM boston AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(0.250220678888687 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.257657622166322 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.349142817211163 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.010947739911215 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.341702940502129 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.18342485606155 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.312908408273551 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.322031010422469 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.321095706629001 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.337251474107517 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.204100286621243 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.204838784532289 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.310650151319704 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.333892498335001 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.34612789691036 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.087411219352171 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.424515585194016 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.211293718464013 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.057434294932177 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.314351415230206 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.338321219058974 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.309392655022944 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.278032579446654 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(-0.286931208131544 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(0.25271175238168 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.020410873762011 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(0.196086887583629 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.246925770659438 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.02294168584924 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.295072238263411 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.144753917387686 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.639082842521629 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.046373338354576 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.103183101221439 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.24979327774792 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.184943825588007 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(-0.354813126440233 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.268423931569444 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.2761542549039 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.07043882717758 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.366443977089067 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.005505878674518 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.394677659733639 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.088244170456792 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.479382360763591 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.08998214645493 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.183263010689112 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.098564182000519 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.046163481500644 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.427779120360107 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(0.300568928822139 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.374829551266692 AS DOUBLE PRECISION) AS "PC4", "ADS_sca_1_OUT"."Feature_0" * CAST(0.04300395631166 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.028752126111516 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.022231885157802 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.743568478622781 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.183428814349985 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.071077830384983 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.168277048930943 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.149917016979876 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.196966748602026 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.142011332929751 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.4646548460968 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(0.255520747968419 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.119528546399997 AS DOUBLE PRECISION) AS "PC5", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.37672327180118 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.292078060010324 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.019426014218211 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.108878244543508 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.101464163188857 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.057934635009181 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.108093951272983 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.032878444909013 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.093905810307709 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.129723760554497 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.257280249912816 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.796534018844979 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.088404315276758 AS DOUBLE PRECISION) AS "PC6", "ADS_sca_1_OUT"."Feature_0" * CAST(0.732064562941599 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.315939333753869 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.337399997698915 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.093154051976871 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.22595618925586 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.041144897634024 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.087615019398573 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.088942971352548 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.173522349172408 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.349499754499628 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.023466306336306 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.117411400600455 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.082552061162228 AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" >= CAST(-0.092568500638984 AS DOUBLE PRECISION)) THEN 2 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" < CAST(0.58940035856613 AS DOUBLE PRECISION)) THEN 6 ELSE 7 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, CAST(16.97670454545455 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 6 AS nid, CAST(23.035928143712567 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 7 AS nid, CAST(37.4918032786885 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"