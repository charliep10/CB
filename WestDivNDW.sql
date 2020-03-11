--ROBERT TERRY
SELECT ORDER_COMPLETE_DTE
	,[REGION]
	,[DATA_SOURCE]
	,[PROD_NAME]
	,CASE WHEN [PROD_NAME] = 'BUSINESS INTERNET' THEN 'Data'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' THEN 'EDI'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' THEN 'PN'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' THEN 'Voice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' THEN 'VES'
			WHEN [PROD_NAME] = 'PRI' THEN 'PRI'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' THEN 'BVE'
			WHEN [PROD_NAME] IN ('BUSINESS VIDEO PRIVATE','BUSINESS VIDEO PUBLIC') THEN 'Video'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' THEN 'SmartOffice'
			WHEN [PROD_NAME] IN ('BUSINESS CLASS TELEWORKER STANDARD','BUSINESS CLASS TELEWORKER ENHANCED','BUSINESS CLASS TELEWORKER DELUXE','BUSINESS CLASS TELEWORKER PREMIUM') THEN 'Teleworker'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') THEN 'WiFi Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') THEN 'Connection Pro'
			WHEN [PROD_NAME] = 'SECURITYEDGE - COMMERCIAL' THEN 'SecurityEdge'
			ELSE 'Other' END AS 'PRODUCT'
	,[ORD_TYPE]
	,[NET_QTY] AS NET_QTY
	,CASE WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxData'
			WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxData'
			WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayData'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxEDI'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxEDI'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayEDI'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxPN'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxPN'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayPN'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='WODM' THEN 'Total CxVES'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'WODM' THEN 'VoluntaryVES'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVES'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxPRI'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxPRI'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayPRI'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxBVE'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxBVE'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayBVE'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] IN ('NDW','UCBL') THEN 'Total CxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] IN ('NDW','UCBL') THEN 'Total DxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'UCBL' THEN 'Total CxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'UCBL' THEN 'Total DxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVideo'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='WODM' THEN 'Total CxSmartOffice'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'WODM' THEN 'VoluntarySmartOffice'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PaySmartOffice'
			WHEN [PROD_NAME] IN ('BUSINESS CLASS TELEWORKER STANDARD','BUSINESS CLASS TELEWORKER ENHANCED','BUSINESS CLASS TELEWORKER DELUXE','BUSINESS CLASS TELEWORKER PREMIUM') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxTeleworker'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxWiFi Pro'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxWiFi Pro'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayWiFi Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxConnection Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxConnection Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayConnection Pro'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxSecurityEdge'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxSecurityEdge'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PaySecurityEdge'			
			ELSE NULL END AS 'ORDER_TYPE'
	,[REGION]
	+CASE WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxData'
			WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxData'
			WHEN [PROD_NAME] = 'BUSINESS INTERNET' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayData'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxEDI'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxEDI'
			WHEN [PROD_NAME] = 'BUSINESS CLASS ETHERNET - EDI' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayEDI'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxPN'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxPN'
			WHEN [PROD_NAME] = 'ETHERNET PRIVATE NETWORK' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayPN'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVoice'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='WODM' THEN 'Total CxVES'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'WODM' THEN 'VoluntaryVES'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE SELECT' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVES'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxPRI'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxPRI'
			WHEN [PROD_NAME] = 'PRI' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayPRI'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='NDW' THEN 'Total CxBVE'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxBVE'
			WHEN [PROD_NAME] = 'BUSINESS VOICE EDGE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayBVE'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] IN ('NDW','UCBL') THEN 'Total CxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] IN ('NDW','UCBL') THEN 'Total DxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PRIVATE' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'UCBL' THEN 'Total CxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'UCBL' THEN 'Total DxVideo'
			WHEN [PROD_NAME] = 'BUSINESS VIDEO PUBLIC' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayVideo'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] ='WODM' THEN 'Total CxSmartOffice'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'WODM' THEN 'VoluntarySmartOffice'
			WHEN [PROD_NAME] = 'SMART OFFICE - COMMERCIAL' AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PaySmartOffice'
			WHEN [PROD_NAME] IN ('BUSINESS CLASS TELEWORKER STANDARD','BUSINESS CLASS TELEWORKER ENHANCED','BUSINESS CLASS TELEWORKER DELUXE','BUSINESS CLASS TELEWORKER PREMIUM') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxTeleworker'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxWiFi Pro'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxWiFi Pro'
			WHEN [PROD_NAME] IN ('SV WIFI PRO','LB WIFI PRO') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayWiFi Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxConnection Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxConnection Pro'
			WHEN [PROD_NAME] IN ('CONNECTION PRO SERVICE FEE - COMMERCIAL','SV CONNECTION PRO','CONNECTION PRO','CONNECTION PRO - SINGLEVIEW') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PayConnection Pro'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'CON' AND [DATA_SOURCE] = 'NDW' THEN 'Total CxSecurityEdge'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'VOL' AND [DATA_SOURCE] = 'NDW' THEN 'Total DxSecurityEdge'
			WHEN [PROD_NAME] IN ('SECURITYEDGE - COMMERCIAL') AND [ORD_TYPE] = 'NOP' AND [DATA_SOURCE] = 'WODM' THEN 'Non-PaySecurityEdge'			
			ELSE NULL END AS CONCATENATION
FROM [RptFin].[ext].[v_ExcelSummaryDOR_Comp60]
  WHERE [ORDER_COMPLETE_DTE] BETWEEN '2019-09-22' AND '2019-10-21' --UPDATE EVERY MONTH
		AND [PROD_NAME] IN ('BUSINESS INTERNET'
					,'BUSINESS CLASS ETHERNET - EDI'
					,'ETHERNET PRIVATE NETWORK'
					,'BUSINESS VOICE'
					,'BUSINESS VOICE EDGE SELECT'
					,'PRI'
					,'BUSINESS VOICE EDGE'
					,'BUSINESS VIDEO PRIVATE'
					,'BUSINESS VIDEO PUBLIC'
					,'SMART OFFICE - COMMERCIAL'
					,'BUSINESS CLASS TELEWORKER STANDARD'
					,'BUSINESS CLASS TELEWORKER ENHANCED'
					,'SV WIFI PRO'
					,'LB WIFI PRO'
					,'CONNECTION PRO SERVICE FEE - COMMERCIAL'
					,'SV CONNECTION PRO'
					,'CONNECTION PRO'
					,'CONNECTION PRO - SINGLEVIEW'
					,'SECURITYEDGE - COMMERCIAL')
		AND [DATA_SOURCE] IN ('NDW'
							,'WODM'
							,'UCBL')
		AND [REGION] IN ('WEST DIVISION'
						,'CALIFORNIA'
						,'HOUSTON'
						,'MOUNTAIN WEST'
						,'PORTLAND'
						,'SEATTLE'
						,'TWIN CITIES')