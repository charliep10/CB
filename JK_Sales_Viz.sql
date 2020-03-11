SELECT LEFT(SFOV.[region],LEN(SFOV.[region])-7) AS REGION				
		,CASE WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'CALIFORNIA' THEN 'CAL'		
				WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'HOUSTON' THEN 'HOU' 
				WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'MOUNTAIN WEST' THEN 'MWR'
				WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'PORTLAND' THEN 'POR'
				WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'SEATTLE' THEN 'SEA'
				WHEN LEFT(SFOV.[region],LEN(SFOV.[region])-7) = 'TWIN CITIES' THEN 'TCR'
				ELSE LEFT(SFOV.[region],LEN(SFOV.[region])-7) END AS ALIAS
		,CAST(SFOV.[event_date] AS DATE) AS DATE	
		,CAST(DATEADD(DD,0,DATEADD(YY,
				CASE WHEN SFOV.[FISCAL_YEAR] = '2018' THEN 2
						WHEN SFOV.[FISCAL_YEAR] = '2019' THEN 1
						WHEN SFOV.[FISCAL_YEAR] = '2020' THEN 0 END
				,CAST(SFOV.[event_date] AS DATE))) AS DATE) AS COMP_DATE	
		,CAST(CASE WHEN R.[WEEKDAY] = 'SATURDAY' THEN CONVERT(DATETIME,CAST(SFOV.[event_date] AS DATE),102) - 1
				WHEN R.[WEEKDAY] = 'SUNDAY' THEN CONVERT(DATETIME,CAST(SFOV.[event_date] AS DATE),102) - 2
				ELSE CAST(SFOV.[event_date] AS DATE) END AS DATE) AS ADJ_DATE
		,CAST(DATEADD(DD,0,DATEADD(YY,
				CASE WHEN SFOV.[FISCAL_YEAR] = '2018' THEN 2
						WHEN SFOV.[FISCAL_YEAR] = '2019' THEN 1
						WHEN SFOV.[FISCAL_YEAR] = '2020' THEN 0 END
				,CAST(CASE WHEN R.[WEEKDAY] = 'SATURDAY' THEN CONVERT(DATETIME,CAST(SFOV.[event_date] AS DATE),102) - 1
				WHEN R.[WEEKDAY] = 'SUNDAY' THEN CONVERT(DATETIME,CAST(SFOV.[event_date] AS DATE),102) - 2
				ELSE CAST(SFOV.[event_date] AS DATE) END AS DATE))) AS DATE) AS ADJ_COMP_DATE
		,SFOV.[fiscal_year] AS YEAR		
		,CASE WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 1 THEN 'JAN'		
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 2 THEN 'FEB'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 3 THEN 'MAR'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 4 THEN 'APR'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 5 THEN 'MAY'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 6 THEN 'JUN'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 7 THEN 'JUL'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 8 THEN 'AUG'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 9 THEN 'SEP'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 10 THEN 'OCT'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 11 THEN 'NOV'
				WHEN CAST(SFOV.[fiscal_month] AS VARCHAR(2)) = 12 THEN 'DEC'
				ELSE CAST(SFOV.[fiscal_month] AS VARCHAR(2)) END AS MONTH
		,R.[WEEKDAY]		
		,CASE WHEN SFOV.[acct_scope] = 'DOTCOM' THEN 'BSDOTCOM'		
				WHEN SFOV.[acct_scope] = 'OBSR LIST' THEN 'OBSR Core'
				WHEN SFOV.[acct_scope] = 'OFT' THEN 'BSDOTCOM'
				WHEN SFOV.[acct_scope] = 'WEB CHAT' THEN 'OBSR Chat'
				WHEN SFOV.[acct_scope] = 'WEB SALES' THEN 'OBSR Web'
				WHEN SFOV.[acct_scope] = 'INSIDE CAM' THEN 'OBSR CAM'
				WHEN SFOV.[acct_scope] IN ('NATIONAL','STRATEGIC NATIONAL') THEN 'Large Enterprise Channels'
				WHEN SFOV.[acct_scope] = 'ENTERPRISE' THEN 'Enterprise Account Executive'
				WHEN SFOV.[acct_scope] IN ('CARE','OTHER','LOCAL - OTHER') THEN 'OTR'
				WHEN SFOV.[acct_scope] = 'SR BAE' THEN 'SRBAE'
				ELSE SFOV.[acct_scope] END AS CHANNEL
		,SUM(ISNULL(SFOV.[bci_sale_flag_new],0)) AS MSC		
		,SUM(ISNULL(SFOV.[bcv_sale_flag_new],0))		
		 + SUM(ISNULL(SFOV.[VES],0))		
		 + ROUND(SUM(ISNULL(SFOV.[BVE],0)),0)		
		 + ROUND(SUM(ISNULL(SFOV.[PRI],0)),0)		
		 + ROUND(SUM(ISNULL(SFOV.[SIP],0)),0) AS CTLT		
		,SUM(ISNULL(SFOV.[bctv_sale_flag_new],0)) AS CVID		
		,SUM(ISNULL(SFOV.[SO_Sale_Flag_new],0)) AS HS3B		
		,SUM(ISNULL(SFOV.[Connection_Pro],0)) AS 'Connection Pro'		
		,SUM(ISNULL(SFOV.[wifi_Pro],0)) AS 'WiFi Pro'		
		,SUM(ISNULL(SFOV.[SECURITYEDGE],0)) AS ISECURITY		
FROM [BusServ_DW_DEV].[dbo].[SALES_FLASH_ORDER_VIEW] SFOV				
JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] R ON CAST(SFOV.[event_date] AS DATE) = CAST(R.[DATE] AS DATE)  				
WHERE SFOV.[division] = 'WEST DIVISION'				
		AND SFOV.[fiscal_year] IN ('2018','2019','2020')		
GROUP BY CAST(SFOV.[event_date] AS DATE)				
			,LEFT(SFOV.[region],LEN(SFOV.[region])-7)	
			,CASE WHEN SFOV.[acct_scope] = 'DOTCOM' THEN 'BSDOTCOM'	
				WHEN SFOV.[acct_scope] = 'OBSR LIST' THEN 'OBSR Core'
				WHEN SFOV.[acct_scope] = 'OFT' THEN 'BSDOTCOM'
				WHEN SFOV.[acct_scope] = 'WEB CHAT' THEN 'OBSR Chat'
				WHEN SFOV.[acct_scope] = 'WEB SALES' THEN 'OBSR Web'
				WHEN SFOV.[acct_scope] = 'INSIDE CAM' THEN 'OBSR CAM'
				WHEN SFOV.[acct_scope] IN ('NATIONAL','STRATEGIC NATIONAL') THEN 'Large Enterprise Channels'
				WHEN SFOV.[acct_scope] = 'ENTERPRISE' THEN 'Enterprise Account Executive'
				WHEN SFOV.[acct_scope] IN ('CARE','OTHER','LOCAL - OTHER') THEN 'OTR'
				WHEN SFOV.[acct_scope] = 'SR BAE' THEN 'SRBAE'
				ELSE SFOV.[acct_scope] END
			,SFOV.[fiscal_year]	
			,SFOV.[fiscal_month]	
			,R.[WEEKDAY]
ORDER BY CAST(SFOV.[event_date] AS DATE)				
			,CASE WHEN SFOV.[acct_scope] = 'DOTCOM' THEN 'BSDOTCOM'	
				WHEN SFOV.[acct_scope] = 'OBSR LIST' THEN 'OBSR Core'
				WHEN SFOV.[acct_scope] = 'OFT' THEN 'BSDOTCOM'
				WHEN SFOV.[acct_scope] = 'WEB CHAT' THEN 'OBSR Chat'
				WHEN SFOV.[acct_scope] = 'WEB SALES' THEN 'OBSR Web'
				WHEN SFOV.[acct_scope] = 'INSIDE CAM' THEN 'OBSR CAM'
				WHEN SFOV.[acct_scope] IN ('NATIONAL','STRATEGIC NATIONAL') THEN 'Large Enterprise Channels'
				WHEN SFOV.[acct_scope] = 'ENTERPRISE' THEN 'Enterprise Account Executive'
				WHEN SFOV.[acct_scope] IN ('CARE','OTHER','LOCAL - OTHER') THEN 'OTR'
				WHEN SFOV.[acct_scope] = 'SR BAE' THEN 'SRBAE'
				ELSE SFOV.[acct_scope] END
			,LEFT(SFOV.[region],LEN(SFOV.[region])-7)