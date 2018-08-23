-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial
-- Dataset : freidman3
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS `Feature_3` 
FROM freidman3 AS `ADS`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -1.0 AS dual_coeff, -0.12782307796584916 AS sv_0, -0.8503971026347198 AS sv_1, -1.6859904237278465 AS sv_2, -0.5050895326574296 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.18118515361567264 AS dual_coeff, 0.1871421187807054 AS sv_0, 1.5468120391557871 AS sv_1, -0.7518480444237882 AS sv_2, -0.4874496037207571 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, -0.061452150015480836 AS sv_0, 0.3774517898163364 AS sv_1, 0.8031840175318876 AS sv_2, 0.30220624018005193 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, -0.21152729584795466 AS sv_0, -1.7444439677525907 AS sv_1, 0.4004397884124832 AS sv_2, -1.280761716963789 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -1.0 AS dual_coeff, 0.2606505517419123 AS sv_0, -1.1491857713604607 AS sv_1, -1.460611402459679 AS sv_2, -1.052479326928032 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, 1.477576202804345 AS sv_0, -0.9271264867595896 AS sv_1, 0.009704247466632536 AS sv_2, -0.4375335070800741 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, 2.1441062194703595 AS sv_0, -1.5860201052988996 AS sv_1, 0.887640633884356 AS sv_2, -1.4027307340509194 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -1.0 AS dual_coeff, 0.7297966940855642 AS sv_0, -1.0546257130717192 AS sv_1, -1.6324213800380483 AS sv_2, 1.2758491111612755 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -1.0 AS dual_coeff, -0.18411878423931247 AS sv_0, 0.4670017978456244 AS sv_1, -1.7720973589464624 AS sv_2, 0.2072268552988088 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.3836022622914684 AS dual_coeff, 0.6826754233314936 AS sv_0, -0.2721679688607297 AS sv_1, -1.161707552508324 AS sv_2, 0.7552985898220035 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, -1.1235642146527816 AS sv_0, 1.6831962197372268 AS sv_1, -1.7985020645272318 AS sv_2, -0.8477663172082077 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.5657014934157736 AS dual_coeff, 1.6667800581458547 AS sv_0, -0.6183101662033021 AS sv_1, -0.7810149971816369 AS sv_2, -0.767384669273583 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 1.0 AS dual_coeff, -1.4593802161589062 AS sv_0, 0.7018378149519552 AS sv_1, -0.9101131840730574 AS sv_2, -1.2754210367439045 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 0.8328313732924216 AS dual_coeff, -0.13407363073193884 AS sv_0, -1.2484766986547693 AS sv_1, 1.5947158390479141 AS sv_2, -1.4497212689408288 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.7992258503143329 AS dual_coeff, -1.6669124897856251 AS sv_0, -0.8313958413955534 AS sv_1, 1.5909574525996735 AS sv_2, 0.72424156579339 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 0.5820185269894488 AS dual_coeff, -1.2956953232218467 AS sv_0, 1.4987717050067189 AS sv_1, 0.6045319069288795 AS sv_2, -0.049480778656289616 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 0.04880533896681522 AS dual_coeff, -0.706431594106171 AS sv_0, -0.9086748464408037 AS sv_1, 0.403260314283118 AS sv_2, -0.7506058198149691 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -1.0 AS dual_coeff, 2.010032312501274 AS sv_0, 0.09530861930129077 AS sv_1, -1.1913671710570366 AS sv_2, -1.618815287158773 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.6434349335735793 AS dual_coeff, -0.17431668183364954 AS sv_0, 1.1501017450587885 AS sv_1, 1.5363842711868212 AS sv_2, 1.551694080146041 AS sv_3 UNION ALL SELECT 19 AS sv_idx, 0.3103016213000746 AS dual_coeff, 0.4817765801022509 AS sv_0, -1.2711686162379983 AS sv_1, 1.0632281967706563 AS sv_2, 1.1966669970792532 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -0.33982550805404754 AS dual_coeff, 0.21406979439593116 AS sv_0, -1.5118055059174604 AS sv_1, -0.4015281963864979 AS sv_2, -0.039017517211154665 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -0.8865818296204901 AS dual_coeff, -1.0864384290982352 AS sv_0, -1.6483271949983813 AS sv_1, 0.6144078655656166 AS sv_2, 1.1229003779563531 AS sv_3 UNION ALL SELECT 22 AS sv_idx, 1.0 AS dual_coeff, 1.21879454372484 AS sv_0, 0.07229586633146984 AS sv_1, -0.6398301029289686 AS sv_2, 0.17785804513924774 AS sv_3 UNION ALL SELECT 23 AS sv_idx, -0.5852879416351539 AS dual_coeff, 1.815625146237454 AS sv_0, -1.384316192930798 AS sv_1, 0.09691754614914039 AS sv_2, -0.8002898195560286 AS sv_3 UNION ALL SELECT 24 AS sv_idx, 1.0 AS dual_coeff, 1.0970537231905186 AS sv_0, -1.1637961400737291 AS sv_1, 0.1368610720655398 AS sv_2, 0.2696693980106513 AS sv_3 UNION ALL SELECT 25 AS sv_idx, 1.0 AS dual_coeff, -0.5000185056309808 AS sv_0, 0.6748373765105417 AS sv_1, -0.9220970631704556 AS sv_2, -0.08831240284391073 AS sv_3 UNION ALL SELECT 26 AS sv_idx, 0.024934522707544357 AS dual_coeff, 1.3325437335818795 AS sv_0, -0.1327888137316275 AS sv_1, 1.1097257527218722 AS sv_2, 0.8620713355322227 AS sv_3 UNION ALL SELECT 27 AS sv_idx, -1.0 AS dual_coeff, 1.315055616296454 AS sv_0, -0.5059581919472076 AS sv_1, -1.0661972420808348 AS sv_2, 1.1270305001877208 AS sv_3 UNION ALL SELECT 28 AS sv_idx, 0.4077462149439722 AS dual_coeff, -1.2164497979438715 AS sv_0, 1.503310417535894 AS sv_1, -1.665981445490253 AS sv_2, -1.3456333509575589 AS sv_3 UNION ALL SELECT 29 AS sv_idx, -1.0 AS dual_coeff, -0.6393876588754417 AS sv_0, 0.4552812872104025 AS sv_1, 0.0453310496742652 AS sv_2, -0.4257327196658084 AS sv_3 UNION ALL SELECT 30 AS sv_idx, -0.28270962817665674 AS dual_coeff, -0.65853839397246 AS sv_0, 0.4734713679176543 AS sv_1, 0.18031379770736736 AS sv_2, -1.168839753970359 AS sv_3 UNION ALL SELECT 31 AS sv_idx, 1.0 AS dual_coeff, -0.0265344430722154 AS sv_0, -0.0283631248134526 AS sv_1, -0.739570601711903 AS sv_2, 0.16082809124136166 AS sv_3 UNION ALL SELECT 32 AS sv_idx, -0.3686612198605911 AS dual_coeff, -0.9894374348380393 AS sv_0, 1.1628195030168447 AS sv_1, -1.6348530109335948 AS sv_2, 0.06543940945798173 AS sv_3 UNION ALL SELECT 33 AS sv_idx, 1.0 AS dual_coeff, -1.3445193007126655 AS sv_0, 0.476367891619324 AS sv_1, -1.0814171294453323 AS sv_2, 1.4174747937922738 AS sv_3 UNION ALL SELECT 34 AS sv_idx, -1.0 AS dual_coeff, 1.248222153817392 AS sv_0, -1.5636307162426029 AS sv_1, 0.8019197781960634 AS sv_2, 0.18477273030127928 AS sv_3 UNION ALL SELECT 35 AS sv_idx, -1.0 AS dual_coeff, -0.08429331712502666 AS sv_0, -1.0999319759856232 AS sv_1, -1.4761017015390492 AS sv_2, -1.1829469095899825 AS sv_3 UNION ALL SELECT 36 AS sv_idx, 0.6643684281627299 AS dual_coeff, -1.6658117660425131 AS sv_0, -1.467078414584683 AS sv_1, -0.113981723147617 AS sv_2, 0.8450224213755827 AS sv_3 UNION ALL SELECT 37 AS sv_idx, 1.0 AS dual_coeff, -1.6140966135148043 AS sv_0, -1.7643768278128538 AS sv_1, -0.6526951695405658 AS sv_2, 1.1878103980702412 AS sv_3 UNION ALL SELECT 38 AS sv_idx, -1.0 AS dual_coeff, -1.0603027345726208 AS sv_0, -0.7477287119197085 AS sv_1, -1.6186493290430493 AS sv_2, 1.2695784995912052 AS sv_3 UNION ALL SELECT 39 AS sv_idx, -1.0 AS dual_coeff, -1.306038787142802 AS sv_0, 0.2266223683034748 AS sv_1, 0.3037839265673539 AS sv_2, 0.7057290276196071 AS sv_3 UNION ALL SELECT 40 AS sv_idx, 0.004345083966178767 AS dual_coeff, 1.7557755480064199 AS sv_0, 0.962684681824095 AS sv_1, 1.0869930076042431 AS sv_2, 1.0379200088920848 AS sv_3 UNION ALL SELECT 41 AS sv_idx, 0.7159748156477672 AS dual_coeff, 1.3069659327192835 AS sv_0, 0.18630106914955127 AS sv_1, 1.5113442172696083 AS sv_2, -1.5876587304789196 AS sv_3 UNION ALL SELECT 42 AS sv_idx, 1.0 AS dual_coeff, 0.16613621334490802 AS sv_0, -0.3981922001971783 AS sv_1, -0.7654272731239506 AS sv_2, -1.6133263333529493 AS sv_3 UNION ALL SELECT 43 AS sv_idx, 1.0 AS dual_coeff, -0.9172782517703172 AS sv_0, -1.4509035319107564 AS sv_1, -0.2786390833534205 AS sv_2, -1.3827993897154927 AS sv_3 UNION ALL SELECT 44 AS sv_idx, 0.2985905081591594 AS dual_coeff, -0.33584226456881233 AS sv_0, -0.5694885143919526 AS sv_1, 0.28146542960356485 AS sv_2, 1.567207446356592 AS sv_3 UNION ALL SELECT 45 AS sv_idx, 1.0 AS dual_coeff, -0.983380385417142 AS sv_0, -0.18235220597772892 AS sv_1, -1.4685459931960436 AS sv_2, 0.2129505388767858 AS sv_3) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.193477832078369 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * exp(least(100.0, greatest(-100.0, -0.166237820108079 * (power(kernel_input_with_scaling.`Feature_0` - `SV_data`.sv_0, 2) + power(kernel_input_with_scaling.`Feature_1` - `SV_data`.sv_1, 2) + power(kernel_input_with_scaling.`Feature_2` - `SV_data`.sv_2, 2) + power(kernel_input_with_scaling.`Feature_3` - `SV_data`.sv_3, 2))))) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, 1.3612342030259188 + 0.2740412358892127 * kernel_dp.dot_product AS `Estimator` 
FROM kernel_dp