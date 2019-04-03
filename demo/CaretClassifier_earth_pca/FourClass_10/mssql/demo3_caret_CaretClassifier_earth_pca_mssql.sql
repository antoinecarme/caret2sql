-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth_pca
-- Dataset : FourClass_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - -0.003903374463034224) / 0.985685974308334 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 0.6152232215702326) / 1.398851036008891 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.04279623691429167) / 1.5057087871323842 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.770981955890407) / 2.3480777416797296 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.43300733624893323) / 1.4118274472656485 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - -0.04249569657940362) / 0.961839508883184 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - -0.29809080119845444) / 1.0234297313191445 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.14672241507251668) / 1.610898315451602 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.01746942384662041) / 1.1559772136551034 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.11507331415602873) / 0.975205386360447 AS [Feature_9] 
FROM [FourClass_10] AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * -0.04932772619908273 + [ADS_sca_1_OUT].[Feature_1] * -0.30424192738374856 + [ADS_sca_1_OUT].[Feature_2] * -0.3679687561849888 + [ADS_sca_1_OUT].[Feature_3] * -0.5380769831115797 + [ADS_sca_1_OUT].[Feature_4] * 0.10802988742400396 + [ADS_sca_1_OUT].[Feature_5] * 0.13910407016754714 + [ADS_sca_1_OUT].[Feature_6] * 0.5384086347891889 + [ADS_sca_1_OUT].[Feature_7] * -0.3713071820395216 + [ADS_sca_1_OUT].[Feature_8] * 0.0483137135579316 + [ADS_sca_1_OUT].[Feature_9] * 0.13772539520944088 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.4566046379002287 + [ADS_sca_1_OUT].[Feature_1] * 0.22867203934764516 + [ADS_sca_1_OUT].[Feature_2] * -0.2673956790968541 + [ADS_sca_1_OUT].[Feature_3] * 0.01671202428135116 + [ADS_sca_1_OUT].[Feature_4] * -0.7163497555230034 + [ADS_sca_1_OUT].[Feature_5] * 0.3501083253113648 + [ADS_sca_1_OUT].[Feature_6] * -0.02365108420686553 + [ADS_sca_1_OUT].[Feature_7] * -0.15293556467571348 + [ADS_sca_1_OUT].[Feature_8] * -0.04278465473081572 + [ADS_sca_1_OUT].[Feature_9] * -0.07700365586043896 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * -0.4595639307438372 + [ADS_sca_1_OUT].[Feature_1] * 0.3158880900516212 + [ADS_sca_1_OUT].[Feature_2] * -0.23051961282840416 + [ADS_sca_1_OUT].[Feature_3] * -0.0044376721269756845 + [ADS_sca_1_OUT].[Feature_4] * -0.16274384812665132 + [ADS_sca_1_OUT].[Feature_5] * -0.27453767262313855 + [ADS_sca_1_OUT].[Feature_6] * 0.06030524407436345 + [ADS_sca_1_OUT].[Feature_7] * -0.14174903890838467 + [ADS_sca_1_OUT].[Feature_8] * -0.7115147418569482 + [ADS_sca_1_OUT].[Feature_9] * -0.06338366606522455 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * 0.12741284788275034 + [ADS_sca_1_OUT].[Feature_1] * 0.08549541136134871 + [ADS_sca_1_OUT].[Feature_2] * -0.3821190712444285 + [ADS_sca_1_OUT].[Feature_3] * -0.10433262844841386 + [ADS_sca_1_OUT].[Feature_4] * 0.08250986211203802 + [ADS_sca_1_OUT].[Feature_5] * -0.36296260084226667 + [ADS_sca_1_OUT].[Feature_6] * 0.10962886388759648 + [ADS_sca_1_OUT].[Feature_7] * 0.2426374781882909 + [ADS_sca_1_OUT].[Feature_8] * 0.2287736877363014 + [ADS_sca_1_OUT].[Feature_9] * -0.7468451366164522 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * -0.5052628362580355 + [ADS_sca_1_OUT].[Feature_1] * 0.5459531848285842 + [ADS_sca_1_OUT].[Feature_2] * -0.22747468245471705 + [ADS_sca_1_OUT].[Feature_3] * 0.10502795983753949 + [ADS_sca_1_OUT].[Feature_4] * 0.09502215073405063 + [ADS_sca_1_OUT].[Feature_5] * 0.36269377695620797 + [ADS_sca_1_OUT].[Feature_6] * 0.0045813170830969465 + [ADS_sca_1_OUT].[Feature_7] * -0.05707137281293255 + [ADS_sca_1_OUT].[Feature_8] * 0.4879473635061551 + [ADS_sca_1_OUT].[Feature_9] * 0.04384333678041198 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * -0.364462956028093 + [ADS_sca_1_OUT].[Feature_1] * -0.4012918066249357 + [ADS_sca_1_OUT].[Feature_2] * 0.1851889259404308 + [ADS_sca_1_OUT].[Feature_3] * -0.03041929320097767 + [ADS_sca_1_OUT].[Feature_4] * -0.1029513075574872 + [ADS_sca_1_OUT].[Feature_5] * 0.5811919009803136 + [ADS_sca_1_OUT].[Feature_6] * -0.060907389766695234 + [ADS_sca_1_OUT].[Feature_7] * 0.12041134521888586 + [ADS_sca_1_OUT].[Feature_8] * -0.186159059340367 + [ADS_sca_1_OUT].[Feature_9] * -0.5192923770633756 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * 0.20119583886282807 + [ADS_sca_1_OUT].[Feature_1] * 0.0677442703839704 + [ADS_sca_1_OUT].[Feature_2] * -0.41277620208310173 + [ADS_sca_1_OUT].[Feature_3] * -0.019873248265688318 + [ADS_sca_1_OUT].[Feature_4] * 0.327357356668028 + [ADS_sca_1_OUT].[Feature_5] * 0.3399166161542765 + [ADS_sca_1_OUT].[Feature_6] * 0.007401751370061409 + [ADS_sca_1_OUT].[Feature_7] * 0.6352452099253666 + [ADS_sca_1_OUT].[Feature_8] * -0.3190683902934043 + [ADS_sca_1_OUT].[Feature_9] * 0.23674831363349555 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
earth_input AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CAST([ADS_pre_1_OUT].[PC1] AS FLOAT(53)) AS [PC1], CAST([ADS_pre_1_OUT].[PC2] AS FLOAT(53)) AS [PC2], CAST([ADS_pre_1_OUT].[PC3] AS FLOAT(53)) AS [PC3], CAST([ADS_pre_1_OUT].[PC4] AS FLOAT(53)) AS [PC4], CAST([ADS_pre_1_OUT].[PC5] AS FLOAT(53)) AS [PC5], CAST([ADS_pre_1_OUT].[PC6] AS FLOAT(53)) AS [PC6], CAST([ADS_pre_1_OUT].[PC7] AS FLOAT(53)) AS [PC7] 
FROM [ADS_pre_1_OUT]), 
earth_model_cte AS 
(SELECT earth_input.[KEY] AS [KEY], -5.841023505624675 * CASE WHEN (earth_input.[PC1] - 0.7161352287510814 <= 0) THEN 0 ELSE earth_input.[PC1] - 0.7161352287510814 END + 2.182286634728866 * CASE WHEN (0.6492235018923073 - earth_input.[PC2] <= 0) THEN 0 ELSE 0.6492235018923073 - earth_input.[PC2] END + -1.6133572333332198 * CASE WHEN (0.3661186335019563 - earth_input.[PC7] <= 0) THEN 0 ELSE 0.3661186335019563 - earth_input.[PC7] END + 1.5335452481038532 * CASE WHEN (1.041519928843311 - earth_input.[PC3] <= 0) THEN 0 ELSE 1.041519928843311 - earth_input.[PC3] END + 3.8355382498539115 * CASE WHEN (earth_input.[PC1] - -1.7597443145922087 <= 0) THEN 0 ELSE earth_input.[PC1] - -1.7597443145922087 END + -11.089807309890986 AS [Score_0], -403.23227552881593 * CASE WHEN (earth_input.[PC1] - 0.7161352287510814 <= 0) THEN 0 ELSE earth_input.[PC1] - 0.7161352287510814 END + 0.5962689721479145 * CASE WHEN (0.6492235018923073 - earth_input.[PC2] <= 0) THEN 0 ELSE 0.6492235018923073 - earth_input.[PC2] END + -0.3031357070500953 * CASE WHEN (0.3661186335019563 - earth_input.[PC7] <= 0) THEN 0 ELSE 0.3661186335019563 - earth_input.[PC7] END + -0.06618149554510443 * CASE WHEN (1.041519928843311 - earth_input.[PC3] <= 0) THEN 0 ELSE 1.041519928843311 - earth_input.[PC3] END + -1.3042951154489348 * CASE WHEN (earth_input.[PC1] - -1.7597443145922087 <= 0) THEN 0 ELSE earth_input.[PC1] - -1.7597443145922087 END + 0.4205131628383921 AS [Score_1], 2.950706659743382 * CASE WHEN (earth_input.[PC1] - 0.7161352287510814 <= 0) THEN 0 ELSE earth_input.[PC1] - 0.7161352287510814 END + -0.8160070272986734 * CASE WHEN (0.6492235018923073 - earth_input.[PC2] <= 0) THEN 0 ELSE 0.6492235018923073 - earth_input.[PC2] END + -0.7900379299074102 * CASE WHEN (0.3661186335019563 - earth_input.[PC7] <= 0) THEN 0 ELSE 0.3661186335019563 - earth_input.[PC7] END + 0.0532245123685132 * CASE WHEN (1.041519928843311 - earth_input.[PC3] <= 0) THEN 0 ELSE 1.041519928843311 - earth_input.[PC3] END + -0.4848976145718066 * CASE WHEN (earth_input.[PC1] - -1.7597443145922087 <= 0) THEN 0 ELSE earth_input.[PC1] - -1.7597443145922087 END + -0.7430445534468179 AS [Score_2], -2.8422932170992343 * CASE WHEN (earth_input.[PC1] - 0.7161352287510814 <= 0) THEN 0 ELSE earth_input.[PC1] - 0.7161352287510814 END + -1.7531524195815218 * CASE WHEN (0.6492235018923073 - earth_input.[PC2] <= 0) THEN 0 ELSE 0.6492235018923073 - earth_input.[PC2] END + 1.917169749632974 * CASE WHEN (0.3661186335019563 - earth_input.[PC7] <= 0) THEN 0 ELSE 0.3661186335019563 - earth_input.[PC7] END + -1.1063523401743458 * CASE WHEN (1.041519928843311 - earth_input.[PC3] <= 0) THEN 0 ELSE 1.041519928843311 - earth_input.[PC3] END + 0.603282642650161 * CASE WHEN (earth_input.[PC1] - -1.7597443145922087 <= 0) THEN 0 ELSE earth_input.[PC1] - -1.7597443145922087 END + -0.1929465237483979 AS [Score_3] 
FROM earth_input), 
earth_model_cte_logistic AS 
(SELECT earth_model_cte.[KEY] AS [KEY], earth_model_cte.[Score_0] AS [Score_0], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -earth_model_cte.[Score_0]) THEN -earth_model_cte.[Score_0] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -earth_model_cte.[Score_0]) THEN -earth_model_cte.[Score_0] ELSE -100.0 END END)) AS [Logistic_0], earth_model_cte.[Score_1] AS [Score_1], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -earth_model_cte.[Score_1]) THEN -earth_model_cte.[Score_1] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -earth_model_cte.[Score_1]) THEN -earth_model_cte.[Score_1] ELSE -100.0 END END)) AS [Logistic_1], earth_model_cte.[Score_2] AS [Score_2], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -earth_model_cte.[Score_2]) THEN -earth_model_cte.[Score_2] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -earth_model_cte.[Score_2]) THEN -earth_model_cte.[Score_2] ELSE -100.0 END END)) AS [Logistic_2], earth_model_cte.[Score_3] AS [Score_3], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -earth_model_cte.[Score_3]) THEN -earth_model_cte.[Score_3] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -earth_model_cte.[Score_3]) THEN -earth_model_cte.[Score_3] ELSE -100.0 END END)) AS [Logistic_3] 
FROM earth_model_cte), 
orig_cte AS 
(SELECT earth_model_cte_logistic.[KEY] AS [KEY], earth_model_cte_logistic.[Score_0] AS [Score_0], earth_model_cte_logistic.[Score_1] AS [Score_1], earth_model_cte_logistic.[Score_2] AS [Score_2], earth_model_cte_logistic.[Score_3] AS [Score_3], earth_model_cte_logistic.[Logistic_0] / (earth_model_cte_logistic.[Logistic_0] + earth_model_cte_logistic.[Logistic_1] + earth_model_cte_logistic.[Logistic_2] + earth_model_cte_logistic.[Logistic_3]) AS [Proba_0], earth_model_cte_logistic.[Logistic_1] / (earth_model_cte_logistic.[Logistic_0] + earth_model_cte_logistic.[Logistic_1] + earth_model_cte_logistic.[Logistic_2] + earth_model_cte_logistic.[Logistic_3]) AS [Proba_1], earth_model_cte_logistic.[Logistic_2] / (earth_model_cte_logistic.[Logistic_0] + earth_model_cte_logistic.[Logistic_1] + earth_model_cte_logistic.[Logistic_2] + earth_model_cte_logistic.[Logistic_3]) AS [Proba_2], earth_model_cte_logistic.[Logistic_3] / (earth_model_cte_logistic.[Logistic_0] + earth_model_cte_logistic.[Logistic_1] + earth_model_cte_logistic.[Logistic_2] + earth_model_cte_logistic.[Logistic_3]) AS [Proba_3], CAST(NULL AS FLOAT(53)) AS [LogProba_0], CAST(NULL AS FLOAT(53)) AS [LogProba_1], CAST(NULL AS FLOAT(53)) AS [LogProba_2], CAST(NULL AS FLOAT(53)) AS [LogProba_3], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM earth_model_cte_logistic), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 0 AS class, orig_cte.[LogProba_0] AS [LogProba], orig_cte.[Proba_0] AS [Proba], orig_cte.[Score_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 1 AS class, orig_cte.[LogProba_1] AS [LogProba], orig_cte.[Proba_1] AS [Proba], orig_cte.[Score_1] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 2 AS class, orig_cte.[LogProba_2] AS [LogProba], orig_cte.[Proba_2] AS [Proba], orig_cte.[Score_2] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 3 AS class, orig_cte.[LogProba_3] AS [LogProba], orig_cte.[Proba_3] AS [Proba], orig_cte.[Score_3] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_0] AS [Score_0], orig_cte.[Score_1] AS [Score_1], orig_cte.[Score_2] AS [Score_2], orig_cte.[Score_3] AS [Score_3], orig_cte.[Proba_0] AS [Proba_0], orig_cte.[Proba_1] AS [Proba_1], orig_cte.[Proba_2] AS [Proba_2], orig_cte.[Proba_3] AS [Proba_3], orig_cte.[LogProba_0] AS [LogProba_0], orig_cte.[LogProba_1] AS [LogProba_1], orig_cte.[LogProba_2] AS [LogProba_2], orig_cte.[LogProba_3] AS [LogProba_3], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Proba] AS [max_Proba] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Proba]) AS [max_Proba] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_max.[KEY] AS [KEY], score_max.[Score_0] AS [Score_0], score_max.[Score_1] AS [Score_1], score_max.[Score_2] AS [Score_2], score_max.[Score_3] AS [Score_3], score_max.[Proba_0] AS [Proba_0], score_max.[Proba_1] AS [Proba_1], score_max.[Proba_2] AS [Proba_2], score_max.[Proba_3] AS [Proba_3], score_max.[LogProba_0] AS [LogProba_0], score_max.[LogProba_1] AS [LogProba_1], score_max.[LogProba_2] AS [LogProba_2], score_max.[LogProba_3] AS [LogProba_3], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Proba] AS [max_Proba] 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union.[KEY_u] = score_max.[KEY]), 
arg_max_cte AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_0] AS [Score_0], score_max.[Score_1] AS [Score_1], score_max.[Score_2] AS [Score_2], score_max.[Score_3] AS [Score_3], score_max.[Proba_0] AS [Proba_0], score_max.[Proba_1] AS [Proba_1], score_max.[Proba_2] AS [Proba_2], score_max.[Proba_3] AS [Proba_3], score_max.[LogProba_0] AS [LogProba_0], score_max.[LogProba_1] AS [LogProba_1], score_max.[LogProba_2] AS [LogProba_2], score_max.[LogProba_3] AS [LogProba_3], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Proba] AS [max_Proba], [arg_max_t_Proba].[KEY_Proba] AS [KEY_Proba], [arg_max_t_Proba].[arg_max_Proba] AS [arg_max_Proba] 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Proba], max(union_with_max.class) AS [arg_max_Proba] 
FROM union_with_max 
WHERE union_with_max.[max_Proba] <= union_with_max.[Proba] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Proba] ON score_max.[KEY] = [arg_max_t_Proba].[KEY_Proba])
 SELECT arg_max_cte.[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_0], CAST(NULL AS FLOAT(53)) AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Score_2], CAST(NULL AS FLOAT(53)) AS [Score_3], arg_max_cte.[Proba_0] AS [Proba_0], arg_max_cte.[Proba_1] AS [Proba_1], arg_max_cte.[Proba_2] AS [Proba_2], arg_max_cte.[Proba_3] AS [Proba_3], CASE WHEN (arg_max_cte.[Proba_0] IS NULL OR arg_max_cte.[Proba_0] > 0.0) THEN log(arg_max_cte.[Proba_0]) ELSE -1.79769313486231e+308 END AS [LogProba_0], CASE WHEN (arg_max_cte.[Proba_1] IS NULL OR arg_max_cte.[Proba_1] > 0.0) THEN log(arg_max_cte.[Proba_1]) ELSE -1.79769313486231e+308 END AS [LogProba_1], CASE WHEN (arg_max_cte.[Proba_2] IS NULL OR arg_max_cte.[Proba_2] > 0.0) THEN log(arg_max_cte.[Proba_2]) ELSE -1.79769313486231e+308 END AS [LogProba_2], CASE WHEN (arg_max_cte.[Proba_3] IS NULL OR arg_max_cte.[Proba_3] > 0.0) THEN log(arg_max_cte.[Proba_3]) ELSE -1.79769313486231e+308 END AS [LogProba_3], arg_max_cte.[arg_max_Proba] AS [Decision], arg_max_cte.[max_Proba] AS [DecisionProba] 
FROM arg_max_cte