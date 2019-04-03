-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet
-- Dataset : boston
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE) AS "Feature_9", CAST("ADS"."Feature_10" AS DOUBLE) AS "Feature_10", CAST("ADS"."Feature_11" AS DOUBLE) AS "Feature_11", CAST("ADS"."Feature_12" AS DOUBLE) AS "Feature_12" 
FROM "BOSTON" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.1351813 * "IL"."Feature_0" + -0.02143762 * "IL"."Feature_1" + 0.09721068 * "IL"."Feature_2" + 0.009305186 * "IL"."Feature_3" + -0.01397769 * "IL"."Feature_4" + 0.03079222 * "IL"."Feature_5" + 0.2921661 * "IL"."Feature_6" + 0.01690945 * "IL"."Feature_7" + -0.05263157 * "IL"."Feature_8" + -0.09234688 * "IL"."Feature_9" + 0.0149016 * "IL"."Feature_10" + -0.7622842 * "IL"."Feature_11" + -0.2744261 * "IL"."Feature_12" + -0.006197264 AS "NEUR_1_1", 0.02014699 * "IL"."Feature_0" + 0.6179534 * "IL"."Feature_1" + -0.04437742 * "IL"."Feature_2" + -0.02284549 * "IL"."Feature_3" + 0.02935823 * "IL"."Feature_4" + 0.0417114 * "IL"."Feature_5" + 0.3148483 * "IL"."Feature_6" + -0.0003156307 * "IL"."Feature_7" + 0.04296511 * "IL"."Feature_8" + 0.5836911 * "IL"."Feature_9" + -0.01205411 * "IL"."Feature_10" + 1.84664 * "IL"."Feature_11" + -0.06593712 * "IL"."Feature_12" + -0.01935552 AS "NEUR_1_2", -2.374975 * "IL"."Feature_0" + -0.8546931 * "IL"."Feature_1" + -3.647563 * "IL"."Feature_2" + 1.413034 * "IL"."Feature_3" + 0.09119969 * "IL"."Feature_4" + 4.195611 * "IL"."Feature_5" + -3.182887 * "IL"."Feature_6" + -0.2243626 * "IL"."Feature_7" + 1.718077 * "IL"."Feature_8" + 0.2398923 * "IL"."Feature_9" + -1.300518 * "IL"."Feature_10" + 0.698918 * "IL"."Feature_11" + -4.869611 * "IL"."Feature_12" + 0.06881025 AS "NEUR_1_3", 0.01888981 * "IL"."Feature_0" + 0.003662139 * "IL"."Feature_1" + -0.02322489 * "IL"."Feature_2" + -0.01467577 * "IL"."Feature_3" + 0.02142798 * "IL"."Feature_4" + 0.0007741832 * "IL"."Feature_5" + 0.02803737 * "IL"."Feature_6" + -0.002163595 * "IL"."Feature_7" + 0.002987478 * "IL"."Feature_8" + -0.01827652 * "IL"."Feature_9" + 0.02442459 * "IL"."Feature_10" + 0.01183094 * "IL"."Feature_11" + -0.02884906 * "IL"."Feature_12" + -0.02338468 AS "NEUR_1_4", 0.02358981 * "IL"."Feature_0" + -0.01990417 * "IL"."Feature_1" + -0.02242251 * "IL"."Feature_2" + 0.02059028 * "IL"."Feature_3" + -0.0133024 * "IL"."Feature_4" + 0.0129734 * "IL"."Feature_5" + 0.03297099 * "IL"."Feature_6" + 0.001547034 * "IL"."Feature_7" + -0.002466041 * "IL"."Feature_8" + 0.05477244 * "IL"."Feature_9" + -0.01448132 * "IL"."Feature_10" + 0.01715995 * "IL"."Feature_11" + 0.008023614 * "IL"."Feature_12" + 0.01862126 AS "NEUR_1_5", 5.035675 * "IL"."Feature_0" + 2.355905 * "IL"."Feature_1" + 0.4689048 * "IL"."Feature_2" + 0.2765196 * "IL"."Feature_3" + 0.6269587 * "IL"."Feature_4" + -11.30414 * "IL"."Feature_5" + 1.467389 * "IL"."Feature_6" + -4.129247 * "IL"."Feature_7" + -6.571389 * "IL"."Feature_8" + -0.3437788 * "IL"."Feature_9" + 2.86081 * "IL"."Feature_10" + 0.6700416 * "IL"."Feature_11" + -16.89673 * "IL"."Feature_12" + -0.8161347 AS "NEUR_1_6", 0.01537435 * "IL"."Feature_0" + -0.02618181 * "IL"."Feature_1" + 0.006509641 * "IL"."Feature_2" + 0.01363565 * "IL"."Feature_3" + 0.01415559 * "IL"."Feature_4" + -0.01409141 * "IL"."Feature_5" + -0.002043709 * "IL"."Feature_6" + -0.02648619 * "IL"."Feature_7" + -0.0293079 * "IL"."Feature_8" + -0.03117244 * "IL"."Feature_9" + 0.03047694 * "IL"."Feature_10" + -0.02567456 * "IL"."Feature_11" + 0.0267888 * "IL"."Feature_12" + -0.002280895 AS "NEUR_1_7", 0.01669056 * "IL"."Feature_0" + -0.1003909 * "IL"."Feature_1" + -0.01991443 * "IL"."Feature_2" + -0.004837676 * "IL"."Feature_3" + -0.02259718 * "IL"."Feature_4" + -0.002960343 * "IL"."Feature_5" + -0.01003447 * "IL"."Feature_6" + 0.01271595 * "IL"."Feature_7" + -0.03429068 * "IL"."Feature_8" + -0.3009182 * "IL"."Feature_9" + -0.008404199 * "IL"."Feature_10" + -0.3531412 * "IL"."Feature_11" + -0.0291831 * "IL"."Feature_12" + -0.007238326 AS "NEUR_1_8", 2.15465 * "IL"."Feature_0" + 0.01552231 * "IL"."Feature_1" + 0.1678482 * "IL"."Feature_2" + 0.03521127 * "IL"."Feature_3" + 0.02174246 * "IL"."Feature_4" + -0.1915261 * "IL"."Feature_5" + 0.9150873 * "IL"."Feature_6" + 0.002452169 * "IL"."Feature_7" + -0.1322021 * "IL"."Feature_8" + -0.5427202 * "IL"."Feature_9" + 0.07356975 * "IL"."Feature_10" + 1.332741 * "IL"."Feature_11" + 0.1064475 * "IL"."Feature_12" + 0.02726335 AS "NEUR_1_9", -0.02484066 * "IL"."Feature_0" + -0.005304619 * "IL"."Feature_1" + 0.0165223 * "IL"."Feature_2" + -0.01725457 * "IL"."Feature_3" + 0.0207067 * "IL"."Feature_4" + 0.0339034 * "IL"."Feature_5" + 0.04781904 * "IL"."Feature_6" + 0.007237797 * "IL"."Feature_7" + 0.01695399 * "IL"."Feature_8" + 0.1043466 * "IL"."Feature_9" + 0.03200844 * "IL"."Feature_10" + 0.06177061 * "IL"."Feature_11" + 0.02454189 * "IL"."Feature_12" + 0.02169011 AS "NEUR_1_10", -0.01503247 * "IL"."Feature_0" + 0.006681374 * "IL"."Feature_1" + 0.03881411 * "IL"."Feature_2" + -0.03157174 * "IL"."Feature_3" + 0.007520752 * "IL"."Feature_4" + 0.0122862 * "IL"."Feature_5" + 0.1268908 * "IL"."Feature_6" + -0.009839361 * "IL"."Feature_7" + -0.01148733 * "IL"."Feature_8" + 0.5613739 * "IL"."Feature_9" + 0.02650241 * "IL"."Feature_10" + 0.5968301 * "IL"."Feature_11" + 0.03491617 * "IL"."Feature_12" + 0.007100828 AS "NEUR_1_11", 0.00592356 * "IL"."Feature_0" + 0.01220896 * "IL"."Feature_1" + -0.02539924 * "IL"."Feature_2" + 0.001335394 * "IL"."Feature_3" + 0.003454459 * "IL"."Feature_4" + -0.01316109 * "IL"."Feature_5" + 0.02215265 * "IL"."Feature_6" + -0.001631511 * "IL"."Feature_7" + -0.01144526 * "IL"."Feature_8" + 0.04978539 * "IL"."Feature_9" + -0.02748036 * "IL"."Feature_10" + 0.1343038 * "IL"."Feature_11" + -0.003273613 * "IL"."Feature_12" + -0.004381384 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -1.863313 * "HL_1_logistic_1"."NEUR_1_1" + -0.128194 * "HL_1_logistic_1"."NEUR_1_2" + 6.474053 * "HL_1_logistic_1"."NEUR_1_3" + 0.01813677 * "HL_1_logistic_1"."NEUR_1_4" + 2.335336 * "HL_1_logistic_1"."NEUR_1_5" + 6.416257 * "HL_1_logistic_1"."NEUR_1_6" + -0.0071284 * "HL_1_logistic_1"."NEUR_1_7" + 0.2763816 * "HL_1_logistic_1"."NEUR_1_8" + 3.612582 * "HL_1_logistic_1"."NEUR_1_9" + 2.345602 * "HL_1_logistic_1"."NEUR_1_10" + 2.496434 * "HL_1_logistic_1"."NEUR_1_11" + 2.313157 * "HL_1_logistic_1"."NEUR_1_12" + 2.594217 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"