--Eric Shaw
SELECT LEFT(SFOV.[region],LEN(SFOV.[region])-7) AS REGION
		,CAST(CAST(T.[FISCAL_MONTH_END] AS DATETIME) AS DATE) AS FISCAL_MONTH_END
		,SFOV.[fiscal_year]
		,SFOV.[fiscal_month]
		,CASE WHEN SFOV.[acct_scope] = 'DOTCOM' THEN 'Web Buy Flow'
				WHEN SFOV.[acct_scope] = 'OBSR LIST' THEN 'Core'
				WHEN SFOV.[acct_scope] = 'OFT' THEN 'Web Buy Flow'
				WHEN SFOV.[acct_scope] = 'WEB CHAT' THEN 'Chat'
				WHEN SFOV.[acct_scope] = 'WEB SALES' THEN 'Web'
				ELSE SFOV.[acct_scope] END AS channel
		,ROUND(SUM(CASE WHEN SFOV.[bci_sale_flag_new] = 1 THEN ISNULL(SFOV.[w_promo_bci_mrc],0) ELSE 0 END),0) AS bci_mrc_w_promo
		,SUM(ISNULL(SFOV.[bci_sale_flag_new],0)) AS bci
		,ROUND(SUM(CASE WHEN SFOV.[bcv_sale_flag_new] = 1 THEN ISNULL(SFOV.[w_promo_bcv_mrc],0) ELSE 0 END),0) AS bcv_mrc_w_promo
		,SUM(ISNULL(SFOV.[bcv_sale_flag_new],0)) AS bcv
		,SUM(ISNULL(SFOV.[w_promo_VES_mrc],0)) AS ves_mrc_w_promo
		,SUM(ISNULL(SFOV.[VES],0)) AS VES
		,ROUND(SUM(ISNULL(SFOV.[BVE_MRC],0)),0) AS bve_mrc
		,ROUND(SUM(ISNULL(SFOV.[BVE],0)),0) AS BVE
		,ROUND(SUM(ISNULL(SFOV.[PRI_MRC],0)),0) AS pri_mrc
		,ROUND(SUM(ISNULL(SFOV.[PRI],0)),0) AS PRI
		,ROUND(SUM(ISNULL(SFOV.[SIP_MRC],0)),0) AS sip_mrc
		,ROUND(SUM(ISNULL(SFOV.[SIP],0)),0) AS SIP
		,ROUND(SUM(CASE WHEN SFOV.[bctv_sale_flag_new] = 1 THEN ISNULL(SFOV.[w_promo_bctv_mrc],0) ELSE 0 END),0) AS bctv_mrc_w_promo
		,SUM(ISNULL(SFOV.[bctv_sale_flag_new],0)) AS bctv
		,ROUND(SUM(CASE WHEN SFOV.[SO_Sale_Flag_new] = 1 THEN ISNULL(SFOV.[SO_Total_MRC],0) ELSE 0 END),0) AS smartoffice_mrc
		,SUM(ISNULL(SFOV.[SO_Sale_Flag_new],0)) AS smartoffice
		,SUM(ISNULL(SFOV.[Connection_Pro_MRC],0)) AS connection_pro_mrc
		,SUM(ISNULL(SFOV.[Connection_Pro],0)) AS connection_pro
		,SUM(ISNULL(SFOV.[Wifi_Pro_mrc],0)) AS wifi_pro_mrc
		,SUM(ISNULL(SFOV.[wifi_Pro],0)) AS wifi_pro
		,SUM(ISNULL(SFOV.[W_PROMO_SECURITYEDGE_MRC],0)) AS w_promo_securityedge
		,SUM(ISNULL(SFOV.[SECURITYEDGE],0)) AS securityedge
FROM [BusServ_DW_DEV].[dbo].[SALES_FLASH_ORDER_VIEW] SFOV
	JOIN [BusServ_DW_DEV].[dbo].[REF_TIME] T ON CAST(SFOV.[event_date] AS DATE) = CAST(T.[DATE] AS DATE)
WHERE SFOV.[division] = 'WEST DIVISION'
		AND SFOV.[fiscal_year] IN ('2017','2018','2019','2020')
GROUP BY SFOV.[region]
			,T.[FISCAL_MONTH_END]
			,SFOV.[fiscal_year]
			,SFOV.[fiscal_month]
			,SFOV.[acct_scope]
ORDER BY T.[FISCAL_MONTH_END]
