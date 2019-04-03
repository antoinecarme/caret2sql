-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth_pca
-- Dataset : iris
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(5.8475 AS DOUBLE PRECISION)) / CAST(0.83050683118121 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(3.040833333333333 AS DOUBLE PRECISION)) / CAST(0.441063617685633 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(3.844166666666666 AS DOUBLE PRECISION)) / CAST(1.718157887567567 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(1.245833333333333 AS DOUBLE PRECISION)) / CAST(0.75179290834033 AS DOUBLE PRECISION) AS "Feature_3" 
FROM iris AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.526301451438797 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.249543074005026 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.582256265414231 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.567197212453844 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.357978551872095 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.931208839467465 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.009350349831008 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.067926612275687 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(0.726838701881798 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.231985866568292 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.142090941958786 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.630633192412678 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.257999302440444 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.129463930213543 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.800437615656071 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.525333298161016 AS DOUBLE PRECISION) AS "PC4" 
FROM "ADS_sca_1_OUT"), 
earth_input AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE PRECISION) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE PRECISION) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE PRECISION) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE PRECISION) AS "PC4" 
FROM "ADS_pre_1_OUT"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", CAST(0.565254251876074 AS DOUBLE PRECISION) * greatest(CAST(-0.017360589210773 AS DOUBLE PRECISION) - earth_input."PC1", CAST(0 AS DOUBLE PRECISION)) + CAST(-2.085242044132094 AS DOUBLE PRECISION) * greatest(earth_input."PC3" - CAST(0.228043563673482 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-3.39347876518004 AS DOUBLE PRECISION) * greatest(CAST(0.228043563673482 AS DOUBLE PRECISION) - earth_input."PC3", CAST(0 AS DOUBLE PRECISION)) + CAST(-31.105006767610195 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(1.919341051316061 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(1.494746705263822 AS DOUBLE PRECISION) * greatest(earth_input."PC4" - CAST(0.104764602598352 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(246.5306887644564 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.674082655111522 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-211.2310381967572 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.86175635050664 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-26.46884082498328 AS DOUBLE PRECISION) AS "Score_0", CAST(-8.992786819418152 AS DOUBLE PRECISION) * greatest(CAST(-0.017360589210773 AS DOUBLE PRECISION) - earth_input."PC1", CAST(0 AS DOUBLE PRECISION)) + CAST(15.84995544306683 AS DOUBLE PRECISION) * greatest(earth_input."PC3" - CAST(0.228043563673482 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-230.48053812141384 AS DOUBLE PRECISION) * greatest(CAST(0.228043563673482 AS DOUBLE PRECISION) - earth_input."PC3", CAST(0 AS DOUBLE PRECISION)) + CAST(166.83394354349454 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(1.919341051316061 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-178.68275200317646 AS DOUBLE PRECISION) * greatest(earth_input."PC4" - CAST(0.104764602598352 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-1777.968317298613 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.674082655111522 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(1642.202521023471 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.86175635050664 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(10.146013831606671 AS DOUBLE PRECISION) AS "Score_1", CAST(8.992786820244358 AS DOUBLE PRECISION) * greatest(CAST(-0.017360589210773 AS DOUBLE PRECISION) - earth_input."PC1", CAST(0 AS DOUBLE PRECISION)) + CAST(-15.849955447247641 AS DOUBLE PRECISION) * greatest(earth_input."PC3" - CAST(0.228043563673482 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(199.16131724211783 AS DOUBLE PRECISION) * greatest(CAST(0.228043563673482 AS DOUBLE PRECISION) - earth_input."PC3", CAST(0 AS DOUBLE PRECISION)) + CAST(-10.365620460304324 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(1.919341051316061 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(182.7411014213087 AS DOUBLE PRECISION) * greatest(earth_input."PC4" - CAST(0.104764602598352 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(1268.4777055539728 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.674082655111522 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-1230.34115471282 AS DOUBLE PRECISION) * greatest(earth_input."PC1" - CAST(-0.86175635050664 AS DOUBLE PRECISION), CAST(0 AS DOUBLE PRECISION)) + CAST(-10.146013832189793 AS DOUBLE PRECISION) AS "Score_2" 
FROM earth_input), 
earth_model_cte_logistic AS 
(SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Score_0" AS "Score_0", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -earth_model_cte."Score_0")))) AS "Logistic_0", earth_model_cte."Score_1" AS "Score_1", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -earth_model_cte."Score_1")))) AS "Logistic_1", earth_model_cte."Score_2" AS "Score_2", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -earth_model_cte."Score_2")))) AS "Logistic_2" 
FROM earth_model_cte), 
orig_cte AS 
(SELECT earth_model_cte_logistic."KEY" AS "KEY", earth_model_cte_logistic."Score_0" AS "Score_0", earth_model_cte_logistic."Score_1" AS "Score_1", earth_model_cte_logistic."Score_2" AS "Score_2", earth_model_cte_logistic."Logistic_0" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2") AS "Proba_0", earth_model_cte_logistic."Logistic_1" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2") AS "Proba_1", earth_model_cte_logistic."Logistic_2" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2") AS "Proba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM earth_model_cte_logistic), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu."class" AS "class", scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS "class", orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS "class", orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS "class", orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union."class" AS "class", score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max."class") AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", arg_max_cte."Proba_2" AS "Proba_2", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."Proba_2" IS NULL OR arg_max_cte."Proba_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."Proba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte