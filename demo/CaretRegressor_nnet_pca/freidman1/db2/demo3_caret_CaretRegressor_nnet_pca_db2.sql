-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : freidman1
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM "FREIDMAN1" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.01078044206398687 + "ADS_sca_1_OUT"."Feature_1" * 0.20275672425035265 + "ADS_sca_1_OUT"."Feature_2" * -0.3032095959115069 + "ADS_sca_1_OUT"."Feature_3" * 0.28036946451509137 + "ADS_sca_1_OUT"."Feature_4" * -0.456472170133784 + "ADS_sca_1_OUT"."Feature_5" * 0.36405052299186 + "ADS_sca_1_OUT"."Feature_6" * -0.4779398415021841 + "ADS_sca_1_OUT"."Feature_7" * -0.2499537237134235 + "ADS_sca_1_OUT"."Feature_8" * -0.08553249751289721 + "ADS_sca_1_OUT"."Feature_9" * -0.38614972165398104 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.2486501060343723 + "ADS_sca_1_OUT"."Feature_1" * 0.18538688464371286 + "ADS_sca_1_OUT"."Feature_2" * -0.2340911061275425 + "ADS_sca_1_OUT"."Feature_3" * -0.5312215967757172 + "ADS_sca_1_OUT"."Feature_4" * -0.034157117099708666 + "ADS_sca_1_OUT"."Feature_5" * -0.11403009160110295 + "ADS_sca_1_OUT"."Feature_6" * 0.03913846092020175 + "ADS_sca_1_OUT"."Feature_7" * -0.3193281863661248 + "ADS_sca_1_OUT"."Feature_8" * 0.6497321497824414 + "ADS_sca_1_OUT"."Feature_9" * -0.16427431415508242 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.529444486853135 + "ADS_sca_1_OUT"."Feature_1" * -0.042432305775754416 + "ADS_sca_1_OUT"."Feature_2" * -0.467456082445249 + "ADS_sca_1_OUT"."Feature_3" * -0.12113349070226218 + "ADS_sca_1_OUT"."Feature_4" * 0.3516615435966041 + "ADS_sca_1_OUT"."Feature_5" * 0.05456396920784263 + "ADS_sca_1_OUT"."Feature_6" * -0.0169721401066592 + "ADS_sca_1_OUT"."Feature_7" * 0.44796273797836184 + "ADS_sca_1_OUT"."Feature_8" * 0.09951231655089274 + "ADS_sca_1_OUT"."Feature_9" * -0.3836601176822301 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.18967062357660877 + "ADS_sca_1_OUT"."Feature_1" * -0.6739997429415825 + "ADS_sca_1_OUT"."Feature_2" * -0.05142756480300252 + "ADS_sca_1_OUT"."Feature_3" * -0.4240887569157897 + "ADS_sca_1_OUT"."Feature_4" * -0.1753617554170441 + "ADS_sca_1_OUT"."Feature_5" * -0.23730999119190946 + "ADS_sca_1_OUT"."Feature_6" * -0.3492917073303225 + "ADS_sca_1_OUT"."Feature_7" * -0.24015917199949824 + "ADS_sca_1_OUT"."Feature_8" * -0.24578721855897134 + "ADS_sca_1_OUT"."Feature_9" * 0.009647497508173676 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.22360120393586685 + "ADS_sca_1_OUT"."Feature_1" * -0.27882706563202 + "ADS_sca_1_OUT"."Feature_2" * 0.3325159145316829 + "ADS_sca_1_OUT"."Feature_3" * 0.03231293124673378 + "ADS_sca_1_OUT"."Feature_4" * 0.31176328828301664 + "ADS_sca_1_OUT"."Feature_5" * 0.5846343873278481 + "ADS_sca_1_OUT"."Feature_6" * 0.2256344434749018 + "ADS_sca_1_OUT"."Feature_7" * -0.4544239404125063 + "ADS_sca_1_OUT"."Feature_8" * 0.13999262235747426 + "ADS_sca_1_OUT"."Feature_9" * -0.21128970950531886 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.3346351973554642 + "ADS_sca_1_OUT"."Feature_1" * 0.0673786411182812 + "ADS_sca_1_OUT"."Feature_2" * 0.2578168786971707 + "ADS_sca_1_OUT"."Feature_3" * 0.1264276445937259 + "ADS_sca_1_OUT"."Feature_4" * -0.40729831882959366 + "ADS_sca_1_OUT"."Feature_5" * -0.455689833219327 + "ADS_sca_1_OUT"."Feature_6" * 0.4311593109248494 + "ADS_sca_1_OUT"."Feature_7" * -0.10623939522740035 + "ADS_sca_1_OUT"."Feature_8" * 0.004192902519120928 + "ADS_sca_1_OUT"."Feature_9" * -0.4798729265184412 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.5345631681819778 + "ADS_sca_1_OUT"."Feature_1" * 0.2916209104051029 + "ADS_sca_1_OUT"."Feature_2" * 0.4273963159452305 + "ADS_sca_1_OUT"."Feature_3" * -0.2195301363042834 + "ADS_sca_1_OUT"."Feature_4" * -0.235065733216965 + "ADS_sca_1_OUT"."Feature_5" * 0.1295961010443568 + "ADS_sca_1_OUT"."Feature_6" * -0.3373404838354823 + "ADS_sca_1_OUT"."Feature_7" * 0.1550843553371763 + "ADS_sca_1_OUT"."Feature_8" * 0.2854751024551945 + "ADS_sca_1_OUT"."Feature_9" * 0.3270191591377724 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -1.38818 * "IL"."PC1" + 1.320619 * "IL"."PC2" + 1.613219 * "IL"."PC3" + -2.621459 * "IL"."PC4" + -4.15033 * "IL"."PC5" + -7.503219 * "IL"."PC6" + 2.420589 * "IL"."PC7" + -2.51368 AS "NEUR_1_1", -3.305104 * "IL"."PC1" + 3.273925 * "IL"."PC2" + 2.855636 * "IL"."PC3" + -1.439087 * "IL"."PC4" + -0.3842821 * "IL"."PC5" + -2.402861 * "IL"."PC6" + 10.57827 * "IL"."PC7" + 2.283554 AS "NEUR_1_2", 4.433946 * "IL"."PC1" + -3.262745 * "IL"."PC2" + 7.916662 * "IL"."PC3" + -10.78212 * "IL"."PC4" + -0.2906378 * "IL"."PC5" + -5.493145 * "IL"."PC6" + -1.403054 * "IL"."PC7" + 5.619753 AS "NEUR_1_3", 10.38136 * "IL"."PC1" + 2.202154 * "IL"."PC2" + -1.856463 * "IL"."PC3" + 4.326226 * "IL"."PC4" + 5.909885 * "IL"."PC5" + -0.3516871 * "IL"."PC6" + -1.560501 * "IL"."PC7" + -2.186918 AS "NEUR_1_4", -4.05267 * "IL"."PC1" + -4.251279 * "IL"."PC2" + 2.776565 * "IL"."PC3" + -6.000405 * "IL"."PC4" + 2.17744 * "IL"."PC5" + -13.73165 * "IL"."PC6" + -3.144635 * "IL"."PC7" + -1.963308 AS "NEUR_1_5", -16.43161 * "IL"."PC1" + 0.04735324 * "IL"."PC2" + 0.05580523 * "IL"."PC3" + -1.247186 * "IL"."PC4" + -8.531786 * "IL"."PC5" + 5.145749 * "IL"."PC6" + 1.612149 * "IL"."PC7" + 6.421798 AS "NEUR_1_6", -4.955881 * "IL"."PC1" + -0.469585 * "IL"."PC2" + 2.786806 * "IL"."PC3" + 3.467541 * "IL"."PC4" + -6.598046 * "IL"."PC5" + 0.791339 * "IL"."PC6" + -4.336247 * "IL"."PC7" + -3.461526 AS "NEUR_1_7", 4.574201 * "IL"."PC1" + -6.558103 * "IL"."PC2" + 1.715031 * "IL"."PC3" + 1.707458 * "IL"."PC4" + 5.129017 * "IL"."PC5" + 1.612495 * "IL"."PC6" + 4.802894 * "IL"."PC7" + -6.616124 AS "NEUR_1_8", 4.90537 * "IL"."PC1" + -0.2818602 * "IL"."PC2" + 2.366352 * "IL"."PC3" + 8.639039 * "IL"."PC4" + -6.362813 * "IL"."PC5" + -2.995219 * "IL"."PC6" + -9.157335 * "IL"."PC7" + -1.967224 AS "NEUR_1_9", 2.11696 * "IL"."PC1" + -1.701608 * "IL"."PC2" + -4.773989 * "IL"."PC3" + 0.08549247 * "IL"."PC4" + 2.724559 * "IL"."PC5" + 10.64002 * "IL"."PC6" + -6.119164 * "IL"."PC7" + 1.662514 AS "NEUR_1_10", 1.152062 * "IL"."PC1" + 2.147258 * "IL"."PC2" + 6.650008 * "IL"."PC3" + 3.867633 * "IL"."PC4" + -4.1637 * "IL"."PC5" + -7.066435 * "IL"."PC6" + -2.544227 * "IL"."PC7" + -2.607971 AS "NEUR_1_11", 7.910656 * "IL"."PC1" + -0.3208843 * "IL"."PC2" + -3.056667 * "IL"."PC3" + -11.36157 * "IL"."PC4" + -0.8342136 * "IL"."PC5" + 6.577535 * "IL"."PC6" + 4.876686 * "IL"."PC7" + -1.935967 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 3.087567 * "HL_1_logistic_1"."NEUR_1_1" + 5.946668 * "HL_1_logistic_1"."NEUR_1_2" + 7.808159 * "HL_1_logistic_1"."NEUR_1_3" + 5.509357 * "HL_1_logistic_1"."NEUR_1_4" + 6.847678 * "HL_1_logistic_1"."NEUR_1_5" + 7.086572 * "HL_1_logistic_1"."NEUR_1_6" + 4.677018 * "HL_1_logistic_1"."NEUR_1_7" + 6.406751 * "HL_1_logistic_1"."NEUR_1_8" + -1.274837 * "HL_1_logistic_1"."NEUR_1_9" + 9.638248 * "HL_1_logistic_1"."NEUR_1_10" + 4.871414 * "HL_1_logistic_1"."NEUR_1_11" + 6.713556 * "HL_1_logistic_1"."NEUR_1_12" + -17.81222 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"