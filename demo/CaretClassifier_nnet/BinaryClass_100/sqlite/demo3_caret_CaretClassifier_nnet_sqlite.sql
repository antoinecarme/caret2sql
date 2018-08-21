-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : BinaryClass_100
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9", CAST("ADS"."Feature_10" AS FLOAT) AS "Feature_10", CAST("ADS"."Feature_11" AS FLOAT) AS "Feature_11", CAST("ADS"."Feature_12" AS FLOAT) AS "Feature_12", CAST("ADS"."Feature_13" AS FLOAT) AS "Feature_13", CAST("ADS"."Feature_14" AS FLOAT) AS "Feature_14", CAST("ADS"."Feature_15" AS FLOAT) AS "Feature_15", CAST("ADS"."Feature_16" AS FLOAT) AS "Feature_16", CAST("ADS"."Feature_17" AS FLOAT) AS "Feature_17", CAST("ADS"."Feature_18" AS FLOAT) AS "Feature_18", CAST("ADS"."Feature_19" AS FLOAT) AS "Feature_19", CAST("ADS"."Feature_20" AS FLOAT) AS "Feature_20", CAST("ADS"."Feature_21" AS FLOAT) AS "Feature_21", CAST("ADS"."Feature_22" AS FLOAT) AS "Feature_22", CAST("ADS"."Feature_23" AS FLOAT) AS "Feature_23", CAST("ADS"."Feature_24" AS FLOAT) AS "Feature_24", CAST("ADS"."Feature_25" AS FLOAT) AS "Feature_25", CAST("ADS"."Feature_26" AS FLOAT) AS "Feature_26", CAST("ADS"."Feature_27" AS FLOAT) AS "Feature_27", CAST("ADS"."Feature_28" AS FLOAT) AS "Feature_28", CAST("ADS"."Feature_29" AS FLOAT) AS "Feature_29", CAST("ADS"."Feature_30" AS FLOAT) AS "Feature_30", CAST("ADS"."Feature_31" AS FLOAT) AS "Feature_31", CAST("ADS"."Feature_32" AS FLOAT) AS "Feature_32", CAST("ADS"."Feature_33" AS FLOAT) AS "Feature_33", CAST("ADS"."Feature_34" AS FLOAT) AS "Feature_34", CAST("ADS"."Feature_35" AS FLOAT) AS "Feature_35", CAST("ADS"."Feature_36" AS FLOAT) AS "Feature_36", CAST("ADS"."Feature_37" AS FLOAT) AS "Feature_37", CAST("ADS"."Feature_38" AS FLOAT) AS "Feature_38", CAST("ADS"."Feature_39" AS FLOAT) AS "Feature_39", CAST("ADS"."Feature_40" AS FLOAT) AS "Feature_40", CAST("ADS"."Feature_41" AS FLOAT) AS "Feature_41", CAST("ADS"."Feature_42" AS FLOAT) AS "Feature_42", CAST("ADS"."Feature_43" AS FLOAT) AS "Feature_43", CAST("ADS"."Feature_44" AS FLOAT) AS "Feature_44", CAST("ADS"."Feature_45" AS FLOAT) AS "Feature_45", CAST("ADS"."Feature_46" AS FLOAT) AS "Feature_46", CAST("ADS"."Feature_47" AS FLOAT) AS "Feature_47", CAST("ADS"."Feature_48" AS FLOAT) AS "Feature_48", CAST("ADS"."Feature_49" AS FLOAT) AS "Feature_49", CAST("ADS"."Feature_50" AS FLOAT) AS "Feature_50", CAST("ADS"."Feature_51" AS FLOAT) AS "Feature_51", CAST("ADS"."Feature_52" AS FLOAT) AS "Feature_52", CAST("ADS"."Feature_53" AS FLOAT) AS "Feature_53", CAST("ADS"."Feature_54" AS FLOAT) AS "Feature_54", CAST("ADS"."Feature_55" AS FLOAT) AS "Feature_55", CAST("ADS"."Feature_56" AS FLOAT) AS "Feature_56", CAST("ADS"."Feature_57" AS FLOAT) AS "Feature_57", CAST("ADS"."Feature_58" AS FLOAT) AS "Feature_58", CAST("ADS"."Feature_59" AS FLOAT) AS "Feature_59", CAST("ADS"."Feature_60" AS FLOAT) AS "Feature_60", CAST("ADS"."Feature_61" AS FLOAT) AS "Feature_61", CAST("ADS"."Feature_62" AS FLOAT) AS "Feature_62", CAST("ADS"."Feature_63" AS FLOAT) AS "Feature_63", CAST("ADS"."Feature_64" AS FLOAT) AS "Feature_64", CAST("ADS"."Feature_65" AS FLOAT) AS "Feature_65", CAST("ADS"."Feature_66" AS FLOAT) AS "Feature_66", CAST("ADS"."Feature_67" AS FLOAT) AS "Feature_67", CAST("ADS"."Feature_68" AS FLOAT) AS "Feature_68", CAST("ADS"."Feature_69" AS FLOAT) AS "Feature_69", CAST("ADS"."Feature_70" AS FLOAT) AS "Feature_70", CAST("ADS"."Feature_71" AS FLOAT) AS "Feature_71", CAST("ADS"."Feature_72" AS FLOAT) AS "Feature_72", CAST("ADS"."Feature_73" AS FLOAT) AS "Feature_73", CAST("ADS"."Feature_74" AS FLOAT) AS "Feature_74", CAST("ADS"."Feature_75" AS FLOAT) AS "Feature_75", CAST("ADS"."Feature_76" AS FLOAT) AS "Feature_76", CAST("ADS"."Feature_77" AS FLOAT) AS "Feature_77", CAST("ADS"."Feature_78" AS FLOAT) AS "Feature_78", CAST("ADS"."Feature_79" AS FLOAT) AS "Feature_79", CAST("ADS"."Feature_80" AS FLOAT) AS "Feature_80", CAST("ADS"."Feature_81" AS FLOAT) AS "Feature_81", CAST("ADS"."Feature_82" AS FLOAT) AS "Feature_82", CAST("ADS"."Feature_83" AS FLOAT) AS "Feature_83", CAST("ADS"."Feature_84" AS FLOAT) AS "Feature_84", CAST("ADS"."Feature_85" AS FLOAT) AS "Feature_85", CAST("ADS"."Feature_86" AS FLOAT) AS "Feature_86", CAST("ADS"."Feature_87" AS FLOAT) AS "Feature_87", CAST("ADS"."Feature_88" AS FLOAT) AS "Feature_88", CAST("ADS"."Feature_89" AS FLOAT) AS "Feature_89", CAST("ADS"."Feature_90" AS FLOAT) AS "Feature_90", CAST("ADS"."Feature_91" AS FLOAT) AS "Feature_91", CAST("ADS"."Feature_92" AS FLOAT) AS "Feature_92", CAST("ADS"."Feature_93" AS FLOAT) AS "Feature_93", CAST("ADS"."Feature_94" AS FLOAT) AS "Feature_94", CAST("ADS"."Feature_95" AS FLOAT) AS "Feature_95", CAST("ADS"."Feature_96" AS FLOAT) AS "Feature_96", CAST("ADS"."Feature_97" AS FLOAT) AS "Feature_97", CAST("ADS"."Feature_98" AS FLOAT) AS "Feature_98", CAST("ADS"."Feature_99" AS FLOAT) AS "Feature_99" 
FROM "BinaryClass_100" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.1929844 * "IL"."Feature_0" + -0.08178544 * "IL"."Feature_1" + 0.0490519 * "IL"."Feature_2" + -0.003616374 * "IL"."Feature_3" + 0.5892253 * "IL"."Feature_4" + -0.3375529 * "IL"."Feature_5" + 0.0539044 * "IL"."Feature_6" + 0.05845304 * "IL"."Feature_7" + -0.1315445 * "IL"."Feature_8" + -0.1199187 * "IL"."Feature_9" + 0.08726554 * "IL"."Feature_10" + -0.04131799 * "IL"."Feature_11" + -0.09741468 * "IL"."Feature_12" + -0.05213514 * "IL"."Feature_13" + 0.1370507 * "IL"."Feature_14" + 0.2198991 * "IL"."Feature_15" + -0.05188221 * "IL"."Feature_16" + -0.1082764 * "IL"."Feature_17" + 0.1823413 * "IL"."Feature_18" + 0.06846435 * "IL"."Feature_19" + -0.03552255 * "IL"."Feature_20" + 0.03635841 * "IL"."Feature_21" + 0.0747733 * "IL"."Feature_22" + 0.02892761 * "IL"."Feature_23" + 0.03297194 * "IL"."Feature_24" + 0.2124563 * "IL"."Feature_25" + 0.07634496 * "IL"."Feature_26" + -0.1350374 * "IL"."Feature_27" + 0.1712241 * "IL"."Feature_28" + -0.05214787 * "IL"."Feature_29" + -0.02090862 * "IL"."Feature_30" + 0.1534073 * "IL"."Feature_31" + -0.08359777 * "IL"."Feature_32" + 0.2565933 * "IL"."Feature_33" + 0.2426266 * "IL"."Feature_34" + -0.01386057 * "IL"."Feature_35" + 0.05313549 * "IL"."Feature_36" + -0.08113943 * "IL"."Feature_37" + 0.01440895 * "IL"."Feature_38" + 0.1055268 * "IL"."Feature_39" + 0.03816301 * "IL"."Feature_40" + 0.100386 * "IL"."Feature_41" + 0.0287599 * "IL"."Feature_42" + -0.00124552 * "IL"."Feature_43" + 0.2734347 * "IL"."Feature_44" + 0.1144116 * "IL"."Feature_45" + -0.07570763 * "IL"."Feature_46" + 0.003539971 * "IL"."Feature_47" + 0.1852823 * "IL"."Feature_48" + 0.1048537 * "IL"."Feature_49" + -0.005149822 * "IL"."Feature_50" + -0.03718521 * "IL"."Feature_51" + 0.09944713 * "IL"."Feature_52" + -0.1502822 * "IL"."Feature_53" + -0.01076684 * "IL"."Feature_54" + -0.02097562 * "IL"."Feature_55" + -0.1489098 * "IL"."Feature_56" + -0.6493412 * "IL"."Feature_57" + -0.00362675 * "IL"."Feature_58" + -0.1216127 * "IL"."Feature_59" + 0.2807195 * "IL"."Feature_60" + 0.006257216 * "IL"."Feature_61" + -0.07955882 * "IL"."Feature_62" + -0.1313176 * "IL"."Feature_63" + -0.09099019 * "IL"."Feature_64" + -0.06936507 * "IL"."Feature_65" + 0.07650935 * "IL"."Feature_66" + -0.4249365 * "IL"."Feature_67" + 0.2094604 * "IL"."Feature_68" + 0.09205074 * "IL"."Feature_69" + -0.04974169 * "IL"."Feature_70" + 0.1963533 * "IL"."Feature_71" + 0.09013112 * "IL"."Feature_72" + 0.2220708 * "IL"."Feature_73" + -0.08154345 * "IL"."Feature_74" + -0.1032816 * "IL"."Feature_75" + -0.07548488 * "IL"."Feature_76" + 0.2432509 * "IL"."Feature_77" + -0.04673262 * "IL"."Feature_78" + -0.05145783 * "IL"."Feature_79" + 0.1534146 * "IL"."Feature_80" + -0.001002558 * "IL"."Feature_81" + -0.1498157 * "IL"."Feature_82" + -0.04195914 * "IL"."Feature_83" + -0.1048859 * "IL"."Feature_84" + 0.1810614 * "IL"."Feature_85" + 0.08868072 * "IL"."Feature_86" + -0.07173021 * "IL"."Feature_87" + -0.1422604 * "IL"."Feature_88" + 0.09027989 * "IL"."Feature_89" + 0.2371525 * "IL"."Feature_90" + 0.1526541 * "IL"."Feature_91" + -0.2128603 * "IL"."Feature_92" + 0.07040517 * "IL"."Feature_93" + 0.1093346 * "IL"."Feature_94" + 0.3113411 * "IL"."Feature_95" + 0.1161321 * "IL"."Feature_96" + -0.0354583 * "IL"."Feature_97" + 0.01008466 * "IL"."Feature_98" + 0.07886169 * "IL"."Feature_99" + -0.1134203 AS "NEUR_1_1", -0.1929543 * "IL"."Feature_0" + -0.08176877 * "IL"."Feature_1" + 0.04905949 * "IL"."Feature_2" + -0.003596218 * "IL"."Feature_3" + 0.5891647 * "IL"."Feature_4" + -0.3375191 * "IL"."Feature_5" + 0.05390716 * "IL"."Feature_6" + 0.05843027 * "IL"."Feature_7" + -0.1315029 * "IL"."Feature_8" + -0.1199027 * "IL"."Feature_9" + 0.08724472 * "IL"."Feature_10" + -0.04134866 * "IL"."Feature_11" + -0.09740159 * "IL"."Feature_12" + -0.05212343 * "IL"."Feature_13" + 0.1370356 * "IL"."Feature_14" + 0.2198744 * "IL"."Feature_15" + -0.05190905 * "IL"."Feature_16" + -0.1082489 * "IL"."Feature_17" + 0.1823019 * "IL"."Feature_18" + 0.06846655 * "IL"."Feature_19" + -0.03554194 * "IL"."Feature_20" + 0.03634808 * "IL"."Feature_21" + 0.07478094 * "IL"."Feature_22" + 0.02892934 * "IL"."Feature_23" + 0.03297723 * "IL"."Feature_24" + 0.212402 * "IL"."Feature_25" + 0.07632044 * "IL"."Feature_26" + -0.1350293 * "IL"."Feature_27" + 0.1712268 * "IL"."Feature_28" + -0.05215108 * "IL"."Feature_29" + -0.02089056 * "IL"."Feature_30" + 0.153423 * "IL"."Feature_31" + -0.08360333 * "IL"."Feature_32" + 0.2565553 * "IL"."Feature_33" + 0.2425751 * "IL"."Feature_34" + -0.01385617 * "IL"."Feature_35" + 0.05310535 * "IL"."Feature_36" + -0.08112339 * "IL"."Feature_37" + 0.01445031 * "IL"."Feature_38" + 0.1055131 * "IL"."Feature_39" + 0.03816922 * "IL"."Feature_40" + 0.1004164 * "IL"."Feature_41" + 0.02877143 * "IL"."Feature_42" + -0.001254272 * "IL"."Feature_43" + 0.2734227 * "IL"."Feature_44" + 0.1144049 * "IL"."Feature_45" + -0.07569805 * "IL"."Feature_46" + 0.003512365 * "IL"."Feature_47" + 0.1852712 * "IL"."Feature_48" + 0.1048304 * "IL"."Feature_49" + -0.005149469 * "IL"."Feature_50" + -0.03718139 * "IL"."Feature_51" + 0.0994327 * "IL"."Feature_52" + -0.1502894 * "IL"."Feature_53" + -0.01076957 * "IL"."Feature_54" + -0.02096358 * "IL"."Feature_55" + -0.1488771 * "IL"."Feature_56" + -0.6492702 * "IL"."Feature_57" + -0.003646773 * "IL"."Feature_58" + -0.1215958 * "IL"."Feature_59" + 0.2806912 * "IL"."Feature_60" + 0.00622883 * "IL"."Feature_61" + -0.07954165 * "IL"."Feature_62" + -0.1313153 * "IL"."Feature_63" + -0.09099811 * "IL"."Feature_64" + -0.06934454 * "IL"."Feature_65" + 0.07649541 * "IL"."Feature_66" + -0.4248699 * "IL"."Feature_67" + 0.2094288 * "IL"."Feature_68" + 0.0920548 * "IL"."Feature_69" + -0.04973711 * "IL"."Feature_70" + 0.1963258 * "IL"."Feature_71" + 0.09013645 * "IL"."Feature_72" + 0.2220369 * "IL"."Feature_73" + -0.08152105 * "IL"."Feature_74" + -0.1032502 * "IL"."Feature_75" + -0.07545381 * "IL"."Feature_76" + 0.2432255 * "IL"."Feature_77" + -0.04673349 * "IL"."Feature_78" + -0.05144491 * "IL"."Feature_79" + 0.1534307 * "IL"."Feature_80" + -0.001019315 * "IL"."Feature_81" + -0.1498019 * "IL"."Feature_82" + -0.04192334 * "IL"."Feature_83" + -0.1048585 * "IL"."Feature_84" + 0.1810433 * "IL"."Feature_85" + 0.08865487 * "IL"."Feature_86" + -0.07174224 * "IL"."Feature_87" + -0.1422003 * "IL"."Feature_88" + 0.09025826 * "IL"."Feature_89" + 0.2371073 * "IL"."Feature_90" + 0.1526 * "IL"."Feature_91" + -0.2128608 * "IL"."Feature_92" + 0.07041598 * "IL"."Feature_93" + 0.1093194 * "IL"."Feature_94" + 0.3113126 * "IL"."Feature_95" + 0.1161005 * "IL"."Feature_96" + -0.03543953 * "IL"."Feature_97" + 0.01009434 * "IL"."Feature_98" + 0.07884418 * "IL"."Feature_99" + -0.1133989 AS "NEUR_1_2", 0.2142325 * "IL"."Feature_0" + 0.09304082 * "IL"."Feature_1" + -0.05546332 * "IL"."Feature_2" + 0.008637885 * "IL"."Feature_3" + -0.6421229 * "IL"."Feature_4" + 0.3752662 * "IL"."Feature_5" + -0.05796795 * "IL"."Feature_6" + -0.06206502 * "IL"."Feature_7" + 0.1450005 * "IL"."Feature_8" + 0.1327485 * "IL"."Feature_9" + -0.09733454 * "IL"."Feature_10" + 0.0437471 * "IL"."Feature_11" + 0.1046251 * "IL"."Feature_12" + 0.0587593 * "IL"."Feature_13" + -0.1514297 * "IL"."Feature_14" + -0.2431028 * "IL"."Feature_15" + 0.05712779 * "IL"."Feature_16" + 0.1212757 * "IL"."Feature_17" + -0.2012393 * "IL"."Feature_18" + -0.07400415 * "IL"."Feature_19" + 0.03726975 * "IL"."Feature_20" + -0.03750237 * "IL"."Feature_21" + -0.08137987 * "IL"."Feature_22" + -0.03040267 * "IL"."Feature_23" + -0.0331418 * "IL"."Feature_24" + -0.237674 * "IL"."Feature_25" + -0.08578461 * "IL"."Feature_26" + 0.1473191 * "IL"."Feature_27" + -0.1949729 * "IL"."Feature_28" + 0.05902407 * "IL"."Feature_29" + 0.02389425 * "IL"."Feature_30" + -0.1685485 * "IL"."Feature_31" + 0.09259251 * "IL"."Feature_32" + -0.2825431 * "IL"."Feature_33" + -0.2698712 * "IL"."Feature_34" + 0.0130654 * "IL"."Feature_35" + -0.05832636 * "IL"."Feature_36" + 0.08972185 * "IL"."Feature_37" + -0.01399707 * "IL"."Feature_38" + -0.1145134 * "IL"."Feature_39" + -0.04361297 * "IL"."Feature_40" + -0.1085184 * "IL"."Feature_41" + -0.02904018 * "IL"."Feature_42" + 0.00243465 * "IL"."Feature_43" + -0.3022224 * "IL"."Feature_44" + -0.1243132 * "IL"."Feature_45" + 0.08105355 * "IL"."Feature_46" + -0.00352366 * "IL"."Feature_47" + -0.2036819 * "IL"."Feature_48" + -0.1133479 * "IL"."Feature_49" + 0.006350824 * "IL"."Feature_50" + 0.03956993 * "IL"."Feature_51" + -0.1144765 * "IL"."Feature_52" + 0.168762 * "IL"."Feature_53" + 0.01765768 * "IL"."Feature_54" + 0.02559076 * "IL"."Feature_55" + 0.1671596 * "IL"."Feature_56" + 0.7082179 * "IL"."Feature_57" + 0.0066485 * "IL"."Feature_58" + 0.1338258 * "IL"."Feature_59" + -0.307986 * "IL"."Feature_60" + -0.008602026 * "IL"."Feature_61" + 0.08855337 * "IL"."Feature_62" + 0.1438487 * "IL"."Feature_63" + 0.10112 * "IL"."Feature_64" + 0.07372918 * "IL"."Feature_65" + -0.08740262 * "IL"."Feature_66" + 0.4724667 * "IL"."Feature_67" + -0.2319825 * "IL"."Feature_68" + -0.09909641 * "IL"."Feature_69" + 0.05674044 * "IL"."Feature_70" + -0.2160738 * "IL"."Feature_71" + -0.1021546 * "IL"."Feature_72" + -0.2468208 * "IL"."Feature_73" + 0.09210154 * "IL"."Feature_74" + 0.1180444 * "IL"."Feature_75" + 0.08093329 * "IL"."Feature_76" + -0.265218 * "IL"."Feature_77" + 0.05182762 * "IL"."Feature_78" + 0.05710031 * "IL"."Feature_79" + -0.1748584 * "IL"."Feature_80" + -0.0002480058 * "IL"."Feature_81" + 0.1652733 * "IL"."Feature_82" + 0.04960459 * "IL"."Feature_83" + 0.1172505 * "IL"."Feature_84" + -0.2011759 * "IL"."Feature_85" + -0.09631042 * "IL"."Feature_86" + 0.08080665 * "IL"."Feature_87" + 0.1581014 * "IL"."Feature_88" + -0.09849652 * "IL"."Feature_89" + -0.2634557 * "IL"."Feature_90" + -0.1673134 * "IL"."Feature_91" + 0.2334755 * "IL"."Feature_92" + -0.07683402 * "IL"."Feature_93" + -0.1237672 * "IL"."Feature_94" + -0.3462179 * "IL"."Feature_95" + -0.1254085 * "IL"."Feature_96" + 0.04216571 * "IL"."Feature_97" + -0.01584967 * "IL"."Feature_98" + -0.08446314 * "IL"."Feature_99" + 0.1263347 AS "NEUR_1_3", -0.1929688 * "IL"."Feature_0" + -0.08176252 * "IL"."Feature_1" + 0.04903561 * "IL"."Feature_2" + -0.003579482 * "IL"."Feature_3" + 0.5891457 * "IL"."Feature_4" + -0.337488 * "IL"."Feature_5" + 0.05390312 * "IL"."Feature_6" + 0.05845454 * "IL"."Feature_7" + -0.131512 * "IL"."Feature_8" + -0.1198881 * "IL"."Feature_9" + 0.08723833 * "IL"."Feature_10" + -0.0413238 * "IL"."Feature_11" + -0.0973815 * "IL"."Feature_12" + -0.05213057 * "IL"."Feature_13" + 0.1370406 * "IL"."Feature_14" + 0.2198669 * "IL"."Feature_15" + -0.05186809 * "IL"."Feature_16" + -0.1082517 * "IL"."Feature_17" + 0.1822988 * "IL"."Feature_18" + 0.0684549 * "IL"."Feature_19" + -0.03554776 * "IL"."Feature_20" + 0.03638778 * "IL"."Feature_21" + 0.07479597 * "IL"."Feature_22" + 0.02893152 * "IL"."Feature_23" + 0.03299439 * "IL"."Feature_24" + 0.2124033 * "IL"."Feature_25" + 0.07631206 * "IL"."Feature_26" + -0.1350167 * "IL"."Feature_27" + 0.1711898 * "IL"."Feature_28" + -0.05215042 * "IL"."Feature_29" + -0.02088598 * "IL"."Feature_30" + 0.1533647 * "IL"."Feature_31" + -0.08361 * "IL"."Feature_32" + 0.2565536 * "IL"."Feature_33" + 0.2425907 * "IL"."Feature_34" + -0.01386099 * "IL"."Feature_35" + 0.05312133 * "IL"."Feature_36" + -0.0811227 * "IL"."Feature_37" + 0.01444684 * "IL"."Feature_38" + 0.1054567 * "IL"."Feature_39" + 0.03817268 * "IL"."Feature_40" + 0.1003856 * "IL"."Feature_41" + 0.02878391 * "IL"."Feature_42" + -0.001246713 * "IL"."Feature_43" + 0.273406 * "IL"."Feature_44" + 0.1144225 * "IL"."Feature_45" + -0.07568916 * "IL"."Feature_46" + 0.003506214 * "IL"."Feature_47" + 0.1852661 * "IL"."Feature_48" + 0.1048478 * "IL"."Feature_49" + -0.005155574 * "IL"."Feature_50" + -0.03717884 * "IL"."Feature_51" + 0.09948231 * "IL"."Feature_52" + -0.1502596 * "IL"."Feature_53" + -0.01074255 * "IL"."Feature_54" + -0.0209614 * "IL"."Feature_55" + -0.1488801 * "IL"."Feature_56" + -0.6492528 * "IL"."Feature_57" + -0.003620032 * "IL"."Feature_58" + -0.1215869 * "IL"."Feature_59" + 0.2806564 * "IL"."Feature_60" + 0.006227321 * "IL"."Feature_61" + -0.07951399 * "IL"."Feature_62" + -0.1313076 * "IL"."Feature_63" + -0.09100174 * "IL"."Feature_64" + -0.06934187 * "IL"."Feature_65" + 0.0765083 * "IL"."Feature_66" + -0.4248644 * "IL"."Feature_67" + 0.2094289 * "IL"."Feature_68" + 0.09203518 * "IL"."Feature_69" + -0.0497387 * "IL"."Feature_70" + 0.196353 * "IL"."Feature_71" + 0.09012849 * "IL"."Feature_72" + 0.2220107 * "IL"."Feature_73" + -0.08149943 * "IL"."Feature_74" + -0.1032472 * "IL"."Feature_75" + -0.07550318 * "IL"."Feature_76" + 0.2432182 * "IL"."Feature_77" + -0.0467382 * "IL"."Feature_78" + -0.05143554 * "IL"."Feature_79" + 0.1533745 * "IL"."Feature_80" + -0.001040042 * "IL"."Feature_81" + -0.1497971 * "IL"."Feature_82" + -0.04192591 * "IL"."Feature_83" + -0.1048663 * "IL"."Feature_84" + 0.1810692 * "IL"."Feature_85" + 0.08866266 * "IL"."Feature_86" + -0.07171051 * "IL"."Feature_87" + -0.1422063 * "IL"."Feature_88" + 0.0902988 * "IL"."Feature_89" + 0.2371195 * "IL"."Feature_90" + 0.1526256 * "IL"."Feature_91" + -0.2128067 * "IL"."Feature_92" + 0.07040497 * "IL"."Feature_93" + 0.1092991 * "IL"."Feature_94" + 0.3112863 * "IL"."Feature_95" + 0.1160941 * "IL"."Feature_96" + -0.03542217 * "IL"."Feature_97" + 0.01007688 * "IL"."Feature_98" + 0.07886789 * "IL"."Feature_99" + -0.1133898 AS "NEUR_1_4", 0.2142582 * "IL"."Feature_0" + 0.09305364 * "IL"."Feature_1" + -0.05545213 * "IL"."Feature_2" + 0.008627336 * "IL"."Feature_3" + -0.6421619 * "IL"."Feature_4" + 0.3753234 * "IL"."Feature_5" + -0.05795992 * "IL"."Feature_6" + -0.06208713 * "IL"."Feature_7" + 0.1450034 * "IL"."Feature_8" + 0.1327447 * "IL"."Feature_9" + -0.09733763 * "IL"."Feature_10" + 0.04373613 * "IL"."Feature_11" + 0.1046252 * "IL"."Feature_12" + 0.05876539 * "IL"."Feature_13" + -0.1514411 * "IL"."Feature_14" + -0.2431144 * "IL"."Feature_15" + 0.05712306 * "IL"."Feature_16" + 0.1212546 * "IL"."Feature_17" + -0.2012638 * "IL"."Feature_18" + -0.07401817 * "IL"."Feature_19" + 0.03726201 * "IL"."Feature_20" + -0.03751068 * "IL"."Feature_21" + -0.08137427 * "IL"."Feature_22" + -0.03039534 * "IL"."Feature_23" + -0.03317256 * "IL"."Feature_24" + -0.2376664 * "IL"."Feature_25" + -0.08580541 * "IL"."Feature_26" + 0.1473166 * "IL"."Feature_27" + -0.1949528 * "IL"."Feature_28" + 0.05902536 * "IL"."Feature_29" + 0.02391205 * "IL"."Feature_30" + -0.1685347 * "IL"."Feature_31" + 0.09259124 * "IL"."Feature_32" + -0.28255 * "IL"."Feature_33" + -0.2698607 * "IL"."Feature_34" + 0.01306622 * "IL"."Feature_35" + -0.0583266 * "IL"."Feature_36" + 0.08972616 * "IL"."Feature_37" + -0.01400565 * "IL"."Feature_38" + -0.1145283 * "IL"."Feature_39" + -0.04362108 * "IL"."Feature_40" + -0.1085487 * "IL"."Feature_41" + -0.02904147 * "IL"."Feature_42" + 0.002429919 * "IL"."Feature_43" + -0.3022316 * "IL"."Feature_44" + -0.1243085 * "IL"."Feature_45" + 0.08105081 * "IL"."Feature_46" + -0.003534298 * "IL"."Feature_47" + -0.2036824 * "IL"."Feature_48" + -0.113352 * "IL"."Feature_49" + 0.006335759 * "IL"."Feature_50" + 0.03957851 * "IL"."Feature_51" + -0.1145083 * "IL"."Feature_52" + 0.1687664 * "IL"."Feature_53" + 0.01765325 * "IL"."Feature_54" + 0.02559358 * "IL"."Feature_55" + 0.167168 * "IL"."Feature_56" + 0.7082631 * "IL"."Feature_57" + 0.006653211 * "IL"."Feature_58" + 0.1338358 * "IL"."Feature_59" + -0.3079847 * "IL"."Feature_60" + -0.008590902 * "IL"."Feature_61" + 0.08854861 * "IL"."Feature_62" + 0.1438508 * "IL"."Feature_63" + 0.1011178 * "IL"."Feature_64" + 0.07371852 * "IL"."Feature_65" + -0.08738119 * "IL"."Feature_66" + 0.4724712 * "IL"."Feature_67" + -0.231977 * "IL"."Feature_68" + -0.09912585 * "IL"."Feature_69" + 0.05675985 * "IL"."Feature_70" + -0.2161144 * "IL"."Feature_71" + -0.1021531 * "IL"."Feature_72" + -0.2468464 * "IL"."Feature_73" + 0.09209789 * "IL"."Feature_74" + 0.118033 * "IL"."Feature_75" + 0.08094696 * "IL"."Feature_76" + -0.2652352 * "IL"."Feature_77" + 0.05181883 * "IL"."Feature_78" + 0.05713252 * "IL"."Feature_79" + -0.1748426 * "IL"."Feature_80" + -0.0002479402 * "IL"."Feature_81" + 0.1652721 * "IL"."Feature_82" + 0.04959877 * "IL"."Feature_83" + 0.1172494 * "IL"."Feature_84" + -0.2011709 * "IL"."Feature_85" + -0.09632444 * "IL"."Feature_86" + 0.08080504 * "IL"."Feature_87" + 0.1581023 * "IL"."Feature_88" + -0.09851023 * "IL"."Feature_89" + -0.2634668 * "IL"."Feature_90" + -0.1673377 * "IL"."Feature_91" + 0.2334549 * "IL"."Feature_92" + -0.07683827 * "IL"."Feature_93" + -0.1237699 * "IL"."Feature_94" + -0.3462003 * "IL"."Feature_95" + -0.1254377 * "IL"."Feature_96" + 0.04217795 * "IL"."Feature_97" + -0.0158546 * "IL"."Feature_98" + -0.08447528 * "IL"."Feature_99" + 0.1263522 AS "NEUR_1_5" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -2.002565 * "HL_1_logistic_1"."NEUR_1_1" + -2.002215 * "HL_1_logistic_1"."NEUR_1_2" + 2.506505 * "HL_1_logistic_1"."NEUR_1_3" + -2.002134 * "HL_1_logistic_1"."NEUR_1_4" + 2.506654 * "HL_1_logistic_1"."NEUR_1_5" + 0.381115 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"