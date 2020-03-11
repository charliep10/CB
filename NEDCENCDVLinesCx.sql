/*SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_2016] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '12-22-2015' AND '12-21-2016'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------2016-----------------------
UNION ALL*/

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201701] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '12-22-2016' AND '01-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201701---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201702] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '01-22-2017' AND '02-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201702---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201703] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '02-22-2017' AND '03-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201703---------------------
UNION ALL


SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201704] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '03-22-2017' AND '04-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201704---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201705] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '04-22-2017' AND '05-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201705---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201706] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '05-22-2017' AND '06-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201706---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201707] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '06-22-2017' AND '07-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201707---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201708] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '07-22-2017' AND '08-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201708---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201709] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '08-22-2017' AND '09-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201709---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201710] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '09-22-2017' AND '10-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201710---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201711] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '10-22-2017' AND '11-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201711---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201712] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '11-22-2017' AND '12-21-2017'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201712---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_2018] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '12-22-2017' AND '12-21-2018'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]

-----------------------2018-----------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201901] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '12-22-2018' AND '01-21-2019'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201901---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201902] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '01-22-2019' AND '02-21-2019'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201902---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201903] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '02-22-2019' AND '03-21-2019'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]
-----------------------201903---------------------
UNION ALL

SELECT (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS REGION
		,(SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) AS DIVISION
		,d.[FISCAL_MONTH] AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR]) AS YEAR
		,CAST(CAST(d.[FISCAL_MONTH_END] + 0 AS SMALLDATETIME) AS DATE) AS FISCAL_MONTH_END
		,SUM(ISNULL(CAST(t.[Number Voice Lines] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [SMB_Sales].[dbo].[TD_201904] t
		LEFT JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] d ON t.[Connect Date] = d.[DATE]
WHERE t.[VOICE EXISTING] = 'NO'
		AND t.[VOICE SOLD] = 'YES'
		AND t.[Connect Date] BETWEEN '03-22-2019' AND '04-21-2019'
		AND (SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
		AND (SELECT DISTINCT r.[OBI_DIVISION]
				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
				WHERE t.[Customer Region] = r.[Customer Region]) IS NOT NULL
GROUP BY d.FISCAL_YEAR
			,d.[FISCAL_MONTH]
			,d.[FISCAL_MONTH_END]
			,t.[Customer Region]

--ORDER BY d.[FISCAL_MONTH_END]
--			,(SELECT DISTINCT LEFT(r.[OBI_REGION],LEN(r.[OBI_REGION])-7)
--				FROM [SMB_Sales].[dbo].[TD_to_OBI] r
--				WHERE t.[Customer Region] = r.[Customer Region])
-----------------------201904---------------------