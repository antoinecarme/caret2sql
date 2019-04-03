-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmPoly
-- Dataset : BinaryClass_10
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 0.06182920523813451) / 1.236134089597546 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 0.17702463767183327) / 0.9467574985190108 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.041383850049034464) / 1.0809597326983538 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.13060646805847148) / 1.0860335106241017 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - -0.05955810471983085) / 1.1165897507633815 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - -0.048929089870105816) / 1.3868824547243672 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 0.19101797861713127) / 0.979670721363872 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.02204959673267471) / 0.4775973825125086 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - -0.05772981403414008) / 1.0713243581907332 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - -0.052549592052032364) / 1.2322587258530384 AS "Feature_9" 
FROM "BINARYCLASS_10" AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6, "Values".sv_7 AS sv_7, "Values".sv_8 AS sv_8, "Values".sv_9 AS sv_9 
FROM (SELECT 0 AS sv_idx, 0.8663762673296781 AS dual_coeff, 0.4767818683255514 AS sv_0, -0.28136563198507386 AS sv_1, 1.8087790521738945 AS sv_2, 0.4449539533195914 AS sv_3, -0.16902725173840266 AS sv_4, -1.4791780781476596 AS sv_5, -0.7302410329129739 AS sv_6, 0.2706127321879131 AS sv_7, -0.5143238548060276 AS sv_8, -0.11190694923804112 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 1 AS sv_idx, 1.0 AS dual_coeff, 0.08731081953801947 AS sv_0, 0.4199233175588533 AS sv_1, 0.08679506491664504 AS sv_2, 1.0174400930801393 AS sv_3, -0.6549833482800742 AS sv_4, -0.6851656356375779 AS sv_5, 0.11599876482082065 AS sv_6, -0.011874677152135459 AS sv_7, -1.848525091555032 AS sv_8, 0.08629526864015696 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, 0.6499395316012174 AS sv_0, -1.506720424067879 AS sv_1, 1.7845923767119436 AS sv_2, -0.09886845177631504 AS sv_3, -0.6213985646247768 AS sv_4, -0.8340575865045254 AS sv_5, 2.008045248044393 AS sv_6, 0.5442086455727778 AS sv_7, 0.942421558835432 AS sv_8, -0.457308264456212 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 3 AS sv_idx, 0.12530781239186228 AS dual_coeff, 0.03247492302713887 AS sv_0, 1.047286707612166 AS sv_1, 1.0391283253022847 AS sv_2, -1.3383605111337342 AS sv_3, -0.6795344453699088 AS sv_4, -1.1278249500885464 AS sv_5, -0.8399858584070454 AS sv_6, -0.13386158693372827 AS sv_7, -1.5700426095706588 AS sv_8, 0.25711802388268823 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS sv_idx, 0.8834320376952653 AS dual_coeff, 0.14083620190832646 AS sv_0, -0.17050728659476827 AS sv_1, -0.17476119918004282 AS sv_2, -1.3116930533698625 AS sv_3, -1.8522798067714217 AS sv_4, 2.1631555501499937 AS sv_5, -2.301092696036681 AS sv_6, 0.4654752574193307 AS sv_7, -1.48934370977668 AS sv_8, -0.7032592838031525 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS sv_idx, -0.4504044944668061 AS dual_coeff, 1.6650626530715869 AS sv_0, -1.5766827074506495 AS sv_1, 0.5565243718857906 AS sv_2, 0.4884517606942003 AS sv_3, 0.3810898411966673 AS sv_4, -1.802779371470432 AS sv_5, -0.13241280888701454 AS sv_6, 1.443714407925888 AS sv_7, 1.7622796749286411 AS sv_8, -1.2576505372849975 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS sv_idx, -0.11279766118507255 AS dual_coeff, 0.3390716331602923 AS sv_0, 1.8495748250780832 AS sv_1, 0.4600537982105392 AS sv_2, 0.7202543181900448 AS sv_3, 1.9303542345114997 AS sv_4, -0.16002169001695207 AS sv_5, -0.99700583736059 AS sv_6, 0.3247043113431265 AS sv_7, 1.3653876633263504 AS sv_8, -0.30948765635421005 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 7 AS sv_idx, 0.8269156237984406 AS dual_coeff, 0.4316632164451289 AS sv_0, 0.9432865010471296 AS sv_1, 1.4751609859952413 AS sv_2, 1.556256383029816 AS sv_3, 1.0010203990914768 AS sv_4, -1.0441170028461593 AS sv_5, -0.3593685870288738 AS sv_6, 0.2887590395694796 AS sv_7, -0.84927467797952 AS sv_8, -0.17737835735188892 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, 0.6221885599110655 AS sv_0, 0.18208594849454285 AS sv_1, -0.4810904853567675 AS sv_2, 0.8906503536555366 AS sv_3, 0.405159495681492 AS sv_4, -1.4484025904128284 AS sv_5, 0.3789677119541289 AS sv_6, 0.4245969561363369 AS sv_7, 1.1135607471616895 AS sv_8, -0.270248120878393 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 9 AS sv_idx, -1.0 AS dual_coeff, -0.22486873581581127 AS sv_0, -0.747124622008959 AS sv_1, -0.5343402174111191 AS sv_2, -0.8661290484799834 AS sv_3, -0.8078241668385704 AS sv_4, 1.1550372867564416 AS sv_5, -0.6640411432231608 AS sv_6, -0.05980851644639337 AS sv_7, -1.6384879600188207 AS sv_8, -0.06512049285154635 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.5437636969550028 AS sv_0, 1.1725515049139292 AS sv_1, 0.13525603577238227 AS sv_2, 0.15287416932472261 AS sv_3, -0.5333342594554455 AS sv_4, -0.3733667497505653 AS sv_5, 0.7589891487410354 AS sv_6, 0.5034125581080473 AS sv_7, 0.22128542987670494 AS sv_8, -0.4662285978408736 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 11 AS sv_idx, -1.0 AS dual_coeff, -0.09219307051230703 AS sv_0, -0.03383840306373853 AS sv_1, 0.4557758820420369 AS sv_2, 1.1984793822247075 AS sv_3, 0.7145275034771345 AS sv_4, 1.069357624606272 AS sv_5, -0.16068247962651222 AS sv_6, 0.06382534115002213 AS sv_7, -0.7681712621935882 AS sv_8, -0.18027504043848688 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 12 AS sv_idx, 1.0 AS dual_coeff, -0.5804832306627995 AS sv_0, -0.39562408389751746 AS sv_1, -0.3963090122082156 AS sv_2, -0.007554630167357402 AS sv_3, 0.8224036722817619 AS sv_4, 1.2488290063983079 AS sv_5, -0.3667354334678337 AS sv_6, -0.4113329093675934 AS sv_7, -1.3370459277006963 AS sv_8, 0.2785506180157216 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 13 AS sv_idx, 0.021467670327521917 AS dual_coeff, -0.8073840363957818 AS sv_0, -0.30688652426677715 AS sv_1, 0.94416164172329 AS sv_2, 0.08616722240970885 AS sv_3, 0.4756249870095519 AS sv_4, 0.6385821218711152 AS sv_5, -0.7827600058286099 AS sv_6, -0.7349845919862718 AS sv_7, 0.08979218933977293 AS sv_8, 0.6705546683085666 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 14 AS sv_idx, 1.0 AS dual_coeff, -0.6587850557714721 AS sv_0, 1.2733227255492003 AS sv_1, -0.8227481344684896 AS sv_2, -0.305210206650154 AS sv_3, -0.6634569232975569 AS sv_4, 1.0804098987454418 AS sv_5, -0.5310991352079625 AS sv_6, -0.5167694294933857 AS sv_7, 0.8631286880823567 AS sv_8, 0.4029578791240681 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 15 AS sv_idx, -0.13670902360900214 AS dual_coeff, 0.08020016657299005 AS sv_0, 0.1505015978993766 AS sv_1, 1.277098083690131 AS sv_2, 0.8835114967570349 AS sv_3, 0.2441777680306949 AS sv_4, 1.2161656377224637 AS sv_5, -1.1337905809449507 AS sv_6, 0.2627463288807569 AS sv_7, 0.5846592700183276 AS sv_8, -0.3964397842248741 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.8960449006810026 AS sv_0, -0.06767861728773622 AS sv_1, 0.3955153071673583 AS sv_2, -0.8205013141283433 AS sv_3, 0.17494187825177776 AS sv_4, 1.0993645721313074 AS sv_5, 0.3379235938543237 AS sv_6, -0.7577685980946971 AS sv_7, -0.394323434099768 AS sv_8, 0.643493265350324 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 17 AS sv_idx, -0.15964201979180556 AS dual_coeff, -0.6647834094376374 AS sv_0, 0.3969131818824111 AS sv_1, -0.2555668615993008 AS sv_2, -1.2897839952702206 AS sv_3, 1.3576478261985563 AS sv_4, 1.148216139427111 AS sv_5, 2.6741150801024878 AS sv_6, -0.5128791186300218 AS sv_7, 0.630037118647296 AS sv_8, 0.3916847168371329 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 18 AS sv_idx, 1.0 AS dual_coeff, 0.8166965027571061 AS sv_0, -0.856837819570681 AS sv_1, -0.8346208486211699 AS sv_2, 1.508846145001042 AS sv_3, -0.08284783125819263 AS sv_4, -1.2743169957083567 AS sv_5, 1.8625996360263628 AS sv_6, 0.6502878578362915 AS sv_7, -0.0979226946412716 AS sv_8, -0.5163193927874381 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 19 AS sv_idx, 0.1883699715758997 AS dual_coeff, -0.0402579003378627 AS sv_0, 0.28240036238327587 AS sv_1, -1.3979939985038197 AS sv_2, 0.29567763320855905 AS sv_3, -1.5021951825115891 AS sv_4, -1.0180651995815984 AS sv_5, -0.5395902153033929 AS sv_6, -0.19232721470954892 AS sv_7, 1.426455850368092 AS sv_8, 0.3040608757006605 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 20 AS sv_idx, -0.6722399915918789 AS dual_coeff, 0.5854796706416528 AS sv_0, 0.9467243711695577 AS sv_1, 0.08062093545781357 AS sv_2, -0.6416465388511702 AS sv_3, -1.273839257565051 AS sv_4, -0.5694030134631977 AS sv_5, 0.07658207122439202 AS sv_6, 0.5172120543419477 AS sv_7, 1.2408273951392916 AS sv_8, -0.4588488968355255 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 21 AS sv_idx, -1.0 AS dual_coeff, 0.8724200570194672 AS sv_0, 0.5272266339939217 AS sv_1, -1.401079622483255 AS sv_2, 0.5541152573071053 AS sv_3, 1.3935420392658495 AS sv_4, -1.0234665862047136 AS sv_5, 0.9523691295891799 AS sv_6, 0.744745651531851 AS sv_7, -0.18356194808830936 AS sv_8, -0.6386193584599393 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 22 AS sv_idx, -0.510213456449534 AS dual_coeff, 0.5510564765507573 AS sv_0, -0.4397336283863665 AS sv_1, -0.9209732070268521 AS sv_2, 1.1053807270278273 AS sv_3, 0.6421893033944561 AS sv_4, 0.18625660627131024 AS sv_5, -0.544274868062212 AS sv_6, 0.593887192412277 AS sv_7, -0.41395632599615995 AS sv_8, -0.6180216801636585 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 23 AS sv_idx, -0.2587671984713118 AS dual_coeff, 0.3846891437751013 AS sv_0, -0.2365274338597743 AS sv_1, 0.2351377768853404 AS sv_2, -2.786052368959439 AS sv_3, 1.1836730271232743 AS sv_4, -0.521314434395501 AS sv_5, -1.209342049277925 AS sv_6, 0.3180089465843848 AS sv_7, -0.2348436242987612 AS sv_8, -0.2635469140867004 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 24 AS sv_idx, -0.8897542652470474 AS dual_coeff, 0.27960861386112984 AS sv_0, 1.264238596760879 AS sv_1, -0.34087310709709 AS sv_2, -0.5767049209229327 AS sv_3, 0.521316595461216 AS sv_4, 1.3559438178247885 AS sv_5, -0.8534621035323254 AS sv_6, 0.4883859432672015 AS sv_7, 0.3141378889994094 AS sv_8, -0.6387369934302088 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 25 AS sv_idx, 0.2833739221916928 AS dual_coeff, -0.14055392156453275 AS sv_0, -3.307009155707085 AS sv_1, -0.5053088265507224 AS sv_2, -0.23723664654797286 AS sv_3, 1.529687672782185 AS sv_4, -1.4022076887762727 AS sv_5, -0.7271252300575837 AS sv_6, -0.3523524125978137 AS sv_7, -1.7653312868419129 AS sv_8, 0.5068241116651305 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 26 AS sv_idx, 1.0 AS dual_coeff, 0.6894274057055135 AS sv_0, 0.4514552890095735 AS sv_1, 0.2093204069248752 AS sv_2, 1.0368484617551743 AS sv_3, 0.03717007641055501 AS sv_4, -1.0304302721128482 AS sv_5, 0.42755899213875986 AS sv_6, 0.5556686478624994 AS sv_7, -0.10328987231898806 AS sv_8, -0.4475371044214476 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 27 AS sv_idx, 0.17087445987714084 AS dual_coeff, -0.6440716426524146 AS sv_0, -1.6937945609945309 AS sv_1, -0.7604782422693294 AS sv_2, 1.2277185724937787 AS sv_3, 0.15273447561018624 AS sv_4, 1.0754549630378707 AS sv_5, 0.8801545491936706 AS sv_6, -0.5023845449922668 AS sv_7, 1.0057121033769099 AS sv_8, 0.3890155424170703 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 28 AS sv_idx, -1.0 AS dual_coeff, 0.4191755661898865 AS sv_0, -0.4362848376718623 AS sv_1, 0.36418742871327614 AS sv_2, 1.1130259015135746 AS sv_3, -1.6358625035920635 AS sv_4, 0.0499132664130655 AS sv_5, -0.8372968035882955 AS sv_6, 0.43814862780670494 AS sv_7, -1.3003945708887839 AS sv_8, -0.44646020877036335 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 29 AS sv_idx, 0.31498185337961176 AS dual_coeff, 0.2794373691093419 AS sv_0, 1.9748184218306333 AS sv_1, -3.730640694613173 AS sv_2, 0.651614605956266 AS sv_3, 0.5376239706138513 AS sv_4, 1.887838518503456 AS sv_5, 2.2897668532896183 AS sv_6, 0.567078913830321 AS sv_7, 0.3516434659057892 AS sv_8, -0.7756619176900128 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 30 AS sv_idx, -1.0 AS dual_coeff, -0.05965227040296731 AS sv_0, -1.1278824561246392 AS sv_1, -0.5067205861155859 AS sv_2, -0.3438480794724477 AS sv_3, 0.1819222668680084 AS sv_4, 1.0766603006052455 AS sv_5, 0.4653057588055848 AS sv_6, 0.09834731334434337 AS sv_7, -1.2093505684195625 AS sv_8, -0.21581753779977167 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 31 AS sv_idx, -0.4148205361345284 AS dual_coeff, -0.7645658302552634 AS sv_0, 0.3422472361142004 AS sv_1, 0.1911042670120429 AS sv_2, 0.6801860167145513 AS sv_3, 1.8410573400703392 AS sv_4, 1.7516302168692475 AS sv_5, 2.474097517744636 AS sv_6, -0.5259423987639593 AS sv_7, -0.006825346235036049 AS sv_8, 0.33936246816863225 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 32 AS sv_idx, -1.0 AS dual_coeff, 0.5375286223309171 AS sv_0, -0.3316233054726869 AS sv_1, 1.696629945926522 AS sv_2, 1.2825840459604203 AS sv_3, -0.35942908021069986 AS sv_4, -0.6647233962692908 AS sv_5, -0.20701215675681173 AS sv_6, 0.4538032124898558 AS sv_7, -0.1379393345057123 AS sv_8, -0.38467847534567856 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 33 AS sv_idx, -0.5447601443161588 AS dual_coeff, 0.10090115670650003 AS sv_0, 0.554346723698571 AS sv_1, -0.197751203387923 AS sv_2, -1.065209679886695 AS sv_3, -1.2140227330434523 AS sv_4, 0.096733894093727 AS sv_5, 2.1174637540416263 AS sv_6, 0.11803031054174727 AS sv_7, 0.03452695980479888 AS sv_8, -0.12930627127635813 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 34 AS sv_idx, 0.15664563070673512 AS dual_coeff, -0.882972487531501 AS sv_0, -1.219336807983632 AS sv_1, 1.5853496426285412 AS sv_2, 0.7197215150212883 AS sv_3, -0.02006938150829118 AS sv_4, 0.917317513202626 AS sv_5, 0.4545273917601003 AS sv_6, -0.771329101498273 AS sv_7, 1.7437596770039452 AS sv_8, 0.6768959353502201 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 35 AS sv_idx, -1.0 AS dual_coeff, -0.29854940524111245 AS sv_0, -0.27591262235697506 AS sv_1, -0.1591283541815007 AS sv_2, 0.3957093617338647 AS sv_3, -1.038885445178377 AS sv_4, 0.9853371169504632 AS sv_5, 1.2610319116699569 AS sv_6, -0.16068626198837024 AS sv_7, 1.1625050210441923 AS sv_8, 0.05483686149403229 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 36 AS sv_idx, -0.6876364580107025 AS dual_coeff, 1.3330104867062402 AS sv_0, -2.004419008069948 AS sv_1, 0.4179504207851609 AS sv_2, 0.4329564613298016 AS sv_3, -0.024340118612492058 AS sv_4, -1.542589836095544 AS sv_5, 0.18127516015523207 AS sv_6, 1.1410761582546198 AS sv_7, -0.9682759523566362 AS sv_8, -0.9812432350972058 AS sv_9 FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 37 AS sv_idx, 1.0 AS dual_coeff, 0.2223351200571684 AS sv_0, -0.7767745396114429 AS sv_1, -1.5514094382140453 AS sv_2, -0.5859919130917198 AS sv_3, -0.14614709090844266 AS sv_4, 2.1293025969237926 AS sv_5, 0.3065489513353151 AS sv_6, 0.544204383292988 AS sv_7, 0.9354410688231648 AS sv_8, -0.7788356308066725 AS sv_9 FROM SYSIBM.SYSDUMMY1) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.144612691165941 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * power(0.1 * (kernel_input_with_scaling."Feature_0" * "SV_data".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data".sv_3 + kernel_input_with_scaling."Feature_4" * "SV_data".sv_4 + kernel_input_with_scaling."Feature_5" * "SV_data".sv_5 + kernel_input_with_scaling."Feature_6" * "SV_data".sv_6 + kernel_input_with_scaling."Feature_7" * "SV_data".sv_7 + kernel_input_with_scaling."Feature_8" * "SV_data".sv_8 + kernel_input_with_scaling."Feature_9" * "SV_data".sv_9) + 1.0, 2.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", -kernel_dp.dot_product AS "Score_0", kernel_dp.dot_product AS "Score_1", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CASE WHEN (kernel_dp.dot_product > 0.0) THEN 1 ELSE 0 END AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM kernel_dp