-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth
-- Dataset : digits
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9`, CAST(`ADS`.`Feature_10` AS DOUBLE) AS `Feature_10`, CAST(`ADS`.`Feature_11` AS DOUBLE) AS `Feature_11`, CAST(`ADS`.`Feature_12` AS DOUBLE) AS `Feature_12`, CAST(`ADS`.`Feature_13` AS DOUBLE) AS `Feature_13`, CAST(`ADS`.`Feature_14` AS DOUBLE) AS `Feature_14`, CAST(`ADS`.`Feature_15` AS DOUBLE) AS `Feature_15`, CAST(`ADS`.`Feature_16` AS DOUBLE) AS `Feature_16`, CAST(`ADS`.`Feature_17` AS DOUBLE) AS `Feature_17`, CAST(`ADS`.`Feature_18` AS DOUBLE) AS `Feature_18`, CAST(`ADS`.`Feature_19` AS DOUBLE) AS `Feature_19`, CAST(`ADS`.`Feature_20` AS DOUBLE) AS `Feature_20`, CAST(`ADS`.`Feature_21` AS DOUBLE) AS `Feature_21`, CAST(`ADS`.`Feature_22` AS DOUBLE) AS `Feature_22`, CAST(`ADS`.`Feature_23` AS DOUBLE) AS `Feature_23`, CAST(`ADS`.`Feature_24` AS DOUBLE) AS `Feature_24`, CAST(`ADS`.`Feature_25` AS DOUBLE) AS `Feature_25`, CAST(`ADS`.`Feature_26` AS DOUBLE) AS `Feature_26`, CAST(`ADS`.`Feature_27` AS DOUBLE) AS `Feature_27`, CAST(`ADS`.`Feature_28` AS DOUBLE) AS `Feature_28`, CAST(`ADS`.`Feature_29` AS DOUBLE) AS `Feature_29`, CAST(`ADS`.`Feature_30` AS DOUBLE) AS `Feature_30`, CAST(`ADS`.`Feature_31` AS DOUBLE) AS `Feature_31`, CAST(`ADS`.`Feature_32` AS DOUBLE) AS `Feature_32`, CAST(`ADS`.`Feature_33` AS DOUBLE) AS `Feature_33`, CAST(`ADS`.`Feature_34` AS DOUBLE) AS `Feature_34`, CAST(`ADS`.`Feature_35` AS DOUBLE) AS `Feature_35`, CAST(`ADS`.`Feature_36` AS DOUBLE) AS `Feature_36`, CAST(`ADS`.`Feature_37` AS DOUBLE) AS `Feature_37`, CAST(`ADS`.`Feature_38` AS DOUBLE) AS `Feature_38`, CAST(`ADS`.`Feature_39` AS DOUBLE) AS `Feature_39`, CAST(`ADS`.`Feature_40` AS DOUBLE) AS `Feature_40`, CAST(`ADS`.`Feature_41` AS DOUBLE) AS `Feature_41`, CAST(`ADS`.`Feature_42` AS DOUBLE) AS `Feature_42`, CAST(`ADS`.`Feature_43` AS DOUBLE) AS `Feature_43`, CAST(`ADS`.`Feature_44` AS DOUBLE) AS `Feature_44`, CAST(`ADS`.`Feature_45` AS DOUBLE) AS `Feature_45`, CAST(`ADS`.`Feature_46` AS DOUBLE) AS `Feature_46`, CAST(`ADS`.`Feature_47` AS DOUBLE) AS `Feature_47`, CAST(`ADS`.`Feature_48` AS DOUBLE) AS `Feature_48`, CAST(`ADS`.`Feature_49` AS DOUBLE) AS `Feature_49`, CAST(`ADS`.`Feature_50` AS DOUBLE) AS `Feature_50`, CAST(`ADS`.`Feature_51` AS DOUBLE) AS `Feature_51`, CAST(`ADS`.`Feature_52` AS DOUBLE) AS `Feature_52`, CAST(`ADS`.`Feature_53` AS DOUBLE) AS `Feature_53`, CAST(`ADS`.`Feature_54` AS DOUBLE) AS `Feature_54`, CAST(`ADS`.`Feature_55` AS DOUBLE) AS `Feature_55`, CAST(`ADS`.`Feature_56` AS DOUBLE) AS `Feature_56`, CAST(`ADS`.`Feature_57` AS DOUBLE) AS `Feature_57`, CAST(`ADS`.`Feature_58` AS DOUBLE) AS `Feature_58`, CAST(`ADS`.`Feature_59` AS DOUBLE) AS `Feature_59`, CAST(`ADS`.`Feature_60` AS DOUBLE) AS `Feature_60`, CAST(`ADS`.`Feature_61` AS DOUBLE) AS `Feature_61`, CAST(`ADS`.`Feature_62` AS DOUBLE) AS `Feature_62`, CAST(`ADS`.`Feature_63` AS DOUBLE) AS `Feature_63` 
FROM digits AS `ADS`), 
earth_model_cte AS 
(SELECT earth_input.`KEY` AS `KEY`, 3.5745633977147686 * greatest(earth_input.`Feature_33` - 7.0, 0) + -2.833203430137122 * greatest(7.0 - earth_input.`Feature_33`, 0) + 9.064751900214171 * greatest(earth_input.`Feature_21` - 3.0, 0) + -13.317279167823973 * greatest(3.0 - earth_input.`Feature_21`, 0) + 5.628657338491868 * greatest(8.0 - earth_input.`Feature_60`, 0) + 22.19445079306912 * greatest(5.0 - earth_input.`Feature_43`, 0) + 7.8340520881455795 * greatest(earth_input.`Feature_27` - 15.0, 0) + 7.7489715243099715 * greatest(15.0 - earth_input.`Feature_27`, 0) + -14.656672779681644 * greatest(earth_input.`Feature_36` - 3.0, 0) + 15.635733273769846 * greatest(3.0 - earth_input.`Feature_36`, 0) + -11.560399729302096 * greatest(earth_input.`Feature_10` - 7.0, 0) + -12.844378781358373 * greatest(7.0 - earth_input.`Feature_10`, 0) + -12.138456141283411 * greatest(14.0 - earth_input.`Feature_42`, 0) + 8.24245718545056 * greatest(earth_input.`Feature_26` - 2.0, 0) + -28.105975562123124 * greatest(2.0 - earth_input.`Feature_26`, 0) + -5.005343313207331 * greatest(earth_input.`Feature_46` - 1.0, 0) + -167.51077588931275 AS `Score_0`, -0.8551500515732691 * greatest(earth_input.`Feature_33` - 7.0, 0) + 0.2376951926254322 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.04729706793407463 * greatest(earth_input.`Feature_21` - 3.0, 0) + 0.006382093633574719 * greatest(3.0 - earth_input.`Feature_21`, 0) + -0.39156603516325855 * greatest(8.0 - earth_input.`Feature_60`, 0) + -0.22597736394328624 * greatest(5.0 - earth_input.`Feature_43`, 0) + 2.547662051567078 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.08768601450925165 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.06341798524423717 * greatest(earth_input.`Feature_36` - 3.0, 0) + -0.6566226491290712 * greatest(3.0 - earth_input.`Feature_36`, 0) + -0.3505637567567652 * greatest(earth_input.`Feature_10` - 7.0, 0) + 0.2747099196495673 * greatest(7.0 - earth_input.`Feature_10`, 0) + 0.08800925921504707 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.03568859709414658 * greatest(earth_input.`Feature_26` - 2.0, 0) + -0.14931693313634706 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.5476695939895899 * greatest(earth_input.`Feature_46` - 1.0, 0) + -3.7859205525806856 AS `Score_1`, -9.506583648820833 * greatest(earth_input.`Feature_33` - 7.0, 0) + 1.1125967123701312 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.21169884080254506 * greatest(earth_input.`Feature_21` - 3.0, 0) + 0.3636175009509188 * greatest(3.0 - earth_input.`Feature_21`, 0) + -1.0588111440169468 * greatest(8.0 - earth_input.`Feature_60`, 0) + -1.2386174810183033 * greatest(5.0 - earth_input.`Feature_43`, 0) + -0.6060948598913753 * greatest(earth_input.`Feature_27` - 15.0, 0) + 0.5539367691302245 * greatest(15.0 - earth_input.`Feature_27`, 0) + -0.38233401468366784 * greatest(earth_input.`Feature_36` - 3.0, 0) + -0.44215879000994907 * greatest(3.0 - earth_input.`Feature_36`, 0) + 0.2764100672200364 * greatest(earth_input.`Feature_10` - 7.0, 0) + 0.10966107437032488 * greatest(7.0 - earth_input.`Feature_10`, 0) + -0.02402189974247376 * greatest(14.0 - earth_input.`Feature_42`, 0) + -0.6605007038220103 * greatest(earth_input.`Feature_26` - 2.0, 0) + -0.6987033526878581 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.2955639335352047 * greatest(earth_input.`Feature_46` - 1.0, 0) + -6.235859945288574 AS `Score_2`, -9.704736403420592 * greatest(earth_input.`Feature_33` - 7.0, 0) + 0.4766307323686265 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.1700578053782848 * greatest(earth_input.`Feature_21` - 3.0, 0) + -0.6940062398842226 * greatest(3.0 - earth_input.`Feature_21`, 0) + -0.0793176612184435 * greatest(8.0 - earth_input.`Feature_60`, 0) + 0.925107134743924 * greatest(5.0 - earth_input.`Feature_43`, 0) + 0.4407543451547025 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.0810292082675717 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.20036806645902755 * greatest(earth_input.`Feature_36` - 3.0, 0) + -1.4839820203637337 * greatest(3.0 - earth_input.`Feature_36`, 0) + -0.10215768900399833 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.5735500986276888 * greatest(7.0 - earth_input.`Feature_10`, 0) + 0.10849213524275078 * greatest(14.0 - earth_input.`Feature_42`, 0) + -0.315061110920232 * greatest(earth_input.`Feature_26` - 2.0, 0) + 1.1113633997658638 * greatest(2.0 - earth_input.`Feature_26`, 0) + 0.2532913671179213 * greatest(earth_input.`Feature_46` - 1.0, 0) + -8.504709779516073 AS `Score_3`, 0.42351620550367863 * greatest(earth_input.`Feature_33` - 7.0, 0) + -0.3817142463418725 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.16813056210526467 * greatest(earth_input.`Feature_21` - 3.0, 0) + -0.44100665913212234 * greatest(3.0 - earth_input.`Feature_21`, 0) + 0.09438783983820909 * greatest(8.0 - earth_input.`Feature_60`, 0) + -0.4554233090487162 * greatest(5.0 - earth_input.`Feature_43`, 0) + -2.933060618598704 * greatest(earth_input.`Feature_27` - 15.0, 0) + 0.03818008028475909 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.1341914576863793 * greatest(earth_input.`Feature_36` - 3.0, 0) + 0.24883216308655184 * greatest(3.0 - earth_input.`Feature_36`, 0) + -0.2337303640472005 * greatest(earth_input.`Feature_10` - 7.0, 0) + 0.4476585112004106 * greatest(7.0 - earth_input.`Feature_10`, 0) + -0.002697414131959665 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.22609616048909564 * greatest(earth_input.`Feature_26` - 2.0, 0) + -13.19087251336881 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.31868550287742853 * greatest(earth_input.`Feature_46` - 1.0, 0) + -3.0468493227391815 AS `Score_4`, 0.19865760921759115 * greatest(earth_input.`Feature_33` - 7.0, 0) + -0.36946160775223214 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.3679518949250497 * greatest(earth_input.`Feature_21` - 3.0, 0) + 2.1650313807040846 * greatest(3.0 - earth_input.`Feature_21`, 0) + 0.4975026600423564 * greatest(8.0 - earth_input.`Feature_60`, 0) + 0.5153563224327956 * greatest(5.0 - earth_input.`Feature_43`, 0) + -1.3572823850982891 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.0780001269725436 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.02679591150797022 * greatest(earth_input.`Feature_36` - 3.0, 0) + 1.0123923590671315 * greatest(3.0 - earth_input.`Feature_36`, 0) + 0.4427778237727935 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.5575135490485289 * greatest(7.0 - earth_input.`Feature_10`, 0) + 0.4582373575954568 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.4510383258387525 * greatest(earth_input.`Feature_26` - 2.0, 0) + 0.6282502737080458 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.15856984671206362 * greatest(earth_input.`Feature_46` - 1.0, 0) + -17.462320475627227 AS `Score_5`, -1.148070769242591 * greatest(earth_input.`Feature_33` - 7.0, 0) + 0.02762217191984201 * greatest(7.0 - earth_input.`Feature_33`, 0) + -0.5625660970954802 * greatest(earth_input.`Feature_21` - 3.0, 0) + 1.1376844335417502 * greatest(3.0 - earth_input.`Feature_21`, 0) + -17.889432339135045 * greatest(8.0 - earth_input.`Feature_60`, 0) + -0.2503811805978936 * greatest(5.0 - earth_input.`Feature_43`, 0) + -2.384940837735998 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.0071739297325085815 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.03984144892156363 * greatest(earth_input.`Feature_36` - 3.0, 0) + -0.4952308859286552 * greatest(3.0 - earth_input.`Feature_36`, 0) + -0.4778883069994233 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.5863284127603383 * greatest(7.0 - earth_input.`Feature_10`, 0) + -0.702906294504489 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.001638195737160299 * greatest(earth_input.`Feature_26` - 2.0, 0) + -2.927895901431901 * greatest(2.0 - earth_input.`Feature_26`, 0) + 0.5473523627848836 * greatest(earth_input.`Feature_46` - 1.0, 0) + -0.043537321356935325 AS `Score_6`, -0.8965457704642437 * greatest(earth_input.`Feature_33` - 7.0, 0) + -0.2515174551254953 * greatest(7.0 - earth_input.`Feature_33`, 0) + 0.010284917958512569 * greatest(earth_input.`Feature_21` - 3.0, 0) + -0.6816018589120572 * greatest(3.0 - earth_input.`Feature_21`, 0) + 0.8515374484949857 * greatest(8.0 - earth_input.`Feature_60`, 0) + -0.03877062351287845 * greatest(5.0 - earth_input.`Feature_43`, 0) + -0.33995276768668975 * greatest(earth_input.`Feature_27` - 15.0, 0) + 0.2110854275923822 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.10006616644718218 * greatest(earth_input.`Feature_36` - 3.0, 0) + -11.92495953320783 * greatest(3.0 - earth_input.`Feature_36`, 0) + -0.235769905055056 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.17494929252553124 * greatest(7.0 - earth_input.`Feature_10`, 0) + -0.001976995545743211 * greatest(14.0 - earth_input.`Feature_42`, 0) + -0.2783317290457189 * greatest(earth_input.`Feature_26` - 2.0, 0) + -0.9648621361719256 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.29478048458830464 * greatest(earth_input.`Feature_46` - 1.0, 0) + -1.3619866032540495 AS `Score_7`, -0.16770598547083268 * greatest(earth_input.`Feature_33` - 7.0, 0) + 0.3505358625120492 * greatest(7.0 - earth_input.`Feature_33`, 0) + 0.14184272384881896 * greatest(earth_input.`Feature_21` - 3.0, 0) + -0.8400074646578525 * greatest(3.0 - earth_input.`Feature_21`, 0) + -0.4599754342956613 * greatest(8.0 - earth_input.`Feature_60`, 0) + -0.2818411699679628 * greatest(5.0 - earth_input.`Feature_43`, 0) + -1.9342562899565037 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.2905777834910527 * greatest(15.0 - earth_input.`Feature_27`, 0) + 0.1114922578744958 * greatest(earth_input.`Feature_36` - 3.0, 0) + -0.3659869529881245 * greatest(3.0 - earth_input.`Feature_36`, 0) + 0.1429640230756214 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.2598048546274609 * greatest(7.0 - earth_input.`Feature_10`, 0) + -0.22059676932843453 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.03390828245433843 * greatest(earth_input.`Feature_26` - 2.0, 0) + -0.6620173577527158 * greatest(2.0 - earth_input.`Feature_26`, 0) + -0.14425024647966686 * greatest(earth_input.`Feature_46` - 1.0, 0) + -2.1681358825617374 AS `Score_8`, -14.37126297267605 * greatest(earth_input.`Feature_33` - 7.0, 0) + 0.5962182923085358 * greatest(7.0 - earth_input.`Feature_33`, 0) + 0.3980031011451307 * greatest(earth_input.`Feature_21` - 3.0, 0) + -1.473110845899417 * greatest(3.0 - earth_input.`Feature_21`, 0) + 0.058276161627176824 * greatest(8.0 - earth_input.`Feature_60`, 0) + 0.6759452889544784 * greatest(5.0 - earth_input.`Feature_43`, 0) + -0.049367134712176235 * greatest(earth_input.`Feature_27` - 15.0, 0) + -0.18883639709853167 * greatest(15.0 - earth_input.`Feature_27`, 0) + -0.2707749256192565 * greatest(earth_input.`Feature_36` - 3.0, 0) + 0.034731856410053434 * greatest(3.0 - earth_input.`Feature_36`, 0) + 0.12688738017395454 * greatest(earth_input.`Feature_10` - 7.0, 0) + -0.28585958555511864 * greatest(7.0 - earth_input.`Feature_10`, 0) + 0.3475445727291324 * greatest(14.0 - earth_input.`Feature_42`, 0) + 0.17940270679833314 * greatest(earth_input.`Feature_26` - 2.0, 0) + -1.3048640634615072 * greatest(2.0 - earth_input.`Feature_26`, 0) + 0.07412999765517156 * greatest(earth_input.`Feature_46` - 1.0, 0) + -14.445246487910625 AS `Score_9` 
FROM earth_input), 
earth_model_cte_logistic AS 
(SELECT earth_model_cte.`KEY` AS `KEY`, earth_model_cte.`Score_0` AS `Score_0`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_0`)))) AS `Logistic_0`, earth_model_cte.`Score_1` AS `Score_1`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_1`)))) AS `Logistic_1`, earth_model_cte.`Score_2` AS `Score_2`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_2`)))) AS `Logistic_2`, earth_model_cte.`Score_3` AS `Score_3`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_3`)))) AS `Logistic_3`, earth_model_cte.`Score_4` AS `Score_4`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_4`)))) AS `Logistic_4`, earth_model_cte.`Score_5` AS `Score_5`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_5`)))) AS `Logistic_5`, earth_model_cte.`Score_6` AS `Score_6`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_6`)))) AS `Logistic_6`, earth_model_cte.`Score_7` AS `Score_7`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_7`)))) AS `Logistic_7`, earth_model_cte.`Score_8` AS `Score_8`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_8`)))) AS `Logistic_8`, earth_model_cte.`Score_9` AS `Score_9`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -earth_model_cte.`Score_9`)))) AS `Logistic_9` 
FROM earth_model_cte), 
orig_cte AS 
(SELECT earth_model_cte_logistic.`KEY` AS `KEY`, earth_model_cte_logistic.`Score_0` AS `Score_0`, earth_model_cte_logistic.`Score_1` AS `Score_1`, earth_model_cte_logistic.`Score_2` AS `Score_2`, earth_model_cte_logistic.`Score_3` AS `Score_3`, earth_model_cte_logistic.`Score_4` AS `Score_4`, earth_model_cte_logistic.`Score_5` AS `Score_5`, earth_model_cte_logistic.`Score_6` AS `Score_6`, earth_model_cte_logistic.`Score_7` AS `Score_7`, earth_model_cte_logistic.`Score_8` AS `Score_8`, earth_model_cte_logistic.`Score_9` AS `Score_9`, earth_model_cte_logistic.`Logistic_0` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_0`, earth_model_cte_logistic.`Logistic_1` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_1`, earth_model_cte_logistic.`Logistic_2` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_2`, earth_model_cte_logistic.`Logistic_3` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_3`, earth_model_cte_logistic.`Logistic_4` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_4`, earth_model_cte_logistic.`Logistic_5` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_5`, earth_model_cte_logistic.`Logistic_6` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_6`, earth_model_cte_logistic.`Logistic_7` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_7`, earth_model_cte_logistic.`Logistic_8` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_8`, earth_model_cte_logistic.`Logistic_9` / (earth_model_cte_logistic.`Logistic_0` + earth_model_cte_logistic.`Logistic_1` + earth_model_cte_logistic.`Logistic_2` + earth_model_cte_logistic.`Logistic_3` + earth_model_cte_logistic.`Logistic_4` + earth_model_cte_logistic.`Logistic_5` + earth_model_cte_logistic.`Logistic_6` + earth_model_cte_logistic.`Logistic_7` + earth_model_cte_logistic.`Logistic_8` + earth_model_cte_logistic.`Logistic_9`) AS `Proba_9`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, NULL AS `LogProba_2`, NULL AS `LogProba_3`, NULL AS `LogProba_4`, NULL AS `LogProba_5`, NULL AS `LogProba_6`, NULL AS `LogProba_7`, NULL AS `LogProba_8`, NULL AS `LogProba_9`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM earth_model_cte_logistic), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 2 AS class, orig_cte.`LogProba_2` AS `LogProba`, orig_cte.`Proba_2` AS `Proba`, orig_cte.`Score_2` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 3 AS class, orig_cte.`LogProba_3` AS `LogProba`, orig_cte.`Proba_3` AS `Proba`, orig_cte.`Score_3` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 4 AS class, orig_cte.`LogProba_4` AS `LogProba`, orig_cte.`Proba_4` AS `Proba`, orig_cte.`Score_4` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 5 AS class, orig_cte.`LogProba_5` AS `LogProba`, orig_cte.`Proba_5` AS `Proba`, orig_cte.`Score_5` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 6 AS class, orig_cte.`LogProba_6` AS `LogProba`, orig_cte.`Proba_6` AS `Proba`, orig_cte.`Score_6` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 7 AS class, orig_cte.`LogProba_7` AS `LogProba`, orig_cte.`Proba_7` AS `Proba`, orig_cte.`Score_7` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 8 AS class, orig_cte.`LogProba_8` AS `LogProba`, orig_cte.`Proba_8` AS `Proba`, orig_cte.`Score_8` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 9 AS class, orig_cte.`LogProba_9` AS `LogProba`, orig_cte.`Proba_9` AS `Proba`, orig_cte.`Score_9` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Score_2` AS `Score_2`, orig_cte.`Score_3` AS `Score_3`, orig_cte.`Score_4` AS `Score_4`, orig_cte.`Score_5` AS `Score_5`, orig_cte.`Score_6` AS `Score_6`, orig_cte.`Score_7` AS `Score_7`, orig_cte.`Score_8` AS `Score_8`, orig_cte.`Score_9` AS `Score_9`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`Proba_2` AS `Proba_2`, orig_cte.`Proba_3` AS `Proba_3`, orig_cte.`Proba_4` AS `Proba_4`, orig_cte.`Proba_5` AS `Proba_5`, orig_cte.`Proba_6` AS `Proba_6`, orig_cte.`Proba_7` AS `Proba_7`, orig_cte.`Proba_8` AS `Proba_8`, orig_cte.`Proba_9` AS `Proba_9`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`LogProba_2` AS `LogProba_2`, orig_cte.`LogProba_3` AS `LogProba_3`, orig_cte.`LogProba_4` AS `LogProba_4`, orig_cte.`LogProba_5` AS `LogProba_5`, orig_cte.`LogProba_6` AS `LogProba_6`, orig_cte.`LogProba_7` AS `LogProba_7`, orig_cte.`LogProba_8` AS `LogProba_8`, orig_cte.`LogProba_9` AS `LogProba_9`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Proba` AS `max_Proba` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Proba`) AS `max_Proba` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Score_4` AS `Score_4`, score_max.`Score_5` AS `Score_5`, score_max.`Score_6` AS `Score_6`, score_max.`Score_7` AS `Score_7`, score_max.`Score_8` AS `Score_8`, score_max.`Score_9` AS `Score_9`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`Proba_4` AS `Proba_4`, score_max.`Proba_5` AS `Proba_5`, score_max.`Proba_6` AS `Proba_6`, score_max.`Proba_7` AS `Proba_7`, score_max.`Proba_8` AS `Proba_8`, score_max.`Proba_9` AS `Proba_9`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`LogProba_4` AS `LogProba_4`, score_max.`LogProba_5` AS `LogProba_5`, score_max.`LogProba_6` AS `LogProba_6`, score_max.`LogProba_7` AS `LogProba_7`, score_max.`LogProba_8` AS `LogProba_8`, score_max.`LogProba_9` AS `LogProba_9`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba` 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.`KEY_u` = score_max.`KEY`), 
arg_max_cte AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Score_4` AS `Score_4`, score_max.`Score_5` AS `Score_5`, score_max.`Score_6` AS `Score_6`, score_max.`Score_7` AS `Score_7`, score_max.`Score_8` AS `Score_8`, score_max.`Score_9` AS `Score_9`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`Proba_4` AS `Proba_4`, score_max.`Proba_5` AS `Proba_5`, score_max.`Proba_6` AS `Proba_6`, score_max.`Proba_7` AS `Proba_7`, score_max.`Proba_8` AS `Proba_8`, score_max.`Proba_9` AS `Proba_9`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`LogProba_4` AS `LogProba_4`, score_max.`LogProba_5` AS `LogProba_5`, score_max.`LogProba_6` AS `LogProba_6`, score_max.`LogProba_7` AS `LogProba_7`, score_max.`LogProba_8` AS `LogProba_8`, score_max.`LogProba_9` AS `LogProba_9`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Proba` AS `max_Proba`, `arg_max_t_Proba`.`KEY_Proba` AS `KEY_Proba`, `arg_max_t_Proba`.`arg_max_Proba` AS `arg_max_Proba` 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Proba`, max(union_with_max.class) AS `arg_max_Proba` 
FROM union_with_max 
WHERE union_with_max.`max_Proba` <= union_with_max.`Proba` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Proba` ON score_max.`KEY` = `arg_max_t_Proba`.`KEY_Proba`)
 SELECT arg_max_cte.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, NULL AS `Score_2`, NULL AS `Score_3`, NULL AS `Score_4`, NULL AS `Score_5`, NULL AS `Score_6`, NULL AS `Score_7`, NULL AS `Score_8`, NULL AS `Score_9`, arg_max_cte.`Proba_0` AS `Proba_0`, arg_max_cte.`Proba_1` AS `Proba_1`, arg_max_cte.`Proba_2` AS `Proba_2`, arg_max_cte.`Proba_3` AS `Proba_3`, arg_max_cte.`Proba_4` AS `Proba_4`, arg_max_cte.`Proba_5` AS `Proba_5`, arg_max_cte.`Proba_6` AS `Proba_6`, arg_max_cte.`Proba_7` AS `Proba_7`, arg_max_cte.`Proba_8` AS `Proba_8`, arg_max_cte.`Proba_9` AS `Proba_9`, CASE WHEN (arg_max_cte.`Proba_0` IS NULL OR arg_max_cte.`Proba_0` > 0.0) THEN ln(arg_max_cte.`Proba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`Proba_1` IS NULL OR arg_max_cte.`Proba_1` > 0.0) THEN ln(arg_max_cte.`Proba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (arg_max_cte.`Proba_2` IS NULL OR arg_max_cte.`Proba_2` > 0.0) THEN ln(arg_max_cte.`Proba_2`) ELSE -1.79769313486231e+308 END AS `LogProba_2`, CASE WHEN (arg_max_cte.`Proba_3` IS NULL OR arg_max_cte.`Proba_3` > 0.0) THEN ln(arg_max_cte.`Proba_3`) ELSE -1.79769313486231e+308 END AS `LogProba_3`, CASE WHEN (arg_max_cte.`Proba_4` IS NULL OR arg_max_cte.`Proba_4` > 0.0) THEN ln(arg_max_cte.`Proba_4`) ELSE -1.79769313486231e+308 END AS `LogProba_4`, CASE WHEN (arg_max_cte.`Proba_5` IS NULL OR arg_max_cte.`Proba_5` > 0.0) THEN ln(arg_max_cte.`Proba_5`) ELSE -1.79769313486231e+308 END AS `LogProba_5`, CASE WHEN (arg_max_cte.`Proba_6` IS NULL OR arg_max_cte.`Proba_6` > 0.0) THEN ln(arg_max_cte.`Proba_6`) ELSE -1.79769313486231e+308 END AS `LogProba_6`, CASE WHEN (arg_max_cte.`Proba_7` IS NULL OR arg_max_cte.`Proba_7` > 0.0) THEN ln(arg_max_cte.`Proba_7`) ELSE -1.79769313486231e+308 END AS `LogProba_7`, CASE WHEN (arg_max_cte.`Proba_8` IS NULL OR arg_max_cte.`Proba_8` > 0.0) THEN ln(arg_max_cte.`Proba_8`) ELSE -1.79769313486231e+308 END AS `LogProba_8`, CASE WHEN (arg_max_cte.`Proba_9` IS NULL OR arg_max_cte.`Proba_9` > 0.0) THEN ln(arg_max_cte.`Proba_9`) ELSE -1.79769313486231e+308 END AS `LogProba_9`, arg_max_cte.`arg_max_Proba` AS `Decision`, arg_max_cte.`max_Proba` AS `DecisionProba` 
FROM arg_max_cte