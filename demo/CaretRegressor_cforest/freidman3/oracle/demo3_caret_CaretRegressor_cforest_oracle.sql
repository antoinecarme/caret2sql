-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest
-- Dataset : freidman3
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 62.41256103982974) THEN CASE WHEN ("ADS"."Feature_0" <= 45.60940687108933) THEN CASE WHEN ("ADS"."Feature_1" <= 576.5087879963894) THEN 6 ELSE 7 END ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_2" <= 0.7651752581595906) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.631347402501331 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.45710631487313 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.53780643916796 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.4524844447157699 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.19661478692477 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.49135798533088 AS "E" FROM DUAL) "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"RF_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 61.39878854860189) THEN CASE WHEN ("ADS"."Feature_0" <= 45.60940687108933) THEN CASE WHEN ("ADS"."Feature_0" <= 9.844209111159174) THEN 6 ELSE CASE WHEN ("ADS"."Feature_1" <= 1121.243323563217) THEN 8 ELSE 9 END END ELSE 10 END ELSE CASE WHEN ("ADS"."Feature_1" <= 819.5815430545474) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.814859925712208 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.55635375780683 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.51513304205248 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.52991924083483 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.4032281019811201 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.1175616007476001 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.4467536779644299 AS "E" FROM DUAL) "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."E" AS "E" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"RF_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."E" AS "Estimator" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_0" <= 62.41256103982974) THEN CASE WHEN ("ADS"."Feature_2" <= 0.1679032802018684) THEN 3 ELSE CASE WHEN ("ADS"."Feature_0" <= 9.573211516810986) THEN 5 ELSE CASE WHEN ("ADS"."Feature_1" <= 808.6138063164557) THEN 7 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.7128122573277177) THEN 9 ELSE 10 END END END END ELSE CASE WHEN ("ADS"."Feature_1" <= 711.0171497771485) THEN 12 ELSE 13 END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 1.17558264113001 AS "E" FROM DUAL UNION ALL SELECT 5 AS nid, 1.5566604803537398 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.46085977972947 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.5015342342808602 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.5291075628761799 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.09502953827124 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.41469267043702 AS "E" FROM DUAL) "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."E" AS "E" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"RF_Model_2" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", "DT_Output_2"."E" AS "Estimator" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 61.39878854860189) THEN CASE WHEN ("ADS"."Feature_0" <= 49.065466008392974) THEN CASE WHEN ("ADS"."Feature_0" <= 6.292766107513682) THEN 6 ELSE CASE WHEN ("ADS"."Feature_0" <= 28.332097756867146) THEN 8 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.7470342432713207) THEN 10 ELSE 11 END END END ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.855719346202639 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.56717917677131 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.53285914750484 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.49090766495478 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.5236702059723002 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.43328804635681 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.24673788589817 AS "E" FROM DUAL) "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."E" AS "E" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"RF_Model_3" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", "DT_Output_3"."E" AS "Estimator" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.21965300342994898) THEN 2 ELSE CASE WHEN ("ADS"."Feature_1" <= 658.8446347865662) THEN 4 ELSE CASE WHEN ("ADS"."Feature_0" <= 42.73189343322634) THEN CASE WHEN ("ADS"."Feature_0" <= 20.56283672662996) THEN 7 ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_1" <= 979.5390758373205) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 1.1564284873681698 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 1.2588144451191499 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.55553588583173 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.5246609283934798 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.4375602538288301 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.5039564882981398 AS "E" FROM DUAL) "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."E" AS "E" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"RF_Model_4" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", "DT_Output_4"."E" AS "Estimator" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.09995386118122852) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 69.85214811522404) THEN CASE WHEN ("ADS"."Feature_0" <= 34.99225156681424) THEN CASE WHEN ("ADS"."Feature_2" <= 0.4895624792598544) THEN 6 ELSE 7 END ELSE CASE WHEN ("ADS"."Feature_1" <= 761.0600872268959) THEN 9 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.5666035361130893) THEN 11 ELSE 12 END END END ELSE 13 END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.9033070219172441 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.5004200732533797 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.5406419157141102 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.3081697262918202 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.41085163960801 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.50074552869082 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.27662882696325 AS "E" FROM DUAL) "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."E" AS "E" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"RF_Model_5" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", "DT_Output_5"."E" AS "Estimator" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.21965300342994898) THEN 2 ELSE CASE WHEN ("ADS"."Feature_1" <= 405.53911579286233) THEN 4 ELSE CASE WHEN ("ADS"."Feature_0" <= 69.58353961616501) THEN CASE WHEN ("ADS"."Feature_0" <= 28.19529948939466) THEN 7 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.7446274145722073) THEN 9 ELSE 10 END END ELSE 11 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 1.16653037821291 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 1.3318483356154098 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.5425595068331799 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.48270863454821 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.51412033313833 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.40683558645291 AS "E" FROM DUAL) "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."E" AS "E" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"RF_Model_6" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", "DT_Output_6"."E" AS "Estimator" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_1" <= 819.5815430545474) THEN CASE WHEN ("ADS"."Feature_2" <= 0.2399512252460241) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_2" <= 0.2510397707351385) THEN 6 ELSE CASE WHEN ("ADS"."Feature_0" <= 28.19529948939466) THEN 8 ELSE CASE WHEN ("ADS"."Feature_0" <= 45.60940687108933) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 0.8893511267928541 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 1.2821539907011201 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.3556078850159499 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.5510736182250602 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.5186512964874 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.4902398103966998 AS "E" FROM DUAL) "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."E" AS "E" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"RF_Model_7" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", "DT_Output_7"."E" AS "Estimator" 
FROM "DT_Output_7"), 
"DT_node_lookup_8" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.3029311169301471) THEN CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_1" <= 515.4406205692957) THEN 6 ELSE CASE WHEN ("ADS"."Feature_0" <= 42.73189343322634) THEN 8 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.5666035361130893) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_8" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 0.9564314896039459 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 1.1918733667998602 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.3059671092226002 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.53179547336936 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.4525596019744 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.50186039646481 AS "E" FROM DUAL) "Values"), 
"DT_Output_8" AS 
(SELECT "DT_node_lookup_8"."KEY" AS "KEY", "DT_node_lookup_8".node_id_2 AS node_id_2, "DT_node_data_8".nid AS nid, "DT_node_data_8"."E" AS "E" 
FROM "DT_node_lookup_8" LEFT OUTER JOIN "DT_node_data_8" ON "DT_node_lookup_8".node_id_2 = "DT_node_data_8".nid), 
"RF_Model_8" AS 
(SELECT "DT_Output_8"."KEY" AS "KEY", "DT_Output_8"."E" AS "Estimator" 
FROM "DT_Output_8"), 
"DT_node_lookup_9" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.09995386118122852) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 60.58860696643238) THEN CASE WHEN ("ADS"."Feature_2" <= 0.41374778042760707) THEN 5 ELSE CASE WHEN ("ADS"."Feature_1" <= 897.2276900739249) THEN 7 ELSE CASE WHEN ("ADS"."Feature_0" <= 28.19529948939466) THEN 9 ELSE 10 END END END ELSE CASE WHEN ("ADS"."Feature_1" <= 819.5815430545474) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_9" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.743335130047082 AS "E" FROM DUAL UNION ALL SELECT 5 AS nid, 1.4003846540076297 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.47887795047389 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.5529969614813601 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.5226911591084 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.1877075338495802 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.4563515404109197 AS "E" FROM DUAL) "Values"), 
"DT_Output_9" AS 
(SELECT "DT_node_lookup_9"."KEY" AS "KEY", "DT_node_lookup_9".node_id_2 AS node_id_2, "DT_node_data_9".nid AS nid, "DT_node_data_9"."E" AS "E" 
FROM "DT_node_lookup_9" LEFT OUTER JOIN "DT_node_data_9" ON "DT_node_lookup_9".node_id_2 = "DT_node_data_9".nid), 
"RF_Model_9" AS 
(SELECT "DT_Output_9"."KEY" AS "KEY", "DT_Output_9"."E" AS "Estimator" 
FROM "DT_Output_9"), 
"RF_0" AS 
(SELECT "RF_esu_0"."KEY" AS "KEY", "RF_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "RF_Model_0"."KEY" AS "KEY", CAST("RF_Model_0"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_0" UNION ALL SELECT "RF_Model_1"."KEY" AS "KEY", CAST("RF_Model_1"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_1" UNION ALL SELECT "RF_Model_2"."KEY" AS "KEY", CAST("RF_Model_2"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_2" UNION ALL SELECT "RF_Model_3"."KEY" AS "KEY", CAST("RF_Model_3"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_3" UNION ALL SELECT "RF_Model_4"."KEY" AS "KEY", CAST("RF_Model_4"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_4" UNION ALL SELECT "RF_Model_5"."KEY" AS "KEY", CAST("RF_Model_5"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_5" UNION ALL SELECT "RF_Model_6"."KEY" AS "KEY", CAST("RF_Model_6"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_6" UNION ALL SELECT "RF_Model_7"."KEY" AS "KEY", CAST("RF_Model_7"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_7" UNION ALL SELECT "RF_Model_8"."KEY" AS "KEY", CAST("RF_Model_8"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_8" UNION ALL SELECT "RF_Model_9"."KEY" AS "KEY", CAST("RF_Model_9"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_9") "RF_esu_0"), 
"DT_node_lookup_10" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.2399512252460241) THEN CASE WHEN ("ADS"."Feature_2" <= 0.05430583027749702) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_0" <= 42.181241785673954) THEN CASE WHEN ("ADS"."Feature_0" <= 6.292766107513682) THEN 7 ELSE CASE WHEN ("ADS"."Feature_1" <= 940.7646066666928) THEN 9 ELSE 10 END END ELSE CASE WHEN ("ADS"."Feature_1" <= 884.3045807091647) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_10" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 0.7292751893850021 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 1.1360433504269398 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.56313052484412 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.4956444894722398 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.52216406321197 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.34394856151012 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.48694558263944 AS "E" FROM DUAL) "Values"), 
"DT_Output_10" AS 
(SELECT "DT_node_lookup_10"."KEY" AS "KEY", "DT_node_lookup_10".node_id_2 AS node_id_2, "DT_node_data_10".nid AS nid, "DT_node_data_10"."E" AS "E" 
FROM "DT_node_lookup_10" LEFT OUTER JOIN "DT_node_data_10" ON "DT_node_lookup_10".node_id_2 = "DT_node_data_10".nid), 
"RF_Model_10" AS 
(SELECT "DT_Output_10"."KEY" AS "KEY", "DT_Output_10"."E" AS "Estimator" 
FROM "DT_Output_10"), 
"DT_node_lookup_11" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.2399512252460241) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 35.20412262564763) THEN CASE WHEN ("ADS"."Feature_0" <= 9.844209111159174) THEN 5 ELSE 6 END ELSE CASE WHEN ("ADS"."Feature_1" <= 515.4406205692957) THEN 8 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.5861796897198648) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_11" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 1.09191598593098 AS "E" FROM DUAL UNION ALL SELECT 5 AS nid, 1.55404749586872 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.5205829146385401 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.2338089458010701 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.4309733688407 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.50023178896125 AS "E" FROM DUAL) "Values"), 
"DT_Output_11" AS 
(SELECT "DT_node_lookup_11"."KEY" AS "KEY", "DT_node_lookup_11".node_id_2 AS node_id_2, "DT_node_data_11".nid AS nid, "DT_node_data_11"."E" AS "E" 
FROM "DT_node_lookup_11" LEFT OUTER JOIN "DT_node_data_11" ON "DT_node_lookup_11".node_id_2 = "DT_node_data_11".nid), 
"RF_Model_11" AS 
(SELECT "DT_Output_11"."KEY" AS "KEY", "DT_Output_11"."E" AS "Estimator" 
FROM "DT_Output_11"), 
"DT_node_lookup_12" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 61.39878854860189) THEN CASE WHEN ("ADS"."Feature_0" <= 35.20412262564763) THEN CASE WHEN ("ADS"."Feature_1" <= 681.5157838950513) THEN 6 ELSE 7 END ELSE CASE WHEN ("ADS"."Feature_1" <= 808.6138063164557) THEN 9 ELSE 10 END END ELSE CASE WHEN ("ADS"."Feature_1" <= 819.5815430545474) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_12" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.7626553929012241 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.48819803028505 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.5388670053196103 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.3508383354385802 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.46758366813252 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.17594556569703 AS "E" FROM DUAL UNION ALL SELECT 13 AS nid, 1.39122874006303 AS "E" FROM DUAL) "Values"), 
"DT_Output_12" AS 
(SELECT "DT_node_lookup_12"."KEY" AS "KEY", "DT_node_lookup_12".node_id_2 AS node_id_2, "DT_node_data_12".nid AS nid, "DT_node_data_12"."E" AS "E" 
FROM "DT_node_lookup_12" LEFT OUTER JOIN "DT_node_data_12" ON "DT_node_lookup_12".node_id_2 = "DT_node_data_12".nid), 
"RF_Model_12" AS 
(SELECT "DT_Output_12"."KEY" AS "KEY", "DT_Output_12"."E" AS "Estimator" 
FROM "DT_Output_12"), 
"DT_node_lookup_13" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_0" <= 62.41256103982974) THEN CASE WHEN ("ADS"."Feature_2" <= 0.1917623524007062) THEN 3 ELSE CASE WHEN ("ADS"."Feature_1" <= 243.9351566585151) THEN 5 ELSE CASE WHEN ("ADS"."Feature_0" <= 15.86010468726484) THEN 7 ELSE CASE WHEN ("ADS"."Feature_1" <= 880.6272882099099) THEN 9 ELSE 10 END END END END ELSE 11 END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_13" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 1.20759737258603 AS "E" FROM DUAL UNION ALL SELECT 5 AS nid, 1.36842681653178 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.5540334415761 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.4488335882139098 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.51011464169907 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.14997512839271 AS "E" FROM DUAL) "Values"), 
"DT_Output_13" AS 
(SELECT "DT_node_lookup_13"."KEY" AS "KEY", "DT_node_lookup_13".node_id_2 AS node_id_2, "DT_node_data_13".nid AS nid, "DT_node_data_13"."E" AS "E" 
FROM "DT_node_lookup_13" LEFT OUTER JOIN "DT_node_data_13" ON "DT_node_lookup_13".node_id_2 = "DT_node_data_13".nid), 
"RF_Model_13" AS 
(SELECT "DT_Output_13"."KEY" AS "KEY", "DT_Output_13"."E" AS "Estimator" 
FROM "DT_Output_13"), 
"DT_node_lookup_14" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 45.60940687108933) THEN CASE WHEN ("ADS"."Feature_3" <= 2.8065267604549216) THEN 5 ELSE CASE WHEN ("ADS"."Feature_0" <= 8.565026378214535) THEN 7 ELSE CASE WHEN ("ADS"."Feature_1" <= 932.796392771736) THEN 9 ELSE 10 END END END ELSE CASE WHEN ("ADS"."Feature_1" <= 819.5815430545474) THEN 12 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.3441595308948491) THEN 14 ELSE 15 END END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_14" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.815178736431828 AS "E" FROM DUAL UNION ALL SELECT 5 AS nid, 1.4506427784153 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.55662444895359 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 1.49350169734817 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.5292442799761399 AS "E" FROM DUAL UNION ALL SELECT 12 AS nid, 1.19219934014551 AS "E" FROM DUAL UNION ALL SELECT 14 AS nid, 1.35231560165816 AS "E" FROM DUAL UNION ALL SELECT 15 AS nid, 1.4844260275496102 AS "E" FROM DUAL) "Values"), 
"DT_Output_14" AS 
(SELECT "DT_node_lookup_14"."KEY" AS "KEY", "DT_node_lookup_14".node_id_2 AS node_id_2, "DT_node_data_14".nid AS nid, "DT_node_data_14"."E" AS "E" 
FROM "DT_node_lookup_14" LEFT OUTER JOIN "DT_node_data_14" ON "DT_node_lookup_14".node_id_2 = "DT_node_data_14".nid), 
"RF_Model_14" AS 
(SELECT "DT_Output_14"."KEY" AS "KEY", "DT_Output_14"."E" AS "Estimator" 
FROM "DT_Output_14"), 
"DT_node_lookup_15" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.1044772945574536) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 54.388341028653976) THEN CASE WHEN ("ADS"."Feature_0" <= 35.20412262564763) THEN CASE WHEN ("ADS"."Feature_1" <= 1044.674930239592) THEN 6 ELSE 7 END ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_1" <= 990.2254318826166) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "FREIDMAN3" "ADS"), 
"DT_node_data_15" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 0.7854470855823441 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 1.51812858195786 AS "E" FROM DUAL UNION ALL SELECT 7 AS nid, 1.54768181821971 AS "E" FROM DUAL UNION ALL SELECT 8 AS nid, 1.46080874607909 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 1.19050500068907 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 1.43847228981141 AS "E" FROM DUAL) "Values"), 
"DT_Output_15" AS 
(SELECT "DT_node_lookup_15"."KEY" AS "KEY", "DT_node_lookup_15".node_id_2 AS node_id_2, "DT_node_data_15".nid AS nid, "DT_node_data_15"."E" AS "E" 
FROM "DT_node_lookup_15" LEFT OUTER JOIN "DT_node_data_15" ON "DT_node_lookup_15".node_id_2 = "DT_node_data_15".nid), 
"RF_Model_15" AS 
(SELECT "DT_Output_15"."KEY" AS "KEY", "DT_Output_15"."E" AS "Estimator" 
FROM "DT_Output_15"), 
"RF_1" AS 
(SELECT "RF_esu_1"."KEY" AS "KEY", "RF_esu_1"."Estimator" AS "Estimator" 
FROM (SELECT "RF_Model_10"."KEY" AS "KEY", CAST("RF_Model_10"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_10" UNION ALL SELECT "RF_Model_11"."KEY" AS "KEY", CAST("RF_Model_11"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_11" UNION ALL SELECT "RF_Model_12"."KEY" AS "KEY", CAST("RF_Model_12"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_12" UNION ALL SELECT "RF_Model_13"."KEY" AS "KEY", CAST("RF_Model_13"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_13" UNION ALL SELECT "RF_Model_14"."KEY" AS "KEY", CAST("RF_Model_14"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_14" UNION ALL SELECT "RF_Model_15"."KEY" AS "KEY", CAST("RF_Model_15"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_Model_15") "RF_esu_1"), 
"RF" AS 
(SELECT "RFbig_esu"."KEY" AS "KEY", "RFbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "RF_0"."KEY" AS "KEY", CAST("RF_0"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_0" UNION ALL SELECT "RF_1"."KEY" AS "KEY", CAST("RF_1"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "RF_1") "RFbig_esu"), 
"RF_avg" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM (SELECT "RF"."KEY" AS "KEY", avg(CAST("RF"."Estimator" AS BINARY_DOUBLE)) AS "Estimator" 
FROM "RF" GROUP BY "RF"."KEY") "T")
 SELECT "RF_avg"."KEY" AS "KEY", "RF_avg"."Estimator" AS "Estimator" 
FROM "RF_avg"