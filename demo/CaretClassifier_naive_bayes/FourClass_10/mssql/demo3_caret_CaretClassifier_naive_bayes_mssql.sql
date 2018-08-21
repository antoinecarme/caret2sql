-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_naive_bayes
-- Dataset : FourClass_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH centered_data AS 
(SELECT [ADS].[KEY] AS [KEY], CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.121972324020858 AS [Feature_0_0], CAST([ADS].[Feature_1] AS FLOAT(53)) - -0.20420906414335102 AS [Feature_1_0], CAST([ADS].[Feature_2] AS FLOAT(53)) - -0.17866802296600098 AS [Feature_2_0], CAST([ADS].[Feature_3] AS FLOAT(53)) - -0.338489162809258 AS [Feature_3_0], CAST([ADS].[Feature_4] AS FLOAT(53)) - 0.692046433348698 AS [Feature_4_0], CAST([ADS].[Feature_5] AS FLOAT(53)) - -0.232889543871415 AS [Feature_5_0], CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.148905014543641 AS [Feature_6_0], CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.34426146569985705 AS [Feature_7_0], CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.48106253993680603 AS [Feature_8_0], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.210725722984837 AS [Feature_9_0], CAST([ADS].[Feature_0] AS FLOAT(53)) - -0.0558044571136593 AS [Feature_0_1], CAST([ADS].[Feature_1] AS FLOAT(53)) - 1.1164241563456598 AS [Feature_1_1], CAST([ADS].[Feature_2] AS FLOAT(53)) - 1.2320912666948798 AS [Feature_2_1], CAST([ADS].[Feature_3] AS FLOAT(53)) - 2.85620117640919 AS [Feature_3_1], CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.19467773540770397 AS [Feature_4_1], CAST([ADS].[Feature_5] AS FLOAT(53)) - -0.308859790178418 AS [Feature_5_1], CAST([ADS].[Feature_6] AS FLOAT(53)) - -1.20900090932447 AS [Feature_6_1], CAST([ADS].[Feature_7] AS FLOAT(53)) - 1.22543376941976 AS [Feature_7_1], CAST([ADS].[Feature_8] AS FLOAT(53)) - -0.216885934061671 AS [Feature_8_1], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.0464300051462853 AS [Feature_9_1], CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.0405274143016847 AS [Feature_0_2], CAST([ADS].[Feature_1] AS FLOAT(53)) - -0.20169636688948103 AS [Feature_1_2], CAST([ADS].[Feature_2] AS FLOAT(53)) - -1.0656602223531801 AS [Feature_2_2], CAST([ADS].[Feature_3] AS FLOAT(53)) - -0.933951975193257 AS [Feature_3_2], CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.927385394883359 AS [Feature_4_2], CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.180750853837477 AS [Feature_5_2], CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.336730803418236 AS [Feature_6_2], CAST([ADS].[Feature_7] AS FLOAT(53)) - -0.0409790815588465 AS [Feature_7_2], CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.269658006083996 AS [Feature_8_2], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.14187498063568302 AS [Feature_9_2], CAST([ADS].[Feature_0] AS FLOAT(53)) - -0.100101406053577 AS [Feature_0_3], CAST([ADS].[Feature_1] AS FLOAT(53)) - 1.57268477686706 AS [Feature_1_3], CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.150504658168055 AS [Feature_2_3], CAST([ADS].[Feature_3] AS FLOAT(53)) - 1.33301715352184 AS [Feature_3_3], CAST([ADS].[Feature_4] AS FLOAT(53)) - -1.1207345497440901 AS [Feature_4_3], CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.152478854097818 AS [Feature_5_3], CAST([ADS].[Feature_6] AS FLOAT(53)) - -0.41282510179714293 AS [Feature_6_3], CAST([ADS].[Feature_7] AS FLOAT(53)) - -0.824909406091562 AS [Feature_7_3], CAST([ADS].[Feature_8] AS FLOAT(53)) - -0.37804605688997095 AS [Feature_8_3], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.0748501092325389 AS [Feature_9_3] 
FROM [FourClass_10] AS [ADS]), 
[NaiveBayes_data] AS 
(SELECT [Values].[KEY] AS [KEY], [Values].[Feature] AS [Feature], [Values].log_proba_0 AS log_proba_0, [Values].log_proba_1 AS log_proba_1, [Values].log_proba_2 AS log_proba_2, [Values].log_proba_3 AS log_proba_3 
FROM (SELECT centered_data.[KEY] AS [KEY], 0 AS [Feature], -0.5 * 2.3367266448967743 - (0.5 * centered_data.[Feature_0_0] * centered_data.[Feature_0_0]) / 1.6468256368801124 AS log_proba_0, -0.5 * 1.5936550370791305 - (0.5 * centered_data.[Feature_0_1] * centered_data.[Feature_0_1]) / 0.7833136963385703 AS log_proba_1, -0.5 * 1.7827605907593003 - (0.5 * centered_data.[Feature_0_2] * centered_data.[Feature_0_2]) / 0.9463749119006505 AS log_proba_2, -0.5 * 1.522011109908515 - (0.5 * centered_data.[Feature_0_3] * centered_data.[Feature_0_3]) / 0.7291571823974655 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 1 AS [Feature], -0.5 * 2.1558852246869686 - (0.5 * centered_data.[Feature_1_0] * centered_data.[Feature_1_0]) / 1.374387473816397 AS log_proba_0, -0.5 * 1.9560783028972477 - (0.5 * centered_data.[Feature_1_1] * centered_data.[Feature_1_1]) / 1.1254705743258875 AS log_proba_1, -0.5 * 2.66869282040259 - (0.5 * centered_data.[Feature_1_2] * centered_data.[Feature_1_2]) / 2.2951902874415913 AS log_proba_2, -0.5 * 1.540820746493154 - (0.5 * centered_data.[Feature_1_3] * centered_data.[Feature_1_3]) / 0.7430021653638579 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 2 AS [Feature], -0.5 * 2.007948613285439 - (0.5 * centered_data.[Feature_2_0] * centered_data.[Feature_2_0]) / 1.18538965921353 AS log_proba_0, -0.5 * 2.6498808202921356 - (0.5 * centered_data.[Feature_2_1] * centered_data.[Feature_2_1]) / 2.252416756757137 AS log_proba_1, -0.5 * 2.1520353637841767 - (0.5 * centered_data.[Feature_2_2] * centered_data.[Feature_2_2]) / 1.3691064453508697 AS log_proba_2, -0.5 * 2.380892273396306 - (0.5 * centered_data.[Feature_2_3] * centered_data.[Feature_2_3]) / 1.7211887864265372 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 3 AS [Feature], -0.5 * 1.6811163801513278 - (0.5 * centered_data.[Feature_3_0] * centered_data.[Feature_3_0]) / 0.8549086257211475 AS log_proba_0, -0.5 * 2.930357019144103 - (0.5 * centered_data.[Feature_3_1] * centered_data.[Feature_3_1]) / 2.9816592853875834 AS log_proba_1, -0.5 * 3.725546951999224 - (0.5 * centered_data.[Feature_3_2] * centered_data.[Feature_3_2]) / 6.603962750454359 AS log_proba_2, -0.5 * 2.9630988997014636 - (0.5 * centered_data.[Feature_3_3] * centered_data.[Feature_3_3]) / 3.080900219356419 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 4 AS [Feature], -0.5 * 1.700375979279688 - (0.5 * centered_data.[Feature_4_0] * centered_data.[Feature_4_0]) / 0.8715334025268334 AS log_proba_0, -0.5 * 2.9516714730546014 - (0.5 * centered_data.[Feature_4_1] * centered_data.[Feature_4_1]) / 3.045893855366248 AS log_proba_1, -0.5 * 2.3224255880621403 - (0.5 * centered_data.[Feature_4_2] * centered_data.[Feature_4_2]) / 1.623441894500743 AS log_proba_2, -0.5 * 1.4826216995817454 - (0.5 * centered_data.[Feature_4_3] * centered_data.[Feature_4_3]) / 0.700994409631374 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 5 AS [Feature], -0.5 * 0.6478387234160543 - (0.5 * centered_data.[Feature_5_0] * centered_data.[Feature_5_0]) / 0.30420959953644483 AS log_proba_0, -0.5 * 1.7748482279420352 - (0.5 * centered_data.[Feature_5_1] * centered_data.[Feature_5_1]) / 0.9389163963888969 AS log_proba_1, -0.5 * 2.186530704693101 - (0.5 * centered_data.[Feature_5_2] * centered_data.[Feature_5_2]) / 1.4171582559607323 AS log_proba_2, -0.5 * 1.7505589941350332 - (0.5 * centered_data.[Feature_5_3] * centered_data.[Feature_5_3]) / 0.9163855724297163 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 6 AS [Feature], -0.5 * 0.6564159745016753 - (0.5 * centered_data.[Feature_6_0] * centered_data.[Feature_6_0]) / 0.3068301039508023 AS log_proba_0, -0.5 * 1.5123319868587988 - (0.5 * centered_data.[Feature_6_1] * centered_data.[Feature_6_1]) / 0.7221336260730629 AS log_proba_1, -0.5 * 2.0441250286682444 - (0.5 * centered_data.[Feature_6_2] * centered_data.[Feature_6_2]) / 1.229057926193645 AS log_proba_2, -0.5 * 1.2711777363049515 - (0.5 * centered_data.[Feature_6_3] * centered_data.[Feature_6_3]) / 0.5673951354186509 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 7 AS [Feature], -0.5 * 2.5693942673392525 - (0.5 * centered_data.[Feature_7_0] * centered_data.[Feature_7_0]) / 2.078231311422663 AS log_proba_0, -0.5 * 2.0141113491232794 - (0.5 * centered_data.[Feature_7_1] * centered_data.[Feature_7_1]) / 1.1927174590033067 AS log_proba_1, -0.5 * 3.251531726731955 - (0.5 * centered_data.[Feature_7_2] * centered_data.[Feature_7_2]) / 4.110952117023496 AS log_proba_2, -0.5 * 1.9484778572110926 - (0.5 * centered_data.[Feature_7_3] * centered_data.[Feature_7_3]) / 1.1169489215562007 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 8 AS [Feature], -0.5 * 2.0355629928883685 - (0.5 * centered_data.[Feature_8_0] * centered_data.[Feature_8_0]) / 1.218579610124935 AS log_proba_0, -0.5 * 2.003516864867477 - (0.5 * centered_data.[Feature_8_1] * centered_data.[Feature_8_1]) / 1.18014793404937 AS log_proba_1, -0.5 * 1.1669815121491176 - (0.5 * centered_data.[Feature_8_2] * centered_data.[Feature_8_2]) / 0.5112505201280685 AS log_proba_2, -0.5 * 2.555333012872624 - (0.5 * centered_data.[Feature_8_3] * centered_data.[Feature_8_3]) / 2.0492132652939863 AS log_proba_3 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 9 AS [Feature], -0.5 * 2.067827849858662 - (0.5 * centered_data.[Feature_9_0] * centered_data.[Feature_9_0]) / 1.2585380675026077 AS log_proba_0, -0.5 * 1.6831739943486388 - (0.5 * centered_data.[Feature_9_1] * centered_data.[Feature_9_1]) / 0.8566695088346166 AS log_proba_1, -0.5 * 1.8287836460762252 - (0.5 * centered_data.[Feature_9_2] * centered_data.[Feature_9_2]) / 0.9909477997750108 AS log_proba_2, -0.5 * 1.7014710474919859 - (0.5 * centered_data.[Feature_9_3] * centered_data.[Feature_9_3]) / 0.8724883138029631 AS log_proba_3 
FROM centered_data) AS [Values]), 
[NaiveBayes_Scores] AS 
(SELECT nb_sums.[KEY] AS [KEY], nb_sums.[Score_0] AS [Score_0], nb_sums.[Score_1] AS [Score_1], nb_sums.[Score_2] AS [Score_2], nb_sums.[Score_3] AS [Score_3] 
FROM (SELECT [NaiveBayes_data].[KEY] AS [KEY], -1.491654876777717 + sum([NaiveBayes_data].log_proba_0) AS [Score_0], -1.3862943611198906 + sum([NaiveBayes_data].log_proba_1) AS [Score_1], -1.3862943611198906 + sum([NaiveBayes_data].log_proba_2) AS [Score_2], -1.2909841813155656 + sum([NaiveBayes_data].log_proba_3) AS [Score_3] 
FROM [NaiveBayes_data] GROUP BY [NaiveBayes_data].[KEY]) AS nb_sums), 
orig_cte AS 
(SELECT [NaiveBayes_Scores].[KEY] AS [KEY], [NaiveBayes_Scores].[Score_0] AS [Score_0], [NaiveBayes_Scores].[Score_1] AS [Score_1], [NaiveBayes_Scores].[Score_2] AS [Score_2], [NaiveBayes_Scores].[Score_3] AS [Score_3], CAST(NULL AS FLOAT(53)) AS [Proba_0], CAST(NULL AS FLOAT(53)) AS [Proba_1], CAST(NULL AS FLOAT(53)) AS [Proba_2], CAST(NULL AS FLOAT(53)) AS [Proba_3], CAST(NULL AS FLOAT(53)) AS [LogProba_0], CAST(NULL AS FLOAT(53)) AS [LogProba_1], CAST(NULL AS FLOAT(53)) AS [LogProba_2], CAST(NULL AS FLOAT(53)) AS [LogProba_3], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM [NaiveBayes_Scores]), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 0 AS class, orig_cte.[LogProba_0] AS [LogProba], orig_cte.[Proba_0] AS [Proba], orig_cte.[Score_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 1 AS class, orig_cte.[LogProba_1] AS [LogProba], orig_cte.[Proba_1] AS [Proba], orig_cte.[Score_1] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 2 AS class, orig_cte.[LogProba_2] AS [LogProba], orig_cte.[Proba_2] AS [Proba], orig_cte.[Score_2] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 3 AS class, orig_cte.[LogProba_3] AS [LogProba], orig_cte.[Proba_3] AS [Proba], orig_cte.[Score_3] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_0] AS [Score_0], orig_cte.[Score_1] AS [Score_1], orig_cte.[Score_2] AS [Score_2], orig_cte.[Score_3] AS [Score_3], orig_cte.[Proba_0] AS [Proba_0], orig_cte.[Proba_1] AS [Proba_1], orig_cte.[Proba_2] AS [Proba_2], orig_cte.[Proba_3] AS [Proba_3], orig_cte.[LogProba_0] AS [LogProba_0], orig_cte.[LogProba_1] AS [LogProba_1], orig_cte.[LogProba_2] AS [LogProba_2], orig_cte.[LogProba_3] AS [LogProba_3], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Score] AS [max_Score] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Score]) AS [max_Score] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
score_soft_max_deltas AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_0] AS [Score_0], score_max.[Score_1] AS [Score_1], score_max.[Score_2] AS [Score_2], score_max.[Score_3] AS [Score_3], score_max.[Proba_0] AS [Proba_0], score_max.[Proba_1] AS [Proba_1], score_max.[Proba_2] AS [Proba_2], score_max.[Proba_3] AS [Proba_3], score_max.[LogProba_0] AS [LogProba_0], score_max.[LogProba_1] AS [LogProba_1], score_max.[LogProba_2] AS [LogProba_2], score_max.[LogProba_3] AS [LogProba_3], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score], exp(CASE WHEN (-100.0 <= score_max.[Score_0] - score_max.[max_Score]) THEN score_max.[Score_0] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_0], exp(CASE WHEN (-100.0 <= score_max.[Score_1] - score_max.[max_Score]) THEN score_max.[Score_1] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_1], exp(CASE WHEN (-100.0 <= score_max.[Score_2] - score_max.[max_Score]) THEN score_max.[Score_2] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_2], exp(CASE WHEN (-100.0 <= score_max.[Score_3] - score_max.[max_Score]) THEN score_max.[Score_3] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_3] 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.[KEY] AS [KEY], soft_scu.class AS class, soft_scu.[exp_delta_Score] AS [exp_delta_Score] 
FROM (SELECT score_soft_max_deltas.[KEY] AS [KEY], 0 AS class, score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 1 AS class, score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 2 AS class, score_soft_max_deltas.[exp_delta_Score_2] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 3 AS class, score_soft_max_deltas.[exp_delta_Score_3] AS [exp_delta_Score] 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.[KEY] AS [KEY], score_soft_max_deltas.[Score_0] AS [Score_0], score_soft_max_deltas.[Score_1] AS [Score_1], score_soft_max_deltas.[Score_2] AS [Score_2], score_soft_max_deltas.[Score_3] AS [Score_3], score_soft_max_deltas.[Proba_0] AS [Proba_0], score_soft_max_deltas.[Proba_1] AS [Proba_1], score_soft_max_deltas.[Proba_2] AS [Proba_2], score_soft_max_deltas.[Proba_3] AS [Proba_3], score_soft_max_deltas.[LogProba_0] AS [LogProba_0], score_soft_max_deltas.[LogProba_1] AS [LogProba_1], score_soft_max_deltas.[LogProba_2] AS [LogProba_2], score_soft_max_deltas.[LogProba_3] AS [LogProba_3], score_soft_max_deltas.[Decision] AS [Decision], score_soft_max_deltas.[DecisionProba] AS [DecisionProba], score_soft_max_deltas.[KEY_m] AS [KEY_m], score_soft_max_deltas.[max_Score] AS [max_Score], score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max_deltas.[exp_delta_Score_2] AS [exp_delta_Score_2], score_soft_max_deltas.[exp_delta_Score_3] AS [exp_delta_Score_3], sum_exp_t.[KEY_sum] AS [KEY_sum], sum_exp_t.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.[KEY] AS [KEY_sum], sum(score_class_union_soft.[exp_delta_Score]) AS [sum_ExpDeltaScore] 
FROM score_class_union_soft GROUP BY score_class_union_soft.[KEY]) AS sum_exp_t ON score_soft_max_deltas.[KEY] = sum_exp_t.[KEY_sum]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Score_2] AS [Score_2], score_soft_max.[Score_3] AS [Score_3], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[Proba_2] AS [Proba_2], score_soft_max.[Proba_3] AS [Proba_3], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[LogProba_2] AS [LogProba_2], score_soft_max.[LogProba_3] AS [LogProba_3], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[exp_delta_Score_2] AS [exp_delta_Score_2], score_soft_max.[exp_delta_Score_3] AS [exp_delta_Score_3], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.[KEY_u] = score_soft_max.[KEY]), 
arg_max_cte AS 
(SELECT score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Score_2] AS [Score_2], score_soft_max.[Score_3] AS [Score_3], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[Proba_2] AS [Proba_2], score_soft_max.[Proba_3] AS [Proba_3], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[LogProba_2] AS [LogProba_2], score_soft_max.[LogProba_3] AS [LogProba_3], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[exp_delta_Score_2] AS [exp_delta_Score_2], score_soft_max.[exp_delta_Score_3] AS [exp_delta_Score_3], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore], [arg_max_t_Score].[KEY_Score] AS [KEY_Score], [arg_max_t_Score].[arg_max_Score] AS [arg_max_Score], soft_max_comp.[KEY_softmax] AS [KEY_softmax], soft_max_comp.[SoftProba_0] AS [SoftProba_0], soft_max_comp.[SoftProba_1] AS [SoftProba_1], soft_max_comp.[SoftProba_2] AS [SoftProba_2], soft_max_comp.[SoftProba_3] AS [SoftProba_3] 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Score], max(union_with_max.class) AS [arg_max_Score] 
FROM union_with_max 
WHERE union_with_max.[max_Score] <= union_with_max.[Score] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Score] ON score_soft_max.[KEY] = [arg_max_t_Score].[KEY_Score] LEFT OUTER JOIN (SELECT score_soft_max.[KEY] AS [KEY_softmax], score_soft_max.[exp_delta_Score_0] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_0], score_soft_max.[exp_delta_Score_1] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_1], score_soft_max.[exp_delta_Score_2] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_2], score_soft_max.[exp_delta_Score_3] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_3] 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.[KEY_softmax] = [arg_max_t_Score].[KEY_Score])
 SELECT arg_max_cte.[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_0], CAST(NULL AS FLOAT(53)) AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Score_2], CAST(NULL AS FLOAT(53)) AS [Score_3], arg_max_cte.[SoftProba_0] AS [Proba_0], arg_max_cte.[SoftProba_1] AS [Proba_1], arg_max_cte.[SoftProba_2] AS [Proba_2], arg_max_cte.[SoftProba_3] AS [Proba_3], CASE WHEN (arg_max_cte.[SoftProba_0] IS NULL OR arg_max_cte.[SoftProba_0] > 0.0) THEN log(arg_max_cte.[SoftProba_0]) ELSE -1.79769313486231e+308 END AS [LogProba_0], CASE WHEN (arg_max_cte.[SoftProba_1] IS NULL OR arg_max_cte.[SoftProba_1] > 0.0) THEN log(arg_max_cte.[SoftProba_1]) ELSE -1.79769313486231e+308 END AS [LogProba_1], CASE WHEN (arg_max_cte.[SoftProba_2] IS NULL OR arg_max_cte.[SoftProba_2] > 0.0) THEN log(arg_max_cte.[SoftProba_2]) ELSE -1.79769313486231e+308 END AS [LogProba_2], CASE WHEN (arg_max_cte.[SoftProba_3] IS NULL OR arg_max_cte.[SoftProba_3] > 0.0) THEN log(arg_max_cte.[SoftProba_3]) ELSE -1.79769313486231e+308 END AS [LogProba_3], arg_max_cte.[arg_max_Score] AS [Decision], CASE WHEN (arg_max_cte.[SoftProba_0] <= CASE WHEN (arg_max_cte.[SoftProba_1] <= CASE WHEN (arg_max_cte.[SoftProba_2] <= arg_max_cte.[SoftProba_3]) THEN arg_max_cte.[SoftProba_3] ELSE arg_max_cte.[SoftProba_2] END) THEN CASE WHEN (arg_max_cte.[SoftProba_2] <= arg_max_cte.[SoftProba_3]) THEN arg_max_cte.[SoftProba_3] ELSE arg_max_cte.[SoftProba_2] END ELSE arg_max_cte.[SoftProba_1] END) THEN CASE WHEN (arg_max_cte.[SoftProba_1] <= CASE WHEN (arg_max_cte.[SoftProba_2] <= arg_max_cte.[SoftProba_3]) THEN arg_max_cte.[SoftProba_3] ELSE arg_max_cte.[SoftProba_2] END) THEN CASE WHEN (arg_max_cte.[SoftProba_2] <= arg_max_cte.[SoftProba_3]) THEN arg_max_cte.[SoftProba_3] ELSE arg_max_cte.[SoftProba_2] END ELSE arg_max_cte.[SoftProba_1] END ELSE arg_max_cte.[SoftProba_0] END AS [DecisionProba] 
FROM arg_max_cte