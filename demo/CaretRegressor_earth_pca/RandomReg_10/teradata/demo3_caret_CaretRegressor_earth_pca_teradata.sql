-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth_pca
-- Dataset : RandomReg_10
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(0.166809472981374 AS DOUBLE PRECISION)) / CAST(1.03547567419981 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(-0.163512719944435 AS DOUBLE PRECISION)) / CAST(0.997837348711178 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(0.191492922410032 AS DOUBLE PRECISION)) / CAST(0.937995671493437 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(0.058384844753055 AS DOUBLE PRECISION)) / CAST(1.092422041481253 AS DOUBLE PRECISION) AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(-0.099332051621223 AS DOUBLE PRECISION)) / CAST(1.081168997121092 AS DOUBLE PRECISION) AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(0.21293121660488 AS DOUBLE PRECISION)) / CAST(0.941711644634202 AS DOUBLE PRECISION) AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(0.04786556869003 AS DOUBLE PRECISION)) / CAST(1.143526927559765 AS DOUBLE PRECISION) AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(0.050786989590842 AS DOUBLE PRECISION)) / CAST(0.978681742185858 AS DOUBLE PRECISION) AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(-0.191319922590819 AS DOUBLE PRECISION)) / CAST(1.148800046927508 AS DOUBLE PRECISION) AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(0.199404056774734 AS DOUBLE PRECISION)) / CAST(0.887811956124007 AS DOUBLE PRECISION) AS "Feature_9" 
FROM "RandomReg_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(0.145684144765775 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.010523261114797 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.069148601342093 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.395081446850409 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.565378850867802 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.423497863649134 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.133473917314213 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.507359731057423 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.176818819154519 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.110890705622054 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.286067293716033 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.141622422394932 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.212847609341725 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.257068174580166 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.225055175184555 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.015684732467483 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.572513626472278 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.088202081234787 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.36055223660901 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.519880009321609 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(0.339385906080871 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.470620494618064 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.468223718996961 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.248736600119557 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.309558438932034 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.275980762744694 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.387858743222817 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.171314096149579 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.0413326560183 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.16954966329101 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(0.384991256082771 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.489240707252605 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.452507033674484 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.114461634683362 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.082285897936018 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.058352057584197 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.131934851549488 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.27479424717018 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.535971424967745 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.064816652419735 AS DOUBLE PRECISION) AS "PC4", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.424131805951354 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.129042023281614 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.437544286093195 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.35348581616011 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.140972957461332 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.532079322316014 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.150274308366173 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.030789353356622 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.206098081444698 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.343619836020491 AS DOUBLE PRECISION) AS "PC5", "ADS_sca_1_OUT"."Feature_0" * CAST(0.169940111098282 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.334840719077651 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.104716289286998 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.554101329974212 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.14490660804803 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.261230387227612 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.065795994094319 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.45826345265723 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.405838048142092 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.269685001249971 AS DOUBLE PRECISION) AS "PC6", "ADS_sca_1_OUT"."Feature_0" * CAST(0.437034730034142 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.300481491370081 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.299425924373114 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.041488290602702 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.238639906695168 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.346857540129524 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.088682212050158 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.35236441046927 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.138699549746685 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.546637375078386 AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_sca_1_OUT"), 
earth_input AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE PRECISION) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE PRECISION) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE PRECISION) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE PRECISION) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE PRECISION) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE PRECISION) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", CAST(125.27856942159798 AS DOUBLE PRECISION) * greatest(earth_input."PC5" - CAST(-0.400524996069624 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-111.9437121336165 AS DOUBLE PRECISION) * greatest(CAST(-0.400524996069624 AS DOUBLE PRECISION) - earth_input."PC5", CAST(0 AS DOUBLE PRECISION)) + CAST(88.63483256575974 AS DOUBLE PRECISION) * greatest(earth_input."PC3" - CAST(-0.216773250300855 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-103.20324686281369 AS DOUBLE PRECISION) * greatest(CAST(-0.216773250300855 AS DOUBLE PRECISION) - earth_input."PC3", CAST(0 AS DOUBLE PRECISION)) + CAST(84.42316523841586 AS DOUBLE PRECISION) * greatest(earth_input."PC7" - CAST(-0.737864235157231 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-75.39829735529638 AS DOUBLE PRECISION) * greatest(CAST(-0.737864235157231 AS DOUBLE PRECISION) - earth_input."PC7", CAST(0 AS DOUBLE PRECISION)) + CAST(-75.73629395618771 AS DOUBLE PRECISION) * greatest(earth_input."PC2" - CAST(-0.604948194852074 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(55.33828446831361 AS DOUBLE PRECISION) * greatest(CAST(-0.604948194852074 AS DOUBLE PRECISION) - earth_input."PC2", CAST(0 AS DOUBLE PRECISION)) + CAST(63.33063067322757 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.980847714792583 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-64.99783764836225 AS DOUBLE PRECISION) * greatest(CAST(-0.980847714792583 AS DOUBLE PRECISION) - earth_input."PC1", CAST(0 AS DOUBLE PRECISION)) + CAST(22.648370510585043 AS DOUBLE PRECISION) * greatest(CAST(1.101807151705725 AS DOUBLE PRECISION) - earth_input."PC4", CAST(0 AS DOUBLE PRECISION)) + CAST(-142.9599839166683 AS DOUBLE PRECISION) AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte