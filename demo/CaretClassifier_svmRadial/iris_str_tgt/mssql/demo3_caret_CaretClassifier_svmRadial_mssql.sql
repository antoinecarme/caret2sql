-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmRadial
-- Dataset : iris_str_tgt
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 5.8475) / 0.8305068311812105 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 3.036666666666667) / 0.4380885397125232 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 3.845) / 1.7169863181769165 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 1.245) / 0.7530163434118665 AS [Feature_3] 
FROM iris_str_tgt AS [ADS]), 
[SV_data_CLASS_0] AS 
(SELECT [Values].sv_idx AS sv_idx, [Values].dual_coeff AS dual_coeff, [Values].sv_0 AS sv_0, [Values].sv_1 AS sv_1, [Values].sv_2 AS sv_2, [Values].sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.08675591840009599 AS dual_coeff, -1.502094809052576 AS sv_0, 0.8293605068321469 AS sv_1, -1.424006687832017 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.3387793106821074 AS dual_coeff, -1.0204612029435332 AS sv_0, 1.0576248665107195 AS sv_1, -1.3075235231831812 AS sv_2, -0.8565551141659797 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.02065111205682048 AS dual_coeff, -0.41841919530723065 AS sv_0, 2.655475384260728 AS sv_1, -1.424006687832017 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.32231800970308966 AS dual_coeff, 1.1468900245471565 AS sv_0, -0.5402256512392887 AS sv_1, 0.5562071111981904 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -0.049697337672127376 AS dual_coeff, -0.9000528014162733 AS sv_0, 0.6010961471535741 AS sv_1, -1.2492819408587634 AS sv_2, -0.9893543566723332 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.43734102376647566 AS dual_coeff, -0.9000528014162733 AS sv_0, -1.225018730275006 AS sv_1, -0.4921413706413311 AS sv_2, -0.19255890163421224 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 0.08198449012236975 AS dual_coeff, -0.05719399072544915 AS sv_0, -0.7684900109178605 AS sv_1, 0.1485160349272653 AS sv_2, -0.32535814414056585 AS sv_3 UNION ALL SELECT 7 AS sv_idx, 0.5 AS dual_coeff, 1.387706827601678 AS sv_0, 0.3728317874750024 AS sv_1, 0.4979655288737728 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -0.32913965917071336 AS dual_coeff, -0.1776023922527093 AS sv_0, 1.7424179455464368 AS sv_1, -1.2492819408587634 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.10901097029929728 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.6815474496321514 AS sv_1, 0.3232407819005192 AS sv_2, 0.07303958337849463 AS sv_3 UNION ALL SELECT 10 AS sv_idx, 0.5 AS dual_coeff, 0.4244396153835936 AS sv_0, -1.9098118093107233 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.21779943285913958 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.4532830899535787 AS sv_1, -0.3174166236680776 AS sv_2, -0.32535814414056585 AS sv_3 UNION ALL SELECT 12 AS sv_idx, -0.5 AS dual_coeff, -0.7796443998890122 AS sv_0, 2.4272110245821534 AS sv_1, -1.3657651055075992 AS sv_2, -1.5205513266977468 AS sv_3 UNION ALL SELECT 13 AS sv_idx, -0.28701642946279515 AS dual_coeff, -1.7429116121070964 AS sv_0, -0.31196129156071595 AS sv_1, -1.424006687832017 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.5 AS dual_coeff, 0.18362281232907215 AS sv_0, 0.8293605068321469 AS sv_1, 0.3814823642249369 AS sv_2, 0.4714373108975551 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 0.007051823427946217 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.225018730275006 AS sv_1, 0.6144486935226086 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 0.5 AS dual_coeff, -1.0204612029435332 AS sv_0, -2.3663405286678687 AS sv_1, -0.2009334590192418 AS sv_2, -0.32535814414056585 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -0.1387852010501832 AS dual_coeff, -1.2612780059980548 AS sv_0, -0.08369693188214318 AS sv_1, -1.424006687832017 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.4450772381807456 AS dual_coeff, -0.5388275968344908 AS sv_0, -0.08369693188214318 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 19 AS sv_idx, -0.5 AS dual_coeff, -1.6225032105798363 AS sv_0, -1.6815474496321514 AS sv_1, -1.4822482701564348 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -0.5 AS dual_coeff, -0.1776023922527093 AS sv_0, 3.1120041036178727 AS sv_1, -1.3657651055075992 AS sv_2, -1.1221535991786866 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -0.36975801986422085 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8293605068321469 AS sv_1, -1.2492819408587634 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 22 AS sv_idx, -0.5 AS dual_coeff, -1.8633200136343575 AS sv_0, -0.08369693188214318 AS sv_1, -1.5987314348052706 AS sv_2, -1.5205513266977468 AS sv_3) AS [Values]), 
[kernel_dp_CLASS_0] AS 
(SELECT t.[KEY] AS [KEY], t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.[KEY] AS [KEY], sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT(53))) + 0.112565331953052 AS dot_product 
FROM (SELECT kernel_input_with_scaling.[KEY] AS [KEY], [SV_data_CLASS_0].dual_coeff * exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_0].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_0].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_0].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_0].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_0].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_0].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_0].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_0].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_0].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_0].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_0].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_0].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_0].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_0].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_0].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_0].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END END) AS dot_prod1 
FROM kernel_input_with_scaling, [SV_data_CLASS_0]) AS full_join_data_sv GROUP BY full_join_data_sv.[KEY]) AS t), 
[OVR_Score_CLASS_0] AS 
(SELECT [kernel_dp_CLASS_0].[KEY] AS [KEY_CLASS_0], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_0].dot_product * -3.6954949625848466 + 0.1654538540823712))) THEN -(-([kernel_dp_CLASS_0].dot_product * -3.6954949625848466 + 0.1654538540823712)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_0].dot_product * -3.6954949625848466 + 0.1654538540823712))) THEN -(-([kernel_dp_CLASS_0].dot_product * -3.6954949625848466 + 0.1654538540823712)) ELSE -100.0 END END)) AS [Proba_CLASS_0], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_0] 
FROM [kernel_dp_CLASS_0]), 
[SV_data_CLASS_1] AS 
(SELECT [Values].sv_idx AS sv_idx, [Values].dual_coeff AS dual_coeff, [Values].sv_0 AS sv_0, [Values].sv_1 AS sv_1, [Values].sv_2 AS sv_2, [Values].sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.2241904894239384 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.6010961471535741 AS sv_1, 1.2551060990912049 AS sv_2, 1.666630493454736 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.5 AS dual_coeff, 2.471382441347024 AS sv_0, 1.7424179455464368 AS sv_1, 1.4880724283888769 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.19376612999616444 AS dual_coeff, -1.502094809052576 AS sv_0, 0.8293605068321469 AS sv_1, -1.424006687832017 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -0.34115102773846867 AS dual_coeff, -1.0204612029435334 AS sv_0, 1.0576248665107195 AS sv_1, -1.3075235231831812 AS sv_2, -0.8565551141659797 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -0.14103816763855148 AS dual_coeff, -0.4184191953072307 AS sv_0, 2.655475384260728 AS sv_1, -1.424006687832017 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.1803975533574288 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.08369693188214318 AS sv_1, 1.3133476814156226 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -0.02480345031554054 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8293605068321469 AS sv_1, -1.3657651055075992 AS sv_2, -1.1221535991786866 AS sv_3 UNION ALL SELECT 7 AS sv_idx, 0.5 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.225018730275006 AS sv_1, 0.3814823642249369 AS sv_2, 0.6042365534039084 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 0.5 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.9967543705964332 AS sv_1, 1.779280340010966 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.2100958338872433 AS dual_coeff, 1.0264816230198963 AS sv_0, -1.225018730275006 AS sv_1, 1.1386229344423693 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -0.3412452613154098 AS dual_coeff, -0.1776023922527093 AS sv_0, 1.7424179455464368 AS sv_1, -1.2492819408587634 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.22504151671582664 AS dual_coeff, 0.1836228123290722 AS sv_0, -0.08369693188214318 AS sv_1, 0.5562071111981904 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 12 AS sv_idx, -0.5 AS dual_coeff, -0.7796443998890121 AS sv_0, 2.4272110245821534 AS sv_1, -1.3657651055075992 AS sv_2, -1.5205513266977468 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 0.06996150383535474 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.9967543705964332 AS sv_1, 1.0221397697935333 AS sv_2, 0.2058388258848479 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.1411307682881066 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.5402256512392887 AS sv_1, 0.6144486935226086 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 0.2882132556705292 AS dual_coeff, 0.4244396153835935 AS sv_0, 0.8293605068321469 AS sv_1, 0.905656605144698 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 0.3075549179953853 AS dual_coeff, 1.6285236306561992 AS sv_0, 1.2858892261892922 AS sv_1, 1.3133476814156226 AS sv_2, 1.666630493454736 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -0.4186086413154936 AS dual_coeff, -1.7429116121070964 AS sv_0, -0.31196129156071595 AS sv_1, -1.424006687832017 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.3197380417561704 AS dual_coeff, 1.6285236306561992 AS sv_0, -0.08369693188214318 AS sv_1, 1.1386229344423693 AS sv_2, 0.4714373108975551 AS sv_3 UNION ALL SELECT 19 AS sv_idx, 0.4780752403332032 AS dual_coeff, 0.1836228123290722 AS sv_0, -1.9098118093107233 AS sv_1, 0.6726902758470262 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -0.03160665867416792 AS dual_coeff, -1.2612780059980548 AS sv_0, -0.08369693188214318 AS sv_1, -1.424006687832017 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -0.5 AS dual_coeff, -1.6225032105798365 AS sv_0, -1.6815474496321514 AS sv_1, -1.4822482701564348 AS sv_2, -1.25495284168504 AS sv_3 UNION ALL SELECT 22 AS sv_idx, -0.5 AS dual_coeff, -0.1776023922527093 AS sv_0, 3.1120041036178727 AS sv_1, -1.3657651055075992 AS sv_2, -1.1221535991786866 AS sv_3 UNION ALL SELECT 23 AS sv_idx, -0.45217978426939 AS dual_coeff, -0.5388275968344908 AS sv_0, 0.8293605068321469 AS sv_1, -1.2492819408587634 AS sv_2, -1.3877520841913935 AS sv_3 UNION ALL SELECT 24 AS sv_idx, -0.5 AS dual_coeff, -1.8633200136343575 AS sv_0, -0.08369693188214318 AS sv_1, -1.5987314348052706 AS sv_2, -1.5205513266977468 AS sv_3) AS [Values]), 
[kernel_dp_CLASS_1] AS 
(SELECT t_1.[KEY] AS [KEY], t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1.[KEY] AS [KEY], sum(CAST(full_join_data_sv_1.dot_prod1 AS FLOAT(53))) + 0.253551634750803 AS dot_product 
FROM (SELECT kernel_input_with_scaling.[KEY] AS [KEY], [SV_data_CLASS_1].dual_coeff * exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_1].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_1].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_1].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_1].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_1].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_1].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_1].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_1].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_1].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_1].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_1].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_1].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_1].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_1].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_1].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_1].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END END) AS dot_prod1 
FROM kernel_input_with_scaling, [SV_data_CLASS_1]) AS full_join_data_sv_1 GROUP BY full_join_data_sv_1.[KEY]) AS t_1), 
[OVR_Score_CLASS_1] AS 
(SELECT [kernel_dp_CLASS_1].[KEY] AS [KEY_CLASS_1], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_1].dot_product * -3.7530749181996734 + 0.02463770753932081))) THEN -(-([kernel_dp_CLASS_1].dot_product * -3.7530749181996734 + 0.02463770753932081)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_1].dot_product * -3.7530749181996734 + 0.02463770753932081))) THEN -(-([kernel_dp_CLASS_1].dot_product * -3.7530749181996734 + 0.02463770753932081)) ELSE -100.0 END END)) AS [Proba_CLASS_1], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_1] 
FROM [kernel_dp_CLASS_1]), 
[SV_data_CLASS_2] AS 
(SELECT [Values].sv_idx AS sv_idx, [Values].dual_coeff AS dual_coeff, [Values].sv_0 AS sv_0, [Values].sv_1 AS sv_1, [Values].sv_2 AS sv_2, [Values].sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.5 AS dual_coeff, 2.4713824413470236 AS sv_0, 1.7424179455464368 AS sv_1, 1.4880724283888764 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.5 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.31196129156071595 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.5 AS dual_coeff, 1.1468900245471565 AS sv_0, -0.5402256512392887 AS sv_1, 0.5562071111981904 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.09224193393347394 AS dual_coeff, 0.785664819965375 AS sv_0, -0.08369693188214318 AS sv_1, 0.7891734404958621 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.5 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.08369693188214318 AS sv_1, 0.6144486935226086 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.13716037947050316 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.08369693188214318 AS sv_1, 1.3133476814156226 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -0.5 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.08369693188214318 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.6010961471535741 AS sv_1, 0.4979655288737728 AS sv_2, 0.4714373108975551 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -0.5 AS dual_coeff, 1.387706827601678 AS sv_0, 0.3728317874750024 AS sv_1, 0.4979655288737728 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.5 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.225018730275006 AS sv_1, 0.3814823642249369 AS sv_2, 0.6042365534039084 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -0.4836436528693185 AS dual_coeff, -0.41841919530723065 AS sv_0, -1.6815474496321514 AS sv_1, 0.09027445260284757 AS sv_2, 0.07303958337849463 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.5 AS dual_coeff, 2.2305656382925014 AS sv_0, -0.9967543705964332 AS sv_1, 1.779280340010966 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 0.20896756942731096 AS dual_coeff, 1.0264816230198963 AS sv_0, -1.225018730275006 AS sv_1, 1.138622934442369 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 0.2393221310636339 AS dual_coeff, -0.1776023922527093 AS sv_0, -1.225018730275006 AS sv_1, 0.6726902758470262 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 14 AS sv_idx, -0.5 AS dual_coeff, -0.7796443998890122 AS sv_0, -0.7684900109178605 AS sv_1, 0.03203287027842966 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 0.043771043802427766 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.8293605068321469 AS sv_1, 1.0221397697935333 AS sv_2, 1.5338312509483825 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 0.5 AS dual_coeff, 0.785664819965375 AS sv_0, 0.3728317874750024 AS sv_1, 0.7309318581714438 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.6815474496321514 AS sv_1, 0.32324078190051925 AS sv_2, 0.07303958337849463 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.7684900109178605 AS sv_1, 0.6144486935226086 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 19 AS sv_idx, 0.5 AS dual_coeff, 1.628523630656199 AS sv_0, 0.3728317874750024 AS sv_1, 1.2551060990912049 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 20 AS sv_idx, 0.5 AS dual_coeff, 0.06321441080181206 AS sv_0, -0.08369693188214318 AS sv_1, 0.7309318581714438 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -0.5 AS dual_coeff, 0.4244396153835936 AS sv_0, -1.9098118093107233 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 22 AS sv_idx, -0.35837658635658365 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.4532830899535787 AS sv_1, -0.3174166236680776 AS sv_2, -0.32535814414056585 AS sv_3 UNION ALL SELECT 23 AS sv_idx, 0.5 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.08369693188214318 AS sv_1, 0.5562071111981904 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 24 AS sv_idx, 0.5 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.9967543705964332 AS sv_1, 1.0221397697935333 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 25 AS sv_idx, 0.5 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.5402256512392887 AS sv_1, 0.6144486935226086 AS sv_2, 1.0026342809229687 AS sv_3 UNION ALL SELECT 26 AS sv_idx, 0.5 AS dual_coeff, 0.4244396153835936 AS sv_0, 0.8293605068321469 AS sv_1, 0.905656605144698 AS sv_2, 1.401032008442029 AS sv_3 UNION ALL SELECT 27 AS sv_idx, 0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.5402256512392887 AS sv_1, 0.7309318581714438 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 28 AS sv_idx, 0.5 AS dual_coeff, 0.785664819965375 AS sv_0, -0.08369693188214318 AS sv_1, 0.9638981874691156 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 29 AS sv_idx, 0.3508045941346224 AS dual_coeff, 1.628523630656199 AS sv_0, 1.2858892261892922 AS sv_1, 1.3133476814156226 AS sv_2, 1.666630493454736 AS sv_3 UNION ALL SELECT 30 AS sv_idx, 0.5 AS dual_coeff, 1.628523630656199 AS sv_0, -0.08369693188214318 AS sv_1, 1.138622934442369 AS sv_2, 0.4714373108975551 AS sv_3 UNION ALL SELECT 31 AS sv_idx, -0.5 AS dual_coeff, 0.06321441080181206 AS sv_0, 0.3728317874750024 AS sv_1, 0.5562071111981904 AS sv_2, 0.7370357959102619 AS sv_3 UNION ALL SELECT 32 AS sv_idx, -0.4706442651431388 AS dual_coeff, 0.18362281232907215 AS sv_0, 0.8293605068321469 AS sv_1, 0.3814823642249369 AS sv_2, 0.4714373108975551 AS sv_3 UNION ALL SELECT 33 AS sv_idx, -0.5 AS dual_coeff, 1.0264816230198963 AS sv_0, 0.1445674277964296 AS sv_1, 0.4979655288737728 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 34 AS sv_idx, -0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.225018730275006 AS sv_1, 0.6144486935226086 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 35 AS sv_idx, -0.5 AS dual_coeff, -1.0204612029435332 AS sv_0, -2.3663405286678687 AS sv_1, -0.20093345901924176 AS sv_2, -0.32535814414056585 AS sv_3 UNION ALL SELECT 36 AS sv_idx, 0.5 AS dual_coeff, 0.18362281232907215 AS sv_0, -1.9098118093107233 AS sv_1, 0.6726902758470262 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 37 AS sv_idx, -0.5 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.31196129156071595 AS sv_1, 0.4979655288737728 AS sv_2, 0.20583882588484786 AS sv_3 UNION ALL SELECT 38 AS sv_idx, -0.5 AS dual_coeff, -0.5388275968344908 AS sv_0, -0.08369693188214318 AS sv_1, 0.3814823642249369 AS sv_2, 0.3386380683912015 AS sv_3 UNION ALL SELECT 39 AS sv_idx, -0.5 AS dual_coeff, 1.0264816230198963 AS sv_0, -0.08369693188214318 AS sv_1, 0.6726902758470262 AS sv_2, 0.6042365534039084 AS sv_3 UNION ALL SELECT 40 AS sv_idx, -0.2596031474629312 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.5402256512392887 AS sv_1, 0.4979655288737728 AS sv_2, -0.05975965912785897 AS sv_3 UNION ALL SELECT 41 AS sv_idx, 0.5 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.225018730275006 AS sv_1, 0.6726902758470262 AS sv_2, 0.8698350384166152 AS sv_3 UNION ALL SELECT 42 AS sv_idx, -0.5 AS dual_coeff, 1.2672984260744176 AS sv_0, 0.1445674277964296 AS sv_1, 0.6144486935226086 AS sv_2, 0.3386380683912015 AS sv_3) AS [Values]), 
[kernel_dp_CLASS_2] AS 
(SELECT t_2.[KEY] AS [KEY], t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2.[KEY] AS [KEY], sum(CAST(full_join_data_sv_2.dot_prod1 AS FLOAT(53))) + 0.0847582900108099 AS dot_product 
FROM (SELECT kernel_input_with_scaling.[KEY] AS [KEY], [SV_data_CLASS_2].dual_coeff * exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_2].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_2].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_2].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_2].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_2].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_2].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_2].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_2].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_2].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_2].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_2].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_2].sv_3 AS FLOAT(53)), 2))) THEN -0.674465597724668 * (power(CAST(kernel_input_with_scaling.[Feature_0] - [SV_data_CLASS_2].sv_0 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_1] - [SV_data_CLASS_2].sv_1 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_2] - [SV_data_CLASS_2].sv_2 AS FLOAT(53)), 2) + power(CAST(kernel_input_with_scaling.[Feature_3] - [SV_data_CLASS_2].sv_3 AS FLOAT(53)), 2)) ELSE -100.0 END END) AS dot_prod1 
FROM kernel_input_with_scaling, [SV_data_CLASS_2]) AS full_join_data_sv_2 GROUP BY full_join_data_sv_2.[KEY]) AS t_2), 
[OVR_Score_CLASS_2] AS 
(SELECT [kernel_dp_CLASS_2].[KEY] AS [KEY_CLASS_2], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_2].dot_product * -4.114125905060743 + 0.2325527177483693))) THEN -(-([kernel_dp_CLASS_2].dot_product * -4.114125905060743 + 0.2325527177483693)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -(-([kernel_dp_CLASS_2].dot_product * -4.114125905060743 + 0.2325527177483693))) THEN -(-([kernel_dp_CLASS_2].dot_product * -4.114125905060743 + 0.2325527177483693)) ELSE -100.0 END END)) AS [Proba_CLASS_2], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [kernel_dp_CLASS_2]), 
[OVR_Join_CTE] AS 
(SELECT [OVR_Score_CLASS_0].[KEY_CLASS_0] AS [KEY_CLASS_0], [OVR_Score_CLASS_0].[Proba_CLASS_0] AS [Proba_CLASS_0], [OVR_Score_CLASS_0].[Score_CLASS_0] AS [Score_CLASS_0], [OVR_Score_CLASS_1].[KEY_CLASS_1] AS [KEY_CLASS_1], [OVR_Score_CLASS_1].[Proba_CLASS_1] AS [Proba_CLASS_1], [OVR_Score_CLASS_1].[Score_CLASS_1] AS [Score_CLASS_1], [OVR_Score_CLASS_2].[KEY_CLASS_2] AS [KEY_CLASS_2], [OVR_Score_CLASS_2].[Proba_CLASS_2] AS [Proba_CLASS_2], [OVR_Score_CLASS_2].[Score_CLASS_2] AS [Score_CLASS_2] 
FROM [OVR_Score_CLASS_0] LEFT OUTER JOIN [OVR_Score_CLASS_1] ON [OVR_Score_CLASS_0].[KEY_CLASS_0] = [OVR_Score_CLASS_1].[KEY_CLASS_1] LEFT OUTER JOIN [OVR_Score_CLASS_2] ON [OVR_Score_CLASS_2].[KEY_CLASS_2] = [OVR_Score_CLASS_1].[KEY_CLASS_1]), 
orig_cte AS 
(SELECT [OVR_Join_CTE].[KEY_CLASS_0] AS [KEY], [OVR_Join_CTE].[Score_CLASS_0] AS [Score_CLASS_0], [OVR_Join_CTE].[Score_CLASS_1] AS [Score_CLASS_1], [OVR_Join_CTE].[Score_CLASS_2] AS [Score_CLASS_2], [OVR_Join_CTE].[Proba_CLASS_0] / ([OVR_Join_CTE].[Proba_CLASS_0] + [OVR_Join_CTE].[Proba_CLASS_1] + [OVR_Join_CTE].[Proba_CLASS_2]) AS [Proba_CLASS_0], [OVR_Join_CTE].[Proba_CLASS_1] / ([OVR_Join_CTE].[Proba_CLASS_0] + [OVR_Join_CTE].[Proba_CLASS_1] + [OVR_Join_CTE].[Proba_CLASS_2]) AS [Proba_CLASS_1], [OVR_Join_CTE].[Proba_CLASS_2] / ([OVR_Join_CTE].[Proba_CLASS_0] + [OVR_Join_CTE].[Proba_CLASS_1] + [OVR_Join_CTE].[Proba_CLASS_2]) AS [Proba_CLASS_2], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_0], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_1], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_2], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM [OVR_Join_CTE]), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_0' AS class, orig_cte.[LogProba_CLASS_0] AS [LogProba], orig_cte.[Proba_CLASS_0] AS [Proba], orig_cte.[Score_CLASS_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_1' AS class, orig_cte.[LogProba_CLASS_1] AS [LogProba], orig_cte.[Proba_CLASS_1] AS [Proba], orig_cte.[Score_CLASS_1] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_2' AS class, orig_cte.[LogProba_CLASS_2] AS [LogProba], orig_cte.[Proba_CLASS_2] AS [Proba], orig_cte.[Score_CLASS_2] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_CLASS_0] AS [Score_CLASS_0], orig_cte.[Score_CLASS_1] AS [Score_CLASS_1], orig_cte.[Score_CLASS_2] AS [Score_CLASS_2], orig_cte.[Proba_CLASS_0] AS [Proba_CLASS_0], orig_cte.[Proba_CLASS_1] AS [Proba_CLASS_1], orig_cte.[Proba_CLASS_2] AS [Proba_CLASS_2], orig_cte.[LogProba_CLASS_0] AS [LogProba_CLASS_0], orig_cte.[LogProba_CLASS_1] AS [LogProba_CLASS_1], orig_cte.[LogProba_CLASS_2] AS [LogProba_CLASS_2], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Score] AS [max_Score] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Score]) AS [max_Score] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_max.[KEY] AS [KEY], score_max.[Score_CLASS_0] AS [Score_CLASS_0], score_max.[Score_CLASS_1] AS [Score_CLASS_1], score_max.[Score_CLASS_2] AS [Score_CLASS_2], score_max.[Proba_CLASS_0] AS [Proba_CLASS_0], score_max.[Proba_CLASS_1] AS [Proba_CLASS_1], score_max.[Proba_CLASS_2] AS [Proba_CLASS_2], score_max.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_max.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_max.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score] 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.[KEY_u] = score_max.[KEY]), 
arg_max_cte AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_CLASS_0] AS [Score_CLASS_0], score_max.[Score_CLASS_1] AS [Score_CLASS_1], score_max.[Score_CLASS_2] AS [Score_CLASS_2], score_max.[Proba_CLASS_0] AS [Proba_CLASS_0], score_max.[Proba_CLASS_1] AS [Proba_CLASS_1], score_max.[Proba_CLASS_2] AS [Proba_CLASS_2], score_max.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_max.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_max.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score], [arg_max_t_Score].[KEY_Score] AS [KEY_Score], [arg_max_t_Score].[arg_max_Score] AS [arg_max_Score] 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Score], max(union_with_max.class) AS [arg_max_Score] 
FROM union_with_max 
WHERE union_with_max.[max_Score] <= union_with_max.[Score] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Score] ON score_max.[KEY] = [arg_max_t_Score].[KEY_Score])
 SELECT arg_max_cte.[KEY] AS [KEY], arg_max_cte.[Score_CLASS_0] AS [Score_CLASS_0], arg_max_cte.[Score_CLASS_1] AS [Score_CLASS_1], arg_max_cte.[Score_CLASS_2] AS [Score_CLASS_2], arg_max_cte.[Proba_CLASS_0] AS [Proba_CLASS_0], arg_max_cte.[Proba_CLASS_1] AS [Proba_CLASS_1], arg_max_cte.[Proba_CLASS_2] AS [Proba_CLASS_2], CASE WHEN (arg_max_cte.[Proba_CLASS_0] IS NULL OR arg_max_cte.[Proba_CLASS_0] > 0.0) THEN log(arg_max_cte.[Proba_CLASS_0]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_0], CASE WHEN (arg_max_cte.[Proba_CLASS_1] IS NULL OR arg_max_cte.[Proba_CLASS_1] > 0.0) THEN log(arg_max_cte.[Proba_CLASS_1]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_1], CASE WHEN (arg_max_cte.[Proba_CLASS_2] IS NULL OR arg_max_cte.[Proba_CLASS_2] > 0.0) THEN log(arg_max_cte.[Proba_CLASS_2]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_2], arg_max_cte.[arg_max_Score] AS [Decision], CASE WHEN (arg_max_cte.[arg_max_Score] = 'CLASS_0') THEN arg_max_cte.[Proba_CLASS_0] WHEN (arg_max_cte.[arg_max_Score] = 'CLASS_1') THEN arg_max_cte.[Proba_CLASS_1] WHEN (arg_max_cte.[arg_max_Score] = 'CLASS_2') THEN arg_max_cte.[Proba_CLASS_2] END AS [DecisionProba] 
FROM arg_max_cte