-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart_pca
-- Dataset : BreastCancer
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 14.07771208791209) / 3.5490515005403798 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 19.03905494505495) / 4.166878656652379 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 91.66178021978024) / 24.53094385251417 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 650.9676923076922) / 356.0943508808365 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - 0.09642184615384616) / 0.01421344742747642 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - 0.1044161318681319) / 0.053462476960143265 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - 0.08826232681318681) / 0.08200216346057157 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.0485164) / 0.03941645600907594 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.1815885714285714) / 0.02782064728498547 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.0629403076923077) / 0.007027080900659396 AS "Feature_9", (CAST("ADS"."Feature_10" AS DOUBLE PRECISION) - 0.4099173626373626) / 0.2915245412208004 AS "Feature_10", (CAST("ADS"."Feature_11" AS DOUBLE PRECISION) - 1.217069450549451) / 0.5369800521839988 AS "Feature_11", (CAST("ADS"."Feature_12" AS DOUBLE PRECISION) - 2.9052490109890114) / 2.144852707447646 AS "Feature_12", (CAST("ADS"."Feature_13" AS DOUBLE PRECISION) - 40.87988571428571) / 48.2778362287006 AS "Feature_13", (CAST("ADS"."Feature_14" AS DOUBLE PRECISION) - 0.0070559714285714295) / 0.002866803723188527 AS "Feature_14", (CAST("ADS"."Feature_15" AS DOUBLE PRECISION) - 0.02556783076923077) / 0.01796676819246774 AS "Feature_15", (CAST("ADS"."Feature_16" AS DOUBLE PRECISION) - 0.031999256263736266) / 0.03169979081746389 AS "Feature_16", (CAST("ADS"."Feature_17" AS DOUBLE PRECISION) - 0.01197236923076923) / 0.006399041370931476 AS "Feature_17", (CAST("ADS"."Feature_18" AS DOUBLE PRECISION) - 0.0208962) / 0.008592357424589265 AS "Feature_18", (CAST("ADS"."Feature_19" AS DOUBLE PRECISION) - 0.003846551868131868) / 0.0027466275188339 AS "Feature_19", (CAST("ADS"."Feature_20" AS DOUBLE PRECISION) - 16.17776483516484) / 4.822761469227882 AS "Feature_20", (CAST("ADS"."Feature_21" AS DOUBLE PRECISION) - 25.26505494505495) / 5.929844025113361 AS "Feature_21", (CAST("ADS"."Feature_22" AS DOUBLE PRECISION) - 106.68156043956041) / 33.740956745431944 AS "Feature_22", (CAST("ADS"."Feature_23" AS DOUBLE PRECISION) - 870.863956043956) / 567.6191564029466 AS "Feature_23", (CAST("ADS"."Feature_24" AS DOUBLE PRECISION) - 0.1318275604395604) / 0.02277324683369087 AS "Feature_24", (CAST("ADS"."Feature_25" AS DOUBLE PRECISION) - 0.2499180659340659) / 0.1526367614098782 AS "Feature_25", (CAST("ADS"."Feature_26" AS DOUBLE PRECISION) - 0.2654615934065934) / 0.2071534531545495 AS "Feature_26", (CAST("ADS"."Feature_27" AS DOUBLE PRECISION) - 0.1134879802197802) / 0.06645447985497112 AS "Feature_27", (CAST("ADS"."Feature_28" AS DOUBLE PRECISION) - 0.2897881318681318) / 0.06227317635385585 AS "Feature_28", (CAST("ADS"."Feature_29" AS DOUBLE PRECISION) - 0.08364145054945055) / 0.01708392968253732 AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.21768343094223108 + "CenteredDataForPCA"."Feature_1" * -0.10393262184047268 + "CenteredDataForPCA"."Feature_2" * -0.2265164944329179 + "CenteredDataForPCA"."Feature_3" * -0.21993736711575185 + "CenteredDataForPCA"."Feature_4" * -0.14268833980412854 + "CenteredDataForPCA"."Feature_5" * -0.24024798670573505 + "CenteredDataForPCA"."Feature_6" * -0.257355901686626 + "CenteredDataForPCA"."Feature_7" * -0.2597680750587679 + "CenteredDataForPCA"."Feature_8" * -0.13868620385317515 + "CenteredDataForPCA"."Feature_9" * -0.06712190195264113 + "CenteredDataForPCA"."Feature_10" * -0.2069150720147228 + "CenteredDataForPCA"."Feature_11" * -0.03305717760079786 + "CenteredDataForPCA"."Feature_12" * -0.212828518237874 + "CenteredDataForPCA"."Feature_13" * -0.2013439160056293 + "CenteredDataForPCA"."Feature_14" * -0.02049865164066569 + "CenteredDataForPCA"."Feature_15" * -0.1750181653895911 + "CenteredDataForPCA"."Feature_16" * -0.1519078637342155 + "CenteredDataForPCA"."Feature_17" * -0.1865203607950731 + "CenteredDataForPCA"."Feature_18" * -0.053039357385151385 + "CenteredDataForPCA"."Feature_19" * -0.10231665221046024 + "CenteredDataForPCA"."Feature_20" * -0.226956028801125 + "CenteredDataForPCA"."Feature_21" * -0.10317017778958812 + "CenteredDataForPCA"."Feature_22" * -0.23602999862163965 + "CenteredDataForPCA"."Feature_23" * -0.2240006176535796 + "CenteredDataForPCA"."Feature_24" * -0.12717220549829955 + "CenteredDataForPCA"."Feature_25" * -0.21222759880468806 + "CenteredDataForPCA"."Feature_26" * -0.22758988828313426 + "CenteredDataForPCA"."Feature_27" * -0.2490125441701701 + "CenteredDataForPCA"."Feature_28" * -0.11944032522919835 + "CenteredDataForPCA"."Feature_29" * -0.13166419338876287 AS caress_2, "CenteredDataForPCA"."Feature_0" * 0.2388263496095884 + "CenteredDataForPCA"."Feature_1" * 0.05323416968015016 + "CenteredDataForPCA"."Feature_2" * 0.21941449489711815 + "CenteredDataForPCA"."Feature_3" * 0.2342171388843593 + "CenteredDataForPCA"."Feature_4" * -0.17925865624129375 + "CenteredDataForPCA"."Feature_5" * -0.14316495439683485 + "CenteredDataForPCA"."Feature_6" * -0.06042147680146465 + "CenteredDataForPCA"."Feature_7" * 0.03722975887665922 + "CenteredDataForPCA"."Feature_8" * -0.19462120663415455 + "CenteredDataForPCA"."Feature_9" * -0.3731777815015735 + "CenteredDataForPCA"."Feature_10" * 0.0948169433203506 + "CenteredDataForPCA"."Feature_11" * -0.10262087159564362 + "CenteredDataForPCA"."Feature_12" * 0.08014049234060505 + "CenteredDataForPCA"."Feature_13" * 0.14683589434398536 + "CenteredDataForPCA"."Feature_14" * -0.21665542062253368 + "CenteredDataForPCA"."Feature_15" * -0.22633882980546735 + "CenteredDataForPCA"."Feature_16" * -0.2013330897413932 + "CenteredDataForPCA"."Feature_17" * -0.13744139199061656 + "CenteredDataForPCA"."Feature_18" * -0.1851008068283944 + "CenteredDataForPCA"."Feature_19" * -0.2787797373414811 + "CenteredDataForPCA"."Feature_20" * 0.22285850281808672 + "CenteredDataForPCA"."Feature_21" * 0.04796372561185864 + "CenteredDataForPCA"."Feature_22" * 0.20144532663199727 + "CenteredDataForPCA"."Feature_23" * 0.22117900125773696 + "CenteredDataForPCA"."Feature_24" * -0.16388533650733236 + "CenteredDataForPCA"."Feature_25" * -0.12771851864859946 + "CenteredDataForPCA"."Feature_26" * -0.0920845205598406 + "CenteredDataForPCA"."Feature_27" * 0.01180363799025717 + "CenteredDataForPCA"."Feature_28" * -0.13218791158615573 + "CenteredDataForPCA"."Feature_29" * -0.272971048775739 AS caress_3, "CenteredDataForPCA"."Feature_0" * -0.005390218995132989 + "CenteredDataForPCA"."Feature_1" * 0.07559188324769446 + "CenteredDataForPCA"."Feature_2" * -0.006630034456413209 + "CenteredDataForPCA"."Feature_3" * 0.03307539547257528 + "CenteredDataForPCA"."Feature_4" * -0.11408606276317496 + "CenteredDataForPCA"."Feature_5" * -0.08243204451061603 + "CenteredDataForPCA"."Feature_6" * -0.0034631546527687713 + "CenteredDataForPCA"."Feature_7" * -0.025369092650600944 + "CenteredDataForPCA"."Feature_8" * -0.03545304892446201 + "CenteredDataForPCA"."Feature_9" * -0.033460358570260834 + "CenteredDataForPCA"."Feature_10" * 0.2702606607101766 + "CenteredDataForPCA"."Feature_11" * 0.38895800748244913 + "CenteredDataForPCA"."Feature_12" * 0.265539009843534 + "CenteredDataForPCA"."Feature_13" * 0.22087996051915645 + "CenteredDataForPCA"."Feature_14" * 0.30083207092269965 + "CenteredDataForPCA"."Feature_15" * 0.14870995945035803 + "CenteredDataForPCA"."Feature_16" * 0.15617929564803443 + "CenteredDataForPCA"."Feature_17" * 0.20527006718186183 + "CenteredDataForPCA"."Feature_18" * 0.2727509234513494 + "CenteredDataForPCA"."Feature_19" * 0.20491559570513843 + "CenteredDataForPCA"."Feature_20" * -0.04651017214243354 + "CenteredDataForPCA"."Feature_21" * -0.030620841495121995 + "CenteredDataForPCA"."Feature_22" * -0.04908306111118616 + "CenteredDataForPCA"."Feature_23" * -0.009372073109054205 + "CenteredDataForPCA"."Feature_24" * -0.2716162372345253 + "CenteredDataForPCA"."Feature_25" * -0.2404036986894661 + "CenteredDataForPCA"."Feature_26" * -0.17728088382408685 + "CenteredDataForPCA"."Feature_27" * -0.1759158149922438 + "CenteredDataForPCA"."Feature_28" * -0.2741603341993864 + "CenteredDataForPCA"."Feature_29" * -0.23752113369727115 AS caress_4, "CenteredDataForPCA"."Feature_0" * 0.032221335163821266 + "CenteredDataForPCA"."Feature_1" * -0.5981813597757002 + "CenteredDataForPCA"."Feature_2" * 0.03274684636104511 + "CenteredDataForPCA"."Feature_3" * 0.051633089886458795 + "CenteredDataForPCA"."Feature_4" * 0.1894886130432605 + "CenteredDataForPCA"."Feature_5" * 0.025213175765623888 + "CenteredDataForPCA"."Feature_6" * 0.020686309537882627 + "CenteredDataForPCA"."Feature_7" * 0.06556536720486286 + "CenteredDataForPCA"."Feature_8" * 0.07581347598658743 + "CenteredDataForPCA"."Feature_9" * 0.039784025514564836 + "CenteredDataForPCA"."Feature_10" * 0.12103267182656124 + "CenteredDataForPCA"."Feature_11" * -0.3253456701348236 + "CenteredDataForPCA"."Feature_12" * 0.10403160451161235 + "CenteredDataForPCA"."Feature_13" * 0.13096113686887037 + "CenteredDataForPCA"."Feature_14" * 0.08529767241873171 + "CenteredDataForPCA"."Feature_15" * -0.05050256477826615 + "CenteredDataForPCA"."Feature_16" * -0.013858636956129685 + "CenteredDataForPCA"."Feature_17" * 0.051636470783270175 + "CenteredDataForPCA"."Feature_18" * 0.07845623611137836 + "CenteredDataForPCA"."Feature_19" * -0.01800224834117843 + "CenteredDataForPCA"."Feature_20" * 0.01340810356608377 + "CenteredDataForPCA"."Feature_21" * -0.6255117301896479 + "CenteredDataForPCA"."Feature_22" * 0.008890529878086695 + "CenteredDataForPCA"."Feature_23" * 0.03206575052269575 + "CenteredDataForPCA"."Feature_24" * 0.06218614198553856 + "CenteredDataForPCA"."Feature_25" * -0.10208562087194813 + "CenteredDataForPCA"."Feature_26" * -0.07404407884842225 + "CenteredDataForPCA"."Feature_27" * -0.001759497416926437 + "CenteredDataForPCA"."Feature_28" * -0.020695280701914644 + "CenteredDataForPCA"."Feature_29" * -0.09172275305484348 AS caress_5, "CenteredDataForPCA"."Feature_0" * -0.03583586526438166 + "CenteredDataForPCA"."Feature_1" * 0.10668556494546105 + "CenteredDataForPCA"."Feature_2" * -0.03580063384563657 + "CenteredDataForPCA"."Feature_3" * -0.01186523434650828 + "CenteredDataForPCA"."Feature_4" * 0.3472926626357166 + "CenteredDataForPCA"."Feature_5" * -0.01279638595762936 + "CenteredDataForPCA"."Feature_6" * -0.09686339610083955 + "CenteredDataForPCA"."Feature_7" * 0.030262925273250155 + "CenteredDataForPCA"."Feature_8" * 0.2919734843378978 + "CenteredDataForPCA"."Feature_9" * 0.024129207305013743 + "CenteredDataForPCA"."Feature_10" * 0.13199923484872902 + "CenteredDataForPCA"."Feature_11" * 0.21157425482633896 + "CenteredDataForPCA"."Feature_12" * 0.10248820501553313 + "CenteredDataForPCA"."Feature_13" * 0.10874553311679416 + "CenteredDataForPCA"."Feature_14" * 0.2544812741423084 + "CenteredDataForPCA"."Feature_15" * -0.2746684061050128 + "CenteredDataForPCA"."Feature_16" * -0.3540979971305165 + "CenteredDataForPCA"."Feature_17" * -0.19847452634975313 + "CenteredDataForPCA"."Feature_18" * 0.24138551945384004 + "CenteredDataForPCA"."Feature_19" * -0.27461076869519324 + "CenteredDataForPCA"."Feature_20" * 0.00438970711748895 + "CenteredDataForPCA"."Feature_21" * 0.15304890309187444 + "CenteredDataForPCA"."Feature_22" * -0.0062975700081063036 + "CenteredDataForPCA"."Feature_23" * 0.02449023484088534 + "CenteredDataForPCA"."Feature_24" * 0.3212354882834555 + "CenteredDataForPCA"."Feature_25" * -0.10048955127484832 + "CenteredDataForPCA"."Feature_26" * -0.18301792369043487 + "CenteredDataForPCA"."Feature_27" * -0.04092825303637145 + "CenteredDataForPCA"."Feature_28" * 0.25478475230789854 + "CenteredDataForPCA"."Feature_29" * -0.09149620178238 AS caress_6, "CenteredDataForPCA"."Feature_0" * 0.02578277051115795 + "CenteredDataForPCA"."Feature_1" * -0.03488683150504261 + "CenteredDataForPCA"."Feature_2" * 0.02337879624440808 + "CenteredDataForPCA"."Feature_3" * 5.311632734197533e-05 + "CenteredDataForPCA"."Feature_4" * -0.2831599190004263 + "CenteredDataForPCA"."Feature_5" * -0.0182359166955445 + "CenteredDataForPCA"."Feature_6" * -0.00606493341165939 + "CenteredDataForPCA"."Feature_7" * -0.04670696605311275 + "CenteredDataForPCA"."Feature_8" * 0.3517020411433183 + "CenteredDataForPCA"."Feature_9" * -0.1269409741371922 + "CenteredDataForPCA"."Feature_10" * -0.044449703384920235 + "CenteredDataForPCA"."Feature_11" * -0.05130045078703252 + "CenteredDataForPCA"."Feature_12" * -0.015070584315048681 + "CenteredDataForPCA"."Feature_13" * -0.06214481224260445 + "CenteredDataForPCA"."Feature_14" * -0.300750288327894 + "CenteredDataForPCA"."Feature_15" * 0.05383577001601851 + "CenteredDataForPCA"."Feature_16" * 0.07247828206101359 + "CenteredDataForPCA"."Feature_17" * -0.0041762502813039925 + "CenteredDataForPCA"."Feature_18" * 0.4992859784606968 + "CenteredDataForPCA"."Feature_19" * -0.05341104577876922 + "CenteredDataForPCA"."Feature_20" * 0.004227623567498342 + "CenteredDataForPCA"."Feature_21" * -0.04884501480701089 + "CenteredDataForPCA"."Feature_22" * 0.01367243473013742 + "CenteredDataForPCA"."Feature_23" * -0.025887660162104482 + "CenteredDataForPCA"."Feature_24" * -0.3595690657677812 + "CenteredDataForPCA"."Feature_25" * 0.03179116825393049 + "CenteredDataForPCA"."Feature_26" * 0.02848854626295261 + "CenteredDataForPCA"."Feature_27" * -0.024367902666235317 + "CenteredDataForPCA"."Feature_28" * 0.5192968623188767 + "CenteredDataForPCA"."Feature_29" * -0.1046011433247024 AS caress_7, "CenteredDataForPCA"."Feature_0" * -0.12457908312011272 + "CenteredDataForPCA"."Feature_1" * 0.043675631031051536 + "CenteredDataForPCA"."Feature_2" * -0.11727029149412173 + "CenteredDataForPCA"."Feature_3" * -0.0486941022474712 + "CenteredDataForPCA"."Feature_4" * -0.17248329424325504 + "CenteredDataForPCA"."Feature_5" * -0.01162088057329262 + "CenteredDataForPCA"."Feature_6" * -0.1260478446835378 + "CenteredDataForPCA"."Feature_7" * -0.19103591169799236 + "CenteredDataForPCA"."Feature_8" * -0.07463523147781233 + "CenteredDataForPCA"."Feature_9" * 0.25365336934237714 + "CenteredDataForPCA"."Feature_10" * 0.31534600516947087 + "CenteredDataForPCA"."Feature_11" * -0.20406041132463007 + "CenteredDataForPCA"."Feature_12" * 0.3129999653561438 + "CenteredDataForPCA"."Feature_13" * 0.36739957495731773 + "CenteredDataForPCA"."Feature_14" * -0.168697058125119 + "CenteredDataForPCA"."Feature_15" * 0.03886218090385512 + "CenteredDataForPCA"."Feature_16" * -0.17964511528914745 + "CenteredDataForPCA"."Feature_17" * -0.3603043202671293 + "CenteredDataForPCA"."Feature_18" * -0.04631020413416123 + "CenteredDataForPCA"."Feature_19" * 0.19111982295929997 + "CenteredDataForPCA"."Feature_20" * -0.0005144819631284318 + "CenteredDataForPCA"."Feature_21" * 0.030363622992810892 + "CenteredDataForPCA"."Feature_22" * 0.008358940593792955 + "CenteredDataForPCA"."Feature_23" * 0.0811779959920401 + "CenteredDataForPCA"."Feature_24" * -0.08858951896614652 + "CenteredDataForPCA"."Feature_25" * 0.13376257671354125 + "CenteredDataForPCA"."Feature_26" * -0.0655332998308909 + "CenteredDataForPCA"."Feature_27" * -0.1772937084691342 + "CenteredDataForPCA"."Feature_28" * 0.06513011232874036 + "CenteredDataForPCA"."Feature_29" * 0.369067836821968 AS caress_8, "CenteredDataForPCA"."Feature_0" * 0.014195242068596473 + "CenteredDataForPCA"."Feature_1" * -0.056781231705461475 + "CenteredDataForPCA"."Feature_2" * 0.020930545534346718 + "CenteredDataForPCA"."Feature_3" * -0.0286796527332478 + "CenteredDataForPCA"."Feature_4" * 0.2998243375815541 + "CenteredDataForPCA"."Feature_5" * 0.12157850218186925 + "CenteredDataForPCA"."Feature_6" * -0.006917467355602085 + "CenteredDataForPCA"."Feature_7" * 0.10558257508958617 + "CenteredDataForPCA"."Feature_8" * 0.35091460190988877 + "CenteredDataForPCA"."Feature_9" * 0.2195893539648547 + "CenteredDataForPCA"."Feature_10" * 0.024608734852559846 + "CenteredDataForPCA"."Feature_11" * 0.30486995625692725 + "CenteredDataForPCA"."Feature_12" * 0.038460494570895724 + "CenteredDataForPCA"."Feature_13" * -0.03370575142101336 + "CenteredDataForPCA"."Feature_14" * -0.5839467988489295 + "CenteredDataForPCA"."Feature_15" * -0.1299991981824507 + "CenteredDataForPCA"."Feature_16" * -0.08925051996031573 + "CenteredDataForPCA"."Feature_17" * 0.1243598695064899 + "CenteredDataForPCA"."Feature_18" * -0.283889118805743 + "CenteredDataForPCA"."Feature_19" * 0.12592162585325836 + "CenteredDataForPCA"."Feature_20" * -0.017877683314477488 + "CenteredDataForPCA"."Feature_21" * -0.008581825899858495 + "CenteredDataForPCA"."Feature_22" * -0.016361176441096317 + "CenteredDataForPCA"."Feature_23" * -0.04852459366584428 + "CenteredDataForPCA"."Feature_24" * -0.2296911250553766 + "CenteredDataForPCA"."Feature_25" * -0.15045081676245112 + "CenteredDataForPCA"."Feature_26" * -0.17848679744858986 + "CenteredDataForPCA"."Feature_27" * -0.024184902368730117 + "CenteredDataForPCA"."Feature_28" * -0.1525934841772766 + "CenteredDataForPCA"."Feature_29" * -0.002220776229793687 AS caress_9, "CenteredDataForPCA"."Feature_0" * -0.21430709940128853 + "CenteredDataForPCA"."Feature_1" * 0.07486603960263698 + "CenteredDataForPCA"."Feature_2" * -0.21900770717790716 + "CenteredDataForPCA"."Feature_3" * -0.17871916159403914 + "CenteredDataForPCA"."Feature_4" * -0.01102306249832392 + "CenteredDataForPCA"."Feature_5" * -0.1973770173761281 + "CenteredDataForPCA"."Feature_6" * 0.05746753429619465 + "CenteredDataForPCA"."Feature_7" * -0.11869624602709355 + "CenteredDataForPCA"."Feature_8" * 0.2112325678990958 + "CenteredDataForPCA"."Feature_9" * -0.15199577354171714 + "CenteredDataForPCA"."Feature_10" * 0.2366780116980128 + "CenteredDataForPCA"."Feature_11" * -0.17669115677607064 + "CenteredDataForPCA"."Feature_12" * 0.19933161051311304 + "CenteredDataForPCA"."Feature_13" * 0.2345840825020051 + "CenteredDataForPCA"."Feature_14" * -0.09795842920714146 + "CenteredDataForPCA"."Feature_15" * -0.16586718856151567 + "CenteredDataForPCA"."Feature_16" * 0.41253655234183295 + "CenteredDataForPCA"."Feature_17" * 0.24876416742117186 + "CenteredDataForPCA"."Feature_18" * -0.2853686606253401 + "CenteredDataForPCA"."Feature_19" * -0.2608468647400721 + "CenteredDataForPCA"."Feature_20" * -0.10466382996874203 + "CenteredDataForPCA"."Feature_21" * 0.10074865778278996 + "CenteredDataForPCA"."Feature_22" * -0.10984341723415453 + "CenteredDataForPCA"."Feature_23" * -0.0616547252528919 + "CenteredDataForPCA"."Feature_24" * 0.13862502599080712 + "CenteredDataForPCA"."Feature_25" * -0.08885938037986367 + "CenteredDataForPCA"."Feature_26" * 0.22054695840588354 + "CenteredDataForPCA"."Feature_27" * 0.06716006727975916 + "CenteredDataForPCA"."Feature_28" * 0.08631396968748989 + "CenteredDataForPCA"."Feature_29" * -0.13795254761377934 AS caress_10, "CenteredDataForPCA"."Feature_0" * 0.0843235584569337 + "CenteredDataForPCA"."Feature_1" * 0.008265984874603253 + "CenteredDataForPCA"."Feature_2" * 0.063375270258393 + "CenteredDataForPCA"."Feature_3" * 0.11106966259344915 + "CenteredDataForPCA"."Feature_4" * -0.2533823735060409 + "CenteredDataForPCA"."Feature_5" * -0.15744110233831887 + "CenteredDataForPCA"."Feature_6" * -0.054852230488164365 + "CenteredDataForPCA"."Feature_7" * -0.055745504617080395 + "CenteredDataForPCA"."Feature_8" * 0.568852566997655 + "CenteredDataForPCA"."Feature_9" * -0.06448387053659857 + "CenteredDataForPCA"."Feature_10" * -0.055770202347908124 + "CenteredDataForPCA"."Feature_11" * -0.07737685076074256 + "CenteredDataForPCA"."Feature_12" * -0.18266867816017407 + "CenteredDataForPCA"."Feature_13" * -0.04675160547662491 + "CenteredDataForPCA"."Feature_14" * 0.3537964303835901 + "CenteredDataForPCA"."Feature_15" * 0.011573655910954262 + "CenteredDataForPCA"."Feature_16" * 0.03734883137250606 + "CenteredDataForPCA"."Feature_17" * -0.096826866184196 + "CenteredDataForPCA"."Feature_18" * -0.3903391059820738 + "CenteredDataForPCA"."Feature_19" * 0.34286751513441716 + "CenteredDataForPCA"."Feature_20" * 0.11827793303585522 + "CenteredDataForPCA"."Feature_21" * -0.006110372705259543 + "CenteredDataForPCA"."Feature_22" * 0.0719981447029124 + "CenteredDataForPCA"."Feature_23" * 0.1630007606578442 + "CenteredDataForPCA"."Feature_24" * 0.029348614995469507 + "CenteredDataForPCA"."Feature_25" * -0.1597497181929972 + "CenteredDataForPCA"."Feature_26" * -0.11308875717152952 + "CenteredDataForPCA"."Feature_27" * -0.08458394926434495 + "CenteredDataForPCA"."Feature_28" * 0.07883799137160397 + "CenteredDataForPCA"."Feature_29" * 0.06811727917482001 AS caress_11, "CenteredDataForPCA"."Feature_0" * -0.03959397470436005 + "CenteredDataForPCA"."Feature_1" * 0.27347748395304583 + "CenteredDataForPCA"."Feature_2" * -0.01655709788931299 + "CenteredDataForPCA"."Feature_3" * -0.10101865401004913 + "CenteredDataForPCA"."Feature_4" * -0.07796017283185724 + "CenteredDataForPCA"."Feature_5" * 0.28509892456891583 + "CenteredDataForPCA"."Feature_6" * -0.14141725608364691 + "CenteredDataForPCA"."Feature_7" * 0.04953710536296077 + "CenteredDataForPCA"."Feature_8" * 0.2319497810770402 + "CenteredDataForPCA"."Feature_9" * -0.04878879009335351 + "CenteredDataForPCA"."Feature_10" * 0.02698407588191025 + "CenteredDataForPCA"."Feature_11" * -0.3381947704722899 + "CenteredDataForPCA"."Feature_12" * 0.13737284639888608 + "CenteredDataForPCA"."Feature_13" * -0.04822563918121703 + "CenteredDataForPCA"."Feature_14" * 0.15319739236980925 + "CenteredDataForPCA"."Feature_15" * 0.2841648205545759 + "CenteredDataForPCA"."Feature_16" * -0.38422591823416896 + "CenteredDataForPCA"."Feature_17" * 0.3043869137106776 + "CenteredDataForPCA"."Feature_18" * -0.11289160634704618 + "CenteredDataForPCA"."Feature_19" * -0.21502424771028594 + "CenteredDataForPCA"."Feature_20" * -0.08822442813668092 + "CenteredDataForPCA"."Feature_21" * -0.0637989701407694 + "CenteredDataForPCA"."Feature_22" * -0.03411417506299588 + "CenteredDataForPCA"."Feature_23" * -0.15162672711565378 + "CenteredDataForPCA"."Feature_24" * -0.17149367361582535 + "CenteredDataForPCA"."Feature_25" * 0.2394822141797368 + "CenteredDataForPCA"."Feature_26" * -0.19097631491073289 + "CenteredDataForPCA"."Feature_27" * 0.09473285597155916 + "CenteredDataForPCA"."Feature_28" * -0.162053472793438 + "CenteredDataForPCA"."Feature_29" * -0.11363072670211805 AS caress_12, "CenteredDataForPCA"."Feature_0" * -0.053835881686103454 + "CenteredDataForPCA"."Feature_1" * -0.35760980694365624 + "CenteredDataForPCA"."Feature_2" * -0.030985844662497538 + "CenteredDataForPCA"."Feature_3" * -0.03450345431238103 + "CenteredDataForPCA"."Feature_4" * -0.21840978832264238 + "CenteredDataForPCA"."Feature_5" * 0.12581271207286251 + "CenteredDataForPCA"."Feature_6" * 0.14061327010930655 + "CenteredDataForPCA"."Feature_7" * -0.011317580461918095 + "CenteredDataForPCA"."Feature_8" * 0.163791406100184 + "CenteredDataForPCA"."Feature_9" * -0.11777147369121313 + "CenteredDataForPCA"."Feature_10" * -0.009184006718255713 + "CenteredDataForPCA"."Feature_11" * 0.4874898938535969 + "CenteredDataForPCA"."Feature_12" * 0.08533634850138337 + "CenteredDataForPCA"."Feature_13" * 0.04639111480064871 + "CenteredDataForPCA"."Feature_14" * 0.1279881503042126 + "CenteredDataForPCA"."Feature_15" * 0.12328363590640184 + "CenteredDataForPCA"."Feature_16" * -0.07424736405246857 + "CenteredDataForPCA"."Feature_17" * -0.2774680204015638 + "CenteredDataForPCA"."Feature_18" * -0.225960060695478 + "CenteredDataForPCA"."Feature_19" * -0.3393968977153561 + "CenteredDataForPCA"."Feature_20" * -0.06804195569506448 + "CenteredDataForPCA"."Feature_21" * -0.07515511801346483 + "CenteredDataForPCA"."Feature_22" * -0.007568516925735125 + "CenteredDataForPCA"."Feature_23" * -0.049626653969577834 + "CenteredDataForPCA"."Feature_24" * -0.1139065811148969 + "CenteredDataForPCA"."Feature_25" * 0.33084441664655934 + "CenteredDataForPCA"."Feature_26" * 0.26431660483395364 + "CenteredDataForPCA"."Feature_27" * -0.04838681661373357 + "CenteredDataForPCA"."Feature_28" * -0.08685022462470933 + "CenteredDataForPCA"."Feature_29" * 0.021540866339808812 AS caress_13, "CenteredDataForPCA"."Feature_0" * 0.038453371422610766 + "CenteredDataForPCA"."Feature_1" * 0.29626802711282063 + "CenteredDataForPCA"."Feature_2" * 0.065965599120264 + "CenteredDataForPCA"."Feature_3" * 0.09897939851392766 + "CenteredDataForPCA"."Feature_4" * 0.14548680904407274 + "CenteredDataForPCA"."Feature_5" * 0.19082166135760328 + "CenteredDataForPCA"."Feature_6" * 0.3608392555736493 + "CenteredDataForPCA"."Feature_7" * 0.12146505520686225 + "CenteredDataForPCA"."Feature_8" * 0.1531766467200313 + "CenteredDataForPCA"."Feature_9" * 0.18149678132265448 + "CenteredDataForPCA"."Feature_10" * -0.07980988042737562 + "CenteredDataForPCA"."Feature_11" * -0.2809893617689369 + "CenteredDataForPCA"."Feature_12" * -0.07760843437221039 + "CenteredDataForPCA"."Feature_13" * 0.058636342695434024 + "CenteredDataForPCA"."Feature_14" * 0.06251253958413336 + "CenteredDataForPCA"."Feature_15" * -0.04736979727802468 + "CenteredDataForPCA"."Feature_16" * 0.21741624572821594 + "CenteredDataForPCA"."Feature_17" * -0.4581762332998516 + "CenteredDataForPCA"."Feature_18" * 0.07011677813910536 + "CenteredDataForPCA"."Feature_19" * -0.12373854550184958 + "CenteredDataForPCA"."Feature_20" * -0.11724421520284922 + "CenteredDataForPCA"."Feature_21" * -0.04180201985541791 + "CenteredDataForPCA"."Feature_22" * -0.09332632941167764 + "CenteredDataForPCA"."Feature_23" * -0.07432138949858913 + "CenteredDataForPCA"."Feature_24" * -0.18509714278896566 + "CenteredDataForPCA"."Feature_25" * -0.1113396852823921 + "CenteredDataForPCA"."Feature_26" * 0.15164143194483734 + "CenteredDataForPCA"."Feature_27" * -0.2722089955475971 + "CenteredDataForPCA"."Feature_28" * -0.2294280573274829 + "CenteredDataForPCA"."Feature_29" * -0.1821560363684032 AS caress_14, "CenteredDataForPCA"."Feature_0" * 0.04107105790596408 + "CenteredDataForPCA"."Feature_1" * -0.021505836346551125 + "CenteredDataForPCA"."Feature_2" * 0.03469612473734282 + "CenteredDataForPCA"."Feature_3" * -0.006320217733651086 + "CenteredDataForPCA"."Feature_4" * 0.3703622727071961 + "CenteredDataForPCA"."Feature_5" * 0.07253414015608864 + "CenteredDataForPCA"."Feature_6" * -0.1923658351107464 + "CenteredDataForPCA"."Feature_7" * -0.26829499544150676 + "CenteredDataForPCA"."Feature_8" * 0.017848693326847586 + "CenteredDataForPCA"."Feature_9" * -0.3488872610103029 + "CenteredDataForPCA"."Feature_10" * 0.01735778775583138 + "CenteredDataForPCA"."Feature_11" * -0.002975664556039266 + "CenteredDataForPCA"."Feature_12" * -0.04641209281064541 + "CenteredDataForPCA"."Feature_13" * 0.05269302783359672 + "CenteredDataForPCA"."Feature_14" * -0.18717968976139238 + "CenteredDataForPCA"."Feature_15" * 0.4975178731746952 + "CenteredDataForPCA"."Feature_16" * 0.1529318099594695 + "CenteredDataForPCA"."Feature_17" * -0.1800053645354345 + "CenteredDataForPCA"."Feature_18" * -0.05851220516564689 + "CenteredDataForPCA"."Feature_19" * 0.14490612708690995 + "CenteredDataForPCA"."Feature_20" * 0.035927169474923325 + "CenteredDataForPCA"."Feature_21" * 0.04216011047463604 + "CenteredDataForPCA"."Feature_22" * 0.029907325999151614 + "CenteredDataForPCA"."Feature_23" * 0.00877407535288985 + "CenteredDataForPCA"."Feature_24" * 0.21902107130818593 + "CenteredDataForPCA"."Feature_25" * 0.18442352582000593 + "CenteredDataForPCA"."Feature_26" * -0.08555848826758622 + "CenteredDataForPCA"."Feature_27" * -0.2772550534719396 + "CenteredDataForPCA"."Feature_28" * 0.047698977911680894 + "CenteredDataForPCA"."Feature_29" * -0.28748814604027134 AS caress_15, "CenteredDataForPCA"."Feature_0" * -0.06318069654294203 + "CenteredDataForPCA"."Feature_1" * -0.11576496341526445 + "CenteredDataForPCA"."Feature_2" * -0.04846057400091816 + "CenteredDataForPCA"."Feature_3" * 0.002106634220184582 + "CenteredDataForPCA"."Feature_4" * -0.13654219747265345 + "CenteredDataForPCA"."Feature_5" * 0.20477813701292308 + "CenteredDataForPCA"."Feature_6" * -0.09457614360300493 + "CenteredDataForPCA"."Feature_7" * -0.13688120206507454 + "CenteredDataForPCA"."Feature_8" * -0.11542169680522313 + "CenteredDataForPCA"."Feature_9" * 0.5462213007362244 + "CenteredDataForPCA"."Feature_10" * -0.11142931042593732 + "CenteredDataForPCA"."Feature_11" * 0.013935260694068112 + "CenteredDataForPCA"."Feature_12" * 0.005757412935942029 + "CenteredDataForPCA"."Feature_13" * -0.06817062211819945 + "CenteredDataForPCA"."Feature_14" * 0.05524598821204946 + "CenteredDataForPCA"."Feature_15" * 0.1421410179023298 + "CenteredDataForPCA"."Feature_16" * 0.21949808950645616 + "CenteredDataForPCA"."Feature_17" * 0.09633553513856473 + "CenteredDataForPCA"."Feature_18" * -0.13014138008726628 + "CenteredDataForPCA"."Feature_19" * -0.3421562602987315 + "CenteredDataForPCA"."Feature_20" * 0.1655133971278422 + "CenteredDataForPCA"."Feature_21" * 0.1196046030406579 + "CenteredDataForPCA"."Feature_22" * 0.1869501873367181 + "CenteredDataForPCA"."Feature_23" * 0.313785717390961 + "CenteredDataForPCA"."Feature_24" * 0.008169437410224922 + "CenteredDataForPCA"."Feature_25" * -0.08698485130524566 + "CenteredDataForPCA"."Feature_26" * -0.22414853168183213 + "CenteredDataForPCA"."Feature_27" * -0.15981400603071622 + "CenteredDataForPCA"."Feature_28" * 0.17752297952007556 + "CenteredDataForPCA"."Feature_29" * -0.24136629965589124 AS caress_16 
FROM "CenteredDataForPCA"), 
"DT_node_lookup" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_car_1_OUT".caress_2 < -0.4745708658051148) THEN 2 ELSE 3 END AS node_id_2 
FROM "ADS_car_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.9119496855345912 AS "P_0", 0.08805031446540881 AS "P_1", 0 AS "D", 0.9119496855345912 AS "DP" FROM rdb$database UNION ALL SELECT 3 AS nid, 0.050675675675675665 AS "P_0", 0.9493243243243242 AS "P_1", 1 AS "D", 0.9493243243243242 AS "DP" FROM rdb$database) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"