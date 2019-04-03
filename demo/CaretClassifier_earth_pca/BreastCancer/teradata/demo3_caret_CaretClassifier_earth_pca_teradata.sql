-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth_pca
-- Dataset : BreastCancer
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(14.07771208791209 AS DOUBLE PRECISION)) / CAST(3.54905150054038 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(19.039054945054946 AS DOUBLE PRECISION)) / CAST(4.166878656652379 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(91.66178021978024 AS DOUBLE PRECISION)) / CAST(24.530943852514174 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(650.9676923076922 AS DOUBLE PRECISION)) / CAST(356.0943508808365 AS DOUBLE PRECISION) AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - CAST(0.096421846153846 AS DOUBLE PRECISION)) / CAST(0.014213447427476 AS DOUBLE PRECISION) AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - CAST(0.104416131868132 AS DOUBLE PRECISION)) / CAST(0.053462476960143 AS DOUBLE PRECISION) AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - CAST(0.088262326813187 AS DOUBLE PRECISION)) / CAST(0.082002163460572 AS DOUBLE PRECISION) AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - CAST(0.0485164 AS DOUBLE PRECISION)) / CAST(0.039416456009076 AS DOUBLE PRECISION) AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - CAST(0.181588571428571 AS DOUBLE PRECISION)) / CAST(0.027820647284985 AS DOUBLE PRECISION) AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - CAST(0.062940307692308 AS DOUBLE PRECISION)) / CAST(0.007027080900659 AS DOUBLE PRECISION) AS "Feature_9", (CAST("ADS"."Feature_10" AS DOUBLE PRECISION) - CAST(0.409917362637363 AS DOUBLE PRECISION)) / CAST(0.2915245412208 AS DOUBLE PRECISION) AS "Feature_10", (CAST("ADS"."Feature_11" AS DOUBLE PRECISION) - CAST(1.217069450549451 AS DOUBLE PRECISION)) / CAST(0.536980052183999 AS DOUBLE PRECISION) AS "Feature_11", (CAST("ADS"."Feature_12" AS DOUBLE PRECISION) - CAST(2.905249010989012 AS DOUBLE PRECISION)) / CAST(2.144852707447646 AS DOUBLE PRECISION) AS "Feature_12", (CAST("ADS"."Feature_13" AS DOUBLE PRECISION) - CAST(40.87988571428571 AS DOUBLE PRECISION)) / CAST(48.2778362287006 AS DOUBLE PRECISION) AS "Feature_13", (CAST("ADS"."Feature_14" AS DOUBLE PRECISION) - CAST(0.007055971428571 AS DOUBLE PRECISION)) / CAST(0.002866803723189 AS DOUBLE PRECISION) AS "Feature_14", (CAST("ADS"."Feature_15" AS DOUBLE PRECISION) - CAST(0.025567830769231 AS DOUBLE PRECISION)) / CAST(0.017966768192468 AS DOUBLE PRECISION) AS "Feature_15", (CAST("ADS"."Feature_16" AS DOUBLE PRECISION) - CAST(0.031999256263736 AS DOUBLE PRECISION)) / CAST(0.031699790817464 AS DOUBLE PRECISION) AS "Feature_16", (CAST("ADS"."Feature_17" AS DOUBLE PRECISION) - CAST(0.011972369230769 AS DOUBLE PRECISION)) / CAST(0.006399041370931 AS DOUBLE PRECISION) AS "Feature_17", (CAST("ADS"."Feature_18" AS DOUBLE PRECISION) - CAST(0.0208962 AS DOUBLE PRECISION)) / CAST(0.008592357424589 AS DOUBLE PRECISION) AS "Feature_18", (CAST("ADS"."Feature_19" AS DOUBLE PRECISION) - CAST(0.003846551868132 AS DOUBLE PRECISION)) / CAST(0.002746627518834 AS DOUBLE PRECISION) AS "Feature_19", (CAST("ADS"."Feature_20" AS DOUBLE PRECISION) - CAST(16.17776483516484 AS DOUBLE PRECISION)) / CAST(4.822761469227882 AS DOUBLE PRECISION) AS "Feature_20", (CAST("ADS"."Feature_21" AS DOUBLE PRECISION) - CAST(25.26505494505495 AS DOUBLE PRECISION)) / CAST(5.929844025113361 AS DOUBLE PRECISION) AS "Feature_21", (CAST("ADS"."Feature_22" AS DOUBLE PRECISION) - CAST(106.68156043956041 AS DOUBLE PRECISION)) / CAST(33.740956745431944 AS DOUBLE PRECISION) AS "Feature_22", (CAST("ADS"."Feature_23" AS DOUBLE PRECISION) - CAST(870.863956043956 AS DOUBLE PRECISION)) / CAST(567.6191564029466 AS DOUBLE PRECISION) AS "Feature_23", (CAST("ADS"."Feature_24" AS DOUBLE PRECISION) - CAST(0.13182756043956 AS DOUBLE PRECISION)) / CAST(0.022773246833691 AS DOUBLE PRECISION) AS "Feature_24", (CAST("ADS"."Feature_25" AS DOUBLE PRECISION) - CAST(0.249918065934066 AS DOUBLE PRECISION)) / CAST(0.152636761409878 AS DOUBLE PRECISION) AS "Feature_25", (CAST("ADS"."Feature_26" AS DOUBLE PRECISION) - CAST(0.265461593406593 AS DOUBLE PRECISION)) / CAST(0.20715345315455 AS DOUBLE PRECISION) AS "Feature_26", (CAST("ADS"."Feature_27" AS DOUBLE PRECISION) - CAST(0.11348798021978 AS DOUBLE PRECISION)) / CAST(0.066454479854971 AS DOUBLE PRECISION) AS "Feature_27", (CAST("ADS"."Feature_28" AS DOUBLE PRECISION) - CAST(0.289788131868132 AS DOUBLE PRECISION)) / CAST(0.062273176353856 AS DOUBLE PRECISION) AS "Feature_28", (CAST("ADS"."Feature_29" AS DOUBLE PRECISION) - CAST(0.083641450549451 AS DOUBLE PRECISION)) / CAST(0.017083929682537 AS DOUBLE PRECISION) AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.217683430942231 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.103932621840473 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.226516494432918 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.219937367115752 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.142688339804129 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.240247986705735 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.257355901686626 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.259768075058768 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.138686203853175 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.067121901952641 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(-0.206915072014723 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.033057177600798 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.212828518237874 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(-0.201343916005629 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(-0.020498651640666 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(-0.175018165389591 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(-0.151907863734216 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(-0.186520360795073 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(-0.053039357385151 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(-0.10231665221046 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(-0.226956028801125 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(-0.103170177789588 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(-0.23602999862164 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(-0.22400061765358 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(-0.1271722054983 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(-0.212227598804688 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.227589888283134 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.24901254417017 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(-0.119440325229198 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.131664193388763 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.238826349609588 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.05323416968015 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.219414494897118 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.234217138884359 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.179258656241294 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.143164954396835 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.060421476801465 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.037229758876659 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.194621206634155 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.373177781501574 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.094816943320351 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.102620871595644 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.080140492340605 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(0.146835894343985 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(-0.216655420622534 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(-0.226338829805467 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(-0.201333089741393 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(-0.137441391990617 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(-0.185100806828394 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(-0.278779737341481 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(0.222858502818087 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(0.047963725611859 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(0.201445326631997 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(0.221179001257737 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(-0.163885336507332 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(-0.127718518648599 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.092084520559841 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(0.011803637990257 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(-0.132187911586156 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.272971048775739 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.005390218995133 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.075591883247694 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.006630034456413 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.033075395472575 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.114086062763175 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.082432044510616 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.003463154652769 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.025369092650601 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.035453048924462 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.033460358570261 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.270260660710177 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(0.388958007482449 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.265539009843534 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(0.220879960519156 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(0.3008320709227 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(0.148709959450358 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(0.156179295648034 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(0.205270067181862 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(0.272750923451349 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(0.204915595705138 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(-0.046510172142434 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(-0.030620841495122 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(-0.049083061111186 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(-0.009372073109054 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(-0.271616237234525 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(-0.240403698689466 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.177280883824087 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.175915814992244 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(-0.274160334199386 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.237521133697271 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(0.032221335163821 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.5981813597757 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.032746846361045 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.051633089886459 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.18948861304326 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(0.025213175765624 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(0.020686309537883 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.065565367204863 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.075813475986587 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.039784025514565 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.121032671826561 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.325345670134824 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.104031604511612 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(0.13096113686887 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(0.085297672418732 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(-0.050502564778266 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(-0.01385863695613 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(0.05163647078327 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(0.078456236111378 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(-0.018002248341178 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(0.013408103566084 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(-0.625511730189648 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(0.008890529878087 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(0.032065750522696 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(0.062186141985539 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(-0.102085620871948 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.074044078848422 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.001759497416926 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(-0.020695280701915 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.091722753054843 AS DOUBLE PRECISION) AS "PC4", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.035835865264382 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.106685564945461 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.035800633845637 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.011865234346508 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(0.347292662635717 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.012796385957629 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.09686339610084 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(0.03026292527325 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.291973484337898 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.024129207305014 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.131999234848729 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(0.211574254826339 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.102488205015533 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(0.108745533116794 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(0.254481274142308 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(-0.274668406105013 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(-0.354097997130516 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(-0.198474526349753 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(0.24138551945384 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(-0.274610768695193 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(0.004389707117489 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(0.153048903091874 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(-0.006297570008106 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(0.024490234840885 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(0.321235488283456 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(-0.100489551274848 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.183017923690435 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.040928253036371 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(0.254784752307899 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.09149620178238 AS DOUBLE PRECISION) AS "PC5", "ADS_sca_1_OUT"."Feature_0" * CAST(0.025782770511158 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.034886831505043 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.023378796244408 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(5.3116327342e-05 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.283159919000426 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.018235916695544 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.006064933411659 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.046706966053113 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(0.351702041143318 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(-0.126940974137192 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(-0.04444970338492 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.051300450787033 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(-0.015070584315049 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(-0.062144812242604 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(-0.300750288327894 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(0.053835770016019 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(0.072478282061014 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(-0.004176250281304 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(0.499285978460697 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(-0.053411045778769 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(0.004227623567498 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(-0.048845014807011 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(0.013672434730137 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(-0.025887660162104 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(-0.359569065767781 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(0.03179116825393 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(0.028488546262953 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.024367902666235 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(0.519296862318877 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(-0.104601143324702 AS DOUBLE PRECISION) AS "PC6", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.124579083120113 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.043675631031052 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.117270291494122 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.048694102247471 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_4" * CAST(-0.172483294243255 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_5" * CAST(-0.011620880573293 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_6" * CAST(-0.126047844683538 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_7" * CAST(-0.191035911697992 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_8" * CAST(-0.074635231477812 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_9" * CAST(0.253653369342377 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_10" * CAST(0.315346005169471 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_11" * CAST(-0.20406041132463 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_12" * CAST(0.312999965356144 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_13" * CAST(0.367399574957318 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_14" * CAST(-0.168697058125119 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_15" * CAST(0.038862180903855 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_16" * CAST(-0.179645115289147 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_17" * CAST(-0.360304320267129 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_18" * CAST(-0.046310204134161 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_19" * CAST(0.1911198229593 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_20" * CAST(-0.000514481963128 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_21" * CAST(0.030363622992811 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_22" * CAST(0.008358940593793 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_23" * CAST(0.08117799599204 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_24" * CAST(-0.088589518966147 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_25" * CAST(0.133762576713541 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_26" * CAST(-0.065533299830891 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_27" * CAST(-0.177293708469134 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_28" * CAST(0.06513011232874 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_29" * CAST(0.369067836821968 AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_sca_1_OUT"), 
earth_input AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE PRECISION) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE PRECISION) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE PRECISION) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE PRECISION) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE PRECISION) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE PRECISION) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE PRECISION) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
earth_cte AS 
(SELECT earth_input."KEY" AS "KEY", CAST(1.79165268356152 AS DOUBLE PRECISION) * greatest(CAST(3.563945021817851 AS DOUBLE PRECISION) - earth_input."PC2", CAST(0 AS DOUBLE PRECISION)) + CAST(-0.014017405790404 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(1.579711298428207 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-1.620075060583419 AS DOUBLE PRECISION) * greatest(earth_input."PC5" - CAST(-2.411286533387839 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(0.967533870455447 AS DOUBLE PRECISION) * greatest(CAST(-2.411286533387839 AS DOUBLE PRECISION) - earth_input."PC5", CAST(0 AS DOUBLE PRECISION)) + CAST(6.345520282117602 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-1.782370631524911 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-2.003582731836303 AS DOUBLE PRECISION) * greatest(CAST(-0.746707169021883 AS DOUBLE PRECISION) - earth_input."PC3", CAST(0 AS DOUBLE PRECISION)) + CAST(-4.868380147370194 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(0.049765164824712 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-10.58652362411445 AS DOUBLE PRECISION) AS earth 
FROM earth_input), 
dot_prod_logistic AS 
(SELECT earth_cte."KEY" AS "KEY", earth_cte.earth AS dot_prod, CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -earth_cte.earth)))) AS logistic 
FROM earth_cte)
 SELECT dot_prod_logistic."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic AS "Proba_0", dot_prod_logistic.logistic AS "Proba_1", CASE WHEN (CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic IS NULL OR CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (dot_prod_logistic.dot_prod > CAST(0.0 AS DOUBLE PRECISION)) THEN 1 ELSE 0 END AS "Decision", greatest(CAST(1.0 AS DOUBLE PRECISION) - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS "DecisionProba" 
FROM dot_prod_logistic