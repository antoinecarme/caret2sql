-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_xgbTree_pca
-- Dataset : FourClass_10
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(-0.003903374463034 AS DOUBLE PRECISION)) / CAST(0.985685974308334 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(0.615223221570233 AS DOUBLE PRECISION)) / CAST(1.398851036008891 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.042796236914292 AS DOUBLE PRECISION)) / CAST(1.505708787132384 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.770981955890407 AS DOUBLE PRECISION)) / CAST(2.34807774167973 AS DOUBLE PRECISION) AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(-0.433007336248933 AS DOUBLE PRECISION)) / CAST(1.411827447265648 AS DOUBLE PRECISION) AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(-0.042495696579404 AS DOUBLE PRECISION)) / CAST(0.961839508883184 AS DOUBLE PRECISION) AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(-0.298090801198454 AS DOUBLE PRECISION)) / CAST(1.023429731319144 AS DOUBLE PRECISION) AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(0.146722415072517 AS DOUBLE PRECISION)) / CAST(1.610898315451602 AS DOUBLE PRECISION) AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(0.01746942384662 AS DOUBLE PRECISION)) / CAST(1.155977213655104 AS DOUBLE PRECISION) AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(0.115073314156029 AS DOUBLE PRECISION)) / CAST(0.975205386360447 AS DOUBLE PRECISION) AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.049327726199083 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.304241927383749 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.367968756184989 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.53807698311158 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.108029887424004 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.139104070167547 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.538408634789189 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.371307182039522 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.048313713557932 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.137725395209441 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.456604637900229 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.228672039347645 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.267395679096854 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.016712024281351 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.716349755523003 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.350108325311365 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.023651084206866 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.152935564675713 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.042784654730816 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.077003655860439 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.459563930743837 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.315888090051621 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.230519612828404 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.004437672126976 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.162743848126651 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.274537672623139 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.060305244074363 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.141749038908385 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.711514741856948 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.063383666065225 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(0.12741284788275 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.085495411361349 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.382119071244428 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.104332628448414 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.082509862112038 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.362962600842267 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.109628863887596 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.242637478188291 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.228773687736301 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.746845136616452 AS DOUBLE PRECISION) AS "PC4", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.505262836258036 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.545953184828584 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.227474682454717 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.105027959837539 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.095022150734051 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.362693776956208 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.004581317083097 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.057071372812933 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.487947363506155 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.043843336780412 AS DOUBLE PRECISION) AS "PC5", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.364462956028093 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.401291806624936 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.185188925940431 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.030419293200978 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.102951307557487 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.581191900980314 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.060907389766695 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.120411345218886 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.186159059340367 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.519292377063376 AS DOUBLE PRECISION) AS "PC6", "ADS_sca_1_OUT"."Feature_0" * CAST(0.201195838862828 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.06774427038397 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.412776202083102 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.019873248265688 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.327357356668028 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.339916616154276 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.007401751370061 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.635245209925367 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.319068390293404 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.236748313633496 AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < CAST(-0.625437379 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(-0.212244898 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.0911392421 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Score" AS "Score" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Score" AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC2" < CAST(-0.277602673 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(0.15384616 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(-0.105263166 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Score" AS "Score" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1_0" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", "DT_Output_1"."Score" AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < CAST(0.73275876 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(-0.138922155 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.260674179 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."Score" AS "Score" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"XGB_Model_2_0" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", "DT_Output_2"."Score" AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC2" < CAST(0.20414272 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(-0.139860138 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.233628318 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."Score" AS "Score" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"XGB_Model_3_0" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", "DT_Output_3"."Score" AS "Score_3" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC2" < CAST(0.181706101 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(0.136400029 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(-0.214122206 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."Score" AS "Score" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"XGB_Model_0_1" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", "DT_Output_4"."Score" AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < CAST(-0.253722668 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(0.248789892 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(-0.202894136 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."Score" AS "Score" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"XGB_Model_1_1" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", "DT_Output_5"."Score" AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < CAST(0.98972708 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(-0.128405586 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.23165755 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."Score" AS "Score" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"XGB_Model_2_1" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", "DT_Output_6"."Score" AS "Score_2", CAST(0.0 AS DOUBLE PRECISION) AS "Score_3" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC5" < CAST(0.321646661 AS DOUBLE PRECISION)) THEN 1 ELSE 2 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."Score" AS "Score" 
FROM (SELECT 1 AS nid, CAST(-0.108174302 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte UNION ALL SELECT 2 AS nid, CAST(0.198770091 AS DOUBLE PRECISION) AS "Score" 
FROM dummy_cte) AS "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."Score" AS "Score" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"XGB_Model_3_1" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", CAST(0.0 AS DOUBLE PRECISION) AS "Score_0", CAST(0.0 AS DOUBLE PRECISION) AS "Score_1", CAST(0.0 AS DOUBLE PRECISION) AS "Score_2", "DT_Output_7"."Score" AS "Score_3" 
FROM "DT_Output_7"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Score_0" AS "Score_0", "XGB_esu_0"."Score_1" AS "Score_1", "XGB_esu_0"."Score_2" AS "Score_2", "XGB_esu_0"."Score_3" AS "Score_3" 
FROM (SELECT "XGB_Model_0_0"."KEY" AS "KEY", CAST("XGB_Model_0_0"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_0_0"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_0_0"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_0_0"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_0_0" UNION ALL SELECT "XGB_Model_1_0"."KEY" AS "KEY", CAST("XGB_Model_1_0"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_1_0"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_1_0"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_1_0"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_1_0" UNION ALL SELECT "XGB_Model_2_0"."KEY" AS "KEY", CAST("XGB_Model_2_0"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_2_0"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_2_0"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_2_0"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_2_0" UNION ALL SELECT "XGB_Model_3_0"."KEY" AS "KEY", CAST("XGB_Model_3_0"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_3_0"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_3_0"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_3_0"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_3_0" UNION ALL SELECT "XGB_Model_0_1"."KEY" AS "KEY", CAST("XGB_Model_0_1"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_0_1"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_0_1"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_0_1"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_0_1" UNION ALL SELECT "XGB_Model_1_1"."KEY" AS "KEY", CAST("XGB_Model_1_1"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_1_1"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_1_1"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_1_1"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_1_1" UNION ALL SELECT "XGB_Model_2_1"."KEY" AS "KEY", CAST("XGB_Model_2_1"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_2_1"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_2_1"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_2_1"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_2_1" UNION ALL SELECT "XGB_Model_3_1"."KEY" AS "KEY", CAST("XGB_Model_3_1"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_Model_3_1"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_Model_3_1"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_Model_3_1"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_Model_3_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Score_0" AS "Score_0", "XGBbig_esu"."Score_1" AS "Score_1", "XGBbig_esu"."Score_2" AS "Score_2", "XGBbig_esu"."Score_3" AS "Score_3" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("XGB_0"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("XGB_0"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("XGB_0"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Score_0" AS DOUBLE PRECISION) AS "Score_0", CAST("T"."Score_1" AS DOUBLE PRECISION) AS "Score_1", CAST("T"."Score_2" AS DOUBLE PRECISION) AS "Score_2", CAST("T"."Score_3" AS DOUBLE PRECISION) AS "Score_3" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Score_0") AS "Score_0", sum("XGB"."Score_1") AS "Score_1", sum("XGB"."Score_2") AS "Score_2", sum("XGB"."Score_3") AS "Score_3" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T"), 
orig_cte AS 
(SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Score_0" AS "Score_0", "XGB_sum"."Score_1" AS "Score_1", "XGB_sum"."Score_2" AS "Score_2", "XGB_sum"."Score_3" AS "Score_3", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_2", CAST(NULL AS DOUBLE PRECISION) AS "Proba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "XGB_sum"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu."class" AS "class", scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS "class", orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS "class", orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS "class", orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS "class", orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_2" - score_max."max_Score")) AS "exp_delta_Score_2", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_3" - score_max."max_Score")) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu."class" AS "class", soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS "class", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS "class", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS "class", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS "class", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union."class" AS "class", score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", min(union_with_max."class") AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2", arg_max_cte."SoftProba_3") AS "DecisionProba" 
FROM arg_max_cte