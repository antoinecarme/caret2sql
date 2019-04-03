-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth
-- Dataset : FourClass_100
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9`, CAST(`ADS`.`Feature_10` AS DOUBLE) AS `Feature_10`, CAST(`ADS`.`Feature_11` AS DOUBLE) AS `Feature_11`, CAST(`ADS`.`Feature_12` AS DOUBLE) AS `Feature_12`, CAST(`ADS`.`Feature_13` AS DOUBLE) AS `Feature_13`, CAST(`ADS`.`Feature_14` AS DOUBLE) AS `Feature_14`, CAST(`ADS`.`Feature_15` AS DOUBLE) AS `Feature_15`, CAST(`ADS`.`Feature_16` AS DOUBLE) AS `Feature_16`, CAST(`ADS`.`Feature_17` AS DOUBLE) AS `Feature_17`, CAST(`ADS`.`Feature_18` AS DOUBLE) AS `Feature_18`, CAST(`ADS`.`Feature_19` AS DOUBLE) AS `Feature_19`, CAST(`ADS`.`Feature_20` AS DOUBLE) AS `Feature_20`, CAST(`ADS`.`Feature_21` AS DOUBLE) AS `Feature_21`, CAST(`ADS`.`Feature_22` AS DOUBLE) AS `Feature_22`, CAST(`ADS`.`Feature_23` AS DOUBLE) AS `Feature_23`, CAST(`ADS`.`Feature_24` AS DOUBLE) AS `Feature_24`, CAST(`ADS`.`Feature_25` AS DOUBLE) AS `Feature_25`, CAST(`ADS`.`Feature_26` AS DOUBLE) AS `Feature_26`, CAST(`ADS`.`Feature_27` AS DOUBLE) AS `Feature_27`, CAST(`ADS`.`Feature_28` AS DOUBLE) AS `Feature_28`, CAST(`ADS`.`Feature_29` AS DOUBLE) AS `Feature_29`, CAST(`ADS`.`Feature_30` AS DOUBLE) AS `Feature_30`, CAST(`ADS`.`Feature_31` AS DOUBLE) AS `Feature_31`, CAST(`ADS`.`Feature_32` AS DOUBLE) AS `Feature_32`, CAST(`ADS`.`Feature_33` AS DOUBLE) AS `Feature_33`, CAST(`ADS`.`Feature_34` AS DOUBLE) AS `Feature_34`, CAST(`ADS`.`Feature_35` AS DOUBLE) AS `Feature_35`, CAST(`ADS`.`Feature_36` AS DOUBLE) AS `Feature_36`, CAST(`ADS`.`Feature_37` AS DOUBLE) AS `Feature_37`, CAST(`ADS`.`Feature_38` AS DOUBLE) AS `Feature_38`, CAST(`ADS`.`Feature_39` AS DOUBLE) AS `Feature_39`, CAST(`ADS`.`Feature_40` AS DOUBLE) AS `Feature_40`, CAST(`ADS`.`Feature_41` AS DOUBLE) AS `Feature_41`, CAST(`ADS`.`Feature_42` AS DOUBLE) AS `Feature_42`, CAST(`ADS`.`Feature_43` AS DOUBLE) AS `Feature_43`, CAST(`ADS`.`Feature_44` AS DOUBLE) AS `Feature_44`, CAST(`ADS`.`Feature_45` AS DOUBLE) AS `Feature_45`, CAST(`ADS`.`Feature_46` AS DOUBLE) AS `Feature_46`, CAST(`ADS`.`Feature_47` AS DOUBLE) AS `Feature_47`, CAST(`ADS`.`Feature_48` AS DOUBLE) AS `Feature_48`, CAST(`ADS`.`Feature_49` AS DOUBLE) AS `Feature_49`, CAST(`ADS`.`Feature_50` AS DOUBLE) AS `Feature_50`, CAST(`ADS`.`Feature_51` AS DOUBLE) AS `Feature_51`, CAST(`ADS`.`Feature_52` AS DOUBLE) AS `Feature_52`, CAST(`ADS`.`Feature_53` AS DOUBLE) AS `Feature_53`, CAST(`ADS`.`Feature_54` AS DOUBLE) AS `Feature_54`, CAST(`ADS`.`Feature_55` AS DOUBLE) AS `Feature_55`, CAST(`ADS`.`Feature_56` AS DOUBLE) AS `Feature_56`, CAST(`ADS`.`Feature_57` AS DOUBLE) AS `Feature_57`, CAST(`ADS`.`Feature_58` AS DOUBLE) AS `Feature_58`, CAST(`ADS`.`Feature_59` AS DOUBLE) AS `Feature_59`, CAST(`ADS`.`Feature_60` AS DOUBLE) AS `Feature_60`, CAST(`ADS`.`Feature_61` AS DOUBLE) AS `Feature_61`, CAST(`ADS`.`Feature_62` AS DOUBLE) AS `Feature_62`, CAST(`ADS`.`Feature_63` AS DOUBLE) AS `Feature_63`, CAST(`ADS`.`Feature_64` AS DOUBLE) AS `Feature_64`, CAST(`ADS`.`Feature_65` AS DOUBLE) AS `Feature_65`, CAST(`ADS`.`Feature_66` AS DOUBLE) AS `Feature_66`, CAST(`ADS`.`Feature_67` AS DOUBLE) AS `Feature_67`, CAST(`ADS`.`Feature_68` AS DOUBLE) AS `Feature_68`, CAST(`ADS`.`Feature_69` AS DOUBLE) AS `Feature_69`, CAST(`ADS`.`Feature_70` AS DOUBLE) AS `Feature_70`, CAST(`ADS`.`Feature_71` AS DOUBLE) AS `Feature_71`, CAST(`ADS`.`Feature_72` AS DOUBLE) AS `Feature_72`, CAST(`ADS`.`Feature_73` AS DOUBLE) AS `Feature_73`, CAST(`ADS`.`Feature_74` AS DOUBLE) AS `Feature_74`, CAST(`ADS`.`Feature_75` AS DOUBLE) AS `Feature_75`, CAST(`ADS`.`Feature_76` AS DOUBLE) AS `Feature_76`, CAST(`ADS`.`Feature_77` AS DOUBLE) AS `Feature_77`, CAST(`ADS`.`Feature_78` AS DOUBLE) AS `Feature_78`, CAST(`ADS`.`Feature_79` AS DOUBLE) AS `Feature_79`, CAST(`ADS`.`Feature_80` AS DOUBLE) AS `Feature_80`, CAST(`ADS`.`Feature_81` AS DOUBLE) AS `Feature_81`, CAST(`ADS`.`Feature_82` AS DOUBLE) AS `Feature_82`, CAST(`ADS`.`Feature_83` AS DOUBLE) AS `Feature_83`, CAST(`ADS`.`Feature_84` AS DOUBLE) AS `Feature_84`, CAST(`ADS`.`Feature_85` AS DOUBLE) AS `Feature_85`, CAST(`ADS`.`Feature_86` AS DOUBLE) AS `Feature_86`, CAST(`ADS`.`Feature_87` AS DOUBLE) AS `Feature_87`, CAST(`ADS`.`Feature_88` AS DOUBLE) AS `Feature_88`, CAST(`ADS`.`Feature_89` AS DOUBLE) AS `Feature_89`, CAST(`ADS`.`Feature_90` AS DOUBLE) AS `Feature_90`, CAST(`ADS`.`Feature_91` AS DOUBLE) AS `Feature_91`, CAST(`ADS`.`Feature_92` AS DOUBLE) AS `Feature_92`, CAST(`ADS`.`Feature_93` AS DOUBLE) AS `Feature_93`, CAST(`ADS`.`Feature_94` AS DOUBLE) AS `Feature_94`, CAST(`ADS`.`Feature_95` AS DOUBLE) AS `Feature_95`, CAST(`ADS`.`Feature_96` AS DOUBLE) AS `Feature_96`, CAST(`ADS`.`Feature_97` AS DOUBLE) AS `Feature_97`, CAST(`ADS`.`Feature_98` AS DOUBLE) AS `Feature_98`, CAST(`ADS`.`Feature_99` AS DOUBLE) AS `Feature_99` 
FROM `FourClass_100` AS `ADS`), 
earth_model_cte AS 
(SELECT earth_input.`KEY` AS `KEY`, -0.7374835504006946 * greatest(earth_input.`Feature_44` - -1.419479439241581, 0) + -2.6966183770921006 * greatest(-1.419479439241581 - earth_input.`Feature_44`, 0) + -0.6149486980615 * greatest(1.582245107330948 - earth_input.`Feature_78`, 0) + -0.7185573640506285 * greatest(0.576999988283039 - earth_input.`Feature_99`, 0) + -2.175356736635588 * greatest(earth_input.`Feature_51` - 2.6973679983733243, 0) + 0.9659558278707386 * greatest(earth_input.`Feature_19` - -1.169682460598766, 0) + -1.336777544326018 * greatest(-0.1002546636818907 - earth_input.`Feature_67`, 0) + 1.911073702634462 AS `Score_0`, 0.4533522758008141 * greatest(earth_input.`Feature_44` - -1.419479439241581, 0) + 0.1962500155439136 * greatest(-1.419479439241581 - earth_input.`Feature_44`, 0) + -0.4271683189162778 * greatest(1.582245107330948 - earth_input.`Feature_78`, 0) + 0.2896273843305212 * greatest(0.576999988283039 - earth_input.`Feature_99`, 0) + -0.983308702251615 * greatest(earth_input.`Feature_51` - 2.6973679983733243, 0) + -0.82560893042711 * greatest(earth_input.`Feature_19` - -1.169682460598766, 0) + 1.404851156721293 * greatest(-0.1002546636818907 - earth_input.`Feature_67`, 0) + -1.2268261752447909 AS `Score_1`, -0.9185902327952414 * greatest(earth_input.`Feature_44` - -1.419479439241581, 0) + 2.145613938656836 * greatest(-1.419479439241581 - earth_input.`Feature_44`, 0) + 0.994868809822716 * greatest(1.582245107330948 - earth_input.`Feature_78`, 0) + -2.177726522065694 * greatest(0.576999988283039 - earth_input.`Feature_99`, 0) + -0.7394970067437311 * greatest(earth_input.`Feature_51` - 2.6973679983733243, 0) + -1.9284785352812968 * greatest(earth_input.`Feature_19` - -1.169682460598766, 0) + 0.4426326868157523 * greatest(-0.1002546636818907 - earth_input.`Feature_67`, 0) + -0.7238418824230514 AS `Score_2`, 0.2785311778488942 * greatest(earth_input.`Feature_44` - -1.419479439241581, 0) + -1.5050457883657915 * greatest(-1.419479439241581 - earth_input.`Feature_44`, 0) + 0.5276622417107085 * greatest(1.582245107330948 - earth_input.`Feature_78`, 0) + 0.7876952172994078 * greatest(0.576999988283039 - earth_input.`Feature_99`, 0) + 3.5005235303545588 * greatest(earth_input.`Feature_51` - 2.6973679983733243, 0) + 0.8805382301660198 * greatest(earth_input.`Feature_19` - -1.169682460598766, 0) + -0.8146794466462625 * greatest(-0.1002546636818907 - earth_input.`Feature_67`, 0) + -4.923737661822988 AS `Score_3` 
FROM earth_input), 
earth_model_cte_logistic AS 
(SELECT earth_model_cte.`KEY` AS `KEY`, earth_model_cte.`Score_0` AS `Score_0`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_0`)))) AS `Logistic_0`, earth_model_cte.`Score_1` AS `Score_1`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_1`)))) AS `Logistic_1`, earth_model_cte.`Score_2` AS `Score_2`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_2`)))) AS `Logistic_2`, earth_model_cte.`Score_3` AS `Score_3`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_3`)))) AS `Logistic_3` 
FROM earth_model_cte), 
orig_cte AS 
(SELECT earth_model_cte_logistic.`KEY` AS `KEY`, earth_model_cte_logistic.`Score_0` AS `Score_0`, earth_model_cte_logistic.`Score_1` AS `Score_1`, earth_model_cte_logistic.`Score_2` AS `Score_2`, earth_model_cte_logistic.`Score_3` AS `Score_3`, earth_model_cte_logistic.`Logistic_0` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3`) AS `Proba_0`, earth_model_cte_logistic.`Logistic_1` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3`) AS `Proba_1`, earth_model_cte_logistic.`Logistic_2` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3`) AS `Proba_2`, earth_model_cte_logistic.`Logistic_3` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3`) AS `Proba_3`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, NULL AS `LogProba_2`, NULL AS `LogProba_3`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM earth_model_cte_logistic), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 2 AS class, orig_cte.`LogProba_2` AS `LogProba`, orig_cte.`Proba_2` AS `Proba`, orig_cte.`Score_2` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 3 AS class, orig_cte.`LogProba_3` AS `LogProba`, orig_cte.`Proba_3` AS `Proba`, orig_cte.`Score_3` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Score_2` AS `Score_2`, orig_cte.`Score_3` AS `Score_3`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`Proba_2` AS `Proba_2`, orig_cte.`Proba_3` AS `Proba_3`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`LogProba_2` AS `LogProba_2`, orig_cte.`LogProba_3` AS `LogProba_3`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Proba` AS `max_Proba` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Proba`) AS `max_Proba` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba` 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.`KEY_u` = score_max.`KEY`), 
arg_max_cte AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba`, `arg_max_t_Proba`.`KEY_Proba` AS `KEY_Proba`, `arg_max_t_Proba`.`arg_max_Proba` AS `arg_max_Proba` 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Proba`, max(union_with_max.class) AS `arg_max_Proba` 
FROM union_with_max 
WHERE union_with_max.`max_Proba` <= union_with_max.`Proba` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Proba` ON score_max.`KEY` = `arg_max_t_Proba`.`KEY_Proba`)
 SELECT arg_max_cte.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, NULL AS `Score_2`, NULL AS `Score_3`, arg_max_cte.`Proba_0` AS `Proba_0`, arg_max_cte.`Proba_1` AS `Proba_1`, arg_max_cte.`Proba_2` AS `Proba_2`, arg_max_cte.`Proba_3` AS `Proba_3`, CASE WHEN (arg_max_cte.`Proba_0` IS NULL OR arg_max_cte.`Proba_0` > 0.0) THEN ln(arg_max_cte.`Proba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`Proba_1` IS NULL OR arg_max_cte.`Proba_1` > 0.0) THEN ln(arg_max_cte.`Proba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (arg_max_cte.`Proba_2` IS NULL OR arg_max_cte.`Proba_2` > 0.0) THEN ln(arg_max_cte.`Proba_2`) ELSE -1.79769313486231e+308 END AS `LogProba_2`, CASE WHEN (arg_max_cte.`Proba_3` IS NULL OR arg_max_cte.`Proba_3` > 0.0) THEN ln(arg_max_cte.`Proba_3`) ELSE -1.79769313486231e+308 END AS `LogProba_3`, arg_max_cte.`arg_max_Proba` AS `Decision`, arg_max_cte.`max_Proba` AS `DecisionProba` 
FROM arg_max_cte