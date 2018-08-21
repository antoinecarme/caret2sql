-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet_pca
-- Dataset : FourClass_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - -0.003903374463034224) / 0.985685974308334 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 0.6152232215702326) / 1.398851036008891 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.04279623691429167) / 1.5057087871323842 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.770981955890407) / 2.3480777416797296 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - -0.43300733624893323) / 1.4118274472656485 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - -0.04249569657940362) / 0.961839508883184 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - -0.29809080119845444) / 1.0234297313191445 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.14672241507251668) / 1.610898315451602 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.01746942384662041) / 1.1559772136551034 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.11507331415602873) / 0.975205386360447 AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.04932772619908273 + "CenteredDataForPCA"."Feature_1" * -0.30424192738374856 + "CenteredDataForPCA"."Feature_2" * -0.3679687561849888 + "CenteredDataForPCA"."Feature_3" * -0.5380769831115797 + "CenteredDataForPCA"."Feature_4" * 0.10802988742400396 + "CenteredDataForPCA"."Feature_5" * 0.13910407016754714 + "CenteredDataForPCA"."Feature_6" * 0.5384086347891889 + "CenteredDataForPCA"."Feature_7" * -0.3713071820395216 + "CenteredDataForPCA"."Feature_8" * 0.0483137135579316 + "CenteredDataForPCA"."Feature_9" * 0.13772539520944088 AS caress_2, "CenteredDataForPCA"."Feature_0" * 0.4566046379002287 + "CenteredDataForPCA"."Feature_1" * 0.22867203934764516 + "CenteredDataForPCA"."Feature_2" * -0.2673956790968541 + "CenteredDataForPCA"."Feature_3" * 0.01671202428135116 + "CenteredDataForPCA"."Feature_4" * -0.7163497555230034 + "CenteredDataForPCA"."Feature_5" * 0.3501083253113648 + "CenteredDataForPCA"."Feature_6" * -0.02365108420686553 + "CenteredDataForPCA"."Feature_7" * -0.15293556467571348 + "CenteredDataForPCA"."Feature_8" * -0.04278465473081572 + "CenteredDataForPCA"."Feature_9" * -0.07700365586043896 AS caress_3, "CenteredDataForPCA"."Feature_0" * -0.4595639307438372 + "CenteredDataForPCA"."Feature_1" * 0.3158880900516212 + "CenteredDataForPCA"."Feature_2" * -0.23051961282840416 + "CenteredDataForPCA"."Feature_3" * -0.0044376721269756845 + "CenteredDataForPCA"."Feature_4" * -0.16274384812665132 + "CenteredDataForPCA"."Feature_5" * -0.27453767262313855 + "CenteredDataForPCA"."Feature_6" * 0.06030524407436345 + "CenteredDataForPCA"."Feature_7" * -0.14174903890838467 + "CenteredDataForPCA"."Feature_8" * -0.7115147418569482 + "CenteredDataForPCA"."Feature_9" * -0.06338366606522455 AS caress_4, "CenteredDataForPCA"."Feature_0" * 0.12741284788275034 + "CenteredDataForPCA"."Feature_1" * 0.08549541136134871 + "CenteredDataForPCA"."Feature_2" * -0.3821190712444285 + "CenteredDataForPCA"."Feature_3" * -0.10433262844841386 + "CenteredDataForPCA"."Feature_4" * 0.08250986211203802 + "CenteredDataForPCA"."Feature_5" * -0.36296260084226667 + "CenteredDataForPCA"."Feature_6" * 0.10962886388759648 + "CenteredDataForPCA"."Feature_7" * 0.2426374781882909 + "CenteredDataForPCA"."Feature_8" * 0.2287736877363014 + "CenteredDataForPCA"."Feature_9" * -0.7468451366164522 AS caress_5, "CenteredDataForPCA"."Feature_0" * -0.5052628362580355 + "CenteredDataForPCA"."Feature_1" * 0.5459531848285842 + "CenteredDataForPCA"."Feature_2" * -0.22747468245471705 + "CenteredDataForPCA"."Feature_3" * 0.10502795983753949 + "CenteredDataForPCA"."Feature_4" * 0.09502215073405063 + "CenteredDataForPCA"."Feature_5" * 0.36269377695620797 + "CenteredDataForPCA"."Feature_6" * 0.0045813170830969465 + "CenteredDataForPCA"."Feature_7" * -0.05707137281293255 + "CenteredDataForPCA"."Feature_8" * 0.4879473635061551 + "CenteredDataForPCA"."Feature_9" * 0.04384333678041198 AS caress_6, "CenteredDataForPCA"."Feature_0" * -0.364462956028093 + "CenteredDataForPCA"."Feature_1" * -0.4012918066249357 + "CenteredDataForPCA"."Feature_2" * 0.1851889259404308 + "CenteredDataForPCA"."Feature_3" * -0.03041929320097767 + "CenteredDataForPCA"."Feature_4" * -0.1029513075574872 + "CenteredDataForPCA"."Feature_5" * 0.5811919009803136 + "CenteredDataForPCA"."Feature_6" * -0.060907389766695234 + "CenteredDataForPCA"."Feature_7" * 0.12041134521888586 + "CenteredDataForPCA"."Feature_8" * -0.186159059340367 + "CenteredDataForPCA"."Feature_9" * -0.5192923770633756 AS caress_7, "CenteredDataForPCA"."Feature_0" * 0.20119583886282807 + "CenteredDataForPCA"."Feature_1" * 0.0677442703839704 + "CenteredDataForPCA"."Feature_2" * -0.41277620208310173 + "CenteredDataForPCA"."Feature_3" * -0.019873248265688318 + "CenteredDataForPCA"."Feature_4" * 0.327357356668028 + "CenteredDataForPCA"."Feature_5" * 0.3399166161542765 + "CenteredDataForPCA"."Feature_6" * 0.007401751370061409 + "CenteredDataForPCA"."Feature_7" * 0.6352452099253666 + "CenteredDataForPCA"."Feature_8" * -0.3190683902934043 + "CenteredDataForPCA"."Feature_9" * 0.23674831363349555 AS caress_8, "CenteredDataForPCA"."Feature_0" * -0.3647497693402185 + "CenteredDataForPCA"."Feature_1" * -0.35866033244415496 + "CenteredDataForPCA"."Feature_2" * -0.2256349042120905 + "CenteredDataForPCA"."Feature_3" * -0.06321993192815392 + "CenteredDataForPCA"."Feature_4" * -0.5256747831562765 + "CenteredDataForPCA"."Feature_5" * -0.2570745560442294 + "CenteredDataForPCA"."Feature_6" * -0.08150995718583097 + "CenteredDataForPCA"."Feature_7" * 0.4312594646390232 + "CenteredDataForPCA"."Feature_8" * 0.2503840404459864 + "CenteredDataForPCA"."Feature_9" * 0.29269511479104066 AS caress_9, "CenteredDataForPCA"."Feature_0" * -6.730933655843001e-17 + "CenteredDataForPCA"."Feature_1" * -0.3082851658068816 + "CenteredDataForPCA"."Feature_2" * -0.5029961972613992 + "CenteredDataForPCA"."Feature_3" * 0.1562681295166622 + "CenteredDataForPCA"."Feature_4" * 0.196648395365703 + "CenteredDataForPCA"."Feature_5" * -2.0816681711721688e-17 + "CenteredDataForPCA"."Feature_6" * -0.6651561595633952 + "CenteredDataForPCA"."Feature_7" * -0.3826644035918779 + "CenteredDataForPCA"."Feature_8" * -1.387778780781446e-17 + "CenteredDataForPCA"."Feature_9" * 5.204170427930421e-18 AS caress_10, "CenteredDataForPCA"."Feature_0" * -1.0187944673041802e-16 + "CenteredDataForPCA"."Feature_1" * -0.2463431335717323 + "CenteredDataForPCA"."Feature_2" * -0.1833142707252252 + "CenteredDataForPCA"."Feature_3" * 0.8114932152263197 + "CenteredDataForPCA"."Feature_4" * 0.009140288155702114 + "CenteredDataForPCA"."Feature_5" * -1.422473250300982e-16 + "CenteredDataForPCA"."Feature_6" * 0.4909577208852252 + "CenteredDataForPCA"."Feature_7" * -0.0778888423832618 + "CenteredDataForPCA"."Feature_8" * 1.665334536937735e-16 + "CenteredDataForPCA"."Feature_9" * 1.491862189340054e-16 AS caress_11 
FROM "CenteredDataForPCA"), 
linear_input AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CAST("ADS_car_1_OUT".caress_2 AS DOUBLE PRECISION) AS caress_2, CAST("ADS_car_1_OUT".caress_3 AS DOUBLE PRECISION) AS caress_3, CAST("ADS_car_1_OUT".caress_4 AS DOUBLE PRECISION) AS caress_4, CAST("ADS_car_1_OUT".caress_5 AS DOUBLE PRECISION) AS caress_5, CAST("ADS_car_1_OUT".caress_6 AS DOUBLE PRECISION) AS caress_6, CAST("ADS_car_1_OUT".caress_7 AS DOUBLE PRECISION) AS caress_7, CAST("ADS_car_1_OUT".caress_8 AS DOUBLE PRECISION) AS caress_8, CAST("ADS_car_1_OUT".caress_9 AS DOUBLE PRECISION) AS caress_9, CAST("ADS_car_1_OUT".caress_10 AS DOUBLE PRECISION) AS caress_10, CAST("ADS_car_1_OUT".caress_11 AS DOUBLE PRECISION) AS caress_11 
FROM "ADS_car_1_OUT"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 0.4332666918564131 * linear_input.caress_2 + -0.8886491815372878 * linear_input.caress_3 + -1.1864384393660659 * linear_input.caress_4 + 0.04659828101375423 * linear_input.caress_5 + -0.8344034847321045 * linear_input.caress_6 + -0.2301595566491716 * linear_input.caress_7 + -0.2724501895020148 * linear_input.caress_8 + 1.5889060975138032 * linear_input.caress_9 + -3623269551898420.0 * linear_input.caress_10 + -3220098029402095.0 * linear_input.caress_11 + -0.009386978412745748 AS "Score_0", -0.7462514919032555 * linear_input.caress_2 + -0.5169846503757234 * linear_input.caress_3 + 0.2995704431345215 * linear_input.caress_4 + -0.02729400662788946 * linear_input.caress_5 + 0.08705804664747703 * linear_input.caress_6 + 0.1363502181138728 * linear_input.caress_7 + 1.070973307315864 * linear_input.caress_8 + -2.010755856177415 * linear_input.caress_9 + 3297986825477426.0 * linear_input.caress_10 + 2891371412365257.0 * linear_input.caress_11 + 0.3474383830345357 AS "Score_1", 0.5586202055506929 * linear_input.caress_2 + 0.1172464650873978 * linear_input.caress_3 + -0.5340892528330508 * linear_input.caress_4 + 0.8394581032775112 * linear_input.caress_5 + -0.4453853281177727 * linear_input.caress_6 + 0.8436464314852712 * linear_input.caress_7 + 0.5446389354565656 * linear_input.caress_8 + 1.4756459777273931 * linear_input.caress_9 + -3593156182286988.0 * linear_input.caress_10 + 1603938625051490.0 * linear_input.caress_11 + 0.050946590662518616 AS "Score_2", -0.2456354055038506 * linear_input.caress_2 + 1.2883873668256132 * linear_input.caress_3 + 1.4209572490645952 * linear_input.caress_4 + -0.8587623776633759 * linear_input.caress_5 + 1.1927307662023998 * linear_input.caress_6 + -0.7498370929499725 * linear_input.caress_7 + -1.3431620532704143 * linear_input.caress_8 + -1.053796219063782 * linear_input.caress_9 + 3918438908707982.0 * linear_input.caress_10 + -1275212008014653.0 * linear_input.caress_11 + -0.3889979952843086 AS "Score_3" 
FROM linear_input), 
linear_model_cte_logistic AS 
(SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Score_0" AS "Score_0", linear_model_cte."Score_1" AS "Score_1", linear_model_cte."Score_2" AS "Score_2", linear_model_cte."Score_3" AS "Score_3" 
FROM linear_model_cte), 
orig_cte AS 
(SELECT linear_model_cte_logistic."KEY" AS "KEY", linear_model_cte_logistic."Score_0" AS "Score_0", linear_model_cte_logistic."Score_1" AS "Score_1", linear_model_cte_logistic."Score_2" AS "Score_2", linear_model_cte_logistic."Score_3" AS "Score_3", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_2", CAST(NULL AS DOUBLE PRECISION) AS "Proba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM linear_model_cte_logistic), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_0" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_0" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_0", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_1" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_1" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_1", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_2" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_2" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_2", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_3" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_3" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS class, score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS class, score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 0.0) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 0.0) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > 0.0) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > 0.0) THEN ln(arg_max_cte."SoftProba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", maxvalue(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2", arg_max_cte."SoftProba_3") AS "DecisionProba" 
FROM arg_max_cte