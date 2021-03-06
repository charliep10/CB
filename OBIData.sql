SELECT LEFT([region],LEN([REGION])-7) AS region
		,CASE WHEN [Sales_Fiscal_Month] = 'JAN' AND [Sales_Fiscal_Year] ='2018' THEN '01/01/2018'
				WHEN [Sales_Fiscal_Month] = 'FEB' AND [Sales_Fiscal_Year] ='2018' THEN '02/01/2018'
				WHEN [Sales_Fiscal_Month] = 'MAR' AND [Sales_Fiscal_Year] ='2018' THEN '03/01/2018'
				WHEN [Sales_Fiscal_Month] = 'APR' AND [Sales_Fiscal_Year] ='2018' THEN '04/01/2018'
				WHEN [Sales_Fiscal_Month] = 'MAY' AND [Sales_Fiscal_Year] ='2018' THEN '05/01/2018'
				WHEN [Sales_Fiscal_Month] = 'JUN' AND [Sales_Fiscal_Year] ='2018' THEN '06/01/2018'
				WHEN [Sales_Fiscal_Month] = 'JUL' AND [Sales_Fiscal_Year] ='2018' THEN '07/01/2018'
				WHEN [Sales_Fiscal_Month] = 'AUG' AND [Sales_Fiscal_Year] ='2018' THEN '08/01/2018'
				WHEN [Sales_Fiscal_Month] = 'SEP' AND [Sales_Fiscal_Year] ='2018' THEN '09/01/2018'
				WHEN [Sales_Fiscal_Month] = 'OCT' AND [Sales_Fiscal_Year] ='2018' THEN '10/01/2018'
				WHEN [Sales_Fiscal_Month] = 'NOV' AND [Sales_Fiscal_Year] ='2018' THEN '11/01/2018'
				WHEN [Sales_Fiscal_Month] = 'DEC' AND [Sales_Fiscal_Year] ='2018' THEN '12/01/2018'
				WHEN [Sales_Fiscal_Month] = 'JAN' AND [Sales_Fiscal_Year] ='2019' THEN '01/01/2019'
				WHEN [Sales_Fiscal_Month] = 'FEB' AND [Sales_Fiscal_Year] ='2019' THEN '02/01/2019'
				WHEN [Sales_Fiscal_Month] = 'MAR' AND [Sales_Fiscal_Year] ='2019' THEN '03/01/2019'
				WHEN [Sales_Fiscal_Month] = 'APR' AND [Sales_Fiscal_Year] ='2019' THEN '04/01/2019'
				WHEN [Sales_Fiscal_Month] = 'MAY' AND [Sales_Fiscal_Year] ='2019' THEN '05/01/2019'
				WHEN [Sales_Fiscal_Month] = 'JUN' AND [Sales_Fiscal_Year] ='2019' THEN '06/01/2019'
				WHEN [Sales_Fiscal_Month] = 'JUL' AND [Sales_Fiscal_Year] ='2019' THEN '07/01/2019'
				WHEN [Sales_Fiscal_Month] = 'AUG' AND [Sales_Fiscal_Year] ='2019' THEN '08/01/2019'
				WHEN [Sales_Fiscal_Month] = 'SEP' AND [Sales_Fiscal_Year] ='2019' THEN '09/01/2019'
				WHEN [Sales_Fiscal_Month] = 'OCT' AND [Sales_Fiscal_Year] ='2019' THEN '10/01/2019'
				WHEN [Sales_Fiscal_Month] = 'NOV' AND [Sales_Fiscal_Year] ='2019' THEN '11/01/2019'
				WHEN [Sales_Fiscal_Month] = 'DEC' AND [Sales_Fiscal_Year] ='2019' THEN '12/01/2019'
				ELSE NULL END AS [MONTH_ID]
		,CASE WHEN [sales_channel] = 'WEB CHAT' THEN 'Chat'
				WHEN [sales_channel] IN ('DOTCOM','OFT') THEN 'Web Buy Flow'
				WHEN [sales_channel] = 'OBSR LIST' THEN 'Core'
				WHEN [sales_channel] = 'WEB SALES' THEN 'Web'
				WHEN [sales_channel] = 'SR BAE' THEN 'BAE'
				ELSE [sales_channel] END AS sales_channel
		,[Orders]
		,[total_mrc_w_promo]
		,[bci_mrc_w_promo]
		,[bcv_mrc_w_promo]
		,[bctv_mrc_w_promo]
		,[BCI_RGUs]
		,[BCV_RGUs]
		,[BCTV_RGUs]
FROM [BusServ_DW_DEV].[dbo].[SALES_FLASH_REVENUE_SUMMARY]
WHERE [division] = 'WEST DIVISION'
	AND [Sales_Fiscal_Year] IN ('2018','2019')