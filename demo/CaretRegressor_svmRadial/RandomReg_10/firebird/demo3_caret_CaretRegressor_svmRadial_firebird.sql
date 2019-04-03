-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial
-- Dataset : RandomReg_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 0.1668094729813739) / 1.03547567419981 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - -0.1635127199444346) / 0.9978373487111776 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.19149292241003152) / 0.9379956714934372 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.05838484475305535) / 1.092422041481253 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - -0.09933205162122273) / 1.081168997121092 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - 0.21293121660488026) / 0.9417116446342017 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - 0.0478655686900296) / 1.1435269275597653 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.05078698959084227) / 0.9786817421858578 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - -0.19131992259081876) / 1.1488000469275086 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.1994040567747336) / 0.8878119561240071 AS "Feature_9" 
FROM "RandomReg_10" AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6, "Values".sv_7 AS sv_7, "Values".sv_8 AS sv_8, "Values".sv_9 AS sv_9 
FROM (SELECT 0 AS sv_idx, -0.05611259979134855 AS dual_coeff, -1.8827280576590115 AS sv_0, 0.724982394594464 AS sv_1, -0.06223818134692664 AS sv_2, 0.1086768081958077 AS sv_3, -1.238570186526453 AS sv_4, 0.36650639196020557 AS sv_5, 0.2468860302995063 AS sv_6, 0.9774533615536478 AS sv_7, -0.4734616458647326 AS sv_8, 0.3725660959700348 AS sv_9 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, -0.7781709427934019 AS dual_coeff, 0.4785437518358345 AS sv_0, 0.018891732529543608 AS sv_1, -0.6554729136727058 AS sv_2, -1.1973068799329043 AS sv_3, -0.4155159321626604 AS sv_4, -1.4336902283492965 AS sv_5, -0.02731372875903669 AS sv_6, -0.08493842659811271 AS sv_7, 0.09652837719883717 AS sv_8, 0.4953729209323838 AS sv_9 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, 0.5020497366978377 AS dual_coeff, 0.6785831863389769 AS sv_0, 0.4868816844261072 AS sv_1, -0.6710965821240465 AS sv_2, -0.18829814234935566 AS sv_3, -0.28178469121966554 AS sv_4, 1.7832855562123642 AS sv_5, 0.02490916834489113 AS sv_6, -0.9024249705523992 AS sv_7, 0.07993872833815079 AS sv_8, 0.6939839409733441 AS sv_9 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -0.8823088389117238 AS dual_coeff, 0.2680698661277761 AS sv_0, -0.4461897205160905 AS sv_1, -2.0558589236324876 AS sv_2, 1.2926160274843284 AS sv_3, -1.2675717865713472 AS sv_4, 0.25357132495994994 AS sv_5, -0.3370872309606493 AS sv_6, -0.14320015157675564 AS sv_7, -0.04959285923793974 AS sv_8, 0.466807540059304 AS sv_9 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, -0.5085151788170241 AS dual_coeff, 0.39047056456195584 AS sv_0, 0.1488536419721601 AS sv_1, -1.8280939591874328 AS sv_2, 1.6799564851674555 AS sv_3, 0.5043689175992024 AS sv_4, -1.4169241888667339 AS sv_5, -0.3382383933109749 AS sv_6, -0.12947729913758005 AS sv_7, 0.03543913953566647 AS sv_8, 0.8086056106194598 AS sv_9 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, -0.4426787343877673 AS sv_0, 1.2281533532870736 AS sv_1, 1.6431903712000102 AS sv_2, 0.452040951867532 AS sv_3, 0.5279950998625315 AS sv_4, 0.4253335930076349 AS sv_5, 0.15419085128064947 AS sv_6, -0.6402654136972912 AS sv_7, 0.20002320576694027 AS sv_8, -0.3524693883523228 AS sv_9 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, 2.1897434261845814 AS sv_0, 0.016021399542134742 AS sv_1, 0.1359297039999241 AS sv_2, -3.7070593680585056 AS sv_3, -1.8761754233490704 AS sv_4, 1.947270781451251 AS sv_5, -1.1733888200668974 AS sv_6, -2.1601324120989127 AS sv_7, -1.2726149248995307 AS sv_8, -0.2070353637059528 AS sv_9 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, -1.0 AS dual_coeff, 0.4483872364085215 AS sv_0, 0.6884394019355841 AS sv_1, 0.20894764236472846 AS sv_2, -1.7301685997297536 AS sv_3, -2.499108640156026 AS sv_4, 1.0283476749880518 AS sv_5, -0.2521394364065253 AS sv_6, -1.2848136580714031 AS sv_7, -0.18385982353202487 AS sv_8, -2.9375519330012647 AS sv_9 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 0.6689637960631071 AS dual_coeff, 0.4956460925874776 AS sv_0, -0.7786742030951834 AS sv_1, 1.924431320150188 AS sv_2, 1.7533265613459803 AS sv_3, 0.23068208596488116 AS sv_4, -0.7829456093829033 AS sv_5, -0.13915055557691566 AS sv_6, -0.049022494549060665 AS sv_7, 0.18483882350589967 AS sv_8, 0.15373191746324205 AS sv_9 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 0.06087733931458913 AS dual_coeff, -1.524055629147882 AS sv_0, 0.6875382881845146 AS sv_1, -0.2390900719788746 AS sv_2, -1.2169221795137515 AS sv_3, 1.0163970392672472 AS sv_4, 0.2605433664957924 AS sv_5, 0.5204439495886596 AS sv_6, -0.5584056265072476 AS sv_7, 0.8340561100506123 AS sv_8, -0.9696040857804114 AS sv_9 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, 0.26097324245444764 AS dual_coeff, -0.9271491767931072 AS sv_0, -0.29646216165576045 AS sv_1, 0.4298359624818339 AS sv_2, 0.3073257411052712 AS sv_3, 0.2616156204617181 AS sv_4, 1.075681151634291 AS sv_5, -0.2437184248034896 AS sv_6, -0.6762350467347189 AS sv_7, 0.1331970337302381 AS sv_8, 0.607067874754704 AS sv_9 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.5098073917591002 AS dual_coeff, 0.8029756815038512 AS sv_0, 0.40025368143111817 AS sv_1, 1.574911935736435 AS sv_2, 0.07497863587341896 AS sv_3, -0.23145157833681365 AS sv_4, 0.2352533173223821 AS sv_5, -0.14550184084054046 AS sv_6, 0.03542459666527476 AS sv_7, -1.8395364352466896 AS sv_8, 1.8858463881693612 AS sv_9 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, 1.2763954392081525 AS sv_0, -1.2743508868059887 AS sv_1, -0.14539796835240704 AS sv_2, -0.450556180325485 AS sv_3, -1.1634998904416063 AS sv_4, -1.9163242343511713 AS sv_5, 0.380117836063917 AS sv_6, -0.148162273628504 AS sv_7, 0.15949455037943067 AS sv_8, -1.0297200010875707 AS sv_9 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, 0.05598729540479543 AS dual_coeff, 0.2170996531284852 AS sv_0, 0.8970789099398414 AS sv_1, -0.341412180272584 AS sv_2, 0.4001997860710885 AS sv_3, 1.4500484060253642 AS sv_4, 0.04879300958589827 AS sv_5, -0.2011642733213813 AS sv_6, -0.11355544977328938 AS sv_7, -0.1358926104046439 AS sv_8, -1.6683106733239053 AS sv_9 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, 0.8791063858821992 AS dual_coeff, 1.9232046603679351 AS sv_0, 0.43209797836109287 AS sv_1, 0.8106822433515124 AS sv_2, 1.7503047642735197 AS sv_3, 0.07517573429587172 AS sv_4, -1.552922751803831 AS sv_5, 1.0570744292424523 AS sv_6, 0.5712766379310893 AS sv_7, 0.01996270147121879 AS sv_8, 0.4562219039956315 AS sv_9 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, 0.04836838250889044 AS dual_coeff, -0.502079623204086 AS sv_0, 1.256010059513794 AS sv_1, -2.4420588083326065 AS sv_2, -0.1819872820672824 AS sv_3, -1.2059412724599297 AS sv_4, 0.19289361077680642 AS sv_5, -0.008226689153290284 AS sv_6, 0.8993596903178219 AS sv_7, 1.150359827256752 AS sv_8, 1.6681092634916177 AS sv_9 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, -0.9027796655309624 AS dual_coeff, -2.0168410852262535 AS sv_0, -0.4926263315852353 AS sv_1, -0.07915362068129708 AS sv_2, -0.4727917052396186 AS sv_3, 1.024572967669092 AS sv_4, -1.3309351436354426 AS sv_5, -0.39282614957455436 AS sv_6, 0.2512011194916247 AS sv_7, -0.921153338320058 AS sv_8, 1.1156962635834322 AS sv_9 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, 0.00871113941383587 AS dual_coeff, -0.905361864109698 AS sv_0, -0.061963933552185324 AS sv_1, 0.5826189498452101 AS sv_2, -0.2500025816758729 AS sv_3, 0.2385078420912808 AS sv_4, -0.4902464939409862 AS sv_5, 0.23922847485392626 AS sv_6, 1.2258991929127099 AS sv_7, 0.10458633733689676 AS sv_8, -0.21537073207696186 AS sv_9 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, -0.06620332612134837 AS dual_coeff, -1.7281283914860315 AS sv_0, 0.9709795032353826 AS sv_1, -1.2002369808900195 AS sv_2, 0.7384497551983326 AS sv_3, -0.8126633024709343 AS sv_4, 0.5036725552616403 AS sv_5, -0.15718020747473024 AS sv_6, -0.548467860950834 AS sv_7, 0.3679584791736932 AS sv_8, 0.5998946677988629 AS sv_9 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, 0.8539999317748908 AS dual_coeff, 1.3607059066356704 AS sv_0, 0.306310089646293 AS sv_1, -0.3672330324719659 AS sv_2, 0.4881718398137078 AS sv_3, 0.712236874044202 AS sv_4, 0.4774951159380197 AS sv_5, 0.03357680400585403 AS sv_6, 0.7774435360671683 AS sv_7, 0.14401796034134404 AS sv_8, 0.5756106163579257 AS sv_9 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, -1.0 AS dual_coeff, -0.3367795047933305 AS sv_0, -1.6721581876474532 AS sv_1, -1.866557450543607 AS sv_2, -0.9810352611139644 AS sv_3, -0.9614214841752102 AS sv_4, -1.0231894253818945 AS sv_5, -0.6750418339230857 AS sv_6, -0.6304890884632106 AS sv_7, 0.3865408603405424 AS sv_8, 0.12290161855272208 AS sv_9 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, 0.4149600245757619 AS dual_coeff, -0.11201347904015407 AS sv_0, 1.5102532732718412 AS sv_1, 1.060509764808264 AS sv_2, -0.6601147162669645 AS sv_3, -0.2668979709753516 AS sv_4, -0.10063243130200766 AS sv_5, 0.3093370625161703 AS sv_6, -0.2357125559195538 AS sv_7, -0.4419655111420612 AS sv_8, 0.03677558520229348 AS sv_9 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, -1.0 AS dual_coeff, -0.7446863768011411 AS sv_0, -0.3173517151419671 AS sv_1, -1.0082940895736627 AS sv_2, 0.3434631503553011 AS sv_3, 1.2104060441575617 AS sv_4, -2.087741880922677 AS sv_5, 0.40903718018896396 AS sv_6, 0.0635164701607597 AS sv_7, 0.2847319922914825 AS sv_8, -1.0811856100265012 AS sv_9 FROM rdb$database UNION ALL SELECT 23 AS sv_idx, 0.6851716799721084 AS dual_coeff, 0.41913318828844176 AS sv_0, 0.9693770886225114 AS sv_1, 1.6081059846634194 AS sv_2, -0.132843233601535 AS sv_3, -0.920980326178728 AS sv_4, 0.30636177779210766 AS sv_5, -1.5465658170870018 AS sv_6, -0.8844479453693075 AS sv_7, 0.5958315806163418 AS sv_8, 0.19058527832372585 AS sv_9 FROM rdb$database UNION ALL SELECT 24 AS sv_idx, -0.635877823637242 AS dual_coeff, 1.5180769029967636 AS sv_0, 0.40496664528643456 AS sv_1, -1.349843003662979 AS sv_2, 0.44208802596222335 AS sv_3, -0.6521819032805605 AS sv_4, -0.6826908105404625 AS sv_5, -0.4773556871612914 AS sv_6, 0.3598726003985532 AS sv_7, -0.7149867344375801 AS sv_8, 0.4858969588068074 AS sv_9 FROM rdb$database UNION ALL SELECT 25 AS sv_idx, 1.0 AS dual_coeff, 0.7198997497294382 AS sv_0, 0.7057864004452998 AS sv_1, 0.8793539656137299 AS sv_2, -0.1284780147596581 AS sv_3, 1.7663607257305791 AS sv_4, -1.735677226753097 AS sv_5, -0.8965745995896988 AS sv_6, 0.8046484803010691 AS sv_7, 1.6942921475105523 AS sv_8, 0.4921099525569234 AS sv_9 FROM rdb$database UNION ALL SELECT 26 AS sv_idx, -0.12232534893350093 AS dual_coeff, 0.18987162934019505 AS sv_0, 3.241142671951388 AS sv_1, -0.538345020719418 AS sv_2, -0.06814748769809681 AS sv_3, 0.6608587861206779 AS sv_4, -0.8916944835468283 AS sv_5, -0.23558363309108624 AS sv_6, 0.2873305724951182 AS sv_7, -0.863842495987049 AS sv_8, -2.484004736296389 AS sv_9 FROM rdb$database UNION ALL SELECT 27 AS sv_idx, 0.3052846914818693 AS dual_coeff, 0.8435155685466832 AS sv_0, -1.268905436145621 AS sv_1, 0.6422700119026701 AS sv_2, 1.226693280288045 AS sv_3, 1.4752243060031258 AS sv_4, -0.6168590170828174 AS sv_5, 0.3089940727298373 AS sv_6, 1.894497201379804 AS sv_7, 0.18840793707257955 AS sv_8, -1.7050808114408575 AS sv_9 FROM rdb$database UNION ALL SELECT 28 AS sv_idx, 1.0 AS dual_coeff, 0.9863451308921274 AS sv_0, 0.8068375141404786 AS sv_1, -0.481869483126543 AS sv_2, -0.2806281147295018 AS sv_3, 0.16916286244207734 AS sv_4, 1.4553196491617308 AS sv_5, 0.6239745536111131 AS sv_6, 0.9828168027369012 AS sv_7, 0.7452294509648771 AS sv_8, 1.2066044923109975 AS sv_9 FROM rdb$database UNION ALL SELECT 29 AS sv_idx, 1.0 AS dual_coeff, 0.21862046259210835 AS sv_0, 0.0008778363753956915 AS sv_1, 2.429159355867712 AS sv_2, 0.6449150364417418 AS sv_3, 0.663647301317877 AS sv_4, -0.6093759322430545 AS sv_5, -0.4648534272676816 AS sv_6, -0.6999006450067693 AS sv_7, 0.034170244613154085 AS sv_8, 1.768234676613871 AS sv_9 FROM rdb$database UNION ALL SELECT 30 AS sv_idx, -0.5002862428114032 AS dual_coeff, -1.4496154504063476 AS sv_0, -0.34742041799691586 AS sv_1, -0.657404623678108 AS sv_2, 0.6940353395275274 AS sv_3, -0.6916396131457533 AS sv_4, -1.2357898299272323 AS sv_5, 0.3434427569241204 AS sv_6, 0.13587693932051087 AS sv_7, 1.3607050467987876 AS sv_8, -0.4834943150035081 AS sv_9 FROM rdb$database UNION ALL SELECT 31 AS sv_idx, 0.3226586346832567 AS dual_coeff, -1.9268798715014772 AS sv_0, 0.00024969818513483045 AS sv_1, -1.246059571247223 AS sv_2, -0.6843956763431998 AS sv_3, -0.3672414506884244 AS sv_4, 0.8966130953192822 AS sv_5, -1.4216526676892487 AS sv_6, 0.4931875259798141 AS sv_7, 1.6967384562737722 AS sv_8, 2.2341975610819973 AS sv_9 FROM rdb$database UNION ALL SELECT 32 AS sv_idx, -0.03463622331269754 AS dual_coeff, -1.0234074282548076 AS sv_0, -0.4856784898785473 AS sv_1, -1.137183754662056 AS sv_2, 1.0816614085943108 AS sv_3, -0.8696288489840609 AS sv_4, 0.889090240432961 AS sv_5, 2.2543443305258424 AS sv_6, 0.30856423299082913 AS sv_7, -0.6243040736105212 AS sv_8, 0.804756901395073 AS sv_9 FROM rdb$database UNION ALL SELECT 33 AS sv_idx, 0.9935418825495064 AS dual_coeff, 0.10919945375605628 AS sv_0, 0.8433284775994204 AS sv_1, 1.3598441722933732 AS sv_2, -0.196022132095844 AS sv_3, -0.6908644327296471 AS sv_4, -0.8966125913233876 AS sv_5, 1.9701527740970948 AS sv_6, -0.8082892613915197 AS sv_7, 1.0110213051178871 AS sv_8, 0.463304182882941 AS sv_9 FROM rdb$database UNION ALL SELECT 34 AS sv_idx, 0.916018624660406 AS dual_coeff, 1.3102444441588663 AS sv_0, 0.9037431836065096 AS sv_1, -1.7746560854798719 AS sv_2, -0.4753453856152117 AS sv_3, -0.09820438035517837 AS sv_4, 0.9674882108476756 AS sv_5, -0.16161209474314236 AS sv_6, 1.4114989478299624 AS sv_7, 1.7990009932572892 AS sv_8, -0.2378767549162636 AS sv_9 FROM rdb$database UNION ALL SELECT 35 AS sv_idx, -0.06240092691588859 AS dual_coeff, 0.9636206513740884 AS sv_0, -1.0861737538579084 AS sv_1, 0.29576580871746466 AS sv_2, -0.4557272976818767 AS sv_3, -1.1689107967402732 AS sv_4, 0.3282752366192425 AS sv_5, 0.7868047722775816 AS sv_6, 1.1373868275281982 AS sv_7, -0.6183878197376399 AS sv_8, 0.4849085106534772 AS sv_9 FROM rdb$database UNION ALL SELECT 36 AS sv_idx, -0.487028418842999 AS dual_coeff, 0.7414640166062334 AS sv_0, -1.7404288193447846 AS sv_1, -0.01295769871218982 AS sv_2, 0.11827419135111775 AS sv_3, -0.4064407543653299 AS sv_4, 1.1407051796213417 AS sv_5, -2.28623548027599 AS sv_6, 0.5849210940249358 AS sv_7, -0.05016362926855849 AS sv_8, -0.3878211960602255 AS sv_9 FROM rdb$database UNION ALL SELECT 37 AS sv_idx, -1.0 AS dual_coeff, -1.2283186371902604 AS sv_0, -0.4594585142824804 AS sv_1, 0.4972278687125338 AS sv_2, 0.12718166597646013 AS sv_3, -2.359578163126257 AS sv_4, -0.9964058627320505 AS sv_5, 0.010040352863755424 AS sv_6, -0.8817958068786117 AS sv_7, 0.15687975259078493 AS sv_8, -1.1151738104615323 AS sv_9 FROM rdb$database UNION ALL SELECT 38 AS sv_idx, -1.0 AS dual_coeff, -0.31684650929921115 AS sv_0, -1.5161772045088666 AS sv_1, -0.3931920935029703 AS sv_2, -0.18346692037497847 AS sv_3, -0.8856558809008538 AS sv_4, -0.18528776927103782 AS sv_5, 0.6745857112886076 AS sv_6, -1.8524117443078896 AS sv_7, -0.21116271210591867 AS sv_8, 0.9349121095979221 AS sv_9 FROM rdb$database UNION ALL SELECT 39 AS sv_idx, -0.11494382538100513 AS dual_coeff, -0.16406641535150213 AS sv_0, -0.4495259484956444 AS sv_1, 0.3806115524543143 AS sv_2, 0.6380904280804766 AS sv_3, -1.8221001117864324 AS sv_4, 0.5694396983817546 AS sv_5, 0.04053170937628683 AS sv_6, -0.8999947225455794 AS sv_7, 1.1544478237911453 AS sv_8, -1.4844279231081499 AS sv_9 FROM rdb$database UNION ALL SELECT 40 AS sv_idx, 0.8164317187955374 AS dual_coeff, -0.3079861231558801 AS sv_0, -0.0011616579769931435 AS sv_1, 0.3332263713755074 AS sv_2, 0.5696103821350021 AS sv_3, 1.055256786717997 AS sv_4, -0.7637359213164294 AS sv_5, -0.7516313862001823 AS sv_6, 1.1566607464941543 AS sv_7, 1.312356319052044 AS sv_8, 0.4025229371894364 AS sv_9 FROM rdb$database UNION ALL SELECT 41 AS sv_idx, -0.1562076915170493 AS dual_coeff, -1.1746600532488811 AS sv_0, -2.206015524379332 AS sv_1, 0.7958680309227338 AS sv_2, -1.9209596366977884 AS sv_3, -0.15648655815993828 AS sv_4, 1.6031158415598743 AS sv_5, -0.11210160754793859 AS sv_6, 0.6339218386596286 AS sv_7, 0.02402492070430695 AS sv_8, 0.23800763249372844 AS sv_9 FROM rdb$database UNION ALL SELECT 42 AS sv_idx, -0.17929017517174423 AS dual_coeff, -0.8523118435746285 AS sv_0, -0.5905779952297929 AS sv_1, -0.955957774991891 AS sv_2, -1.0679502420066866 AS sv_3, 1.00805777649094 AS sv_4, 1.8098160225179851 AS sv_5, 0.9438532353799614 AS sv_6, -2.001431628623987 AS sv_7, 0.12273945261386088 AS sv_8, -0.573267364124429 AS sv_9 FROM rdb$database UNION ALL SELECT 43 AS sv_idx, -0.6894403530369148 AS dual_coeff, 0.4757227652124141 AS sv_0, -0.955989569736636 AS sv_1, -0.17312664853813936 AS sv_2, 0.858233579344009 AS sv_3, 1.0633969002048547 AS sv_4, 0.8293645821894463 AS sv_5, -2.476801637877167 AS sv_6, -0.8932741165782176 AS sv_7, -2.092078376092036 AS sv_8, 1.3291484625311427 AS sv_9 FROM rdb$database UNION ALL SELECT 44 AS sv_idx, 0.6738223209088369 AS dual_coeff, 0.4934552215758423 AS sv_0, 0.09213117617706457 AS sv_1, 0.14930968062032174 AS sv_2, 0.7377316737949005 AS sv_3, 0.08002165809920521 AS sv_4, -0.23251899609236704 AS sv_5, 1.3091150447058892 AS sv_6, 1.7471364701482437 AS sv_7, 0.4977136234758606 AS sv_8, -0.8526351478909747 AS sv_9 FROM rdb$database UNION ALL SELECT 45 AS sv_idx, 0.39622601135536567 AS dual_coeff, 0.22327078983352855 AS sv_0, 0.9927801259318142 AS sv_1, 0.11039334504096218 AS sv_2, 1.061036853237382 AS sv_3, -0.7573831617660891 AS sv_4, -0.00897395989762102 AS sv_5, 1.629863482060472 AS sv_6, -2.299553244945928 AS sv_7, 0.34808614073869576 AS sv_8, 0.2800199582072133 AS sv_9 FROM rdb$database UNION ALL SELECT 46 AS sv_idx, -1.0 AS dual_coeff, 0.5511935398194927 AS sv_0, -1.028281784886602 AS sv_1, -0.7663109565943844 AS sv_2, -1.092552313062242 AS sv_3, -0.42431834674021535 AS sv_4, -0.9772387068910952 AS sv_5, -0.228590720960698 AS sv_6, -0.04619917178998606 AS sv_7, -1.3492515312314266 AS sv_8, -0.7708901415274917 AS sv_9 FROM rdb$database UNION ALL SELECT 47 AS sv_idx, 0.9150359222061996 AS dual_coeff, -1.3156945062635113 AS sv_0, -0.38117501755855615 AS sv_1, 1.2807692634816734 AS sv_2, 0.21866479024983954 AS sv_3, 0.00026933117792358254 AS sv_4, 1.68338230546346 AS sv_5, -0.3027049249824825 AS sv_6, -0.7937192894716478 AS sv_7, 0.08995223833518043 AS sv_8, 1.436346701909274 AS sv_9 FROM rdb$database UNION ALL SELECT 48 AS sv_idx, -1.0 AS dual_coeff, 0.581088334157257 AS sv_0, -0.9338668084690466 AS sv_1, 0.2444099396765005 AS sv_2, -1.077257061679292 AS sv_3, 0.9632818635910781 AS sv_4, -1.985152786314616 AS sv_5, -1.017103292454951 AS sv_6, 1.07237122709233 AS sv_7, -1.3284014834220896 AS sv_8, -0.33267833339324354 AS sv_9 FROM rdb$database UNION ALL SELECT 49 AS sv_idx, 1.0 AS dual_coeff, 1.7009709095930452 AS sv_0, -0.36130593642636893 AS sv_1, 2.030246817062945 AS sv_2, 1.2327272356034404 AS sv_3, 0.5901163778370216 AS sv_4, 0.7432164412191821 AS sv_5, -0.7289596754339415 AS sv_6, -1.1984813309711315 AS sv_7, 2.76890332494536 AS sv_8, -2.1829736734777847 AS sv_9 FROM rdb$database UNION ALL SELECT 50 AS sv_idx, 1.0 AS dual_coeff, 1.597279027774614 AS sv_0, 1.0093785495303884 AS sv_1, 0.4387449205109616 AS sv_2, 0.9152013878281708 AS sv_3, -0.8030626239181033 AS sv_4, 0.025316892508742413 AS sv_5, 0.8939209147276588 AS sv_6, -1.511593320308886 AS sv_7, 1.590610483204145 AS sv_8, -0.40599696654383427 AS sv_9 FROM rdb$database UNION ALL SELECT 51 AS sv_idx, -0.8170924757365942 AS dual_coeff, -1.3449255517438816 AS sv_0, -0.23201959207728814 AS sv_1, -1.0097946481554652 AS sv_2, 1.6883463135154364 AS sv_3, 0.34281315151171105 AS sv_4, 0.418380650092826 AS sv_5, -1.0272390514901117 AS sv_6, -1.4377864066901422 AS sv_7, -1.00870126239668 AS sv_8, 0.6615717724377342 AS sv_9 FROM rdb$database UNION ALL SELECT 52 AS sv_idx, -0.34562988905539493 AS dual_coeff, -0.9462585826745392 AS sv_0, -0.6051031858828941 AS sv_1, 0.4881696772769388 AS sv_2, -0.4484465226852065 AS sv_3, -0.7139548308037214 AS sv_4, -1.287333185961252 AS sv_5, -0.32505157050395106 AS sv_6, 1.228588520209094 AS sv_7, 0.5800229858634296 AS sv_8, 0.218746846523994 AS sv_9 FROM rdb$database UNION ALL SELECT 53 AS sv_idx, -0.1813306851529079 AS dual_coeff, 0.26718374442627113 AS sv_0, -0.8012588985189719 AS sv_1, -0.16471928396084912 AS sv_2, 1.3612341824882928 AS sv_3, 1.5299056040714316 AS sv_4, -0.5088152208863956 AS sv_5, 0.449299427971647 AS sv_6, 0.39046819497675617 AS sv_7, -1.2874060412559123 AS sv_8, -0.088738717502632 AS sv_9 FROM rdb$database UNION ALL SELECT 54 AS sv_idx, -0.001210092458486009 AS dual_coeff, 0.43740798256859936 AS sv_0, 0.29936596435394164 AS sv_1, 0.040157378588527866 AS sv_2, 0.12065822275120265 AS sv_3, -0.6396536975720959 AS sv_4, 0.5739786547616367 AS sv_5, 1.0386418604418075 AS sv_6, 0.2594015722298095 AS sv_7, -1.6075729224526372 AS sv_8, 0.4225963933138551 AS sv_9 FROM rdb$database UNION ALL SELECT 55 AS sv_idx, -1.0 AS dual_coeff, 0.07642906085355697 AS sv_0, -1.668736902524744 AS sv_1, -1.5299725393127546 AS sv_2, 0.07626662324608538 AS sv_3, 1.9329666642078032 AS sv_4, -1.6317583960578617 AS sv_5, -2.301877134596247 AS sv_6, -0.0285076268192774 AS sv_7, 0.5903691871523145 AS sv_8, 0.9562211040797955 AS sv_9 FROM rdb$database UNION ALL SELECT 56 AS sv_idx, 1.0 AS dual_coeff, -1.4317294440734738 AS sv_0, -0.09106842957023527 AS sv_1, 0.18600297311883887 AS sv_2, 1.6219541675539435 AS sv_3, 0.6865682792612509 AS sv_4, 0.4758890202158608 AS sv_5, 0.011745642016148885 AS sv_6, 0.6390161277933684 AS sv_7, 1.4691647869332292 AS sv_8, 0.6003412612218803 AS sv_9 FROM rdb$database UNION ALL SELECT 57 AS sv_idx, -0.07040000886323622 AS dual_coeff, 0.18864030954899474 AS sv_0, -0.2453275747995678 AS sv_1, 0.8838050063490952 AS sv_2, -0.4372903195199297 AS sv_3, 0.5978825846328845 AS sv_4, 0.30730703391282965 AS sv_5, -1.1558395747484513 AS sv_6, 0.8043522639227446 AS sv_7, -1.511342724246489 AS sv_8, 0.19347518103476746 AS sv_9 FROM rdb$database UNION ALL SELECT 58 AS sv_idx, 1.0 AS dual_coeff, 2.553377950875531 AS sv_0, 0.4123643877549645 AS sv_1, 0.4538948187779143 AS sv_2, -0.2684479715434145 AS sv_3, 1.9381611098462992 AS sv_4, 0.36091085228874537 AS sv_5, 0.7183439997615954 AS sv_6, 2.6198832352109167 AS sv_7, 0.10992160839454378 AS sv_8, 0.3397630725233129 AS sv_9 FROM rdb$database UNION ALL SELECT 59 AS sv_idx, 1.0 AS dual_coeff, 0.3800674725573591 AS sv_0, 1.6234011136147313 AS sv_1, 1.4556854743740317 AS sv_2, -1.1698333988606595 AS sv_3, 1.190398713409102 AS sv_4, 0.15366763147645165 AS sv_5, -0.11548768287645278 AS sv_6, -1.3497024670269315 AS sv_7, 0.052831151601545015 AS sv_8, 1.3820606446525279 AS sv_9 FROM rdb$database UNION ALL SELECT 60 AS sv_idx, -0.8823295765804929 AS dual_coeff, -0.6465405041413769 AS sv_0, 0.3077527156522064 AS sv_1, -1.1346047705235138 AS sv_2, -0.364806067856188 AS sv_3, 0.7772104304640703 AS sv_4, -0.246384930730758 AS sv_5, -1.0088578804028294 AS sv_6, -0.3000066781131692 AS sv_7, -0.35398106153334136 AS sv_8, -0.6540875592169393 AS sv_9 FROM rdb$database UNION ALL SELECT 61 AS sv_idx, -1.0 AS dual_coeff, -0.6732467897552781 AS sv_0, -0.20231423110797428 AS sv_1, -1.2292798861266871 AS sv_2, -1.7131352626499685 AS sv_3, -0.40408516899371916 AS sv_4, -1.0862878520717456 AS sv_5, -0.4437055600888805 AS sv_6, -0.5937723339362064 AS sv_7, -0.9459213489119545 AS sv_8, 1.3931877574727787 AS sv_9 FROM rdb$database UNION ALL SELECT 62 AS sv_idx, -0.7524419360321599 AS dual_coeff, -1.2410598707519926 AS sv_0, 1.0301411860082856 AS sv_1, 0.2838773120673184 AS sv_2, -1.7194336808075812 AS sv_3, 0.3975379956645865 AS sv_4, 0.1076424151025228 AS sv_5, -0.4832391815458957 AS sv_6, -0.06911347201362948 AS sv_7, -1.1554208921880933 AS sv_8, -1.4023384915165635 AS sv_9 FROM rdb$database UNION ALL SELECT 63 AS sv_idx, 1.0 AS dual_coeff, 0.8264675731316864 AS sv_0, 0.27509129181594694 AS sv_1, -0.002797518174846367 AS sv_2, 0.8781839945991958 AS sv_3, -0.6085781562509276 AS sv_4, 1.1048571745193112 AS sv_5, 1.6527326179358885 AS sv_6, 1.4439453899029515 AS sv_7, 1.821278232626692 AS sv_8, -1.7606683314645637 AS sv_9 FROM rdb$database UNION ALL SELECT 64 AS sv_idx, 1.0 AS dual_coeff, -0.9434245307749876 AS sv_0, 2.303426714367448 AS sv_1, 1.1474105180405447 AS sv_2, 0.4919053172644418 AS sv_3, 0.369463563851915 AS sv_4, 0.32853100450032396 AS sv_5, -2.063782842387189 AS sv_6, 0.8446732047481474 AS sv_7, -0.16359534540191806 AS sv_8, 0.11762870623232745 AS sv_9 FROM rdb$database UNION ALL SELECT 65 AS sv_idx, 0.8906567194226771 AS dual_coeff, -0.057607303097333314 AS sv_0, 0.37741723023133966 AS sv_1, 0.4817360074289553 AS sv_2, 0.1560477222778366 AS sv_3, 0.3997919071978809 AS sv_4, 0.5553804429322761 AS sv_5, 0.18683922873708225 AS sv_6, 1.0619821808937444 AS sv_7, 0.5690289843135194 AS sv_8, -0.43231209617976374 AS sv_9 FROM rdb$database UNION ALL SELECT 66 AS sv_idx, -0.2618065406527621 AS dual_coeff, 0.9390896326646816 AS sv_0, 0.4600660007722452 AS sv_1, 0.02348245097598041 AS sv_2, 0.14443594574195076 AS sv_3, 1.259239879119307 AS sv_4, -0.7239806986563658 AS sv_5, -2.573621368020964 AS sv_6, -1.0672785275758387 AS sv_7, -0.1027189952124224 AS sv_8, -0.2774388641829652 AS sv_9 FROM rdb$database UNION ALL SELECT 67 AS sv_idx, -0.8660450481229192 AS dual_coeff, -0.6570671209090757 AS sv_0, -0.6382348648555064 AS sv_1, 0.0024412787773237282 AS sv_2, 0.9503198109567802 AS sv_3, -0.20464019792470892 AS sv_4, 0.00364652507283255 AS sv_5, 1.2427923417847495 AS sv_6, -0.2571306103829975 AS sv_7, -1.591014023928329 AS sv_8, -0.9094681364197068 AS sv_9 FROM rdb$database UNION ALL SELECT 68 AS sv_idx, -0.2673957974901384 AS dual_coeff, 0.5172991542004242 AS sv_0, 1.225941425857963 AS sv_1, -1.1877326973730031 AS sv_2, -0.9761832100023436 AS sv_3, -0.2410330160183593 AS sv_4, -2.1008351808858237 AS sv_5, 0.9847069529720062 AS sv_6, 0.6547755278272744 AS sv_7, 0.633450405177318 AS sv_8, 0.18235758649493536 AS sv_9 FROM rdb$database UNION ALL SELECT 69 AS sv_idx, -0.18095849764788766 AS dual_coeff, 0.8849058781171814 AS sv_0, -0.8233727165385047 AS sv_1, -0.7828232481104476 AS sv_2, 0.8974531714034968 AS sv_3, -1.1249871082454244 AS sv_4, 0.5456520552525127 AS sv_5, 0.6772167899511885 AS sv_6, -0.4637352580719781 AS sv_7, 0.7906536918199962 AS sv_8, -1.0158769889977683 AS sv_9 FROM rdb$database UNION ALL SELECT 70 AS sv_idx, 1.0 AS dual_coeff, -0.4287069160591596 AS sv_0, -1.1713881641464514 AS sv_1, 0.6933753066428534 AS sv_2, -1.346758336265982 AS sv_3, 1.8827117277665737 AS sv_4, 1.0581035417568927 AS sv_5, -0.026488481069570087 AS sv_6, 1.853459285295502 AS sv_7, 1.3709976023326913 AS sv_8, 0.4060316077017176 AS sv_9 FROM rdb$database UNION ALL SELECT 71 AS sv_idx, -1.0 AS dual_coeff, -0.1239948717659312 AS sv_0, -1.760845705745724 AS sv_1, 0.5032399518060433 AS sv_2, -0.27255412217637137 AS sv_3, -1.1105598913912884 AS sv_4, -0.7927718762978716 AS sv_5, 1.3480607132882494 AS sv_6, 0.708623561393435 AS sv_7, -1.6468555473401532 AS sv_8, 0.1860498269607368 AS sv_9 FROM rdb$database UNION ALL SELECT 72 AS sv_idx, -0.3754847425659845 AS dual_coeff, -0.00429419589109511 AS sv_0, 0.574972004992482 AS sv_1, -0.38500418335283654 AS sv_2, 0.9633701924662657 AS sv_3, -0.5816620425187305 AS sv_4, -0.6015134403521211 AS sv_5, 1.375753787941579 AS sv_6, -0.3562964848928715 AS sv_7, -1.0300797775240855 AS sv_8, -0.22471000406197186 AS sv_9 FROM rdb$database) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + 0.00288569723258964 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2) + power(kernel_input_with_scaling."Feature_4" - "SV_data".sv_4, 2) + power(kernel_input_with_scaling."Feature_5" - "SV_data".sv_5, 2) + power(kernel_input_with_scaling."Feature_6" - "SV_data".sv_6, 2) + power(kernel_input_with_scaling."Feature_7" - "SV_data".sv_7, 2) + power(kernel_input_with_scaling."Feature_8" - "SV_data".sv_8, 2) + power(kernel_input_with_scaling."Feature_9" - "SV_data".sv_9, 2)))) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -1.0 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2) + power(kernel_input_with_scaling."Feature_4" - "SV_data".sv_4, 2) + power(kernel_input_with_scaling."Feature_5" - "SV_data".sv_5, 2) + power(kernel_input_with_scaling."Feature_6" - "SV_data".sv_6, 2) + power(kernel_input_with_scaling."Feature_7" - "SV_data".sv_7, 2) + power(kernel_input_with_scaling."Feature_8" - "SV_data".sv_8, 2) + power(kernel_input_with_scaling."Feature_9" - "SV_data".sv_9, 2)))) ELSE -709.782712893384 END) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 26.405852730652423 + 212.6549441322689 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp