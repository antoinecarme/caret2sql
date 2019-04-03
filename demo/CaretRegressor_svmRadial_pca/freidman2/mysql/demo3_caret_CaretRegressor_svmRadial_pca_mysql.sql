-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial_pca
-- Dataset : freidman2
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `ADS_sca_1_OUT` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS `Feature_3` 
FROM freidman2 AS `ADS`), 
`ADS_pre_1_OUT` AS 
(SELECT `ADS_sca_1_OUT`.`KEY` AS `KEY`, `ADS_sca_1_OUT`.`Feature_0` * -0.6121650749100701 + `ADS_sca_1_OUT`.`Feature_1` * 0.5464782903329433 + `ADS_sca_1_OUT`.`Feature_2` * -0.5708677485644764 + `ADS_sca_1_OUT`.`Feature_3` * -0.02693349038014348 AS `PC1`, `ADS_sca_1_OUT`.`Feature_0` * 0.4888813380420076 + `ADS_sca_1_OUT`.`Feature_1` * 0.2745192584561386 + `ADS_sca_1_OUT`.`Feature_2` * -0.2238449995359107 + `ADS_sca_1_OUT`.`Feature_3` * -0.7971998684355868 AS `PC2`, `ADS_sca_1_OUT`.`Feature_0` * -0.024686176636208892 + `ADS_sca_1_OUT`.`Feature_1` * 0.7091918576518509 + `ADS_sca_1_OUT`.`Feature_2` * 0.7038817472089458 + `ADS_sca_1_OUT`.`Feature_3` * 0.03143227114740615 AS `PC3`, `ADS_sca_1_OUT`.`Feature_0` * -0.6209988333786876 + `ADS_sca_1_OUT`.`Feature_1` * -0.3507813620644518 + `ADS_sca_1_OUT`.`Feature_2` * 0.358544161544677 + `ADS_sca_1_OUT`.`Feature_3` * -0.6022947527521242 AS `PC4` 
FROM `ADS_sca_1_OUT`), 
kernel_input_with_scaling AS 
(SELECT `ADS_pre_1_OUT`.`KEY` AS `KEY`, (CAST(`ADS_pre_1_OUT`.`PC1` AS DOUBLE) - 7.259817746962938e-17) / 1.0912921970850795 AS `PC1`, (CAST(`ADS_pre_1_OUT`.`PC2` AS DOUBLE) - 4.6837533851373785e-17) / 1.0787025043586622 AS `PC2`, (CAST(`ADS_pre_1_OUT`.`PC3` AS DOUBLE) - -6.609296443471634e-17) / 0.9655534556992196 AS `PC3`, (CAST(`ADS_pre_1_OUT`.`PC4` AS DOUBLE) - -2.203098814490545e-17) / 0.8445050454904731 AS `PC4` 
FROM `ADS_pre_1_OUT`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.646769191013195 AS dual_coeff, 0.4892762003654096 AS sv_0, 1.2689003116459674 AS sv_1, 1.1578226394792346 AS sv_2, -0.17116392104601666 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.4454731859860579 AS dual_coeff, 0.5402830262004024 AS sv_0, 0.4487957831249405 AS sv_1, -1.866860113869498 AS sv_2, 0.09164206775144247 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 0.01715851279608752 AS dual_coeff, -0.6466256612557754 AS sv_0, -1.015525733325012 AS sv_1, 0.4912913998424375 AS sv_2, -0.8269450329460986 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -0.38524176385176734 AS dual_coeff, 1.37850089854269 AS sv_0, 1.191161406549864 AS sv_1, 0.05089855230848973 AS sv_2, -0.8964391596224826 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.2867101369640753 AS dual_coeff, -0.2041279617224174 AS sv_0, -0.3218056168617284 AS sv_1, 0.8741601489966333 AS sv_2, 0.01387601886812015 AS sv_3 UNION ALL SELECT 5 AS sv_idx, -0.6181667641759242 AS dual_coeff, -0.9327601846263128 AS sv_0, 0.3236215867921677 AS sv_1, -1.0256487029993109 AS sv_2, 1.9635738752492489 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 1.0 AS dual_coeff, 0.15237495262279765 AS sv_0, -0.7546459295194594 AS sv_1, 1.8534269105418688 AS sv_2, -1.1168298691466336 AS sv_3 UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, -0.5771110361354514 AS sv_0, 0.5484588455313958 AS sv_1, 1.3160792801997816 AS sv_2, 1.3039486790441284 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -0.0450217062404317 AS dual_coeff, 0.7536453208264517 AS sv_0, 1.013275681300776 AS sv_1, -0.401412363459556 AS sv_2, -0.846855843010324 AS sv_3 UNION ALL SELECT 9 AS sv_idx, -0.12504218771559425 AS dual_coeff, 0.06835625209790758 AS sv_0, 0.906589630066836 AS sv_1, -1.949770018391347 AS sv_2, 0.41617080776455456 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -0.5156204228779849 AS dual_coeff, -2.426680482621092 AS sv_0, 1.4205800834242046 AS sv_1, -0.6183182283633606 AS sv_2, 0.459410587788732 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.7293782040793104 AS dual_coeff, 0.5925681629913612 AS sv_0, -0.5484461936167893 AS sv_1, 1.112573468618059 AS sv_2, 1.3722059646374063 AS sv_3 UNION ALL SELECT 12 AS sv_idx, -0.7465165429757363 AS dual_coeff, -0.11504934855312395 AS sv_0, -0.5417883638361547 AS sv_1, -1.941763685449151 AS sv_2, -1.701579213947659 AS sv_3 UNION ALL SELECT 13 AS sv_idx, -0.6486590674695164 AS dual_coeff, 1.2590297301771172 AS sv_0, 0.24998798024988075 AS sv_1, -0.9373839509576531 AS sv_2, -0.958744758432644 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.0320686779243736 AS dual_coeff, 0.4763997822181986 AS sv_0, -1.5221538939615835 AS sv_1, 0.17819954322106238 AS sv_2, -0.1127803950097933 AS sv_3 UNION ALL SELECT 15 AS sv_idx, -0.5735019343059066 AS dual_coeff, 2.4348905833817374 AS sv_0, 0.9188864286304074 AS sv_1, -0.07367219011802745 AS sv_2, -0.03189916572717092 AS sv_3 UNION ALL SELECT 16 AS sv_idx, -0.2493922162535425 AS dual_coeff, -0.8171166287211027 AS sv_0, 1.3272471974497932 AS sv_1, -1.0910942319112715 AS sv_2, -0.7531197124244114 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -0.06622411332884283 AS dual_coeff, 1.6776684906185735 AS sv_0, 0.6486440968299845 AS sv_1, -0.15217930773112234 AS sv_2, 1.304841720465672 AS sv_3 UNION ALL SELECT 18 AS sv_idx, -0.13247165030077285 AS dual_coeff, -1.3484161330190985 AS sv_0, 0.3619825146745239 AS sv_1, 0.20177401272176335 AS sv_2, 2.3281536354101884 AS sv_3 UNION ALL SELECT 19 AS sv_idx, 0.4288224028144007 AS dual_coeff, -1.1737330542943012 AS sv_0, 0.2265492462099888 AS sv_1, 1.2954154932505777 AS sv_2, -0.42072453745123267 AS sv_3 UNION ALL SELECT 20 AS sv_idx, 0.1739724529168028 AS dual_coeff, 0.09601148303744038 AS sv_0, 1.4312022917621923 AS sv_1, 0.9667854304109704 AS sv_2, 0.050432320591730966 AS sv_3 UNION ALL SELECT 21 AS sv_idx, 1.0 AS dual_coeff, 1.1623381422247647 AS sv_0, -0.2946826758671762 AS sv_1, 1.5730523524737925 AS sv_2, 0.6221839714024429 AS sv_3 UNION ALL SELECT 22 AS sv_idx, 0.43006261921600497 AS dual_coeff, 1.0127278173139158 AS sv_0, 0.8230296426822232 AS sv_1, 1.210148370053678 AS sv_2, 0.10752059372689902 AS sv_3 UNION ALL SELECT 23 AS sv_idx, -0.09812373298845142 AS dual_coeff, 0.24846746132122124 AS sv_0, 1.0404943100547939 AS sv_1, -0.3235783275711319 AS sv_2, -1.098998006209131 AS sv_3 UNION ALL SELECT 24 AS sv_idx, -0.5093029702851173 AS dual_coeff, -0.4166382298158355 AS sv_0, 2.378813663050534 AS sv_1, -0.902583443484049 AS sv_2, -0.868927903554924 AS sv_3 UNION ALL SELECT 25 AS sv_idx, 0.41878216440767824 AS dual_coeff, 0.3604517789219356 AS sv_0, 0.5862213120278544 AS sv_1, 0.8319347713017446 AS sv_2, -1.8041752608563224 AS sv_3 UNION ALL SELECT 26 AS sv_idx, 1.0 AS dual_coeff, -0.16828540326040994 AS sv_0, -1.2518904350496618 AS sv_1, 2.0197246545043206 AS sv_2, -0.8039021154910662 AS sv_3 UNION ALL SELECT 27 AS sv_idx, -0.23783893572206746 AS dual_coeff, -1.4925296439214475 AS sv_0, -1.2101666301463625 AS sv_1, -0.13193963626985628 AS sv_2, -0.2283141200818075 AS sv_3 UNION ALL SELECT 28 AS sv_idx, -0.5596886895305584 AS dual_coeff, -0.6661319181728007 AS sv_0, -0.17556291897838608 AS sv_1, -1.409864455953601 AS sv_2, 0.32789686552044434 AS sv_3 UNION ALL SELECT 29 AS sv_idx, -0.6676285879327406 AS dual_coeff, -0.5650957902827647 AS sv_0, -1.8692319578289327 AS sv_1, -0.6984537411456064 AS sv_2, 0.9435761306003548 AS sv_3 UNION ALL SELECT 30 AS sv_idx, -0.2687422718660307 AS dual_coeff, -1.7426437743603151 AS sv_0, 1.0419000812266903 AS sv_1, -1.0185899543813515 AS sv_2, -0.14819236347734366 AS sv_3 UNION ALL SELECT 31 AS sv_idx, 0.13068614745878476 AS dual_coeff, -0.059534085189802514 AS sv_0, 1.1233940242272729 AS sv_1, 0.9746875389250588 AS sv_2, 1.0288663280882484 AS sv_3 UNION ALL SELECT 32 AS sv_idx, 0.11784085222053935 AS dual_coeff, 1.102960215973118 AS sv_0, 0.2017382844909168 AS sv_1, -0.16663027049519835 AS sv_2, -0.24112571981491296 AS sv_3 UNION ALL SELECT 33 AS sv_idx, 0.6709521522855824 AS dual_coeff, 0.8962226109026789 AS sv_0, -0.5358946748297992 AS sv_1, 1.428616934806692 AS sv_2, -0.610395378457768 AS sv_3 UNION ALL SELECT 34 AS sv_idx, -0.3120851737843491 AS dual_coeff, -0.4611263004931448 AS sv_0, -0.14442792433756949 AS sv_1, -1.1458058257606203 AS sv_2, -2.013310236056188 AS sv_3 UNION ALL SELECT 35 AS sv_idx, -0.4861614864402547 AS dual_coeff, 2.339879525546283 AS sv_0, 1.1714521819539243 AS sv_1, -0.12302295652274545 AS sv_2, 0.5224606031209847 AS sv_3 UNION ALL SELECT 36 AS sv_idx, -0.1630529953428891 AS dual_coeff, -0.42888076592747615 AS sv_0, 0.04561616375120011 AS sv_1, -1.318563291258743 AS sv_2, -1.1780864986580626 AS sv_3 UNION ALL SELECT 37 AS sv_idx, -0.07036407467808009 AS dual_coeff, 0.5734491358601841 AS sv_0, 0.13131120572729812 AS sv_1, 0.369934744239402 AS sv_2, 0.603933119451112 AS sv_3 UNION ALL SELECT 38 AS sv_idx, -0.029790372323353718 AS dual_coeff, 1.010821727891756 AS sv_0, 1.2022297225875687 AS sv_1, 0.8144060637408875 AS sv_2, -0.1002362063228066 AS sv_3 UNION ALL SELECT 39 AS sv_idx, -0.3821646545929845 AS dual_coeff, 1.990921411400796 AS sv_0, 0.13839240466592856 AS sv_1, -0.31028705038580057 AS sv_2, -0.4961920992645837 AS sv_3 UNION ALL SELECT 40 AS sv_idx, -0.2830643994216817 AS dual_coeff, 1.523479313866697 AS sv_0, -1.3112782541653394 AS sv_1, -0.357937774963381 AS sv_2, -0.6792493332608378 AS sv_3 UNION ALL SELECT 41 AS sv_idx, -0.34234967650291803 AS dual_coeff, -1.9072572563444168 AS sv_0, -0.13518162428086092 AS sv_1, -0.5897793440488845 AS sv_2, -0.05969885033913672 AS sv_3 UNION ALL SELECT 42 AS sv_idx, -0.4678911964836915 AS dual_coeff, 0.2978416084718076 AS sv_0, 0.8624260735137894 AS sv_1, -1.9203138504993655 AS sv_2, 0.735835459037705 AS sv_3 UNION ALL SELECT 43 AS sv_idx, -0.0128215151900763 AS dual_coeff, 0.23855606029981294 AS sv_0, -1.7291728538884004 AS sv_1, -1.0905519699716923 AS sv_2, 1.1832621740869735 AS sv_3 UNION ALL SELECT 44 AS sv_idx, -0.8417770119748813 AS dual_coeff, 0.33401749314845075 AS sv_0, -1.9229369221970436 AS sv_1, -1.6917970042887034 AS sv_2, 0.7955317876032878 AS sv_3 UNION ALL SELECT 45 AS sv_idx, 0.3294702644999857 AS dual_coeff, -1.0597085247885667 AS sv_0, -0.8255728421179906 AS sv_1, 0.6775356326500908 AS sv_2, -1.3882018409141623 AS sv_3 UNION ALL SELECT 46 AS sv_idx, -0.7842937554035072 AS dual_coeff, 1.035747635430745 AS sv_0, -1.273204984798746 AS sv_1, -1.6607472806097137 AS sv_2, -0.5024027743506893 AS sv_3 UNION ALL SELECT 47 AS sv_idx, 0.0962101372729343 AS dual_coeff, -0.07615280303272615 AS sv_0, 1.052700600607052 AS sv_1, 1.0934129854728014 AS sv_2, 0.7220233633050731 AS sv_3 UNION ALL SELECT 48 AS sv_idx, 0.01315145612866399 AS dual_coeff, 1.1759376529966894 AS sv_0, -1.4951782670704983 AS sv_1, 0.05656455139048047 AS sv_2, -0.02819485688836402 AS sv_3 UNION ALL SELECT 49 AS sv_idx, 1.0 AS dual_coeff, -1.0970684602590932 AS sv_0, 0.048107555293905736 AS sv_1, 1.4883934851941163 AS sv_2, -1.9697042645438732 AS sv_3 UNION ALL SELECT 50 AS sv_idx, -0.24900976358633925 AS dual_coeff, -2.022673441251131 AS sv_0, -0.1084335030849492 AS sv_1, -0.12626174946808813 AS sv_2, 0.6100438112889778 AS sv_3 UNION ALL SELECT 51 AS sv_idx, 1.0 AS dual_coeff, -1.3912734755015683 AS sv_0, 1.499457880393438 AS sv_1, 1.1534970865113228 AS sv_2, 0.7355159199545372 AS sv_3 UNION ALL SELECT 52 AS sv_idx, -0.23019238777035034 AS dual_coeff, 0.1476268899682438 AS sv_0, 1.3251012853593251 AS sv_1, -0.907227586442982 AS sv_2, 0.8688716743461946 AS sv_3 UNION ALL SELECT 53 AS sv_idx, 0.6389753621577453 AS dual_coeff, 0.030749329841720886 AS sv_0, -1.937663320039244 AS sv_1, 0.8707084520300622 AS sv_2, 1.0317887590466155 AS sv_3 UNION ALL SELECT 54 AS sv_idx, -0.504853158026815 AS dual_coeff, -0.03211962085432656 AS sv_0, 0.2947970130774457 AS sv_1, -1.2903670542102983 AS sv_2, 2.145075451087018 AS sv_3 UNION ALL SELECT 55 AS sv_idx, 1.0 AS dual_coeff, -1.171639821886214 AS sv_0, 0.5442159347926954 AS sv_1, 1.684051478875226 AS sv_2, -0.6066278790061805 AS sv_3 UNION ALL SELECT 56 AS sv_idx, 0.09576659106690756 AS dual_coeff, -0.03534063384827546 AS sv_0, 0.8778452485462659 AS sv_1, 0.6626587004753683 AS sv_2, 1.6205811371183076 AS sv_3 UNION ALL SELECT 57 AS sv_idx, 0.1175877936938982 AS dual_coeff, -0.4923705964799862 AS sv_0, 0.3397208068550921 AS sv_1, 1.1240842959103805 AS sv_2, 1.637525131892074 AS sv_3 UNION ALL SELECT 58 AS sv_idx, -0.3218367535877541 AS dual_coeff, 1.2232742547023607 AS sv_0, -0.34472245489163605 AS sv_1, -1.1724218805245263 AS sv_2, 0.02350044375025901 AS sv_3) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.0893685778978303 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * exp(least(100.0, greatest(-100.0, -1.0 * (power(kernel_input_with_scaling.`PC1` - `SV_data`.sv_0, 2) + power(kernel_input_with_scaling.`PC2` - `SV_data`.sv_1, 2) + power(kernel_input_with_scaling.`PC3` - `SV_data`.sv_2, 2) + power(kernel_input_with_scaling.`PC4` - `SV_data`.sv_3, 2))))) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, 499.0928844651739 + 374.0338110593958 * kernel_dp.dot_product AS `Estimator` 
FROM kernel_dp