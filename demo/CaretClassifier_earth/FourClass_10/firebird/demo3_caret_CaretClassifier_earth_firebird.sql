-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_earth
-- Dataset : FourClass_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", -7.0966100039827245 * maxvalue(earth_input."Feature_3" - -1.0936327377464858, 0) + -4.579743508022174 * maxvalue(-1.0936327377464858 - earth_input."Feature_3", 0) + 0.6839044019098195 * maxvalue(earth_input."Feature_7" - -1.3706117853921598, 0) + 1.8393950815198343 * maxvalue(earth_input."Feature_4" - -1.740282138077478, 0) + 12.045586123834562 * maxvalue(0.3041014092154993 - earth_input."Feature_6", 0) + -1.339522448433114 AS "Score_0", 0.3446178728095989 * maxvalue(earth_input."Feature_3" - -1.0936327377464858, 0) + -116953.7083110768 * maxvalue(-1.0936327377464858 - earth_input."Feature_3", 0) + -0.0355838268883639 * maxvalue(earth_input."Feature_7" - -1.3706117853921598, 0) + 0.7141291390103319 * maxvalue(earth_input."Feature_4" - -1.740282138077478, 0) + 0.8197397987904907 * maxvalue(0.3041014092154993 - earth_input."Feature_6", 0) + -3.6311054284778184 AS "Score_1", -1.044086129285829 * maxvalue(earth_input."Feature_3" - -1.0936327377464858, 0) + 5.854033367461529 * maxvalue(-1.0936327377464858 - earth_input."Feature_3", 0) + 2.6618637816891746 * maxvalue(earth_input."Feature_7" - -1.3706117853921598, 0) + -2.330819432027628 * maxvalue(earth_input."Feature_4" - -1.740282138077478, 0) + -1.0330317389661932 * maxvalue(0.3041014092154993 - earth_input."Feature_6", 0) + -2.396925982178856 AS "Score_2", 4.426777762367144 * maxvalue(earth_input."Feature_3" - -1.0936327377464858, 0) + -1.639344059788912 * maxvalue(-1.0936327377464858 - earth_input."Feature_3", 0) + -2.720380094084936 * maxvalue(earth_input."Feature_7" - -1.3706117853921598, 0) + -1.7422857178018591 * maxvalue(earth_input."Feature_4" - -1.740282138077478, 0) + -8.964058778164102 * maxvalue(0.3041014092154993 - earth_input."Feature_6", 0) + 1.9878615498861882 AS "Score_3" 
FROM earth_input), 
earth_model_cte_logistic AS 
(SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Score_0" AS "Score_0", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_0")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_0")) ELSE -709.782712893384 END)) AS "Logistic_0", earth_model_cte."Score_1" AS "Score_1", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_1")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_1")) ELSE -709.782712893384 END)) AS "Logistic_1", earth_model_cte."Score_2" AS "Score_2", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_2")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_2")) ELSE -709.782712893384 END)) AS "Logistic_2", earth_model_cte."Score_3" AS "Score_3", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_3")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -earth_model_cte."Score_3")) ELSE -709.782712893384 END)) AS "Logistic_3" 
FROM earth_model_cte), 
orig_cte AS 
(SELECT earth_model_cte_logistic."KEY" AS "KEY", earth_model_cte_logistic."Score_0" AS "Score_0", earth_model_cte_logistic."Score_1" AS "Score_1", earth_model_cte_logistic."Score_2" AS "Score_2", earth_model_cte_logistic."Score_3" AS "Score_3", earth_model_cte_logistic."Logistic_0" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2" + earth_model_cte_logistic."Logistic_3") AS "Proba_0", earth_model_cte_logistic."Logistic_1" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2" + earth_model_cte_logistic."Logistic_3") AS "Proba_1", earth_model_cte_logistic."Logistic_2" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2" + earth_model_cte_logistic."Logistic_3") AS "Proba_2", earth_model_cte_logistic."Logistic_3" / (earth_model_cte_logistic."Logistic_0" + earth_model_cte_logistic."Logistic_1" + earth_model_cte_logistic."Logistic_2" + earth_model_cte_logistic."Logistic_3") AS "Proba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM earth_model_cte_logistic), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", arg_max_cte."Proba_2" AS "Proba_2", arg_max_cte."Proba_3" AS "Proba_3", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."Proba_2" IS NULL OR arg_max_cte."Proba_2" > 0.0) THEN ln(arg_max_cte."Proba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."Proba_3" IS NULL OR arg_max_cte."Proba_3" > 0.0) THEN ln(arg_max_cte."Proba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte