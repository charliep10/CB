SELECT n.[Region]
		,n.[ACCT] AS [Account]
		,ISNULL(n.[ORDERNO],'') AS [OrderNo]
		,ISNULL(n.[HSE_KEY],'') AS [HseKey]
		,CASE WHEN ISNULL(n.[CREATEDTE],'19000101') = '19000101'
				THEN ''
				ELSE CONVERT(VARCHAR(10),n.[CREATEDTE],121)
				END AS [Create Date]
		,n.[ORDER_COMPLETE_DTE] AS [Compl Date]
		,n.[ORDTYP] AS [Ord Type]
		,n.[ordtypdesc] AS [OrdTyp Desc]
		,ISNULL(n.[CREATE_OP_ID],'') AS  [Create OPID]
		,CASE WHEN ISNULL(n.[SALES_ID],0) = '0'
				THEN ''
				ELSE CONVERT(VARCHAR(10),n.[SALES_ID],121)
				END AS [SalesID]
		,ISNULL(n.[repname],'') AS [Rep Name]
		,n.[channel] AS [Channel]
		,ISNULL(n.[saleschannel],'') AS [Sales Channel]
		,ISNULL(n.[vp_name],'') AS [VP Name]
		,ISNULL(n.[BUSNAME],'') AS [Business Name]
		,ISNULL(n.[ADDR1],'') AS [Address]
		,ISNULL(n.[ADDR2],'') AS [Address2]
		,ISNULL(n.[CITY],'') AS [City]
		,ISNULL(n.[STATE],'') AS [ST]
		,ISNULL(n.[zip],'') AS [ZIP]
		,ISNULL(n.[HOMEPHONE],'') AS [Home Phone]
		,ISNULL(n.[BUSPHONE],'') AS [Business Phone]
		,ISNULL(n.[NODE],'') AS [Node]
		,ISNULL(n.[mgmtarea],'') AS [Mgmt Area]
		,CASE WHEN ISNULL(n.[origrep],0) = '0'
				THEN ''
				ELSE CONVERT(VARCHAR(10),n.[origrep],121)
				END AS [Orig Rep]
		,ISNULL(n.[repsold],'') AS [repsold]
		,CASE WHEN ISNULL(n.[Aging],0) = '0'
				THEN ''
				ELSE CONVERT(VARCHAR(10),n.[Aging],121)
				END AS [Aging]
		,CASE WHEN ISNULL(n.[totmrc],0) = '0'
				THEN ''
				ELSE CONVERT(VARCHAR(10),n.[totmrc],121)
				END AS [totmrc]
		,n.[NeverPay] AS [Never Pay]
		,ISNULL(n.[OrdRSN],'') AS [Ord RSN]
		,ISNULL(n.[rsndesc],'') AS [rsndesc]
		,CASE 
             WHEN n.[rsndesc] in ('2ND JOB-CDV','ACCT CORRECT','CBS-2ND CUST','OFFICE CORR','CBS-TELEWRKR','WEB ORDER','CHNL-WEB ORD','EOL Equipment','CELL BACKHAUL','APPR UP','CBS-PRI INST','CBS-S BVE','CBS-S PRI','CBS-S SIP','CBS-BVE DOWN'
								,'CBS-BVE OVRL' ,'CBS-BVE UP' ,'CBS-BVE DVC SWP' ,'PRICE/VALUE' ,'CBS-S METRO E' ,'P-LOW USAGE') THEN 'Administrative'

			 WHEN n.[rsndesc] in ('CBS- BUSNS CLSD','P-CANT AFFORD','P-NONPAY','P-NONPAY MAN','S-NO PROVIDER','IS/MACRO CHANGE','P-PROMO EXP','P-BILL DISSAT') THEN 'Economic'

			 
			 WHEN n.[rsndesc] in ('30 DAY GUAR','P-CSTSRV DISSAT','P-PRDCT DISSAT','P-PROGRAMMING','P-INTNL PROG','INSTALL-NT','INSTALL-SIK','Rate Increase','P-RATE INC') THEN 'Dissatisfaction'

			  WHEN n.[rsndesc] in ('P-MV IN FOOT','P-MV OUT FOOT','Transfer Service','TRANSFER','P-MV CNTD HSE','P-XFER SVC','X MERGE ACCTS') THEN 'Move/Transfer'

			 WHEN n.[rsndesc] in ('CHNL-CBS','CHNL-OTHER' ,'P-DROP BOX' ,'BIZ SO SPLIT' ,'Drop Box' ,'P-MV CNTD HSE' ,'S-UNKNWN/OTHR' ,'(Blank)' ,'BULK' ,'Bulk-Master'
								  ,'BULK-RESI' ,'P-DECEASED' ,'P-MILITARY' ,'P-STUDENT' ,'P-THEFT/FRAUD' ,'CBS-TRNK DEVSWP' ,'CBS-TRNK DOWN' ,'CBS-TRNK OVRL' ,'CBS-TRNK UP'
							      ,'EMP/OFFC ACCT' ,'EMPLOYEE' ,'CONVERSIONS' ,'P-EMP ACCT' ,'P-DC NO CONTACT' ,'CONVERSIONS' ,'CHANNEL-CARE' ,'CHNL-CARE' ,'CHNL-FRNT CNTR'
								  ,'S-XH OTHER' ,'S-XH PROTCTN 1' ,'P-NAT DISAST' ,'P-SEASONAL' ,'TECHNICAL PROB','SERVICETAKEOVER') THEN 'Other'
			 WHEN n.[rsndesc] IS NULL THEN 'Other'

			 WHEN n.[rsndesc] in ('TECHNICAL PROB','INSTALL-NT','INSTALL-SIK','EOL Equipment','CELL BACKHAUL','APPR UP','S-XH OTHER','S-XH PROTCTN 1','P-NAT DISAST','P-SEASONAL') THEN 'Technical/Product'
			 
			 WHEN n.[rsndesc] in ('Centurylink N-FBR','Centurylink Prism','Direct TV','Google Fiber','CSSR SALE','P-COMPETITION','P-PORT OUT' 
								  ,'S-ATT N-FIBR','S-CNTY LNK PRSM','S-CNTYLNK N-FBR','S-COMCAST','S-DRCT TV','S-GOOG FIBR','2ND JOB-PRI/BVE') THEN 'Competition/Price'
			END AS [Reason Code Grouping]
		,n.[SnapMonth] AS [Snap Month]
		,n.[PrevMnthVid] AS [Prev Mnth Vid]
		,n.[PrevMnthHSD] AS [Prev Mnth HSD]
		,n.[PrevMnthVoice] AS [Prev Mnth Voice]
		,n.[Video]
		,n.[DATA] AS [Data]
		,n.[Voice]
		,n.[hospt] AS [Hospitality]
		,n.[Advvoice]
		,n.[PRI]
		,n.[Teleworker] AS [TeleW]
		,n.[netvideomrc] AS [Video MRC]
		,n.[netdatamrc] AS [Data MRC]
		,n.[netvoicemrc] AS [Voice MRC]
		,n.[Prodmix]
		,ISNULL(n.[Products],'') AS [Products]
		,d.[DAY_OF_WEEK_NAME] AS [Day of Week]
		,CONCAT('Week',d.[FISCAL_WEEK_OF_MONTH_NUMBER]) AS [Week Number]
		,ISNULL(n.[Aging]/30,'') AS [Aging Mo]
		,CASE WHEN n.[Aging]/30 < 7 THEN '0-6'
				WHEN n.[Aging]/30 BETWEEN '7' AND '12' THEN '7-12'
				WHEN n.[Aging]/30 BETWEEN '13' AND '24' THEN '13-24'
				WHEN n.[Aging]/30 BETWEEN '25' AND '36' THEN '25-36'
				ELSE '37+'
				END AS [Tenure Group]
		,CASE WHEN ISNULL(DATEDIFF(d,n.[CREATEDTE],n.[ORDER_COMPLETE_DTE]),0) = '0'
				THEN ''
				ELSE CONVERT(VARCHAR(10),DATEDIFF(d,n.[CREATEDTE],n.[ORDER_COMPLETE_DTE]),121) 
				END AS ATTD
		,ISNULL(SUBSTRING(n.[BUSNAME],CHARINDEX(',',REPLACE(n.[BUSNAME],' ','')) + 1, LEN(n.[BUSNAME]))
			+ ' '
			+ LEFT(n.[BUSNAME],CHARINDEX(',',n.[BUSNAME]) -1),'') AS [Business Name 2]
		/*,[CSGSYS]
		,[CSGPRIN]
		,[origdate]
		,[COM_CHSI_MRC]
		,[COM_CDV_MRC]
		,[COM_BASIC_MRC]
		,[repstatus]*/
FROM [RptCB].[Ext].[v_WSTCommDiscoNDW] n
	LEFT JOIN [WISDM].[Dim].[Date] d ON n.[ORDER_COMPLETE_DTE] = d.[DATE_ID]
WHERE [ORDER_COMPLETE_DTE] BETWEEN '09-22-2019' AND '10-21-2019'