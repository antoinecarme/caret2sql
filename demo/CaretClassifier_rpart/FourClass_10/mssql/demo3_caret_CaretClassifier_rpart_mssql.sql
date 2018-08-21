-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : FourClass_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [DT_node_lookup] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_3] < 0.6375722768103697) THEN CASE WHEN ([ADS].[Feature_3] >= -1.7759541702481931) THEN 4 ELSE 5 END ELSE CASE WHEN ([ADS].[Feature_7] >= 0.3623487370147764) THEN 6 ELSE 7 END END AS node_id_2 
FROM [FourClass_10] AS [ADS]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[P_0] AS [P_0], [Values].[P_1] AS [P_1], [Values].[P_2] AS [P_2], [Values].[P_3] AS [P_3], [Values].[D] AS [D], [Values].[DP] AS [DP] 
FROM (SELECT 4 AS nid, 0.5517241379310345 AS [P_0], 0.0 AS [P_1], 0.20689655172413796 AS [P_2], 0.2413793103448276 AS [P_3], 0 AS [D], 0.5517241379310345 AS [DP] UNION ALL SELECT 5 AS nid, 0.0 AS [P_0], 0.0 AS [P_1], 1.0 AS [P_2], 0.0 AS [P_3], 2 AS [D], 1.0 AS [DP] UNION ALL SELECT 6 AS nid, 0.08 AS [P_0], 0.68 AS [P_1], 0.16 AS [P_2], 0.08 AS [P_3], 1 AS [D], 0.68 AS [DP] UNION ALL SELECT 7 AS nid, 0.0 AS [P_0], 0.18750000000000006 AS [P_1], 0.0 AS [P_2], 0.8125 AS [P_3], 3 AS [D], 0.8125 AS [DP]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[P_0] AS [P_0], [DT_node_data].[P_1] AS [P_1], [DT_node_data].[P_2] AS [P_2], [DT_node_data].[P_3] AS [P_3], [DT_node_data].[D] AS [D], [DT_node_data].[DP] AS [DP] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid)
 SELECT [DT_Output].[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_0], CAST(NULL AS FLOAT(53)) AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Score_2], CAST(NULL AS FLOAT(53)) AS [Score_3], [DT_Output].[P_0] AS [Proba_0], [DT_Output].[P_1] AS [Proba_1], [DT_Output].[P_2] AS [Proba_2], [DT_Output].[P_3] AS [Proba_3], CASE WHEN ([DT_Output].[P_0] IS NULL OR [DT_Output].[P_0] > 0.0) THEN log([DT_Output].[P_0]) ELSE -1.79769313486231e+308 END AS [LogProba_0], CASE WHEN ([DT_Output].[P_1] IS NULL OR [DT_Output].[P_1] > 0.0) THEN log([DT_Output].[P_1]) ELSE -1.79769313486231e+308 END AS [LogProba_1], CASE WHEN ([DT_Output].[P_2] IS NULL OR [DT_Output].[P_2] > 0.0) THEN log([DT_Output].[P_2]) ELSE -1.79769313486231e+308 END AS [LogProba_2], CASE WHEN ([DT_Output].[P_3] IS NULL OR [DT_Output].[P_3] > 0.0) THEN log([DT_Output].[P_3]) ELSE -1.79769313486231e+308 END AS [LogProba_3], [DT_Output].[D] AS [Decision], [DT_Output].[DP] AS [DecisionProba] 
FROM [DT_Output]