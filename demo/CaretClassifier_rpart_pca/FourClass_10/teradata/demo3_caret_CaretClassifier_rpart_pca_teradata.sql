-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart_pca
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
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < CAST(1.261218863406317 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" < CAST(-0.081647757653283 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" >= CAST(-0.253722667430684 AS DOUBLE PRECISION)) THEN 8 ELSE 9 END ELSE 5 END ELSE 3 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, CAST(0.238095238095238 AS DOUBLE PRECISION) AS "P_0", CAST(0.0 AS DOUBLE PRECISION) AS "P_1", CAST(0.666666666666667 AS DOUBLE PRECISION) AS "P_2", CAST(0.095238095238095 AS DOUBLE PRECISION) AS "P_3", 2 AS "D", CAST(0.666666666666667 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 5 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_0", CAST(0.241379310344828 AS DOUBLE PRECISION) AS "P_1", CAST(0.172413793103448 AS DOUBLE PRECISION) AS "P_2", CAST(0.586206896551724 AS DOUBLE PRECISION) AS "P_3", 3 AS "D", CAST(0.586206896551724 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 8 AS nid, CAST(0.785714285714286 AS DOUBLE PRECISION) AS "P_0", CAST(0.142857142857143 AS DOUBLE PRECISION) AS "P_1", CAST(0.071428571428571 AS DOUBLE PRECISION) AS "P_2", CAST(0.0 AS DOUBLE PRECISION) AS "P_3", 0 AS "D", CAST(0.785714285714286 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 9 AS nid, CAST(0.125 AS DOUBLE PRECISION) AS "P_0", CAST(0.6875 AS DOUBLE PRECISION) AS "P_1", CAST(0.0 AS DOUBLE PRECISION) AS "P_2", CAST(0.1875 AS DOUBLE PRECISION) AS "P_3", 1 AS "D", CAST(0.6875 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"