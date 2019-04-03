-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth_pca
-- Dataset : diabetes
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.0002686932066652983) / 0.04730915349390602 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 0.0007239580580639588) / 0.047673150284254465 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.0007280719825586781) / 0.04700253448417295 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.0010135652210843957) / 0.04840388131203584 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - 0.0009763580732882078) / 0.04811896752594957 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.0017643808242337245) / 0.048129028508581584 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - -0.0016512815450565033) / 0.04626798564989309 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.0013905501983388132) / 0.04743032244703379 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - 0.001272648254809092) / 0.04595800380394428 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.0010344250056816262) / 0.04782938024075454 AS [Feature_9] 
FROM diabetes AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * -0.2290778852038531 + [ADS_sca_1_OUT].[Feature_1] * -0.1753752188773297 + [ADS_sca_1_OUT].[Feature_2] * -0.3101462867523008 + [ADS_sca_1_OUT].[Feature_3] * -0.2626680617954629 + [ADS_sca_1_OUT].[Feature_4] * -0.3479056910483734 + [ADS_sca_1_OUT].[Feature_5] * -0.3559311512395374 + [ADS_sca_1_OUT].[Feature_6] * 0.2700667896053253 + [ADS_sca_1_OUT].[Feature_7] * -0.4281896059050315 + [ADS_sca_1_OUT].[Feature_8] * -0.3817554053543343 + [ADS_sca_1_OUT].[Feature_9] * -0.319118586083605 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.09937121658133408 + [ADS_sca_1_OUT].[Feature_1] * -0.3974071373222933 + [ADS_sca_1_OUT].[Feature_2] * -0.0955290657434 + [ADS_sca_1_OUT].[Feature_3] * -0.10428227480233908 + [ADS_sca_1_OUT].[Feature_4] * 0.5519944936080498 + [ADS_sca_1_OUT].[Feature_5] * 0.44169748621486143 + [ADS_sca_1_OUT].[Feature_6] * 0.5359791630654337 + [ADS_sca_1_OUT].[Feature_7] * -0.09747648126824032 + [ADS_sca_1_OUT].[Feature_8] * -0.06464571596604123 + [ADS_sca_1_OUT].[Feature_9] * -0.1069735796588606 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * -0.447334397656141 + [ADS_sca_1_OUT].[Feature_1] * 0.06517171310859735 + [ADS_sca_1_OUT].[Feature_2] * -0.1813228857818792 + [ADS_sca_1_OUT].[Feature_3] * -0.5633053550809429 + [ADS_sca_1_OUT].[Feature_4] * 0.10998840407137493 + [ADS_sca_1_OUT].[Feature_5] * 0.2893639101113097 + [ADS_sca_1_OUT].[Feature_6] * -0.3533722834611607 + [ADS_sca_1_OUT].[Feature_7] * 0.3825782441157001 + [ADS_sca_1_OUT].[Feature_8] * -0.04470455133576475 + [ADS_sca_1_OUT].[Feature_9] * -0.2763840995943125 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * -0.3821475868520689 + [ADS_sca_1_OUT].[Feature_1] * -0.6833479183061256 + [ADS_sca_1_OUT].[Feature_2] * 0.5241820976738465 + [ADS_sca_1_OUT].[Feature_3] * -0.03681239814871951 + [ADS_sca_1_OUT].[Feature_4] * -0.08445010736913261 + [ADS_sca_1_OUT].[Feature_5] * -0.16994357503869012 + [ADS_sca_1_OUT].[Feature_6] * -0.07693340159969728 + [ADS_sca_1_OUT].[Feature_7] * 0.017466366084080358 + [ADS_sca_1_OUT].[Feature_8] * 0.2554449000560565 + [ADS_sca_1_OUT].[Feature_9] * 0.05820877690254081 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * -0.7351365637973705 + [ADS_sca_1_OUT].[Feature_1] * 0.3763855813795456 + [ADS_sca_1_OUT].[Feature_2] * 0.1420393394491647 + [ADS_sca_1_OUT].[Feature_3] * 0.3926718700192453 + [ADS_sca_1_OUT].[Feature_4] * 0.1428650665541864 + [ADS_sca_1_OUT].[Feature_5] * 0.1276726308786394 + [ADS_sca_1_OUT].[Feature_6] * 0.245950649429653 + [ADS_sca_1_OUT].[Feature_7] * -0.1284011919823951 + [ADS_sca_1_OUT].[Feature_8] * -0.1367980851890121 + [ADS_sca_1_OUT].[Feature_9] * 0.1055401494998786 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * -0.12368487725974045 + [ADS_sca_1_OUT].[Feature_1] * -0.06284387588101352 + [ADS_sca_1_OUT].[Feature_2] * -0.2953969232053042 + [ADS_sca_1_OUT].[Feature_3] * -0.3412960311712761 + [ADS_sca_1_OUT].[Feature_4] * -0.01656449034153671 + [ADS_sca_1_OUT].[Feature_5] * -0.04587438751367261 + [ADS_sca_1_OUT].[Feature_6] * 0.08082110381516423 + [ADS_sca_1_OUT].[Feature_7] * -0.030199014358925625 + [ADS_sca_1_OUT].[Feature_8] * -0.0053457810566821425 + [ADS_sca_1_OUT].[Feature_9] * 0.8758760898858822 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * -0.18093645279344808 + [ADS_sca_1_OUT].[Feature_1] * -0.06987137416766502 + [ADS_sca_1_OUT].[Feature_2] * -0.5789173338500514 + [ADS_sca_1_OUT].[Feature_3] * 0.2280204737784956 + [ADS_sca_1_OUT].[Feature_4] * 0.10126984562459923 + [ADS_sca_1_OUT].[Feature_5] * -0.2246202656518164 + [ADS_sca_1_OUT].[Feature_6] * 0.06544614151024082 + [ADS_sca_1_OUT].[Feature_7] * 0.03808580365663454 + [ADS_sca_1_OUT].[Feature_8] * 0.6979315085634531 + [ADS_sca_1_OUT].[Feature_9] * -0.147273260741705 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
earth_input AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CAST([ADS_pre_1_OUT].[PC1] AS FLOAT(53)) AS [PC1], CAST([ADS_pre_1_OUT].[PC2] AS FLOAT(53)) AS [PC2], CAST([ADS_pre_1_OUT].[PC3] AS FLOAT(53)) AS [PC3], CAST([ADS_pre_1_OUT].[PC4] AS FLOAT(53)) AS [PC4], CAST([ADS_pre_1_OUT].[PC5] AS FLOAT(53)) AS [PC5], CAST([ADS_pre_1_OUT].[PC6] AS FLOAT(53)) AS [PC6], CAST([ADS_pre_1_OUT].[PC7] AS FLOAT(53)) AS [PC7] 
FROM [ADS_pre_1_OUT]), 
earth_model_cte AS 
(SELECT earth_input.[KEY] AS [KEY], 32.02770014694138 * CASE WHEN (earth_input.[PC4] - 0.2123347291582967 <= 0) THEN 0 ELSE earth_input.[PC4] - 0.2123347291582967 END + -24.72673688893289 * CASE WHEN (0.2123347291582967 - earth_input.[PC4] <= 0) THEN 0 ELSE 0.2123347291582967 - earth_input.[PC4] END + 11.56369722672364 * CASE WHEN (1.9862811003390157 - earth_input.[PC3] <= 0) THEN 0 ELSE 1.9862811003390157 - earth_input.[PC3] END + 45.500638881960704 * CASE WHEN (-0.6750853425580281 - earth_input.[PC6] <= 0) THEN 0 ELSE -0.6750853425580281 - earth_input.[PC6] END + -13.122637976955868 * CASE WHEN (earth_input.[PC2] - -1.195153482002088 <= 0) THEN 0 ELSE earth_input.[PC2] - -1.195153482002088 END + 30.762765775612138 * CASE WHEN (earth_input.[PC1] - 0.4681598523219938 <= 0) THEN 0 ELSE earth_input.[PC1] - 0.4681598523219938 END + -40.20734259409402 * CASE WHEN (earth_input.[PC1] - -1.5445067395904215 <= 0) THEN 0 ELSE earth_input.[PC1] - -1.5445067395904215 END + 200.6744189398773 AS [Estimator] 
FROM earth_input)
 SELECT earth_model_cte.[KEY] AS [KEY], earth_model_cte.[Estimator] AS [Estimator] 
FROM earth_model_cte