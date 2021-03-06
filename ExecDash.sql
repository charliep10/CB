SELECT [PERNR]
		,CAST (CASE WHEN [SALE_DATE] = '2019-01-26' THEN '2019-01-25'
		WHEN [SALE_DATE] = '2019-01-27' THEN '2019-01-25'
		WHEN [SALE_DATE] = '2019-02-02' THEN '2019-02-01'
		WHEN [SALE_DATE] = '2019-02-03' THEN '2019-02-01'
		WHEN [SALE_DATE] = '2019-02-09' THEN '2019-02-08'
		WHEN [SALE_DATE] = '2019-02-10' THEN '2019-02-08'
		WHEN [SALE_DATE] = '2019-02-16' THEN '2019-02-15'
		WHEN [SALE_DATE] = '2019-02-17' THEN '2019-02-15'
		ELSE SALE_DATE END AS DATE) AS SALE_DATE --UPDATE EVERY MONTH
		,[REGION]
		,[NAME]
		,CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END AS CHANNEL
		,[DATA_SALES]
		,[VOICE_SALES]
		,[VIDEO_SALES]
		,[VES_SALES]
		,[SO_SALES]
		,[WIFI_PRO_SALES]
		,[CONNECTION_PRO_SALES]
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [DATA_SALES] > 0 THEN 'Data' ELSE '' END AS 'DATA_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [VOICE_SALES] > 0 THEN 'Voice' ELSE '' END AS 'VOICE_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [VES_SALES] > 0 THEN 'VES' ELSE '' END AS 'VES_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [VIDEO_SALES] > 0 THEN 'Video' ELSE '' END AS 'VIDEO_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [SO_SALES] > 0 THEN 'SO' ELSE '' END AS 'SO_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [WIFI_PRO_SALES] > 0 THEN 'WP' ELSE '' END AS 'WP_SALE'
		,[REGION] 
		+ CASE WHEN [CHANNEL] = 'OBSR Core' THEN 'Core'
				WHEN [CHANNEL] = 'Inbound' THEN 'BSR'
				WHEN [CHANNEL] = 'CAM' THEN 'CAM'
				WHEN [CHANNEL] = 'Web' THEN 'Web'
				WHEN [CHANNEL] = 'Chat' THEN 'Chat'
				ELSE NULL END
		+ CASE WHEN [CONNECTION_PRO_SALES] > 0 THEN 'CP' ELSE '' END AS 'CP_SALE'
FROM [RptCB].[Ext].[v_WSTRtbBigPictureSalesDaily]
WHERE [SALE_DATE] BETWEEN '01-22-2019' AND '02-22-2019' --UPDATE EVERY MONTH