SELECT POI.[GROUPING],     
       SFOV.ORDER_ID,  
       DIVISION,
       CASE WHEN REGION = 'CALIFORNIA REGION' THEN 'California'
              WHEN REGION = 'HOUSTON REGION' THEN 'Houston'
              WHEN REGION = 'MOUNTAIN WEST REGION' THEN 'Mountain West'
              WHEN REGION = 'PORTLAND REGION' THEN 'Portland'
              WHEN REGION = 'SEATTLE REGION' THEN 'Seattle'
              WHEN REGION = 'TWIN CITIES REGION' THEN 'Twin Cities'
                     ELSE NULL END AS REGION,
       CAST (EVENT_DATE AS DATE) AS EVENT_DATE,
       AGENT,
       CASE WHEN SFOV.ACCT_SCOPE = 'BAE' THEN 'BAE'
              WHEN SFOV.ACCT_SCOPE = 'BSR' THEN 'BSR'
              WHEN SFOV.ACCT_SCOPE = 'CAM' THEN 'CAM'
              WHEN SFOV.ACCT_SCOPE = 'CARE' THEN 'Care'
              WHEN SFOV.ACCT_SCOPE = 'CDA' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'DOTCOM' THEN 'Web Buy Flow'
              WHEN SFOV.ACCT_SCOPE = 'ENTERPRISE' THEN 'Enterprise'
              WHEN SFOV.ACCT_SCOPE = 'FOS' THEN 'FOS'
              WHEN SFOV.ACCT_SCOPE = 'INDIRECT' THEN 'Indirect'
              WHEN SFOV.ACCT_SCOPE = 'MSP' THEN 'MSP'
              WHEN SFOV.ACCT_SCOPE = 'NATIONAL' THEN 'National'
              WHEN SFOV.ACCT_SCOPE = 'OBSR' THEN 'Core'
              WHEN SFOV.ACCT_SCOPE = 'OBSR LIST' THEN 'Core'
              WHEN SFOV.ACCT_SCOPE = 'OFT' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'OTHER' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'RETENTION' THEN 'Retention'
              WHEN SFOV.ACCT_SCOPE = 'SR BAE' THEN 'Sr BAE'
              WHEN SFOV.ACCT_SCOPE = 'STRATEGIC NATIONAL' THEN 'National'
              WHEN SFOV.ACCT_SCOPE = 'WEB CHAT' THEN 'Chat'
              WHEN SFOV.ACCT_SCOPE = 'WEB SALES' THEN 'Web'
                     ELSE NULL END AS ROLE
              ,CASE WHEN REGION = 'CALIFORNIA REGION' THEN 'California'
              WHEN REGION = 'HOUSTON REGION' THEN 'Houston'
              WHEN REGION = 'MOUNTAIN WEST REGION' THEN 'Mountain West'
              WHEN REGION = 'PORTLAND REGION' THEN 'Portland'
              WHEN REGION = 'SEATTLE REGION' THEN 'Seattle'
              WHEN REGION = 'TWIN CITIES REGION' THEN 'Twin Cities'
                     ELSE NULL END
              + CASE WHEN SFOV.ACCT_SCOPE = 'BAE' THEN 'BAE'
              WHEN SFOV.ACCT_SCOPE = 'BSR' THEN 'BSR'
              WHEN SFOV.ACCT_SCOPE = 'CAM' THEN 'CAM'
              WHEN SFOV.ACCT_SCOPE = 'CARE' THEN 'Care'
              WHEN SFOV.ACCT_SCOPE = 'CDA' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'DOTCOM' THEN 'Web Buy Flow'
              WHEN SFOV.ACCT_SCOPE = 'ENTERPRISE' THEN 'Enterprise'
              WHEN SFOV.ACCT_SCOPE = 'FOS' THEN 'FOS'
              WHEN SFOV.ACCT_SCOPE = 'INDIRECT' THEN 'Indirect'
              WHEN SFOV.ACCT_SCOPE = 'MSP' THEN 'MSP'
              WHEN SFOV.ACCT_SCOPE = 'NATIONAL' THEN 'National'
              WHEN SFOV.ACCT_SCOPE = 'OBSR' THEN 'Core'
              WHEN SFOV.ACCT_SCOPE = 'OBSR LIST' THEN 'Core'
              WHEN SFOV.ACCT_SCOPE = 'OFT' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'OTHER' THEN 'Other'
              WHEN SFOV.ACCT_SCOPE = 'RETENTION' THEN 'Retention'
              WHEN SFOV.ACCT_SCOPE = 'SR BAE' THEN 'Sr BAE'
              WHEN SFOV.ACCT_SCOPE = 'STRATEGIC NATIONAL' THEN 'National'
              WHEN SFOV.ACCT_SCOPE = 'WEB CHAT' THEN 'Chat'
              WHEN SFOV.ACCT_SCOPE = 'WEB SALES' THEN 'Web'
                     ELSE NULL END
              + POI.[GROUPING] AS CONCAT
FROM /*ExternalUser.WorkBench.[SALES_FLASH_ORDER_VIEW]*/ dbo.[SALES_FLASH_ORDER_VIEW] SFOV WITH (NOLOCK)
INNER JOIN /*ExternalUser.WorkBench.[WB_FACT_POI]*/ dbo.[WB_FACT_POI] POI ON SFOV.ORDER_ID = POI.OPP_ID
WHERE POI.[GROUPING] IN ('VoiceEdge Select','Connection Pro','WiFi Pro')
       AND SFOV.ORDER_ID NOT LIKE '%-%'
       AND DIVISION = 'West Division'
       AND EVENT_DATE BETWEEN '2018-11-22' AND '2018-12-22' --UPDATE EVERY MONTH
ORDER BY EVENT_DATE
