-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmPoly
-- Dataset : freidman3
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman3 AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.127823077965849 AS DOUBLE PRECISION) AS sv_0, CAST(-0.85039710263472 AS DOUBLE PRECISION) AS sv_1, CAST(-1.685990423727846 AS DOUBLE PRECISION) AS sv_2, CAST(-0.50508953265743 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 1 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.211527295847955 AS DOUBLE PRECISION) AS sv_0, CAST(-1.744443967752591 AS DOUBLE PRECISION) AS sv_1, CAST(0.400439788412483 AS DOUBLE PRECISION) AS sv_2, CAST(-1.280761716963789 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 2 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.260650551741912 AS DOUBLE PRECISION) AS sv_0, CAST(-1.149185771360461 AS DOUBLE PRECISION) AS sv_1, CAST(-1.460611402459679 AS DOUBLE PRECISION) AS sv_2, CAST(-1.052479326928032 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 3 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.327108398067466 AS DOUBLE PRECISION) AS sv_0, CAST(-0.968155214484887 AS DOUBLE PRECISION) AS sv_1, CAST(-0.369317532892153 AS DOUBLE PRECISION) AS sv_2, CAST(0.776208279382256 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 4 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.477576202804345 AS DOUBLE PRECISION) AS sv_0, CAST(-0.92712648675959 AS DOUBLE PRECISION) AS sv_1, CAST(0.009704247466633 AS DOUBLE PRECISION) AS sv_2, CAST(-0.437533507080074 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 5 AS sv_idx, CAST(-0.468698347011486 AS DOUBLE PRECISION) AS dual_coeff, CAST(2.14410621947036 AS DOUBLE PRECISION) AS sv_0, CAST(-1.5860201052989 AS DOUBLE PRECISION) AS sv_1, CAST(0.887640633884356 AS DOUBLE PRECISION) AS sv_2, CAST(-1.40273073405092 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 6 AS sv_idx, CAST(-0.109955015854893 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.431247163318032 AS DOUBLE PRECISION) AS sv_0, CAST(0.54633105906536 AS DOUBLE PRECISION) AS sv_1, CAST(0.934906650923215 AS DOUBLE PRECISION) AS sv_2, CAST(-0.20997937151656 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 7 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.729796694085564 AS DOUBLE PRECISION) AS sv_0, CAST(-1.054625713071719 AS DOUBLE PRECISION) AS sv_1, CAST(-1.632421380038048 AS DOUBLE PRECISION) AS sv_2, CAST(1.275849111161276 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 8 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.184118784239312 AS DOUBLE PRECISION) AS sv_0, CAST(0.467001797845624 AS DOUBLE PRECISION) AS sv_1, CAST(-1.772097358946462 AS DOUBLE PRECISION) AS sv_2, CAST(0.207226855298809 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 9 AS sv_idx, CAST(0.959383981806732 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.682675423331494 AS DOUBLE PRECISION) AS sv_0, CAST(-0.27216796886073 AS DOUBLE PRECISION) AS sv_1, CAST(-1.161707552508324 AS DOUBLE PRECISION) AS sv_2, CAST(0.755298589822004 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 10 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.123564214652782 AS DOUBLE PRECISION) AS sv_0, CAST(1.683196219737227 AS DOUBLE PRECISION) AS sv_1, CAST(-1.798502064527232 AS DOUBLE PRECISION) AS sv_2, CAST(-0.847766317208208 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 11 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.666780058145855 AS DOUBLE PRECISION) AS sv_0, CAST(-0.618310166203302 AS DOUBLE PRECISION) AS sv_1, CAST(-0.781014997181637 AS DOUBLE PRECISION) AS sv_2, CAST(-0.767384669273583 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 12 AS sv_idx, CAST(0.063846211942006 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.459380216158906 AS DOUBLE PRECISION) AS sv_0, CAST(0.701837814951955 AS DOUBLE PRECISION) AS sv_1, CAST(-0.910113184073057 AS DOUBLE PRECISION) AS sv_2, CAST(-1.275421036743904 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 13 AS sv_idx, CAST(0.877716666885219 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.134073630731939 AS DOUBLE PRECISION) AS sv_0, CAST(-1.248476698654769 AS DOUBLE PRECISION) AS sv_1, CAST(1.594715839047914 AS DOUBLE PRECISION) AS sv_2, CAST(-1.449721268940829 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 14 AS sv_idx, CAST(-0.076159469467834 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.641122048419644 AS DOUBLE PRECISION) AS sv_0, CAST(1.128151001855874 AS DOUBLE PRECISION) AS sv_1, CAST(0.266937404740246 AS DOUBLE PRECISION) AS sv_2, CAST(-1.229882689514642 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 15 AS sv_idx, CAST(-0.24905096163173 AS DOUBLE PRECISION) AS dual_coeff, CAST(2.010032312501274 AS DOUBLE PRECISION) AS sv_0, CAST(0.095308619301291 AS DOUBLE PRECISION) AS sv_1, CAST(-1.191367171057036 AS DOUBLE PRECISION) AS sv_2, CAST(-1.618815287158773 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 16 AS sv_idx, CAST(-0.154596162615173 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.994693835221938 AS DOUBLE PRECISION) AS sv_0, CAST(1.492696939628282 AS DOUBLE PRECISION) AS sv_1, CAST(-0.346983890811719 AS DOUBLE PRECISION) AS sv_2, CAST(0.428215727414378 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 17 AS sv_idx, CAST(0.431338317771402 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.17431668183365 AS DOUBLE PRECISION) AS sv_0, CAST(1.150101745058788 AS DOUBLE PRECISION) AS sv_1, CAST(1.536384271186821 AS DOUBLE PRECISION) AS sv_2, CAST(1.551694080146041 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 18 AS sv_idx, CAST(0.482270528555857 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.481776580102251 AS DOUBLE PRECISION) AS sv_0, CAST(-1.271168616237998 AS DOUBLE PRECISION) AS sv_1, CAST(1.063228196770656 AS DOUBLE PRECISION) AS sv_2, CAST(1.196666997079253 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 19 AS sv_idx, CAST(-0.022276976286141 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.214069794395931 AS DOUBLE PRECISION) AS sv_0, CAST(-1.51180550591746 AS DOUBLE PRECISION) AS sv_1, CAST(-0.401528196386498 AS DOUBLE PRECISION) AS sv_2, CAST(-0.039017517211155 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 20 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.086438429098235 AS DOUBLE PRECISION) AS sv_0, CAST(-1.648327194998381 AS DOUBLE PRECISION) AS sv_1, CAST(0.614407865565616 AS DOUBLE PRECISION) AS sv_2, CAST(1.122900377956353 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 21 AS sv_idx, CAST(0.57440874383385 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.097053723190519 AS DOUBLE PRECISION) AS sv_0, CAST(-1.163796140073729 AS DOUBLE PRECISION) AS sv_1, CAST(0.13686107206554 AS DOUBLE PRECISION) AS sv_2, CAST(0.269669398010651 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 22 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.500018505630981 AS DOUBLE PRECISION) AS sv_0, CAST(0.674837376510542 AS DOUBLE PRECISION) AS sv_1, CAST(-0.922097063170456 AS DOUBLE PRECISION) AS sv_2, CAST(-0.088312402843911 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 23 AS sv_idx, CAST(0.922553020908834 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.216449797943872 AS DOUBLE PRECISION) AS sv_0, CAST(1.503310417535894 AS DOUBLE PRECISION) AS sv_1, CAST(-1.665981445490253 AS DOUBLE PRECISION) AS sv_2, CAST(-1.345633350957559 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 24 AS sv_idx, CAST(-0.018959931838042 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.65853839397246 AS DOUBLE PRECISION) AS sv_0, CAST(0.473471367917654 AS DOUBLE PRECISION) AS sv_1, CAST(0.180313797707367 AS DOUBLE PRECISION) AS sv_2, CAST(-1.168839753970359 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 25 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.026534443072215 AS DOUBLE PRECISION) AS sv_0, CAST(-0.028363124813453 AS DOUBLE PRECISION) AS sv_1, CAST(-0.739570601711903 AS DOUBLE PRECISION) AS sv_2, CAST(0.160828091241362 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 26 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.344519300712666 AS DOUBLE PRECISION) AS sv_0, CAST(0.476367891619324 AS DOUBLE PRECISION) AS sv_1, CAST(-1.081417129445332 AS DOUBLE PRECISION) AS sv_2, CAST(1.417474793792274 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 27 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.248222153817392 AS DOUBLE PRECISION) AS sv_0, CAST(-1.563630716242603 AS DOUBLE PRECISION) AS sv_1, CAST(0.801919778196063 AS DOUBLE PRECISION) AS sv_2, CAST(0.184772730301279 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 28 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.084293317125027 AS DOUBLE PRECISION) AS sv_0, CAST(-1.099931975985623 AS DOUBLE PRECISION) AS sv_1, CAST(-1.476101701539049 AS DOUBLE PRECISION) AS sv_2, CAST(-1.182946909589982 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 29 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.614096613514804 AS DOUBLE PRECISION) AS sv_0, CAST(-1.764376827812854 AS DOUBLE PRECISION) AS sv_1, CAST(-0.652695169540566 AS DOUBLE PRECISION) AS sv_2, CAST(1.187810398070241 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 30 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.060302734572621 AS DOUBLE PRECISION) AS sv_0, CAST(-0.747728711919708 AS DOUBLE PRECISION) AS sv_1, CAST(-1.618649329043049 AS DOUBLE PRECISION) AS sv_2, CAST(1.269578499591205 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 31 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.306038787142802 AS DOUBLE PRECISION) AS sv_0, CAST(0.226622368303475 AS DOUBLE PRECISION) AS sv_1, CAST(0.303783926567354 AS DOUBLE PRECISION) AS sv_2, CAST(0.705729027619607 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 32 AS sv_idx, CAST(-0.884893557986706 AS DOUBLE PRECISION) AS dual_coeff, CAST(-1.56064164403535 AS DOUBLE PRECISION) AS sv_0, CAST(0.305617549195176 AS DOUBLE PRECISION) AS sv_1, CAST(-0.341654714080915 AS DOUBLE PRECISION) AS sv_2, CAST(1.267260079062927 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 33 AS sv_idx, CAST(-0.42581471379159 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.75577554800642 AS DOUBLE PRECISION) AS sv_0, CAST(0.962684681824095 AS DOUBLE PRECISION) AS sv_1, CAST(1.086993007604243 AS DOUBLE PRECISION) AS sv_2, CAST(1.037920008892085 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 34 AS sv_idx, CAST(0.098887664779693 AS DOUBLE PRECISION) AS dual_coeff, CAST(1.306965932719284 AS DOUBLE PRECISION) AS sv_0, CAST(0.186301069149551 AS DOUBLE PRECISION) AS sv_1, CAST(1.511344217269608 AS DOUBLE PRECISION) AS sv_2, CAST(-1.58765873047892 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 35 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(0.166136213344908 AS DOUBLE PRECISION) AS sv_0, CAST(-0.398192200197178 AS DOUBLE PRECISION) AS sv_1, CAST(-0.765427273123951 AS DOUBLE PRECISION) AS sv_2, CAST(-1.613326333352949 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 36 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.917278251770317 AS DOUBLE PRECISION) AS sv_0, CAST(-1.450903531910756 AS DOUBLE PRECISION) AS sv_1, CAST(-0.278639083353421 AS DOUBLE PRECISION) AS sv_2, CAST(-1.382799389715493 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 37 AS sv_idx, CAST(-1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.379139513858032 AS DOUBLE PRECISION) AS sv_0, CAST(0.212564010166853 AS DOUBLE PRECISION) AS sv_1, CAST(0.751116144040438 AS DOUBLE PRECISION) AS sv_2, CAST(-1.558039368209904 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte UNION ALL SELECT 38 AS sv_idx, CAST(1.0 AS DOUBLE PRECISION) AS dual_coeff, CAST(-0.983380385417142 AS DOUBLE PRECISION) AS sv_0, CAST(-0.182352205977729 AS DOUBLE PRECISION) AS sv_1, CAST(-1.468545993196044 AS DOUBLE PRECISION) AS sv_2, CAST(0.212950538876786 AS DOUBLE PRECISION) AS sv_3 
FROM dummy_cte) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + CAST(0.44032260879547 AS DOUBLE PRECISION) AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * power(CAST(0.1 AS DOUBLE PRECISION) * (kernel_input_with_scaling."Feature_0" * "SV_data".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data".sv_3) + CAST(1.0 AS DOUBLE PRECISION), 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", CAST(1.361234203025919 AS DOUBLE PRECISION) + CAST(0.274041235889213 AS DOUBLE PRECISION) * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp