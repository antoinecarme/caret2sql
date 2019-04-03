-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial
-- Dataset : freidman2
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM "FREIDMAN2" AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.5261250461795391 AS dual_coeff, 0.4044696634344845 AS sv_0, 1.5110797542243983 AS sv_1, 0.12386776664604855 AS sv_2, -0.9833606242368756 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 1 AS sv_idx, -0.4441319750393234 AS dual_coeff, -0.12782307796584916 AS sv_0, -0.8503971026347199 AS sv_1, -1.6859904237278465 AS sv_2, -0.5050895326574296 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 2 AS sv_idx, -0.38963624650601697 AS dual_coeff, 0.1761714069719212 AS sv_0, 1.4752368786239873 AS sv_1, -1.3832462117331343 AS sv_2, -0.6073360229414164 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS sv_idx, 0.2702786548001017 AS dual_coeff, -0.061452150015480836 AS sv_0, 0.3774517898163364 AS sv_1, 0.8031840175318877 AS sv_2, 0.30220624018005193 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS sv_idx, -0.6106092907506894 AS dual_coeff, -0.21152729584795463 AS sv_0, -1.7444439677525907 AS sv_1, 0.4004397884124831 AS sv_2, -1.280761716963789 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, 0.041766113433661996 AS sv_0, 1.4674056735783634 AS sv_1, 1.0087784473355752 AS sv_2, 1.268788761557724 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS sv_idx, 1.0 AS dual_coeff, -0.040434821565860604 AS sv_0, 0.33316647170492614 AS sv_1, 1.516378433743919 AS sv_2, -1.0779792006390798 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 7 AS sv_idx, -0.0966365763427289 AS dual_coeff, 0.4845753005844594 AS sv_0, 0.725502966823729 AS sv_1, -1.2434118981628448 AS sv_2, -0.4749462919614678 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 8 AS sv_idx, -0.22818016904534835 AS dual_coeff, 0.2606505517419123 AS sv_0, -1.1491857713604607 AS sv_1, -1.460611402459679 AS sv_2, -1.052479326928032 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 9 AS sv_idx, -0.5179989222047412 AS dual_coeff, 2.1441062194703595 AS sv_0, -1.5860201052988994 AS sv_1, 0.887640633884356 AS sv_2, -1.4027307340509194 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 10 AS sv_idx, 0.7164685121313453 AS dual_coeff, -1.4312471633180324 AS sv_0, 0.5463310590653604 AS sv_1, 0.934906650923215 AS sv_2, -0.20997937151655952 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 11 AS sv_idx, -0.7469613528085861 AS dual_coeff, 0.7297966940855642 AS sv_0, -1.0546257130717192 AS sv_1, -1.6324213800380485 AS sv_2, 1.2758491111612755 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 12 AS sv_idx, -0.6175074516839401 AS dual_coeff, -0.18411878423931247 AS sv_0, 0.4670017978456244 AS sv_1, -1.7720973589464624 AS sv_2, 0.2072268552988088 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 13 AS sv_idx, -0.029569810911161176 AS dual_coeff, 0.6826754233314936 AS sv_0, -0.27216796886072964 AS sv_1, -1.161707552508324 AS sv_2, 0.7552985898220035 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 14 AS sv_idx, -0.5760609696678444 AS dual_coeff, -1.1235642146527816 AS sv_0, 1.6831962197372268 AS sv_1, -1.7985020645272316 AS sv_2, -0.8477663172082077 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 15 AS sv_idx, -0.2760201944518288 AS dual_coeff, 1.6667800581458547 AS sv_0, -0.6183101662033021 AS sv_1, -0.7810149971816368 AS sv_2, -0.767384669273583 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 16 AS sv_idx, -0.02894027225051848 AS dual_coeff, -1.4593802161589065 AS sv_0, 0.7018378149519552 AS sv_1, -0.9101131840730574 AS sv_2, -1.2754210367439045 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 17 AS sv_idx, -0.13535241804225706 AS dual_coeff, -0.13407363073193884 AS sv_0, -1.2484766986547693 AS sv_1, 1.5947158390479141 AS sv_2, -1.4497212689408288 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 18 AS sv_idx, 0.33855735621566724 AS dual_coeff, 1.093352025970274 AS sv_0, 0.37879673097191136 AS sv_1, 1.4295314017838043 AS sv_2, 0.09299261931469872 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 19 AS sv_idx, 0.28712902334038376 AS dual_coeff, 0.6411220484196439 AS sv_0, 1.1281510018558745 AS sv_1, 0.26693740474024635 AS sv_2, -1.2298826895146424 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 20 AS sv_idx, 1.0 AS dual_coeff, -1.2956953232218467 AS sv_0, 1.4987717050067189 AS sv_1, 0.6045319069288794 AS sv_2, -0.049480778656289616 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 21 AS sv_idx, 0.5452306809476817 AS dual_coeff, -0.3277555483076999 AS sv_0, 1.6444901489977306 AS sv_1, 0.02537289323251288 AS sv_2, -0.7554856825861698 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 22 AS sv_idx, -0.1405671886976435 AS dual_coeff, 0.9667911606739577 AS sv_0, 0.560283003864504 AS sv_1, -0.9587146348985598 AS sv_2, -0.3528923186995045 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 23 AS sv_idx, -0.513245735145607 AS dual_coeff, 2.010032312501274 AS sv_0, 0.09530861930129075 AS sv_1, -1.1913671710570364 AS sv_2, -1.618815287158773 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 24 AS sv_idx, 0.420651147509376 AS dual_coeff, 0.9946938352219382 AS sv_0, 1.4926969396282823 AS sv_1, -0.3469838908117189 AS sv_2, 0.4282157274143781 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 25 AS sv_idx, 1.0 AS dual_coeff, -0.1743166818336495 AS sv_0, 1.1501017450587885 AS sv_1, 1.5363842711868212 AS sv_2, 1.551694080146041 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 26 AS sv_idx, -0.2518508790603061 AS dual_coeff, 0.4817765801022509 AS sv_0, -1.2711686162379985 AS sv_1, 1.0632281967706565 AS sv_2, 1.1966669970792532 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 27 AS sv_idx, -0.557041882503221 AS dual_coeff, 0.21406979439593113 AS sv_0, -1.5118055059174604 AS sv_1, -0.401528196386498 AS sv_2, -0.039017517211154665 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 28 AS sv_idx, -0.6866557987798597 AS dual_coeff, -1.0864384290982352 AS sv_0, -1.6483271949983815 AS sv_1, 0.6144078655656166 AS sv_2, 1.1229003779563531 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 29 AS sv_idx, -0.2854266010023444 AS dual_coeff, 1.815625146237454 AS sv_0, -1.384316192930798 AS sv_1, 0.0969175461491404 AS sv_2, -0.8002898195560286 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 30 AS sv_idx, 0.2351532463112501 AS dual_coeff, 0.06939440587871522 AS sv_0, 0.6598021530180682 AS sv_1, 0.7397966688562453 AS sv_2, -1.4580455298122348 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 31 AS sv_idx, 0.1189902896096632 AS dual_coeff, -0.5000185056309808 AS sv_0, 0.6748373765105417 AS sv_1, -0.9220970631704558 AS sv_2, -0.08831240284391073 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 32 AS sv_idx, 0.6104489608808015 AS dual_coeff, -0.5952690272098226 AS sv_0, 1.534871416711849 AS sv_1, 0.3571820351748573 AS sv_2, 0.7883259704629011 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 33 AS sv_idx, -0.31864385249744936 AS dual_coeff, 1.3150556162964542 AS sv_0, -0.5059581919472076 AS sv_1, -1.0661972420808348 AS sv_2, 1.1270305001877208 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 34 AS sv_idx, -0.4380279881487475 AS dual_coeff, -1.2164497979438718 AS sv_0, 1.503310417535894 AS sv_1, -1.6659814454902533 AS sv_2, -1.3456333509575589 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 35 AS sv_idx, -0.05791936849377261 AS dual_coeff, 0.9598310145490558 AS sv_0, -0.7961729965939714 AS sv_1, -0.9966868722889398 AS sv_2, 0.5325838215197826 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 36 AS sv_idx, -0.09444152743067823 AS dual_coeff, -0.6393876588754417 AS sv_0, 0.4552812872104025 AS sv_1, 0.0453310496742652 AS sv_2, -0.4257327196658084 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 37 AS sv_idx, -0.004084352591072611 AS dual_coeff, -0.008120044849170525 AS sv_0, 1.5461995199793308 AS sv_1, -0.39686978766106656 AS sv_2, -0.9878565201234888 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 38 AS sv_idx, -0.42041210487917025 AS dual_coeff, -0.9894374348380393 AS sv_0, 1.1628195030168447 AS sv_1, -1.6348530109335948 AS sv_2, 0.06543940945798173 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 39 AS sv_idx, -0.31283906770416137 AS dual_coeff, -1.3445193007126655 AS sv_0, 0.476367891619324 AS sv_1, -1.0814171294453323 AS sv_2, 1.4174747937922738 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 40 AS sv_idx, -0.3806357818100538 AS dual_coeff, 1.248222153817392 AS sv_0, -1.563630716242603 AS sv_1, 0.8019197781960634 AS sv_2, 0.18477273030127928 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 41 AS sv_idx, -0.34219149388689 AS dual_coeff, -0.08429331712502665 AS sv_0, -1.0999319759856232 AS sv_1, -1.4761017015390492 AS sv_2, -1.1829469095899825 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 42 AS sv_idx, -0.8356909480864384 AS dual_coeff, -1.6140966135148043 AS sv_0, -1.7643768278128538 AS sv_1, -0.6526951695405658 AS sv_2, 1.1878103980702412 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 43 AS sv_idx, 0.36936270281610717 AS dual_coeff, 0.9844415585345324 AS sv_0, -0.001260824801652486 AS sv_1, 0.8996658839265234 AS sv_2, 1.4677508300650692 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 44 AS sv_idx, -0.7684867187824512 AS dual_coeff, -1.0603027345726208 AS sv_0, -0.7477287119197084 AS sv_1, -1.6186493290430493 AS sv_2, 1.2695784995912052 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 45 AS sv_idx, 0.06490229541838939 AS dual_coeff, -1.5606416440353499 AS sv_0, 0.3056175491951754 AS sv_1, -0.3416547140809151 AS sv_2, 1.2672600790629271 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 46 AS sv_idx, 1.0 AS dual_coeff, 1.75577554800642 AS sv_0, 0.962684681824095 AS sv_1, 1.0869930076042431 AS sv_2, 1.0379200088920848 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 47 AS sv_idx, -0.20071283360024642 AS dual_coeff, 0.977145951082381 AS sv_0, -1.505543173467996 AS sv_1, 1.3851794474085446 AS sv_2, -0.16142774484821756 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 48 AS sv_idx, 1.0 AS dual_coeff, 1.3069659327192833 AS sv_0, 0.1863010691495513 AS sv_1, 1.5113442172696083 AS sv_2, -1.5876587304789196 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 49 AS sv_idx, -0.21154542062803838 AS dual_coeff, 0.16613621334490802 AS sv_0, -0.3981922001971783 AS sv_1, -0.7654272731239506 AS sv_2, -1.6133263333529493 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 50 AS sv_idx, 0.6649103893751416 AS dual_coeff, -1.6042453407535435 AS sv_0, -0.26487689620125343 AS sv_1, 1.3528981281701018 AS sv_2, 1.1669888744725379 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 51 AS sv_idx, -0.4959002910193517 AS dual_coeff, -0.917278251770317 AS sv_0, -1.4509035319107564 AS sv_1, -0.2786390833534205 AS sv_2, -1.3827993897154927 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 52 AS sv_idx, 1.0 AS dual_coeff, 1.3477086249535588 AS sv_0, 0.795308777919337 AS sv_1, 1.5593635512024997 AS sv_2, -0.07389069627856555 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 53 AS sv_idx, 0.04128676377788908 AS dual_coeff, -0.379139513858032 AS sv_0, 0.21256401016685286 AS sv_1, 0.7511161440404381 AS sv_2, -1.5580393682099034 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 54 AS sv_idx, 0.13125765630707875 AS dual_coeff, -0.3774886879153139 AS sv_0, 0.09160188642436172 AS sv_1, 1.4845066754343574 AS sv_2, -1.076465022258961 AS sv_3 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 55 AS sv_idx, -0.32682724116792844 AS dual_coeff, -0.983380385417142 AS sv_0, -0.18235220597772892 AS sv_1, -1.4685459931960436 AS sv_2, 0.2129505388767858 AS sv_3 FROM SYSIBM.SYSDUMMY1) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.0935858973091664 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * exp(least(100.0, greatest(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2))))) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 499.0928844651739 + 374.0338110593958 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp