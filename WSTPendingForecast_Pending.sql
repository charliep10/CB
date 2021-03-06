SELECT [region]
		,[product]
		,[order_type]
		,[pending_date]
		,[PTotal]
FROM [RptMktg].[Ext].[v_WSTPendingForecastPend1_v200]
WHERE [report_date] = CAST(GETDATE() AS DATE)
		AND [product] IN ('BUSINESS INTERNET','BUSINESS VOICE','BUSINESS VIDEO EXPANDED'
							,'BUSINESS VIDEO BASIC','BULK VIDEO BASIC','BULK VIDEO EXPANDED'
							,'SMART OFFICE','BUSINESS VOICE EDGE SELECT')
		AND [pendingcatg] = 'FUTUREBREAKOUT'
		AND [pending_date] NOT LIKE 'OPS MTH TOTAL'
		AND [region] NOT IN ('MILE HIGH','MOUNTAIN')
--http://westbis/Reports/Pages/Report.aspx?ItemPath=%2frptMarketing/WSTPendingForecast_Pending