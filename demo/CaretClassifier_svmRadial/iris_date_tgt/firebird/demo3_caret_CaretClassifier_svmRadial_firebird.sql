-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmRadial
-- Dataset : iris_date_tgt
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 5.8475) / 0.8305068311812105 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM iris_date_tgt AS "ADS"), 
"SV_data_1789-07-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.14146642113129526 AS dual_coeff, -1.502094809052576 AS sv_0, 0.8143194139459978 AS sv_1, -1.4225506772994687 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, -0.35565893020445516 AS dual_coeff, -1.0204612029435332 AS sv_0, 1.0410440767615892 AS sv_1, -1.3061469396411418 AS sv_2, -0.8590574959786267 AS sv_3 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, 0.4215703412348602 AS dual_coeff, 1.1468900245471565 AS sv_0, -0.5460285629475496 AS sv_1, 0.5563128628920867 AS sv_2, 0.2050653377497365 AS sv_3 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -0.008399572915177674 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8143194139459978 AS sv_1, -1.3643488084703053 AS sv_2, -1.1250882044107176 AS sv_3 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, -0.005690865852703906 AS dual_coeff, -0.9000528014162733 AS sv_0, 0.5875947511304064 AS sv_1, -1.2479450708119786 AS sv_2, -0.992072850194672 AS sv_3 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, 0.34642967325051777 AS dual_coeff, -0.9000528014162733 AS sv_0, -1.2262025513943229 AS sv_1, -0.4913207760328544 AS sv_2, -0.1939807248983995 AS sv_3 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, 0.24594319190521824 AS dual_coeff, -0.05719399072544915 AS sv_0, -0.7727532257631398 AS sv_1, 0.14889978108794275 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 0.5799705853058094 AS dual_coeff, 1.387706827601678 AS sv_0, 0.360870088314816 AS sv_1, 0.4981109940629234 AS sv_2, 0.2050653377497365 AS sv_3 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, -0.4515014666112352 AS dual_coeff, -0.1776023922527093 AS sv_0, 1.7212180652083622 AS sv_1, -1.2479450708119786 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 0.127133018081395 AS dual_coeff, -0.7796443998890122 AS sv_0, -0.7727532257631398 AS sv_1, 0.03249604342961614 AS sv_2, 0.2050653377497365 AS sv_3 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, 0.6941184953744333 AS dual_coeff, 0.4244396153835936 AS sv_0, -1.906376539841096 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.2509452403834606 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.452927214209914 AS sv_1, -0.3167151695453643 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -0.467479112224069 AS dual_coeff, -0.7796443998890122 AS sv_0, 2.401392053655136 AS sv_1, -1.3643488084703053 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, 0.10815798729032461 AS dual_coeff, 0.06321441080181206 AS sv_0, 0.360870088314816 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, 0.5746826766863616 AS dual_coeff, 0.18362281232907215 AS sv_0, 0.8143194139459978 AS sv_1, 0.3817072564045966 AS sv_2, 0.4710960461818276 AS sv_3 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, 0.12467776106128002 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.2262025513943229 AS sv_1, 0.6145147317212504 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, 0.7116363276522548 AS dual_coeff, -1.0204612029435332 AS sv_0, -2.359825865472279 AS sv_1, -0.2003114318870374 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, -0.3327140713319631 AS dual_coeff, -1.2612780059980548 AS sv_0, -0.0925792373163668 AS sv_1, -1.4225506772994687 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, 0.4714852634091785 AS dual_coeff, -0.5388275968344908 AS sv_0, -0.0925792373163668 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, -1.6225032105798363 AS sv_0, -1.6796518770255056 AS sv_1, -1.480752546128632 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, 0.05641210986254605 AS dual_coeff, 1.0264816230198963 AS sv_0, -0.0925792373163668 AS sv_1, 0.6727166005504135 AS sv_2, 0.6041114003978728 AS sv_3 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, 0.11936732641136592 AS dual_coeff, -0.1776023922527093 AS sv_0, -0.9994778885787314 AS sv_1, -0.2003114318870374 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, -0.8247779596876486 AS dual_coeff, -0.1776023922527093 AS sv_0, 3.0815660421019113 AS sv_1, -1.3643488084703053 AS sv_2, -1.1250882044107176 AS sv_3 FROM rdb$database UNION ALL SELECT 23 AS sv_idx, -0.36619053301629095 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8143194139459978 AS sv_1, -1.2479450708119786 AS sv_2, -1.3911189128428083 AS sv_3 FROM rdb$database UNION ALL SELECT 24 AS sv_idx, -0.20177902425341518 AS dual_coeff, -1.1408696044707936 AS sv_0, 1.2677687395771806 AS sv_1, -1.4225506772994687 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database UNION ALL SELECT 25 AS sv_idx, -0.6768720406807521 AS dual_coeff, -1.8633200136343575 AS sv_0, -0.0925792373163668 AS sv_1, -1.5971562837869588 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database) AS "Values"), 
"kernel_dp_1789-07-14T00:00:00.000000000" AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + 0.0751748776509592 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-07-14T00:00:00.000000000".dual_coeff * exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-07-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-07-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-07-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-07-14T00:00:00.000000000".sv_3, 2)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-07-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-07-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-07-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-07-14T00:00:00.000000000".sv_3, 2)))) ELSE -709.782712893384 END) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-07-14T00:00:00.000000000") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t), 
"OVR_Score_1789-07-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-07-14T00:00:00.000000000"."KEY" AS "KEY_1789-07-14T00:00:00.000000000", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-07-14T00:00:00.000000000".dot_product * -3.840864932129172 + 0.1244219323867527)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-07-14T00:00:00.000000000".dot_product * -3.840864932129172 + 0.1244219323867527)))) ELSE -709.782712893384 END)) AS "Proba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-07-14T00:00:00.000000000" 
FROM "kernel_dp_1789-07-14T00:00:00.000000000"), 
"SV_data_1789-08-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.2856233611448022 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.5875947511304064 AS sv_1, 1.2547352888420475 AS sv_2, 1.6682342341262362 AS sv_3 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.6409127695605371 AS dual_coeff, 2.471382441347024 AS sv_0, 1.7212180652083622 AS sv_1, 1.4875427641587011 AS sv_2, 1.0031574630460092 AS sv_3 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, -0.1672379169847462 AS dual_coeff, -1.502094809052576 AS sv_0, 0.8143194139459978 AS sv_1, -1.4225506772994687 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -0.41017468430936715 AS dual_coeff, -1.0204612029435334 AS sv_0, 1.0410440767615892 AS sv_1, -1.3061469396411418 AS sv_2, -0.8590574959786267 AS sv_3 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, 0.301659593422774 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.0925792373163668 AS sv_1, 1.3129371576712108 AS sv_2, 1.4022035256941452 AS sv_3 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -0.0040593106458405755 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8143194139459978 AS sv_1, -1.3643488084703053 AS sv_2, -1.1250882044107176 AS sv_3 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, 0.6191853465729644 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.2262025513943229 AS sv_1, 0.3817072564045966 AS sv_2, 0.6041114003978728 AS sv_3 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 0.16910667456363793 AS dual_coeff, 1.2672984260744178 AS sv_0, 0.13414542549922462 AS sv_1, 0.7309184693795767 AS sv_2, 1.4022035256941452 AS sv_3 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 0.5791376004420146 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.9994778885787314 AS sv_1, 1.7785521083045184 AS sv_2, 1.4022035256941452 AS sv_3 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 0.35521769127483793 AS dual_coeff, 1.0264816230198963 AS sv_0, -1.2262025513943229 AS sv_1, 1.1383315511837206 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, -0.5165362631451911 AS dual_coeff, -0.1776023922527093 AS sv_0, 1.7212180652083622 AS sv_1, -1.2479450708119786 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.029929750643237267 AS dual_coeff, -0.1776023922527093 AS sv_0, -1.2262025513943229 AS sv_1, 0.6727166005504135 AS sv_2, 1.0031574630460092 AS sv_3 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, 0.013779726888359387 AS dual_coeff, 1.6285236306561992 AS sv_0, 0.360870088314816 AS sv_1, 1.2547352888420475 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, 0.27268276377637185 AS dual_coeff, 0.1836228123290722 AS sv_0, -0.0925792373163668 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, -0.5373691266014057 AS dual_coeff, -0.7796443998890121 AS sv_0, 2.401392053655136 AS sv_1, -1.3643488084703053 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, 0.15407802198562237 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.9994778885787314 AS sv_1, 1.0219278135253935 AS sv_2, 0.2050653377497365 AS sv_3 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, 0.2510942390813388 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.5460285629475496 AS sv_1, 0.6145147317212504 AS sv_2, 1.0031574630460092 AS sv_3 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, 0.31487105867589693 AS dual_coeff, 0.4244396153835935 AS sv_0, 0.8143194139459978 AS sv_1, 0.9055240758670672 AS sv_2, 1.4022035256941452 AS sv_3 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, 0.05342099520824706 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.5460285629475496 AS sv_1, 0.7309184693795767 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, 0.42380388590475654 AS dual_coeff, 1.6285236306561992 AS sv_0, 1.2677687395771806 AS sv_1, 1.3129371576712108 AS sv_2, 1.6682342341262362 AS sv_3 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, 0.4074075697550629 AS dual_coeff, 1.6285236306561992 AS sv_0, -0.0925792373163668 AS sv_1, 1.1383315511837206 AS sv_2, 0.4710960461818276 AS sv_3 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, 0.5250479729819608 AS dual_coeff, 0.1836228123290722 AS sv_0, -1.906376539841096 AS sv_1, 0.6727166005504135 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, -0.3541320092087708 AS dual_coeff, -1.2612780059980548 AS sv_0, -0.0925792373163668 AS sv_1, -1.4225506772994687 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 23 AS sv_idx, -1.0 AS dual_coeff, -1.6225032105798365 AS sv_0, -1.6796518770255056 AS sv_1, -1.480752546128632 AS sv_2, -1.2581035586267628 AS sv_3 FROM rdb$database UNION ALL SELECT 24 AS sv_idx, -0.9473373396328778 AS dual_coeff, -0.1776023922527093 AS sv_0, 3.0815660421019113 AS sv_1, -1.3643488084703053 AS sv_2, -1.1250882044107176 AS sv_3 FROM rdb$database UNION ALL SELECT 25 AS sv_idx, -0.43009394099085535 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8143194139459978 AS sv_1, -1.2479450708119786 AS sv_2, -1.3911189128428083 AS sv_3 FROM rdb$database UNION ALL SELECT 26 AS sv_idx, -0.230135929907472 AS dual_coeff, -1.1408696044707936 AS sv_0, 1.2677687395771806 AS sv_1, -1.4225506772994687 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database UNION ALL SELECT 27 AS sv_idx, -0.7998825004558953 AS dual_coeff, -1.8633200136343575 AS sv_0, -0.0925792373163668 AS sv_1, -1.5971562837869588 AS sv_2, -1.5241342670588536 AS sv_3 FROM rdb$database) AS "Values"), 
"kernel_dp_1789-08-14T00:00:00.000000000" AS 
(SELECT t_1."KEY" AS "KEY", t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1."KEY" AS "KEY", sum(CAST(full_join_data_sv_1.dot_prod1 AS DOUBLE PRECISION)) + 0.23457835361865 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-08-14T00:00:00.000000000".dual_coeff * exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-08-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-08-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-08-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-08-14T00:00:00.000000000".sv_3, 2)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-08-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-08-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-08-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-08-14T00:00:00.000000000".sv_3, 2)))) ELSE -709.782712893384 END) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-08-14T00:00:00.000000000") AS full_join_data_sv_1 GROUP BY full_join_data_sv_1."KEY") AS t_1), 
"OVR_Score_1789-08-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-08-14T00:00:00.000000000"."KEY" AS "KEY_1789-08-14T00:00:00.000000000", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-08-14T00:00:00.000000000".dot_product * -4.069859748248007 + 0.4042182763613274)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-08-14T00:00:00.000000000".dot_product * -4.069859748248007 + 0.4042182763613274)))) ELSE -709.782712893384 END)) AS "Proba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-08-14T00:00:00.000000000" 
FROM "kernel_dp_1789-08-14T00:00:00.000000000"), 
"SV_data_1789-09-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.6952419179396238 AS dual_coeff, 2.4713824413470236 AS sv_0, 1.7212180652083622 AS sv_1, 1.4875427641587011 AS sv_2, 1.0031574630460092 AS sv_3 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, -1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.3193039001319582 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, 1.1468900245471565 AS sv_0, -0.5460285629475496 AS sv_1, 0.5563128628920867 AS sv_2, 0.20506533774973654 AS sv_3 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.0925792373163668 AS sv_1, 0.6145147317212504 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, 0.19836621136756769 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.0925792373163668 AS sv_1, 1.3129371576712108 AS sv_2, 1.4022035256941454 AS sv_3 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -0.1206180321773326 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.0925792373163668 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.5875947511304064 AS sv_1, 0.4981109940629234 AS sv_2, 0.4710960461818276 AS sv_3 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, -0.009619942213291351 AS dual_coeff, -0.9000528014162733 AS sv_0, -1.2262025513943229 AS sv_1, -0.4913207760328544 AS sv_2, -0.19398072489839946 AS sv_3 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, -0.05565005885126263 AS dual_coeff, 1.387706827601678 AS sv_0, 0.360870088314816 AS sv_1, 0.4981109940629234 AS sv_2, 0.20506533774973654 AS sv_3 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.2262025513943229 AS sv_1, 0.3817072564045966 AS sv_2, 0.6041114003978728 AS sv_3 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, -0.3965786564743253 AS dual_coeff, -0.41841919530723065 AS sv_0, -1.6796518770255056 AS sv_1, 0.0906979122587796 AS sv_2, 0.07204998353369131 AS sv_3 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.6506980205239686 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.9994778885787314 AS sv_1, 1.7785521083045184 AS sv_2, 1.4022035256941454 AS sv_3 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, 0.3068910299339134 AS dual_coeff, 1.0264816230198963 AS sv_0, -1.2262025513943229 AS sv_1, 1.1383315511837206 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, -0.06713839591713812 AS dual_coeff, -0.41841919530723065 AS sv_0, -0.9994778885787314 AS sv_1, 0.3235053875754334 AS sv_2, -0.06096537068235423 AS sv_3 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, -0.7346642463836027 AS dual_coeff, -0.7796443998890122 AS sv_0, -0.7727532257631398 AS sv_1, 0.03249604342961614 AS sv_2, 0.20506533774973654 AS sv_3 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, 1.0 AS dual_coeff, 0.785664819965375 AS sv_0, 0.360870088314816 AS sv_1, 0.7309184693795766 AS sv_2, 1.0031574630460092 AS sv_3 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, -0.6589609611716265 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.6796518770255056 AS sv_1, 0.3235053875754334 AS sv_2, 0.07204998353369131 AS sv_3 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, 0.5271388168557944 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.7727532257631398 AS sv_1, 0.6145147317212504 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, 0.39845410172649925 AS dual_coeff, 1.628523630656199 AS sv_0, 0.360870088314816 AS sv_1, 1.2547352888420475 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, 1.0 AS dual_coeff, 0.06321441080181206 AS sv_0, -0.0925792373163668 AS sv_1, 0.7309184693795766 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, -1.0 AS dual_coeff, 0.4244396153835936 AS sv_0, -1.906376539841096 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, -0.5234151295482554 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.452927214209914 AS sv_1, -0.3167151695453643 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, 1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.0925792373163668 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 23 AS sv_idx, 1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.9994778885787314 AS sv_1, 1.0219278135253935 AS sv_2, 0.20506533774973654 AS sv_3 FROM rdb$database UNION ALL SELECT 24 AS sv_idx, 0.5000980762621393 AS dual_coeff, 0.4244396153835936 AS sv_0, 0.8143194139459978 AS sv_1, 0.9055240758670674 AS sv_2, 1.4022035256941454 AS sv_3 FROM rdb$database UNION ALL SELECT 25 AS sv_idx, 1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.5460285629475496 AS sv_1, 0.7309184693795766 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 26 AS sv_idx, 0.15946537795755514 AS dual_coeff, 0.785664819965375 AS sv_0, -0.0925792373163668 AS sv_1, 0.9637259446962304 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 27 AS sv_idx, 0.4333756730104848 AS dual_coeff, 1.628523630656199 AS sv_0, 1.2677687395771806 AS sv_1, 1.3129371576712108 AS sv_2, 1.6682342341262362 AS sv_3 FROM rdb$database UNION ALL SELECT 28 AS sv_idx, 1.0 AS dual_coeff, 1.628523630656199 AS sv_0, -0.0925792373163668 AS sv_1, 1.1383315511837206 AS sv_2, 0.4710960461818276 AS sv_3 FROM rdb$database UNION ALL SELECT 29 AS sv_idx, -1.0 AS dual_coeff, 0.06321441080181206 AS sv_0, 0.360870088314816 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 FROM rdb$database UNION ALL SELECT 30 AS sv_idx, -0.2957657275794281 AS dual_coeff, 0.18362281232907215 AS sv_0, 0.8143194139459978 AS sv_1, 0.3817072564045966 AS sv_2, 0.4710960461818276 AS sv_3 FROM rdb$database UNION ALL SELECT 31 AS sv_idx, -1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.2262025513943229 AS sv_1, 0.6145147317212504 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 32 AS sv_idx, -0.8114023500500506 AS dual_coeff, -1.0204612029435332 AS sv_0, -2.359825865472279 AS sv_1, -0.2003114318870374 AS sv_2, -0.326996079114445 AS sv_3 FROM rdb$database UNION ALL SELECT 33 AS sv_idx, 1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -1.906376539841096 AS sv_1, 0.6727166005504135 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 34 AS sv_idx, -1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.3193039001319582 AS sv_1, 0.4981109940629234 AS sv_2, 0.20506533774973654 AS sv_3 FROM rdb$database UNION ALL SELECT 35 AS sv_idx, -0.7532630492663028 AS dual_coeff, -0.5388275968344908 AS sv_0, -0.0925792373163668 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database UNION ALL SELECT 36 AS sv_idx, -1.0 AS dual_coeff, 1.0264816230198963 AS sv_0, -0.0925792373163668 AS sv_1, 0.6727166005504135 AS sv_2, 0.6041114003978728 AS sv_3 FROM rdb$database UNION ALL SELECT 37 AS sv_idx, -0.12800946422215634 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.5460285629475496 AS sv_1, 0.4981109940629234 AS sv_2, -0.06096537068235423 AS sv_3 FROM rdb$database UNION ALL SELECT 38 AS sv_idx, 0.685356788277227 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.2262025513943229 AS sv_1, 0.6727166005504135 AS sv_2, 0.8701421088299635 AS sv_3 FROM rdb$database UNION ALL SELECT 39 AS sv_idx, -1.0 AS dual_coeff, 1.2672984260744176 AS sv_0, 0.13414542549922462 AS sv_1, 0.6145147317212504 AS sv_2, 0.3380806919657821 AS sv_3 FROM rdb$database) AS "Values"), 
"kernel_dp_1789-09-14T00:00:00.000000000" AS 
(SELECT t_2."KEY" AS "KEY", t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2."KEY" AS "KEY", sum(CAST(full_join_data_sv_2.dot_prod1 AS DOUBLE PRECISION)) + 0.154010516024696 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-09-14T00:00:00.000000000".dual_coeff * exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-09-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-09-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-09-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-09-14T00:00:00.000000000".sv_3, 2)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data_1789-09-14T00:00:00.000000000".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data_1789-09-14T00:00:00.000000000".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data_1789-09-14T00:00:00.000000000".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data_1789-09-14T00:00:00.000000000".sv_3, 2)))) ELSE -709.782712893384 END) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-09-14T00:00:00.000000000") AS full_join_data_sv_2 GROUP BY full_join_data_sv_2."KEY") AS t_2), 
"OVR_Score_1789-09-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-09-14T00:00:00.000000000"."KEY" AS "KEY_1789-09-14T00:00:00.000000000", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-09-14T00:00:00.000000000".dot_product * -3.097200306485895 + -0.2168516450497708)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -(-("kernel_dp_1789-09-14T00:00:00.000000000".dot_product * -3.097200306485895 + -0.2168516450497708)))) ELSE -709.782712893384 END)) AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "Score_1789-09-14T00:00:00.000000000" 
FROM "kernel_dp_1789-09-14T00:00:00.000000000"), 
"OVR_Join_CTE" AS 
(SELECT "OVR_Score_1789-07-14T00:00:00.000000000"."KEY_1789-07-14T00:00:00.000000000" AS "KEY_1789-07-14T00:00:00.0_a", "OVR_Score_1789-07-14T00:00:00.000000000"."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00_4", "OVR_Score_1789-07-14T00:00:00.000000000"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00_1", "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000" AS "KEY_1789-08-14T00:00:00.0_b", "OVR_Score_1789-08-14T00:00:00.000000000"."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00_5", "OVR_Score_1789-08-14T00:00:00.000000000"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00_2", "OVR_Score_1789-09-14T00:00:00.000000000"."KEY_1789-09-14T00:00:00.000000000" AS "KEY_1789-09-14T00:00:00.0_c", "OVR_Score_1789-09-14T00:00:00.000000000"."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00_6", "OVR_Score_1789-09-14T00:00:00.000000000"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00_3" 
FROM "OVR_Score_1789-07-14T00:00:00.000000000" LEFT OUTER JOIN "OVR_Score_1789-08-14T00:00:00.000000000" ON "OVR_Score_1789-07-14T00:00:00.000000000"."KEY_1789-07-14T00:00:00.000000000" = "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000" LEFT OUTER JOIN "OVR_Score_1789-09-14T00:00:00.000000000" ON "OVR_Score_1789-09-14T00:00:00.000000000"."KEY_1789-09-14T00:00:00.000000000" = "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000"), 
orig_cte AS 
(SELECT "OVR_Join_CTE"."KEY_1789-07-14T00:00:00.0_a" AS "KEY", "OVR_Join_CTE"."Score_1789-07-14T00:00:00_1" AS "Score_1789-07-14T00:00:00.000000000", "OVR_Join_CTE"."Score_1789-08-14T00:00:00_2" AS "Score_1789-08-14T00:00:00.000000000", "OVR_Join_CTE"."Score_1789-09-14T00:00:00_3" AS "Score_1789-09-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-07-14T00:00:00_4" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00_4" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00_5" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00_6") AS "Proba_1789-07-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-08-14T00:00:00_5" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00_4" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00_5" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00_6") AS "Proba_1789-08-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-09-14T00:00:00_6" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00_4" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00_5" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00_6") AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-07-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-08-14T00:00:00.000000000", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1789-09-14T00:00:00.000000000", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OVR_Join_CTE"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", '1789-07-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-08-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-09-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00_1", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00_2", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00_3", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00_4", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00_5", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00_6", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00_7", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00_8", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00_9", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00_1" AS "Score_1789-07-14T00:00:00_1", score_max."Score_1789-08-14T00:00:00_2" AS "Score_1789-08-14T00:00:00_2", score_max."Score_1789-09-14T00:00:00_3" AS "Score_1789-09-14T00:00:00_3", score_max."Proba_1789-07-14T00:00:00_4" AS "Proba_1789-07-14T00:00:00_4", score_max."Proba_1789-08-14T00:00:00_5" AS "Proba_1789-08-14T00:00:00_5", score_max."Proba_1789-09-14T00:00:00_6" AS "Proba_1789-09-14T00:00:00_6", score_max."LogProba_1789-07-14T00:00_7" AS "LogProba_1789-07-14T00:00_7", score_max."LogProba_1789-08-14T00:00_8" AS "LogProba_1789-08-14T00:00_8", score_max."LogProba_1789-09-14T00:00_9" AS "LogProba_1789-09-14T00:00_9", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00_1" AS "Score_1789-07-14T00:00:00_1", score_max."Score_1789-08-14T00:00:00_2" AS "Score_1789-08-14T00:00:00_2", score_max."Score_1789-09-14T00:00:00_3" AS "Score_1789-09-14T00:00:00_3", score_max."Proba_1789-07-14T00:00:00_4" AS "Proba_1789-07-14T00:00:00_4", score_max."Proba_1789-08-14T00:00:00_5" AS "Proba_1789-08-14T00:00:00_5", score_max."Proba_1789-09-14T00:00:00_6" AS "Proba_1789-09-14T00:00:00_6", score_max."LogProba_1789-07-14T00:00_7" AS "LogProba_1789-07-14T00:00_7", score_max."LogProba_1789-08-14T00:00_8" AS "LogProba_1789-08-14T00:00_8", score_max."LogProba_1789-09-14T00:00_9" AS "LogProba_1789-09-14T00:00_9", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_max."KEY" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_1789-07-14T00:00:00_1" AS "Score_1789-07-14T00:00:00.000000000", arg_max_cte."Score_1789-08-14T00:00:00_2" AS "Score_1789-08-14T00:00:00.000000000", arg_max_cte."Score_1789-09-14T00:00:00_3" AS "Score_1789-09-14T00:00:00.000000000", arg_max_cte."Proba_1789-07-14T00:00:00_4" AS "Proba_1789-07-14T00:00:00.000000000", arg_max_cte."Proba_1789-08-14T00:00:00_5" AS "Proba_1789-08-14T00:00:00.000000000", arg_max_cte."Proba_1789-09-14T00:00:00_6" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-07-14T00:00:00_4" IS NULL OR arg_max_cte."Proba_1789-07-14T00:00:00_4" > 0.0) THEN ln(arg_max_cte."Proba_1789-07-14T00:00:00_4") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-08-14T00:00:00_5" IS NULL OR arg_max_cte."Proba_1789-08-14T00:00:00_5" > 0.0) THEN ln(arg_max_cte."Proba_1789-08-14T00:00:00_5") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-09-14T00:00:00_6" IS NULL OR arg_max_cte."Proba_1789-09-14T00:00:00_6" > 0.0) THEN ln(arg_max_cte."Proba_1789-09-14T00:00:00_6") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."arg_max_Score" = '1789-07-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-07-14T00:00:00_4" WHEN (arg_max_cte."arg_max_Score" = '1789-08-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-08-14T00:00:00_5" WHEN (arg_max_cte."arg_max_Score" = '1789-09-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-09-14T00:00:00_6" END AS "DecisionProba" 
FROM arg_max_cte