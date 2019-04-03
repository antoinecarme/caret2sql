-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet_pca
-- Dataset : iris_date_tgt
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `ADS_sca_1_OUT` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 5.8475) / 0.8305068311812104 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 3.040833333333333) / 0.4410636176856331 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 3.8441666666666667) / 1.7181578875675667 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 1.245833333333333) / 0.7517929083403303 AS `Feature_3` 
FROM iris_date_tgt AS `ADS`), 
`ADS_pre_1_OUT` AS 
(SELECT `ADS_sca_1_OUT`.`KEY` AS `KEY`, `ADS_sca_1_OUT`.`Feature_0` * -0.5263014514387969 + `ADS_sca_1_OUT`.`Feature_1` * 0.2495430740050257 + `ADS_sca_1_OUT`.`Feature_2` * -0.5822562654142306 + `ADS_sca_1_OUT`.`Feature_3` * -0.5671972124538438 AS `PC1`, `ADS_sca_1_OUT`.`Feature_0` * 0.35797855187209515 + `ADS_sca_1_OUT`.`Feature_1` * 0.9312088394674648 + `ADS_sca_1_OUT`.`Feature_2` * 0.009350349831007576 + `ADS_sca_1_OUT`.`Feature_3` * 0.06792661227568664 AS `PC2`, `ADS_sca_1_OUT`.`Feature_0` * 0.7268387018817979 + `ADS_sca_1_OUT`.`Feature_1` * -0.2319858665682916 + `ADS_sca_1_OUT`.`Feature_2` * -0.142090941958786 + `ADS_sca_1_OUT`.`Feature_3` * -0.6306331924126783 AS `PC3`, `ADS_sca_1_OUT`.`Feature_0` * -0.2579993024404442 + `ADS_sca_1_OUT`.`Feature_1` * 0.1294639302135427 + `ADS_sca_1_OUT`.`Feature_2` * 0.8004376156560707 + `ADS_sca_1_OUT`.`Feature_3` * -0.5253332981610163 AS `PC4` 
FROM `ADS_sca_1_OUT`), 
`IL` AS 
(SELECT `ADS_pre_1_OUT`.`KEY` AS `KEY`, CAST(`ADS_pre_1_OUT`.`PC1` AS DOUBLE) AS `PC1`, CAST(`ADS_pre_1_OUT`.`PC2` AS DOUBLE) AS `PC2`, CAST(`ADS_pre_1_OUT`.`PC3` AS DOUBLE) AS `PC3`, CAST(`ADS_pre_1_OUT`.`PC4` AS DOUBLE) AS `PC4` 
FROM `ADS_pre_1_OUT`), 
`HL_BA_1` AS 
(SELECT `IL`.`KEY` AS `KEY`, -5.456502 * `IL`.`PC1` + -1.530479 * `IL`.`PC2` + -3.064664 * `IL`.`PC3` + 4.624344 * `IL`.`PC4` + -6.186959 AS `NEUR_1_1`, -1.19155 * `IL`.`PC1` + -1.315662 * `IL`.`PC2` + -0.3096992 * `IL`.`PC3` + 0.3349872 * `IL`.`PC4` + 1.542057 AS `NEUR_1_2`, 1.465492 * `IL`.`PC1` + 0.8148261 * `IL`.`PC2` + 0.5279407 * `IL`.`PC3` + -0.344158 * `IL`.`PC4` + -1.100517 AS `NEUR_1_3`, -5.203385 * `IL`.`PC1` + -4.379149 * `IL`.`PC2` + 3.823356 * `IL`.`PC3` + -2.108529 * `IL`.`PC4` + -1.221374 AS `NEUR_1_4`, -4.348957 * `IL`.`PC1` + -0.6418215 * `IL`.`PC2` + -6.279277 * `IL`.`PC3` + 6.761248 * `IL`.`PC4` + -3.976877 AS `NEUR_1_5`, -1.121816 * `IL`.`PC1` + -1.847458 * `IL`.`PC2` + -0.1743898 * `IL`.`PC3` + 0.2008244 * `IL`.`PC4` + 1.855584 AS `NEUR_1_6`, 1.919318 * `IL`.`PC1` + 0.7616562 * `IL`.`PC2` + 4.546598 * `IL`.`PC3` + -4.365391 * `IL`.`PC4` + 1.551468 AS `NEUR_1_7`, 2.631034 * `IL`.`PC1` + -5.370465 * `IL`.`PC2` + 1.530438 * `IL`.`PC3` + -0.9841443 * `IL`.`PC4` + -0.8227388 AS `NEUR_1_8`, -2.45431 * `IL`.`PC1` + -0.3817792 * `IL`.`PC2` + -0.8786558 * `IL`.`PC3` + 0.3940294 * `IL`.`PC4` + 1.897412 AS `NEUR_1_9`, 1.489035 * `IL`.`PC1` + -1.227615 * `IL`.`PC2` + 0.2423281 * `IL`.`PC3` + 0.04485051 * `IL`.`PC4` + 0.158798 AS `NEUR_1_10`, -2.786009 * `IL`.`PC1` + -0.642327 * `IL`.`PC2` + -0.6938217 * `IL`.`PC3` + 0.2582909 * `IL`.`PC4` + 1.868675 AS `NEUR_1_11`, 2.586708 * `IL`.`PC1` + 0.6242871 * `IL`.`PC2` + 0.639272 * `IL`.`PC3` + -0.4848307 * `IL`.`PC4` + -1.55016 AS `NEUR_1_12` 
FROM `IL`), 
`HL_1_logistic` AS 
(SELECT `HL_BA_1`.`KEY` AS `KEY`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_1`)))) AS `NEUR_1_1`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_2`)))) AS `NEUR_1_2`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_3`)))) AS `NEUR_1_3`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_4`)))) AS `NEUR_1_4`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_5`)))) AS `NEUR_1_5`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_6`)))) AS `NEUR_1_6`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_7`)))) AS `NEUR_1_7`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_8`)))) AS `NEUR_1_8`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_9`)))) AS `NEUR_1_9`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_10`)))) AS `NEUR_1_10`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_11`)))) AS `NEUR_1_11`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_12`)))) AS `NEUR_1_12` 
FROM `HL_BA_1`), 
`HL_1_logistic_1` AS 
(SELECT `HL_1_logistic`.`KEY` AS `KEY`, `HL_1_logistic`.`NEUR_1_1` AS `NEUR_1_1`, `HL_1_logistic`.`NEUR_1_2` AS `NEUR_1_2`, `HL_1_logistic`.`NEUR_1_3` AS `NEUR_1_3`, `HL_1_logistic`.`NEUR_1_4` AS `NEUR_1_4`, `HL_1_logistic`.`NEUR_1_5` AS `NEUR_1_5`, `HL_1_logistic`.`NEUR_1_6` AS `NEUR_1_6`, `HL_1_logistic`.`NEUR_1_7` AS `NEUR_1_7`, `HL_1_logistic`.`NEUR_1_8` AS `NEUR_1_8`, `HL_1_logistic`.`NEUR_1_9` AS `NEUR_1_9`, `HL_1_logistic`.`NEUR_1_10` AS `NEUR_1_10`, `HL_1_logistic`.`NEUR_1_11` AS `NEUR_1_11`, `HL_1_logistic`.`NEUR_1_12` AS `NEUR_1_12` 
FROM `HL_1_logistic`), 
`OL_BA` AS 
(SELECT `HL_1_logistic_1`.`KEY` AS `KEY`, -1.596448 * `HL_1_logistic_1`.`NEUR_1_1` + 0.08689248 * `HL_1_logistic_1`.`NEUR_1_2` + 3.061691 * `HL_1_logistic_1`.`NEUR_1_3` + -3.582084 * `HL_1_logistic_1`.`NEUR_1_4` + -1.860746 * `HL_1_logistic_1`.`NEUR_1_5` + 0.4569869 * `HL_1_logistic_1`.`NEUR_1_6` + 2.900773 * `HL_1_logistic_1`.`NEUR_1_7` + 1.971749 * `HL_1_logistic_1`.`NEUR_1_8` + -2.719351 * `HL_1_logistic_1`.`NEUR_1_9` + 2.830959 * `HL_1_logistic_1`.`NEUR_1_10` + -2.455593 * `HL_1_logistic_1`.`NEUR_1_11` + 3.199563 * `HL_1_logistic_1`.`NEUR_1_12` + -0.5814415 AS `NEUR_2_1`, -8.203695 * `HL_1_logistic_1`.`NEUR_1_1` + 1.049543 * `HL_1_logistic_1`.`NEUR_1_2` + -1.564378 * `HL_1_logistic_1`.`NEUR_1_3` + -5.198749 * `HL_1_logistic_1`.`NEUR_1_4` + -5.260815 * `HL_1_logistic_1`.`NEUR_1_5` + 1.170615 * `HL_1_logistic_1`.`NEUR_1_6` + 2.475192 * `HL_1_logistic_1`.`NEUR_1_7` + 2.40596 * `HL_1_logistic_1`.`NEUR_1_8` + 4.682604 * `HL_1_logistic_1`.`NEUR_1_9` + -2.261143 * `HL_1_logistic_1`.`NEUR_1_10` + 4.730604 * `HL_1_logistic_1`.`NEUR_1_11` + -2.594202 * `HL_1_logistic_1`.`NEUR_1_12` + 3.362535 AS `NEUR_2_2`, 9.587461 * `HL_1_logistic_1`.`NEUR_1_1` + -0.8693166 * `HL_1_logistic_1`.`NEUR_1_2` + -1.320601 * `HL_1_logistic_1`.`NEUR_1_3` + 8.827341 * `HL_1_logistic_1`.`NEUR_1_4` + 7.03563 * `HL_1_logistic_1`.`NEUR_1_5` + -1.695401 * `HL_1_logistic_1`.`NEUR_1_6` + -5.630371 * `HL_1_logistic_1`.`NEUR_1_7` + -4.393325 * `HL_1_logistic_1`.`NEUR_1_8` + -1.64664 * `HL_1_logistic_1`.`NEUR_1_9` + -0.5728598 * `HL_1_logistic_1`.`NEUR_1_10` + -2.288827 * `HL_1_logistic_1`.`NEUR_1_11` + -0.3784019 * `HL_1_logistic_1`.`NEUR_1_12` + -2.694547 AS `NEUR_2_3` 
FROM `HL_1_logistic_1`), 
`OL_softmax` AS 
(SELECT `OL_BA`.`KEY` AS `KEY`, `OL_BA`.`NEUR_2_1` AS `NEUR_2_1`, `OL_BA`.`NEUR_2_2` AS `NEUR_2_2`, `OL_BA`.`NEUR_2_3` AS `NEUR_2_3` 
FROM `OL_BA`), 
`OL_softmax_1` AS 
(SELECT `OL_softmax`.`KEY` AS `KEY`, `OL_softmax`.`NEUR_2_1` AS `NEUR_2_1`, `OL_softmax`.`NEUR_2_2` AS `NEUR_2_2`, `OL_softmax`.`NEUR_2_3` AS `NEUR_2_3` 
FROM `OL_softmax`), 
orig_cte AS 
(SELECT `OL_softmax_1`.`KEY` AS `KEY`, `OL_softmax_1`.`NEUR_2_1` AS `Score_1789-07-14T00:00:00.000000000`, `OL_softmax_1`.`NEUR_2_2` AS `Score_1789-08-14T00:00:00.000000000`, `OL_softmax_1`.`NEUR_2_3` AS `Score_1789-09-14T00:00:00.000000000`, NULL AS `Proba_1789-07-14T00:00:00.000000000`, NULL AS `Proba_1789-08-14T00:00:00.000000000`, NULL AS `Proba_1789-09-14T00:00:00.000000000`, NULL AS `LogProba_1789-07-14T00:00:00.000000000`, NULL AS `LogProba_1789-08-14T00:00:00.000000000`, NULL AS `LogProba_1789-09-14T00:00:00.000000000`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM `OL_softmax_1`), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, '1789-07-14T00:00:00.000000000' AS class, orig_cte.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba`, orig_cte.`Proba_1789-07-14T00:00:00.000000000` AS `Proba`, orig_cte.`Score_1789-07-14T00:00:00.000000000` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, '1789-08-14T00:00:00.000000000' AS class, orig_cte.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba`, orig_cte.`Proba_1789-08-14T00:00:00.000000000` AS `Proba`, orig_cte.`Score_1789-08-14T00:00:00.000000000` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, '1789-09-14T00:00:00.000000000' AS class, orig_cte.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba`, orig_cte.`Proba_1789-09-14T00:00:00.000000000` AS `Proba`, orig_cte.`Score_1789-09-14T00:00:00.000000000` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_1789-07-14T00:00:00.000000000` AS `Score_1789-07-14T00:00:00.000000000`, orig_cte.`Score_1789-08-14T00:00:00.000000000` AS `Score_1789-08-14T00:00:00.000000000`, orig_cte.`Score_1789-09-14T00:00:00.000000000` AS `Score_1789-09-14T00:00:00.000000000`, orig_cte.`Proba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, orig_cte.`Proba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, orig_cte.`Proba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, orig_cte.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba_1789-07-14T00:00:00.000000000`, orig_cte.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba_1789-08-14T00:00:00.000000000`, orig_cte.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba_1789-09-14T00:00:00.000000000`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Score` AS `max_Score` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Score`) AS `max_Score` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
score_soft_max_deltas AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_1789-07-14T00:00:00.000000000` AS `Score_1789-07-14T00:00:00.000000000`, score_max.`Score_1789-08-14T00:00:00.000000000` AS `Score_1789-08-14T00:00:00.000000000`, score_max.`Score_1789-09-14T00:00:00.000000000` AS `Score_1789-09-14T00:00:00.000000000`, score_max.`Proba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, score_max.`Proba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, score_max.`Proba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, score_max.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba_1789-07-14T00:00:00.000000000`, score_max.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba_1789-08-14T00:00:00.000000000`, score_max.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba_1789-09-14T00:00:00.000000000`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Score` AS `max_Score`, exp(greatest(-100.0, score_max.`Score_1789-07-14T00:00:00.000000000` - score_max.`max_Score`)) AS `exp_delta_Score_1789-07-14T00:00:00.000000000`, exp(greatest(-100.0, score_max.`Score_1789-08-14T00:00:00.000000000` - score_max.`max_Score`)) AS `exp_delta_Score_1789-08-14T00:00:00.000000000`, exp(greatest(-100.0, score_max.`Score_1789-09-14T00:00:00.000000000` - score_max.`max_Score`)) AS `exp_delta_Score_1789-09-14T00:00:00.000000000` 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_delta_Score` AS `exp_delta_Score` 
FROM (SELECT score_soft_max_deltas.`KEY` AS `KEY`, '1789-07-14T00:00:00.000000000' AS class, score_soft_max_deltas.`exp_delta_Score_1789-07-14T00:00:00.000000000` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, '1789-08-14T00:00:00.000000000' AS class, score_soft_max_deltas.`exp_delta_Score_1789-08-14T00:00:00.000000000` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, '1789-09-14T00:00:00.000000000' AS class, score_soft_max_deltas.`exp_delta_Score_1789-09-14T00:00:00.000000000` AS `exp_delta_Score` 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.`KEY` AS `KEY`, score_soft_max_deltas.`Score_1789-07-14T00:00:00.000000000` AS `Score_1789-07-14T00:00:00.000000000`, score_soft_max_deltas.`Score_1789-08-14T00:00:00.000000000` AS `Score_1789-08-14T00:00:00.000000000`, score_soft_max_deltas.`Score_1789-09-14T00:00:00.000000000` AS `Score_1789-09-14T00:00:00.000000000`, score_soft_max_deltas.`Proba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, score_soft_max_deltas.`Proba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, score_soft_max_deltas.`Proba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, score_soft_max_deltas.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba_1789-07-14T00:00:00.000000000`, score_soft_max_deltas.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba_1789-08-14T00:00:00.000000000`, score_soft_max_deltas.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba_1789-09-14T00:00:00.000000000`, score_soft_max_deltas.`Decision` AS `Decision`, score_soft_max_deltas.`DecisionProba` AS `DecisionProba`, score_soft_max_deltas.`KEY_m` AS `KEY_m`, score_soft_max_deltas.`max_Score` AS `max_Score`, score_soft_max_deltas.`exp_delta_Score_1789-07-14T00:00:00.000000000` AS `exp_delta_Score_1789-07-14T00:00:00.000000000`, score_soft_max_deltas.`exp_delta_Score_1789-08-14T00:00:00.000000000` AS `exp_delta_Score_1789-08-14T00:00:00.000000000`, score_soft_max_deltas.`exp_delta_Score_1789-09-14T00:00:00.000000000` AS `exp_delta_Score_1789-09-14T00:00:00.000000000`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_delta_Score`) AS `sum_ExpDeltaScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_deltas.`KEY` = sum_exp_t.`KEY_sum`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_1789-07-14T00:00:00.000000000` AS `Score_1789-07-14T00:00:00.000000000`, score_soft_max.`Score_1789-08-14T00:00:00.000000000` AS `Score_1789-08-14T00:00:00.000000000`, score_soft_max.`Score_1789-09-14T00:00:00.000000000` AS `Score_1789-09-14T00:00:00.000000000`, score_soft_max.`Proba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, score_soft_max.`Proba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, score_soft_max.`Proba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba_1789-07-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba_1789-08-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba_1789-09-14T00:00:00.000000000`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_1789-07-14T00:00:00.000000000` AS `exp_delta_Score_1789-07-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-08-14T00:00:00.000000000` AS `exp_delta_Score_1789-08-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-09-14T00:00:00.000000000` AS `exp_delta_Score_1789-09-14T00:00:00.000000000`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.`KEY_u` = score_soft_max.`KEY`), 
arg_max_cte AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_1789-07-14T00:00:00.000000000` AS `Score_1789-07-14T00:00:00.000000000`, score_soft_max.`Score_1789-08-14T00:00:00.000000000` AS `Score_1789-08-14T00:00:00.000000000`, score_soft_max.`Score_1789-09-14T00:00:00.000000000` AS `Score_1789-09-14T00:00:00.000000000`, score_soft_max.`Proba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, score_soft_max.`Proba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, score_soft_max.`Proba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-07-14T00:00:00.000000000` AS `LogProba_1789-07-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-08-14T00:00:00.000000000` AS `LogProba_1789-08-14T00:00:00.000000000`, score_soft_max.`LogProba_1789-09-14T00:00:00.000000000` AS `LogProba_1789-09-14T00:00:00.000000000`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_1789-07-14T00:00:00.000000000` AS `exp_delta_Score_1789-07-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-08-14T00:00:00.000000000` AS `exp_delta_Score_1789-08-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-09-14T00:00:00.000000000` AS `exp_delta_Score_1789-09-14T00:00:00.000000000`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore`, `arg_max_t_Score`.`KEY_Score` AS `KEY_Score`, `arg_max_t_Score`.`arg_max_Score` AS `arg_max_Score`, soft_max_comp.`KEY_softmax` AS `KEY_softmax`, soft_max_comp.`SoftProba_1789-07-14T00:00:00.000000000` AS `SoftProba_1789-07-14T00:00:00.000000000`, soft_max_comp.`SoftProba_1789-08-14T00:00:00.000000000` AS `SoftProba_1789-08-14T00:00:00.000000000`, soft_max_comp.`SoftProba_1789-09-14T00:00:00.000000000` AS `SoftProba_1789-09-14T00:00:00.000000000` 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Score`, max(union_with_max.class) AS `arg_max_Score` 
FROM union_with_max 
WHERE union_with_max.`max_Score` <= union_with_max.`Score` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Score` ON score_soft_max.`KEY` = `arg_max_t_Score`.`KEY_Score` LEFT OUTER JOIN (SELECT score_soft_max.`KEY` AS `KEY_softmax`, score_soft_max.`exp_delta_Score_1789-07-14T00:00:00.000000000` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_1789-07-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-08-14T00:00:00.000000000` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_1789-08-14T00:00:00.000000000`, score_soft_max.`exp_delta_Score_1789-09-14T00:00:00.000000000` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_1789-09-14T00:00:00.000000000` 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.`KEY_softmax` = `arg_max_t_Score`.`KEY_Score`)
 SELECT arg_max_cte.`KEY` AS `KEY`, NULL AS `Score_1789-07-14T00:00:00.000000000`, NULL AS `Score_1789-08-14T00:00:00.000000000`, NULL AS `Score_1789-09-14T00:00:00.000000000`, arg_max_cte.`SoftProba_1789-07-14T00:00:00.000000000` AS `Proba_1789-07-14T00:00:00.000000000`, arg_max_cte.`SoftProba_1789-08-14T00:00:00.000000000` AS `Proba_1789-08-14T00:00:00.000000000`, arg_max_cte.`SoftProba_1789-09-14T00:00:00.000000000` AS `Proba_1789-09-14T00:00:00.000000000`, CASE WHEN (arg_max_cte.`SoftProba_1789-07-14T00:00:00.000000000` IS NULL OR arg_max_cte.`SoftProba_1789-07-14T00:00:00.000000000` > 0.0) THEN ln(arg_max_cte.`SoftProba_1789-07-14T00:00:00.000000000`) ELSE -1.79769313486231e+308 END AS `LogProba_1789-07-14T00:00:00.000000000`, CASE WHEN (arg_max_cte.`SoftProba_1789-08-14T00:00:00.000000000` IS NULL OR arg_max_cte.`SoftProba_1789-08-14T00:00:00.000000000` > 0.0) THEN ln(arg_max_cte.`SoftProba_1789-08-14T00:00:00.000000000`) ELSE -1.79769313486231e+308 END AS `LogProba_1789-08-14T00:00:00.000000000`, CASE WHEN (arg_max_cte.`SoftProba_1789-09-14T00:00:00.000000000` IS NULL OR arg_max_cte.`SoftProba_1789-09-14T00:00:00.000000000` > 0.0) THEN ln(arg_max_cte.`SoftProba_1789-09-14T00:00:00.000000000`) ELSE -1.79769313486231e+308 END AS `LogProba_1789-09-14T00:00:00.000000000`, arg_max_cte.`arg_max_Score` AS `Decision`, greatest(arg_max_cte.`SoftProba_1789-07-14T00:00:00.000000000`, arg_max_cte.`SoftProba_1789-08-14T00:00:00.000000000`, arg_max_cte.`SoftProba_1789-09-14T00:00:00.000000000`) AS `DecisionProba` 
FROM arg_max_cte