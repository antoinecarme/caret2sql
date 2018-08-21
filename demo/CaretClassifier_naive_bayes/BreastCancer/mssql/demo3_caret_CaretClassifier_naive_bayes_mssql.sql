-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_naive_bayes
-- Dataset : BreastCancer
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH centered_data AS 
(SELECT [ADS].[KEY] AS [KEY], CAST([ADS].[Feature_0] AS FLOAT(53)) - 17.6404375 AS [Feature_0_0], CAST([ADS].[Feature_1] AS FLOAT(53)) - 21.2335625 AS [Feature_1_0], CAST([ADS].[Feature_2] AS FLOAT(53)) - 116.71625 AS [Feature_2_0], CAST([ADS].[Feature_3] AS FLOAT(53)) - 997.973125 AS [Feature_3_0], CAST([ADS].[Feature_4] AS FLOAT(53)) - 0.103676625 AS [Feature_4_0], CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.1495689375 AS [Feature_5_0], CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.1660915625 AS [Feature_6_0], CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.0910146875 AS [Feature_7_0], CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.19494125 AS [Feature_8_0], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.06299825 AS [Feature_9_0], CAST([ADS].[Feature_10] AS FLOAT(53)) - 0.641806875 AS [Feature_10_0], CAST([ADS].[Feature_11] AS FLOAT(53)) - 1.23094 AS [Feature_11_0], CAST([ADS].[Feature_12] AS FLOAT(53)) - 4.58268125 AS [Feature_12_0], CAST([ADS].[Feature_13] AS FLOAT(53)) - 77.180875 AS [Feature_13_0], CAST([ADS].[Feature_14] AS FLOAT(53)) - 0.00683034375 AS [Feature_14_0], CAST([ADS].[Feature_15] AS FLOAT(53)) - 0.03308685625 AS [Feature_15_0], CAST([ADS].[Feature_16] AS FLOAT(53)) - 0.0422500625 AS [Feature_16_0], CAST([ADS].[Feature_17] AS FLOAT(53)) - 0.01566620625 AS [Feature_17_0], CAST([ADS].[Feature_18] AS FLOAT(53)) - 0.0213653875 AS [Feature_18_0], CAST([ADS].[Feature_19] AS FLOAT(53)) - 0.00413925625 AS [Feature_19_0], CAST([ADS].[Feature_20] AS FLOAT(53)) - 21.339375 AS [Feature_20_0], CAST([ADS].[Feature_21] AS FLOAT(53)) - 28.7075625 AS [Feature_21_0], CAST([ADS].[Feature_22] AS FLOAT(53)) - 143.081875 AS [Feature_22_0], CAST([ADS].[Feature_23] AS FLOAT(53)) - 1445.17375 AS [Feature_23_0], CAST([ADS].[Feature_24] AS FLOAT(53)) - 0.1450574375 AS [Feature_24_0], CAST([ADS].[Feature_25] AS FLOAT(53)) - 0.3767940625 AS [Feature_25_0], CAST([ADS].[Feature_26] AS FLOAT(53)) - 0.44977675 AS [Feature_26_0], CAST([ADS].[Feature_27] AS FLOAT(53)) - 0.1863309375 AS [Feature_27_0], CAST([ADS].[Feature_28] AS FLOAT(53)) - 0.32580749999999997 AS [Feature_28_0], CAST([ADS].[Feature_29] AS FLOAT(53)) - 0.09126925 AS [Feature_29_0], CAST([ADS].[Feature_0] AS FLOAT(53)) - 12.145386440678001 AS [Feature_0_1], CAST([ADS].[Feature_1] AS FLOAT(53)) - 17.848813559322 AS [Feature_1_1], CAST([ADS].[Feature_2] AS FLOAT(53)) - 78.0729152542373 AS [Feature_2_1], CAST([ADS].[Feature_3] AS FLOAT(53)) - 462.761355932203 AS [Feature_3_1], CAST([ADS].[Feature_4] AS FLOAT(53)) - 0.0924870508474576 AS [Feature_4_1], CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.0799264745762712 AS [Feature_5_1], CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.04604986 AS [Feature_6_1], CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.0254664813559322 AS [Feature_7_1], CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.17434644067796598 AS [Feature_8_1], CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.0629088813559322 AS [Feature_9_1], CAST([ADS].[Feature_10] AS FLOAT(53)) - 0.284146779661017 AS [Feature_10_1], CAST([ADS].[Feature_11] AS FLOAT(53)) - 1.20954644067797 AS [Feature_11_1], CAST([ADS].[Feature_12] AS FLOAT(53)) - 1.99545525423729 AS [Feature_12_1], CAST([ADS].[Feature_13] AS FLOAT(53)) - 21.191213559321998 AS [Feature_13_1], CAST([ADS].[Feature_14] AS FLOAT(53)) - 0.007178345762711859 AS [Feature_14_1], CAST([ADS].[Feature_15] AS FLOAT(53)) - 0.0214897152542373 AS [Feature_15_1], CAST([ADS].[Feature_16] AS FLOAT(53)) - 0.0264394969491525 AS [Feature_16_1], CAST([ADS].[Feature_17] AS FLOAT(53)) - 0.009968932203389829 AS [Feature_17_1], CAST([ADS].[Feature_18] AS FLOAT(53)) - 0.0206417254237288 AS [Feature_18_1], CAST([ADS].[Feature_19] AS FLOAT(53)) - 0.0036877969491525397 AS [Feature_19_1], CAST([ADS].[Feature_20] AS FLOAT(53)) - 13.378247457627099 AS [Feature_20_1], CAST([ADS].[Feature_21] AS FLOAT(53)) - 23.397932203389804 AS [Feature_21_1], CAST([ADS].[Feature_22] AS FLOAT(53)) - 86.9390169491525 AS [Feature_22_1], CAST([ADS].[Feature_23] AS FLOAT(53)) - 559.3738983050849 AS [Feature_23_1], CAST([ADS].[Feature_24] AS FLOAT(53)) - 0.124652033898305 AS [Feature_24_1], CAST([ADS].[Feature_25] AS FLOAT(53)) - 0.181103966101695 AS [Feature_25_1], CAST([ADS].[Feature_26] AS FLOAT(53)) - 0.165494050847458 AS [Feature_26_1], CAST([ADS].[Feature_27] AS FLOAT(53)) - 0.0739799355932203 AS [Feature_27_1], CAST([ADS].[Feature_28] AS FLOAT(53)) - 0.270252203389831 AS [Feature_28_1], CAST([ADS].[Feature_29] AS FLOAT(53)) - 0.0795043389830508 AS [Feature_29_1] 
FROM [BreastCancer] AS [ADS]), 
[NaiveBayes_data] AS 
(SELECT [Values].[KEY] AS [KEY], [Values].[Feature] AS [Feature], [Values].log_proba_0 AS log_proba_0, [Values].log_proba_1 AS log_proba_1 
FROM (SELECT centered_data.[KEY] AS [KEY], 0 AS [Feature], -0.5 * 4.178808681525158 - (0.5 * centered_data.[Feature_0_0] * centered_data.[Feature_0_0]) / 10.390912386006313 AS log_proba_0, -0.5 * 2.9937155535359454 - (0.5 * centered_data.[Feature_0_1] * centered_data.[Feature_0_1]) / 3.176685911380143 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 1 AS [Feature], -0.5 * 4.458669442488868 - (0.5 * centered_data.[Feature_1_0] * centered_data.[Feature_1_0]) / 13.746611757075506 AS log_proba_0, -0.5 * 4.568034401311851 - (0.5 * centered_data.[Feature_1_1] * centered_data.[Feature_1_1]) / 15.335299607978778 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 2 AS [Feature], -0.5 * 8.021642803488525 - (0.5 * centered_data.[Feature_2_0] * centered_data.[Feature_2_0]) / 484.8142059748445 AS log_proba_0, -0.5 * 6.780654192251104 - (0.5 * centered_data.[Feature_2_1] * centered_data.[Feature_2_1]) / 140.15894861524276 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 3 AS [Feature], -0.5 * 13.701640831942209 - (0.5 * centered_data.[Feature_3_0] * centered_data.[Feature_3_0]) / 142025.76524803444 AS log_proba_0, -0.5 * 11.632052135882509 - (0.5 * centered_data.[Feature_3_1] * centered_data.[Feature_3_1]) / 17929.00496414163 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 4 AS [Feature], -0.5 * -6.839467361091579 - (0.5 * centered_data.[Feature_4_0] * centered_data.[Feature_4_0]) / 0.00017040298476415073 AS log_proba_0, -0.5 * -6.809248723433065 - (0.5 * centered_data.[Feature_4_1] * centered_data.[Feature_4_1]) / 0.0001756309235858404 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 5 AS [Feature], -0.5 * -3.9688947869180895 - (0.5 * centered_data.[Feature_5_0] * centered_data.[Feature_5_0]) / 0.0030071218510652553 AS log_proba_0, -0.5 * -4.9965185214932015 - (0.5 * centered_data.[Feature_5_1] * centered_data.[Feature_5_1]) / 0.0010761175371889755 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 6 AS [Feature], -0.5 * -3.262757931308303 - (0.5 * centered_data.[Feature_6_0] * centered_data.[Feature_6_0]) / 0.006092876374272802 AS log_proba_0, -0.5 * -4.374608951449099 - (0.5 * centered_data.[Feature_6_1] * centered_data.[Feature_6_1]) / 0.0020042486675405065 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 7 AS [Feature], -0.5 * -4.902795602419951 - (0.5 * centered_data.[Feature_7_0] * centered_data.[Feature_7_0]) / 0.0011818518942413546 AS log_proba_0, -0.5 * -6.480465444642922 - (0.5 * centered_data.[Feature_7_1] * centered_data.[Feature_7_1]) / 0.00024399995647499226 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 8 AS [Feature], -0.5 * -5.305222878783681 - (0.5 * centered_data.[Feature_8_0] * centered_data.[Feature_8_0]) / 0.0007902984135220118 AS log_proba_0, -0.5 * -5.5509141548082725 - (0.5 * centered_data.[Feature_8_1] * centered_data.[Feature_8_1]) / 0.0006181426998731692 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 9 AS [Feature], -0.5 * -7.86701185941627 - (0.5 * centered_data.[Feature_9_0] * centered_data.[Feature_9_0]) / 6.0984615786163526e-05 AS log_proba_0, -0.5 * -8.210197776930462 - (0.5 * centered_data.[Feature_9_1] * centered_data.[Feature_9_1]) / 4.3268968472270255e-05 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 10 AS [Feature], -0.5 * -0.1710832881964361 - (0.5 * centered_data.[Feature_10_0] * centered_data.[Feature_10_0]) / 0.1341280478140725 AS log_proba_0, -0.5 * -2.4625337752883287 - (0.5 * centered_data.[Feature_10_1] * centered_data.[Feature_10_1]) / 0.013562985627349207 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 11 AS [Feature], -0.5 * 0.5267170784774323 - (0.5 * centered_data.[Feature_11_0] * centered_data.[Feature_11_0]) / 0.2695072498364783 AS log_proba_0, -0.5 * 0.6317553393116706 - (0.5 * centered_data.[Feature_11_1] * centered_data.[Feature_11_1]) / 0.29935601535293443 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 12 AS [Feature], -0.5 * 3.8663919485217204 - (0.5 * centered_data.[Feature_12_0] * centered_data.[Feature_12_0]) / 7.60278693549526 AS log_proba_0, -0.5 * 1.3765537714192537 - (0.5 * centered_data.[Feature_12_1] * centered_data.[Feature_12_1]) / 0.6304488235012108 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 13 AS [Feature], -0.5 * 10.240331116061924 - (0.5 * centered_data.[Feature_13_0] * centered_data.[Feature_13_0]) / 4457.993472185532 AS log_proba_0, -0.5 * 6.246025593390306 - (0.5 * centered_data.[Feature_13_1] * centered_data.[Feature_13_1]) / 82.11728473314896 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 14 AS [Feature], -0.5 * -10.118474967789021 - (0.5 * centered_data.[Feature_14_0] * centered_data.[Feature_14_0]) / 6.418333623231131e-06 AS log_proba_0, -0.5 * -9.760891700786518 - (0.5 * centered_data.[Feature_14_1] * centered_data.[Feature_14_1]) / 9.17738027459934e-06 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 15 AS [Feature], -0.5 * -6.235749806350209 - (0.5 * centered_data.[Feature_15_0] * centered_data.[Feature_15_0]) / 0.0003116509106270042 AS log_proba_0, -0.5 * -6.334027255423631 - (0.5 * centered_data.[Feature_15_1] * centered_data.[Feature_15_1]) / 0.0002824795719050386 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 16 AS [Feature], -0.5 * -5.894262445116711 - (0.5 * centered_data.[Feature_16_0] * centered_data.[Feature_16_0]) / 0.0004385049264111652 AS log_proba_0, -0.5 * -4.86579852358855 - (0.5 * centered_data.[Feature_16_1] * centered_data.[Feature_16_1]) / 0.001226395879804242 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 17 AS [Feature], -0.5 * -8.536420960292533 - (0.5 * centered_data.[Feature_17_0] * centered_data.[Feature_17_0]) / 3.122479626536947e-05 AS log_proba_0, -0.5 * -8.425365119763727 - (0.5 * centered_data.[Feature_17_1] * centered_data.[Feature_17_1]) / 3.4892376668857384e-05 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 18 AS [Feature], -0.5 * -7.219475617656891 - (0.5 * centered_data.[Feature_18_0] * centered_data.[Feature_18_0]) / 0.00011653106314449793 AS log_proba_0, -0.5 * -8.04972221777978 - (0.5 * centered_data.[Feature_18_1] * centered_data.[Feature_18_1]) / 5.080075790054189e-05 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 19 AS [Feature], -0.5 * -10.614873259207352 - (0.5 * centered_data.[Feature_19_0] * centered_data.[Feature_19_0]) / 3.9069625565644544e-06 AS log_proba_0, -0.5 * -9.730069012748974 - (0.5 * centered_data.[Feature_19_1] * centered_data.[Feature_19_1]) / 9.464656371317202e-06 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 20 AS [Feature], -0.5 * 4.712415164263762 - (0.5 * centered_data.[Feature_20_0] * centered_data.[Feature_20_0]) / 17.717238600628907 AS log_proba_0, -0.5 * 3.2171741848940596 - (0.5 * centered_data.[Feature_20_1] * centered_data.[Feature_20_1]) / 3.972108724270712 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 21 AS [Feature], -0.5 * 5.165080581506342 - (0.5 * centered_data.[Feature_21_0] * centered_data.[Feature_21_0]) / 27.86032169418234 AS log_proba_0, -0.5 * 5.214940059419545 - (0.5 * centered_data.[Feature_21_1] * centered_data.[Feature_21_1]) / 29.284635505592018 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 22 AS [Feature], -0.5 * 8.583419091978003 - (0.5 * centered_data.[Feature_22_0] * centered_data.[Feature_22_0]) / 850.2598643867917 AS log_proba_0, -0.5 * 7.063681016935048 - (0.5 * centered_data.[Feature_22_1] * centered_data.[Feature_22_1]) / 186.01065379222987 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 23 AS [Feature], -0.5 * 14.626872296789958 - (0.5 * centered_data.[Feature_23_0] * centered_data.[Feature_23_0]) / 358253.18295440223 AS log_proba_0, -0.5 * 12.03881049104078 - (0.5 * centered_data.[Feature_23_1] * centered_data.[Feature_23_1]) / 26928.30989461558 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 24 AS [Feature], -0.5 * -5.753969572086932 - (0.5 * centered_data.[Feature_24_0] * centered_data.[Feature_24_0]) / 0.000504548474524372 AS log_proba_0, -0.5 * -6.03463000403026 - (0.5 * centered_data.[Feature_24_1] * centered_data.[Feature_24_1]) / 0.0003810777747607524 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 25 AS [Feature], -0.5 * -1.7672376683089852 - (0.5 * centered_data.[Feature_25_0] * centered_data.[Feature_25_0]) / 0.027184325648172233 AS log_proba_0, -0.5 * -3.020459667488068 - (0.5 * centered_data.[Feature_25_1] * centered_data.[Feature_25_1]) / 0.0077633857348967964 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 26 AS [Feature], -0.5 * -1.5733236013441039 - (0.5 * centered_data.[Feature_26_0] * centered_data.[Feature_26_0]) / 0.033001552678679144 AS log_proba_0, -0.5 * -2.0790158351926618 - (0.5 * centered_data.[Feature_26_1] * centered_data.[Feature_26_1]) / 0.019902838850898746 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 27 AS [Feature], -0.5 * -4.337198329073793 - (0.5 * centered_data.[Feature_27_0] * centered_data.[Feature_27_0]) / 0.002080649039996065 AS log_proba_0, -0.5 * -4.854399419651249 - (0.5 * centered_data.[Feature_27_1] * centered_data.[Feature_27_1]) / 0.0012404556762033244 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 28 AS [Feature], -0.5 * -3.296020447283238 - (0.5 * centered_data.[Feature_28_0] * centered_data.[Feature_28_0]) / 0.005893545477987427 AS log_proba_0, -0.5 * -4.532183717677602 - (0.5 * centered_data.[Feature_28_1] * centered_data.[Feature_28_1]) / 0.001712055156693187 AS log_proba_1 
FROM centered_data UNION ALL SELECT centered_data.[KEY] AS [KEY], 29 AS [Feature], -0.5 * -5.965243860185111 - (0.5 * centered_data.[Feature_29_0] * centered_data.[Feature_29_0]) / 0.00040845821955974647 AS log_proba_0, -0.5 * -6.779372917639308 - (0.5 * centered_data.[Feature_29_1] * centered_data.[Feature_29_1]) / 0.00018095720627925714 AS log_proba_1 
FROM centered_data) AS [Values]), 
[NaiveBayes_Scores] AS 
(SELECT nb_sums.[KEY] AS [KEY], nb_sums.[Score_0] AS [Score_0], nb_sums.[Score_1] AS [Score_1] 
FROM (SELECT [NaiveBayes_data].[KEY] AS [KEY], -1.0451236037171234 + sum([NaiveBayes_data].log_proba_0) AS [Score_0], -0.43332206261113054 + sum([NaiveBayes_data].log_proba_1) AS [Score_1] 
FROM [NaiveBayes_data] GROUP BY [NaiveBayes_data].[KEY]) AS nb_sums), 
orig_cte AS 
(SELECT [NaiveBayes_Scores].[KEY] AS [KEY], [NaiveBayes_Scores].[Score_0] AS [Score_0], [NaiveBayes_Scores].[Score_1] AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Proba_0], CAST(NULL AS FLOAT(53)) AS [Proba_1], CAST(NULL AS FLOAT(53)) AS [LogProba_0], CAST(NULL AS FLOAT(53)) AS [LogProba_1], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM [NaiveBayes_Scores]), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 0 AS class, orig_cte.[LogProba_0] AS [LogProba], orig_cte.[Proba_0] AS [Proba], orig_cte.[Score_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 1 AS class, orig_cte.[LogProba_1] AS [LogProba], orig_cte.[Proba_1] AS [Proba], orig_cte.[Score_1] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_0] AS [Score_0], orig_cte.[Score_1] AS [Score_1], orig_cte.[Proba_0] AS [Proba_0], orig_cte.[Proba_1] AS [Proba_1], orig_cte.[LogProba_0] AS [LogProba_0], orig_cte.[LogProba_1] AS [LogProba_1], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Score] AS [max_Score] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Score]) AS [max_Score] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
score_soft_max_deltas AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_0] AS [Score_0], score_max.[Score_1] AS [Score_1], score_max.[Proba_0] AS [Proba_0], score_max.[Proba_1] AS [Proba_1], score_max.[LogProba_0] AS [LogProba_0], score_max.[LogProba_1] AS [LogProba_1], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score], exp(CASE WHEN (-100.0 <= score_max.[Score_0] - score_max.[max_Score]) THEN score_max.[Score_0] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_0], exp(CASE WHEN (-100.0 <= score_max.[Score_1] - score_max.[max_Score]) THEN score_max.[Score_1] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_1] 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.[KEY] AS [KEY], soft_scu.class AS class, soft_scu.[exp_delta_Score] AS [exp_delta_Score] 
FROM (SELECT score_soft_max_deltas.[KEY] AS [KEY], 0 AS class, score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 1 AS class, score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score] 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.[KEY] AS [KEY], score_soft_max_deltas.[Score_0] AS [Score_0], score_soft_max_deltas.[Score_1] AS [Score_1], score_soft_max_deltas.[Proba_0] AS [Proba_0], score_soft_max_deltas.[Proba_1] AS [Proba_1], score_soft_max_deltas.[LogProba_0] AS [LogProba_0], score_soft_max_deltas.[LogProba_1] AS [LogProba_1], score_soft_max_deltas.[Decision] AS [Decision], score_soft_max_deltas.[DecisionProba] AS [DecisionProba], score_soft_max_deltas.[KEY_m] AS [KEY_m], score_soft_max_deltas.[max_Score] AS [max_Score], score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score_1], sum_exp_t.[KEY_sum] AS [KEY_sum], sum_exp_t.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.[KEY] AS [KEY_sum], sum(score_class_union_soft.[exp_delta_Score]) AS [sum_ExpDeltaScore] 
FROM score_class_union_soft GROUP BY score_class_union_soft.[KEY]) AS sum_exp_t ON score_soft_max_deltas.[KEY] = sum_exp_t.[KEY_sum]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.[KEY_u] = score_soft_max.[KEY]), 
arg_max_cte AS 
(SELECT score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore], [arg_max_t_Score].[KEY_Score] AS [KEY_Score], [arg_max_t_Score].[arg_max_Score] AS [arg_max_Score], soft_max_comp.[KEY_softmax] AS [KEY_softmax], soft_max_comp.[SoftProba_0] AS [SoftProba_0], soft_max_comp.[SoftProba_1] AS [SoftProba_1] 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Score], max(union_with_max.class) AS [arg_max_Score] 
FROM union_with_max 
WHERE union_with_max.[max_Score] <= union_with_max.[Score] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Score] ON score_soft_max.[KEY] = [arg_max_t_Score].[KEY_Score] LEFT OUTER JOIN (SELECT score_soft_max.[KEY] AS [KEY_softmax], score_soft_max.[exp_delta_Score_0] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_0], score_soft_max.[exp_delta_Score_1] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_1] 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.[KEY_softmax] = [arg_max_t_Score].[KEY_Score])
 SELECT arg_max_cte.[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_0], CAST(NULL AS FLOAT(53)) AS [Score_1], arg_max_cte.[SoftProba_0] AS [Proba_0], arg_max_cte.[SoftProba_1] AS [Proba_1], CASE WHEN (arg_max_cte.[SoftProba_0] IS NULL OR arg_max_cte.[SoftProba_0] > 0.0) THEN log(arg_max_cte.[SoftProba_0]) ELSE -1.79769313486231e+308 END AS [LogProba_0], CASE WHEN (arg_max_cte.[SoftProba_1] IS NULL OR arg_max_cte.[SoftProba_1] > 0.0) THEN log(arg_max_cte.[SoftProba_1]) ELSE -1.79769313486231e+308 END AS [LogProba_1], arg_max_cte.[arg_max_Score] AS [Decision], CASE WHEN (arg_max_cte.[SoftProba_0] <= arg_max_cte.[SoftProba_1]) THEN arg_max_cte.[SoftProba_1] ELSE arg_max_cte.[SoftProba_0] END AS [DecisionProba] 
FROM arg_max_cte