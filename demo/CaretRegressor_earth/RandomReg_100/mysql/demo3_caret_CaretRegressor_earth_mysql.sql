-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : RandomReg_100
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9`, CAST(`ADS`.`Feature_10` AS DOUBLE) AS `Feature_10`, CAST(`ADS`.`Feature_11` AS DOUBLE) AS `Feature_11`, CAST(`ADS`.`Feature_12` AS DOUBLE) AS `Feature_12`, CAST(`ADS`.`Feature_13` AS DOUBLE) AS `Feature_13`, CAST(`ADS`.`Feature_14` AS DOUBLE) AS `Feature_14`, CAST(`ADS`.`Feature_15` AS DOUBLE) AS `Feature_15`, CAST(`ADS`.`Feature_16` AS DOUBLE) AS `Feature_16`, CAST(`ADS`.`Feature_17` AS DOUBLE) AS `Feature_17`, CAST(`ADS`.`Feature_18` AS DOUBLE) AS `Feature_18`, CAST(`ADS`.`Feature_19` AS DOUBLE) AS `Feature_19`, CAST(`ADS`.`Feature_20` AS DOUBLE) AS `Feature_20`, CAST(`ADS`.`Feature_21` AS DOUBLE) AS `Feature_21`, CAST(`ADS`.`Feature_22` AS DOUBLE) AS `Feature_22`, CAST(`ADS`.`Feature_23` AS DOUBLE) AS `Feature_23`, CAST(`ADS`.`Feature_24` AS DOUBLE) AS `Feature_24`, CAST(`ADS`.`Feature_25` AS DOUBLE) AS `Feature_25`, CAST(`ADS`.`Feature_26` AS DOUBLE) AS `Feature_26`, CAST(`ADS`.`Feature_27` AS DOUBLE) AS `Feature_27`, CAST(`ADS`.`Feature_28` AS DOUBLE) AS `Feature_28`, CAST(`ADS`.`Feature_29` AS DOUBLE) AS `Feature_29`, CAST(`ADS`.`Feature_30` AS DOUBLE) AS `Feature_30`, CAST(`ADS`.`Feature_31` AS DOUBLE) AS `Feature_31`, CAST(`ADS`.`Feature_32` AS DOUBLE) AS `Feature_32`, CAST(`ADS`.`Feature_33` AS DOUBLE) AS `Feature_33`, CAST(`ADS`.`Feature_34` AS DOUBLE) AS `Feature_34`, CAST(`ADS`.`Feature_35` AS DOUBLE) AS `Feature_35`, CAST(`ADS`.`Feature_36` AS DOUBLE) AS `Feature_36`, CAST(`ADS`.`Feature_37` AS DOUBLE) AS `Feature_37`, CAST(`ADS`.`Feature_38` AS DOUBLE) AS `Feature_38`, CAST(`ADS`.`Feature_39` AS DOUBLE) AS `Feature_39`, CAST(`ADS`.`Feature_40` AS DOUBLE) AS `Feature_40`, CAST(`ADS`.`Feature_41` AS DOUBLE) AS `Feature_41`, CAST(`ADS`.`Feature_42` AS DOUBLE) AS `Feature_42`, CAST(`ADS`.`Feature_43` AS DOUBLE) AS `Feature_43`, CAST(`ADS`.`Feature_44` AS DOUBLE) AS `Feature_44`, CAST(`ADS`.`Feature_45` AS DOUBLE) AS `Feature_45`, CAST(`ADS`.`Feature_46` AS DOUBLE) AS `Feature_46`, CAST(`ADS`.`Feature_47` AS DOUBLE) AS `Feature_47`, CAST(`ADS`.`Feature_48` AS DOUBLE) AS `Feature_48`, CAST(`ADS`.`Feature_49` AS DOUBLE) AS `Feature_49`, CAST(`ADS`.`Feature_50` AS DOUBLE) AS `Feature_50`, CAST(`ADS`.`Feature_51` AS DOUBLE) AS `Feature_51`, CAST(`ADS`.`Feature_52` AS DOUBLE) AS `Feature_52`, CAST(`ADS`.`Feature_53` AS DOUBLE) AS `Feature_53`, CAST(`ADS`.`Feature_54` AS DOUBLE) AS `Feature_54`, CAST(`ADS`.`Feature_55` AS DOUBLE) AS `Feature_55`, CAST(`ADS`.`Feature_56` AS DOUBLE) AS `Feature_56`, CAST(`ADS`.`Feature_57` AS DOUBLE) AS `Feature_57`, CAST(`ADS`.`Feature_58` AS DOUBLE) AS `Feature_58`, CAST(`ADS`.`Feature_59` AS DOUBLE) AS `Feature_59`, CAST(`ADS`.`Feature_60` AS DOUBLE) AS `Feature_60`, CAST(`ADS`.`Feature_61` AS DOUBLE) AS `Feature_61`, CAST(`ADS`.`Feature_62` AS DOUBLE) AS `Feature_62`, CAST(`ADS`.`Feature_63` AS DOUBLE) AS `Feature_63`, CAST(`ADS`.`Feature_64` AS DOUBLE) AS `Feature_64`, CAST(`ADS`.`Feature_65` AS DOUBLE) AS `Feature_65`, CAST(`ADS`.`Feature_66` AS DOUBLE) AS `Feature_66`, CAST(`ADS`.`Feature_67` AS DOUBLE) AS `Feature_67`, CAST(`ADS`.`Feature_68` AS DOUBLE) AS `Feature_68`, CAST(`ADS`.`Feature_69` AS DOUBLE) AS `Feature_69`, CAST(`ADS`.`Feature_70` AS DOUBLE) AS `Feature_70`, CAST(`ADS`.`Feature_71` AS DOUBLE) AS `Feature_71`, CAST(`ADS`.`Feature_72` AS DOUBLE) AS `Feature_72`, CAST(`ADS`.`Feature_73` AS DOUBLE) AS `Feature_73`, CAST(`ADS`.`Feature_74` AS DOUBLE) AS `Feature_74`, CAST(`ADS`.`Feature_75` AS DOUBLE) AS `Feature_75`, CAST(`ADS`.`Feature_76` AS DOUBLE) AS `Feature_76`, CAST(`ADS`.`Feature_77` AS DOUBLE) AS `Feature_77`, CAST(`ADS`.`Feature_78` AS DOUBLE) AS `Feature_78`, CAST(`ADS`.`Feature_79` AS DOUBLE) AS `Feature_79`, CAST(`ADS`.`Feature_80` AS DOUBLE) AS `Feature_80`, CAST(`ADS`.`Feature_81` AS DOUBLE) AS `Feature_81`, CAST(`ADS`.`Feature_82` AS DOUBLE) AS `Feature_82`, CAST(`ADS`.`Feature_83` AS DOUBLE) AS `Feature_83`, CAST(`ADS`.`Feature_84` AS DOUBLE) AS `Feature_84`, CAST(`ADS`.`Feature_85` AS DOUBLE) AS `Feature_85`, CAST(`ADS`.`Feature_86` AS DOUBLE) AS `Feature_86`, CAST(`ADS`.`Feature_87` AS DOUBLE) AS `Feature_87`, CAST(`ADS`.`Feature_88` AS DOUBLE) AS `Feature_88`, CAST(`ADS`.`Feature_89` AS DOUBLE) AS `Feature_89`, CAST(`ADS`.`Feature_90` AS DOUBLE) AS `Feature_90`, CAST(`ADS`.`Feature_91` AS DOUBLE) AS `Feature_91`, CAST(`ADS`.`Feature_92` AS DOUBLE) AS `Feature_92`, CAST(`ADS`.`Feature_93` AS DOUBLE) AS `Feature_93`, CAST(`ADS`.`Feature_94` AS DOUBLE) AS `Feature_94`, CAST(`ADS`.`Feature_95` AS DOUBLE) AS `Feature_95`, CAST(`ADS`.`Feature_96` AS DOUBLE) AS `Feature_96`, CAST(`ADS`.`Feature_97` AS DOUBLE) AS `Feature_97`, CAST(`ADS`.`Feature_98` AS DOUBLE) AS `Feature_98`, CAST(`ADS`.`Feature_99` AS DOUBLE) AS `Feature_99` 
FROM `RandomReg_100` AS `ADS`), 
earth_model_cte AS 
(SELECT earth_input.`KEY` AS `KEY`, 87.88599107900968 * greatest(earth_input.`Feature_80` - -0.07166164372372062, 0) + -86.34500257357992 * greatest(-0.07166164372372062 - earth_input.`Feature_80`, 0) + 86.84670510394018 * greatest(earth_input.`Feature_95` - -0.1475151646292369, 0) + -89.71222363641913 * greatest(-0.1475151646292369 - earth_input.`Feature_95`, 0) + 68.96155028752935 * greatest(earth_input.`Feature_63` - 0.6243585548374928, 0) + -74.00081476577769 * greatest(0.6243585548374928 - earth_input.`Feature_63`, 0) + 78.65774271083326 * greatest(earth_input.`Feature_41` - 0.3946384614277951, 0) + -70.0962426232608 * greatest(0.3946384614277951 - earth_input.`Feature_41`, 0) + 81.95230794292853 * greatest(earth_input.`Feature_39` - 0.5504227734683368, 0) + -80.55141891631816 * greatest(0.5504227734683368 - earth_input.`Feature_39`, 0) + 33.91250036696233 * greatest(earth_input.`Feature_49` - -0.8961723373627033, 0) + -19.313980350018237 * greatest(-0.8961723373627033 - earth_input.`Feature_49`, 0) + 28.12790037969905 * greatest(earth_input.`Feature_44` - -1.031346732954803, 0) + 23.76570440391136 * greatest(earth_input.`Feature_16` - -0.9258643993117348, 0) + -18.31882872152421 * greatest(0.6840689176766821 - earth_input.`Feature_68`, 0) + 25.3959143740398 AS `Estimator` 
FROM earth_input)
 SELECT earth_model_cte.`KEY` AS `KEY`, earth_model_cte.`Estimator` AS `Estimator` 
FROM earth_model_cte