-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : iris_str_tgt
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `IL` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3` 
FROM iris_str_tgt AS `ADS`), 
`HL_BA_1` AS 
(SELECT `IL`.`KEY` AS `KEY`, 0.3300473 * `IL`.`Feature_0` + 1.097714 * `IL`.`Feature_1` + -1.717432 * `IL`.`Feature_2` + -0.7618913 * `IL`.`Feature_3` + 0.2026386 AS `NEUR_1_1`, -1.842266 * `IL`.`Feature_0` + -1.875337 * `IL`.`Feature_1` + 2.992373 * `IL`.`Feature_2` + 3.016158 * `IL`.`Feature_3` + -2.790411 AS `NEUR_1_2`, -0.3232855 * `IL`.`Feature_0` + -1.133779 * `IL`.`Feature_1` + 1.847553 * `IL`.`Feature_2` + 0.807448 * `IL`.`Feature_3` + -0.2025273 AS `NEUR_1_3` 
FROM `IL`), 
`HL_1_logistic` AS 
(SELECT `HL_BA_1`.`KEY` AS `KEY`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_1`)))) AS `NEUR_1_1`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_2`)))) AS `NEUR_1_2`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_3`)))) AS `NEUR_1_3` 
FROM `HL_BA_1`), 
`HL_1_logistic_1` AS 
(SELECT `HL_1_logistic`.`KEY` AS `KEY`, `HL_1_logistic`.`NEUR_1_1` AS `NEUR_1_1`, `HL_1_logistic`.`NEUR_1_2` AS `NEUR_1_2`, `HL_1_logistic`.`NEUR_1_3` AS `NEUR_1_3` 
FROM `HL_1_logistic`), 
`OL_BA` AS 
(SELECT `HL_1_logistic_1`.`KEY` AS `KEY`, 3.062885 * `HL_1_logistic_1`.`NEUR_1_1` + -0.9181025 * `HL_1_logistic_1`.`NEUR_1_2` + -2.553509 * `HL_1_logistic_1`.`NEUR_1_3` + 0.5283158 AS `NEUR_2_1`, -1.993521 * `HL_1_logistic_1`.`NEUR_1_1` + -4.213508 * `HL_1_logistic_1`.`NEUR_1_2` + 2.748639 * `HL_1_logistic_1`.`NEUR_1_3` + 0.619224 AS `NEUR_2_2`, -1.06936 * `HL_1_logistic_1`.`NEUR_1_1` + 5.131607 * `HL_1_logistic_1`.`NEUR_1_2` + -0.1951314 * `HL_1_logistic_1`.`NEUR_1_3` + -1.14754 AS `NEUR_2_3` 
FROM `HL_1_logistic_1`), 
`OL_softmax` AS 
(SELECT `OL_BA`.`KEY` AS `KEY`, `OL_BA`.`NEUR_2_1` AS `NEUR_2_1`, `OL_BA`.`NEUR_2_2` AS `NEUR_2_2`, `OL_BA`.`NEUR_2_3` AS `NEUR_2_3` 
FROM `OL_BA`), 
`OL_softmax_1` AS 
(SELECT `OL_softmax`.`KEY` AS `KEY`, `OL_softmax`.`NEUR_2_1` AS `NEUR_2_1`, `OL_softmax`.`NEUR_2_2` AS `NEUR_2_2`, `OL_softmax`.`NEUR_2_3` AS `NEUR_2_3` 
FROM `OL_softmax`), 
orig_cte AS 
(SELECT `OL_softmax_1`.`KEY` AS `KEY`, `OL_softmax_1`.`NEUR_2_1` AS `Score_CLASS_0`, `OL_softmax_1`.`NEUR_2_2` AS `Score_CLASS_1`, `OL_softmax_1`.`NEUR_2_3` AS `Score_CLASS_2`, NULL AS `Proba_CLASS_0`, NULL AS `Proba_CLASS_1`, NULL AS `Proba_CLASS_2`, NULL AS `LogProba_CLASS_0`, NULL AS `LogProba_CLASS_1`, NULL AS `LogProba_CLASS_2`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM `OL_softmax_1`), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 'CLASS_0' AS class, orig_cte.`LogProba_CLASS_0` AS `LogProba`, orig_cte.`Proba_CLASS_0` AS `Proba`, orig_cte.`Score_CLASS_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 'CLASS_1' AS class, orig_cte.`LogProba_CLASS_1` AS `LogProba`, orig_cte.`Proba_CLASS_1` AS `Proba`, orig_cte.`Score_CLASS_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 'CLASS_2' AS class, orig_cte.`LogProba_CLASS_2` AS `LogProba`, orig_cte.`Proba_CLASS_2` AS `Proba`, orig_cte.`Score_CLASS_2` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_CLASS_0` AS `Score_CLASS_0`, orig_cte.`Score_CLASS_1` AS `Score_CLASS_1`, orig_cte.`Score_CLASS_2` AS `Score_CLASS_2`, orig_cte.`Proba_CLASS_0` AS `Proba_CLASS_0`, orig_cte.`Proba_CLASS_1` AS `Proba_CLASS_1`, orig_cte.`Proba_CLASS_2` AS `Proba_CLASS_2`, orig_cte.`LogProba_CLASS_0` AS `LogProba_CLASS_0`, orig_cte.`LogProba_CLASS_1` AS `LogProba_CLASS_1`, orig_cte.`LogProba_CLASS_2` AS `LogProba_CLASS_2`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Score` AS `max_Score` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Score`) AS `max_Score` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
score_soft_max_deltas AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_CLASS_0` AS `Score_CLASS_0`, score_max.`Score_CLASS_1` AS `Score_CLASS_1`, score_max.`Score_CLASS_2` AS `Score_CLASS_2`, score_max.`Proba_CLASS_0` AS `Proba_CLASS_0`, score_max.`Proba_CLASS_1` AS `Proba_CLASS_1`, score_max.`Proba_CLASS_2` AS `Proba_CLASS_2`, score_max.`LogProba_CLASS_0` AS `LogProba_CLASS_0`, score_max.`LogProba_CLASS_1` AS `LogProba_CLASS_1`, score_max.`LogProba_CLASS_2` AS `LogProba_CLASS_2`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Score` AS `max_Score`, exp(greatest(-100.0, score_max.`Score_CLASS_0` - score_max.`max_Score`)) AS `exp_delta_Score_CLASS_0`, exp(greatest(-100.0, score_max.`Score_CLASS_1` - score_max.`max_Score`)) AS `exp_delta_Score_CLASS_1`, exp(greatest(-100.0, score_max.`Score_CLASS_2` - score_max.`max_Score`)) AS `exp_delta_Score_CLASS_2` 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_delta_Score` AS `exp_delta_Score` 
FROM (SELECT score_soft_max_deltas.`KEY` AS `KEY`, 'CLASS_0' AS class, score_soft_max_deltas.`exp_delta_Score_CLASS_0` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, 'CLASS_1' AS class, score_soft_max_deltas.`exp_delta_Score_CLASS_1` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, 'CLASS_2' AS class, score_soft_max_deltas.`exp_delta_Score_CLASS_2` AS `exp_delta_Score` 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.`KEY` AS `KEY`, score_soft_max_deltas.`Score_CLASS_0` AS `Score_CLASS_0`, score_soft_max_deltas.`Score_CLASS_1` AS `Score_CLASS_1`, score_soft_max_deltas.`Score_CLASS_2` AS `Score_CLASS_2`, score_soft_max_deltas.`Proba_CLASS_0` AS `Proba_CLASS_0`, score_soft_max_deltas.`Proba_CLASS_1` AS `Proba_CLASS_1`, score_soft_max_deltas.`Proba_CLASS_2` AS `Proba_CLASS_2`, score_soft_max_deltas.`LogProba_CLASS_0` AS `LogProba_CLASS_0`, score_soft_max_deltas.`LogProba_CLASS_1` AS `LogProba_CLASS_1`, score_soft_max_deltas.`LogProba_CLASS_2` AS `LogProba_CLASS_2`, score_soft_max_deltas.`Decision` AS `Decision`, score_soft_max_deltas.`DecisionProba` AS `DecisionProba`, score_soft_max_deltas.`KEY_m` AS `KEY_m`, score_soft_max_deltas.`max_Score` AS `max_Score`, score_soft_max_deltas.`exp_delta_Score_CLASS_0` AS `exp_delta_Score_CLASS_0`, score_soft_max_deltas.`exp_delta_Score_CLASS_1` AS `exp_delta_Score_CLASS_1`, score_soft_max_deltas.`exp_delta_Score_CLASS_2` AS `exp_delta_Score_CLASS_2`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_delta_Score`) AS `sum_ExpDeltaScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_deltas.`KEY` = sum_exp_t.`KEY_sum`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_CLASS_0` AS `Score_CLASS_0`, score_soft_max.`Score_CLASS_1` AS `Score_CLASS_1`, score_soft_max.`Score_CLASS_2` AS `Score_CLASS_2`, score_soft_max.`Proba_CLASS_0` AS `Proba_CLASS_0`, score_soft_max.`Proba_CLASS_1` AS `Proba_CLASS_1`, score_soft_max.`Proba_CLASS_2` AS `Proba_CLASS_2`, score_soft_max.`LogProba_CLASS_0` AS `LogProba_CLASS_0`, score_soft_max.`LogProba_CLASS_1` AS `LogProba_CLASS_1`, score_soft_max.`LogProba_CLASS_2` AS `LogProba_CLASS_2`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_CLASS_0` AS `exp_delta_Score_CLASS_0`, score_soft_max.`exp_delta_Score_CLASS_1` AS `exp_delta_Score_CLASS_1`, score_soft_max.`exp_delta_Score_CLASS_2` AS `exp_delta_Score_CLASS_2`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.`KEY_u` = score_soft_max.`KEY`), 
arg_max_cte AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_CLASS_0` AS `Score_CLASS_0`, score_soft_max.`Score_CLASS_1` AS `Score_CLASS_1`, score_soft_max.`Score_CLASS_2` AS `Score_CLASS_2`, score_soft_max.`Proba_CLASS_0` AS `Proba_CLASS_0`, score_soft_max.`Proba_CLASS_1` AS `Proba_CLASS_1`, score_soft_max.`Proba_CLASS_2` AS `Proba_CLASS_2`, score_soft_max.`LogProba_CLASS_0` AS `LogProba_CLASS_0`, score_soft_max.`LogProba_CLASS_1` AS `LogProba_CLASS_1`, score_soft_max.`LogProba_CLASS_2` AS `LogProba_CLASS_2`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_CLASS_0` AS `exp_delta_Score_CLASS_0`, score_soft_max.`exp_delta_Score_CLASS_1` AS `exp_delta_Score_CLASS_1`, score_soft_max.`exp_delta_Score_CLASS_2` AS `exp_delta_Score_CLASS_2`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore`, `arg_max_t_Score`.`KEY_Score` AS `KEY_Score`, `arg_max_t_Score`.`arg_max_Score` AS `arg_max_Score`, soft_max_comp.`KEY_softmax` AS `KEY_softmax`, soft_max_comp.`SoftProba_CLASS_0` AS `SoftProba_CLASS_0`, soft_max_comp.`SoftProba_CLASS_1` AS `SoftProba_CLASS_1`, soft_max_comp.`SoftProba_CLASS_2` AS `SoftProba_CLASS_2` 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Score`, max(union_with_max.class) AS `arg_max_Score` 
FROM union_with_max 
WHERE union_with_max.`max_Score` <= union_with_max.`Score` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Score` ON score_soft_max.`KEY` = `arg_max_t_Score`.`KEY_Score` LEFT OUTER JOIN (SELECT score_soft_max.`KEY` AS `KEY_softmax`, score_soft_max.`exp_delta_Score_CLASS_0` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_CLASS_0`, score_soft_max.`exp_delta_Score_CLASS_1` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_CLASS_1`, score_soft_max.`exp_delta_Score_CLASS_2` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_CLASS_2` 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.`KEY_softmax` = `arg_max_t_Score`.`KEY_Score`)
 SELECT arg_max_cte.`KEY` AS `KEY`, NULL AS `Score_CLASS_0`, NULL AS `Score_CLASS_1`, NULL AS `Score_CLASS_2`, arg_max_cte.`SoftProba_CLASS_0` AS `Proba_CLASS_0`, arg_max_cte.`SoftProba_CLASS_1` AS `Proba_CLASS_1`, arg_max_cte.`SoftProba_CLASS_2` AS `Proba_CLASS_2`, CASE WHEN (arg_max_cte.`SoftProba_CLASS_0` IS NULL OR arg_max_cte.`SoftProba_CLASS_0` > 0.0) THEN ln(arg_max_cte.`SoftProba_CLASS_0`) ELSE -1.79769313486231e+308 END AS `LogProba_CLASS_0`, CASE WHEN (arg_max_cte.`SoftProba_CLASS_1` IS NULL OR arg_max_cte.`SoftProba_CLASS_1` > 0.0) THEN ln(arg_max_cte.`SoftProba_CLASS_1`) ELSE -1.79769313486231e+308 END AS `LogProba_CLASS_1`, CASE WHEN (arg_max_cte.`SoftProba_CLASS_2` IS NULL OR arg_max_cte.`SoftProba_CLASS_2` > 0.0) THEN ln(arg_max_cte.`SoftProba_CLASS_2`) ELSE -1.79769313486231e+308 END AS `LogProba_CLASS_2`, arg_max_cte.`arg_max_Score` AS `Decision`, greatest(arg_max_cte.`SoftProba_CLASS_0`, arg_max_cte.`SoftProba_CLASS_1`, arg_max_cte.`SoftProba_CLASS_2`) AS `DecisionProba` 
FROM arg_max_cte