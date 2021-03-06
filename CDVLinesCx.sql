SELECT (SELECT DISTINCT g.[REGION]
				FROM [WISDM].[Dim].[Geography] g
				WHERE g.[Sys] = LEFT(t.[CORP_SYSPRIN],4)) AS REGION
		,LEFT(d.[FISCAL_MONTH_NAME],3) AS MONTH
		,CONCAT('Yr',d.[FISCAL_YEAR_ID]) AS YEAR
		,d.[FISCAL_MONTH_END]
		,SUM(ISNULL(CAST(t.[NUMBER_VOICE_LINES] AS FLOAT),0)) AS [NUMBER_VOICE_LINES]
FROM [ExternalUser].[iCoMP].[t_WSTCBSTransactionData] t
	LEFT JOIN [WISDM].[Dim].[Date] d ON t.[CONNECT_DATE] = d.[DATE_ID]
WHERE t.[VOICE_EXISTING] = 'NO'
		AND t.[VOICE_SOLD] = 'YES'
		AND t.[CONNECT_DATE] > '12-21-2016'
GROUP BY d.[FISCAL_YEAR_ID]
			,d.[FISCAL_MONTH_NAME]
			,d.[FISCAL_MONTH_END]
			,t.[CORP_SYSPRIN]
ORDER BY (SELECT DISTINCT g.[REGION]
				FROM [WISDM].[Dim].[Geography] g
				WHERE g.[Sys] = LEFT(t.[CORP_SYSPRIN],4))