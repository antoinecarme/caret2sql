-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : BreastCancer
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9", CAST("ADS"."Feature_10" AS FLOAT) AS "Feature_10", CAST("ADS"."Feature_11" AS FLOAT) AS "Feature_11", CAST("ADS"."Feature_12" AS FLOAT) AS "Feature_12", CAST("ADS"."Feature_13" AS FLOAT) AS "Feature_13", CAST("ADS"."Feature_14" AS FLOAT) AS "Feature_14", CAST("ADS"."Feature_15" AS FLOAT) AS "Feature_15", CAST("ADS"."Feature_16" AS FLOAT) AS "Feature_16", CAST("ADS"."Feature_17" AS FLOAT) AS "Feature_17", CAST("ADS"."Feature_18" AS FLOAT) AS "Feature_18", CAST("ADS"."Feature_19" AS FLOAT) AS "Feature_19", CAST("ADS"."Feature_20" AS FLOAT) AS "Feature_20", CAST("ADS"."Feature_21" AS FLOAT) AS "Feature_21", CAST("ADS"."Feature_22" AS FLOAT) AS "Feature_22", CAST("ADS"."Feature_23" AS FLOAT) AS "Feature_23", CAST("ADS"."Feature_24" AS FLOAT) AS "Feature_24", CAST("ADS"."Feature_25" AS FLOAT) AS "Feature_25", CAST("ADS"."Feature_26" AS FLOAT) AS "Feature_26", CAST("ADS"."Feature_27" AS FLOAT) AS "Feature_27", CAST("ADS"."Feature_28" AS FLOAT) AS "Feature_28", CAST("ADS"."Feature_29" AS FLOAT) AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -3.760762 * "IL"."Feature_0" + -0.1885735 * "IL"."Feature_1" + 0.4221002 * "IL"."Feature_2" + -0.01339648 * "IL"."Feature_3" + 0.3896819 * "IL"."Feature_4" + 0.9156871 * "IL"."Feature_5" + 1.223192 * "IL"."Feature_6" + 0.8471242 * "IL"."Feature_7" + 0.6638217 * "IL"."Feature_8" + 0.02910383 * "IL"."Feature_9" + 0.1815564 * "IL"."Feature_10" + -0.8952554 * "IL"."Feature_11" + -0.9073684 * "IL"."Feature_12" + 0.06222003 * "IL"."Feature_13" + 0.04639307 * "IL"."Feature_14" + -0.1862236 * "IL"."Feature_15" + -0.1364197 * "IL"."Feature_16" + 0.0885616 * "IL"."Feature_17" + 0.1958454 * "IL"."Feature_18" + -0.0401593 * "IL"."Feature_19" + -0.6149919 * "IL"."Feature_20" + 0.2855832 * "IL"."Feature_21" + 0.04653843 * "IL"."Feature_22" + 0.02841855 * "IL"."Feature_23" + 0.7147849 * "IL"."Feature_24" + 1.458425 * "IL"."Feature_25" + 1.923669 * "IL"."Feature_26" + 1.588492 * "IL"."Feature_27" + 1.843552 * "IL"."Feature_28" + 0.0599002 * "IL"."Feature_29" + -0.8467398 AS "NEUR_1_1", 0.0005756353 * "IL"."Feature_0" + 0.001221362 * "IL"."Feature_1" + 0.003658016 * "IL"."Feature_2" + 0.01409643 * "IL"."Feature_3" + 7.74029e-06 * "IL"."Feature_4" + 6.328648e-06 * "IL"."Feature_5" + 4.315551e-06 * "IL"."Feature_6" + 1.330958e-06 * "IL"."Feature_7" + 1.395926e-05 * "IL"."Feature_8" + 5.745539e-06 * "IL"."Feature_9" + 1.758593e-05 * "IL"."Feature_10" + 0.0001042989 * "IL"."Feature_11" + 0.0001202758 * "IL"."Feature_12" + 0.0009113652 * "IL"."Feature_13" + 3.253073e-07 * "IL"."Feature_14" + 2.266092e-06 * "IL"."Feature_15" + 3.907755e-06 * "IL"."Feature_16" + 8.629101e-07 * "IL"."Feature_17" + 2.109183e-06 * "IL"."Feature_18" + -5.654288e-08 * "IL"."Feature_19" + 0.0006415873 * "IL"."Feature_20" + 0.001626085 * "IL"."Feature_21" + 0.004096491 * "IL"."Feature_22" + 0.01749063 * "IL"."Feature_23" + 1.105264e-05 * "IL"."Feature_24" + 1.470215e-05 * "IL"."Feature_25" + 1.580889e-05 * "IL"."Feature_26" + 3.080195e-06 * "IL"."Feature_27" + 2.107038e-05 * "IL"."Feature_28" + 7.045711e-06 * "IL"."Feature_29" + 7.135648e-05 AS "NEUR_1_2", 0.0005783486 * "IL"."Feature_0" + 0.001230522 * "IL"."Feature_1" + 0.003673953 * "IL"."Feature_2" + 0.01408557 * "IL"."Feature_3" + 7.767848e-06 * "IL"."Feature_4" + 7.08427e-06 * "IL"."Feature_5" + 4.181998e-06 * "IL"."Feature_6" + 6.803453e-07 * "IL"."Feature_7" + 1.421207e-05 * "IL"."Feature_8" + 4.9938e-06 * "IL"."Feature_9" + 1.754368e-05 * "IL"."Feature_10" + 0.0001049704 * "IL"."Feature_11" + 0.0001204203 * "IL"."Feature_12" + 0.0009159937 * "IL"."Feature_13" + 1.042238e-06 * "IL"."Feature_14" + 2.490984e-06 * "IL"."Feature_15" + 3.805198e-06 * "IL"."Feature_16" + 4.461372e-07 * "IL"."Feature_17" + 2.363564e-06 * "IL"."Feature_18" + 5.718136e-07 * "IL"."Feature_19" + 0.0006445627 * "IL"."Feature_20" + 0.001640826 * "IL"."Feature_21" + 0.004115418 * "IL"."Feature_22" + 0.01750467 * "IL"."Feature_23" + 1.068395e-05 * "IL"."Feature_24" + 1.506289e-05 * "IL"."Feature_25" + 1.592076e-05 * "IL"."Feature_26" + 3.303118e-06 * "IL"."Feature_27" + 2.115673e-05 * "IL"."Feature_28" + 7.315397e-06 * "IL"."Feature_29" + 7.197055e-05 AS "NEUR_1_3", 0.5248041 * "IL"."Feature_0" + -0.09084984 * "IL"."Feature_1" + 2.235849 * "IL"."Feature_2" + -0.3157916 * "IL"."Feature_3" + -0.006779386 * "IL"."Feature_4" + -0.01807738 * "IL"."Feature_5" + -0.0210304 * "IL"."Feature_6" + -0.06368093 * "IL"."Feature_7" + 0.04662067 * "IL"."Feature_8" + 0.002191463 * "IL"."Feature_9" + -0.05101132 * "IL"."Feature_10" + 0.2404817 * "IL"."Feature_11" + -1.068625 * "IL"."Feature_12" + -0.6709594 * "IL"."Feature_13" + -0.002265161 * "IL"."Feature_14" + 0.02034477 * "IL"."Feature_15" + 0.044558 * "IL"."Feature_16" + -0.00759801 * "IL"."Feature_17" + -0.007584377 * "IL"."Feature_18" + 0.007806072 * "IL"."Feature_19" + 0.4038981 * "IL"."Feature_20" + -0.3054318 * "IL"."Feature_21" + -0.9982913 * "IL"."Feature_22" + 0.1534632 * "IL"."Feature_23" + -0.01278317 * "IL"."Feature_24" + 0.005295333 * "IL"."Feature_25" + -0.04405881 * "IL"."Feature_26" + -0.1150766 * "IL"."Feature_27" + -0.01950299 * "IL"."Feature_28" + 0.01726019 * "IL"."Feature_29" + 0.07733912 AS "NEUR_1_4", 0.0005812701 * "IL"."Feature_0" + 0.001237863 * "IL"."Feature_1" + 0.003688289 * "IL"."Feature_2" + 0.01409992 * "IL"."Feature_3" + 7.989241e-06 * "IL"."Feature_4" + 6.66329e-06 * "IL"."Feature_5" + 4.573523e-06 * "IL"."Feature_6" + 5.493788e-07 * "IL"."Feature_7" + 1.418396e-05 * "IL"."Feature_8" + 5.829671e-06 * "IL"."Feature_9" + 1.749024e-05 * "IL"."Feature_10" + 0.0001061198 * "IL"."Feature_11" + 0.0001214925 * "IL"."Feature_12" + 0.0009156735 * "IL"."Feature_13" + 1.059168e-06 * "IL"."Feature_14" + 2.663383e-06 * "IL"."Feature_15" + 4.084105e-06 * "IL"."Feature_16" + 7.03055e-07 * "IL"."Feature_17" + 1.741463e-06 * "IL"."Feature_18" + 4.431096e-07 * "IL"."Feature_19" + 0.0006478109 * "IL"."Feature_20" + 0.001652071 * "IL"."Feature_21" + 0.004132482 * "IL"."Feature_22" + 0.01752947 * "IL"."Feature_23" + 1.136528e-05 * "IL"."Feature_24" + 1.532805e-05 * "IL"."Feature_25" + 1.580828e-05 * "IL"."Feature_26" + 2.643652e-06 * "IL"."Feature_27" + 2.221913e-05 * "IL"."Feature_28" + 7.341003e-06 * "IL"."Feature_29" + 7.211979e-05 AS "NEUR_1_5" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -8.95414 * "HL_1_logistic_1"."NEUR_1_1" + 0.2650503 * "HL_1_logistic_1"."NEUR_1_2" + 0.2650225 * "HL_1_logistic_1"."NEUR_1_3" + 4.141118 * "HL_1_logistic_1"."NEUR_1_4" + 0.2650208 * "HL_1_logistic_1"."NEUR_1_5" + 0.2652944 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"