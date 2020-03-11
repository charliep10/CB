USE RptCB;

SELECT B.[Region] AS OMRegion
                     ,B.[dteOrderAccepted] AS OMdteOrderAccepted
                     ,B.[Role] AS OMRole
                     ,ISNULL(A.[REGION], B.[Region]) AS ModRegion
                     ,A.[REGION]
                     ,A.[DIVISION]
                     --,A.[SALE]
					,CASE WHEN A.SALE_DATE BETWEEN '2019-03-22' AND '2019-04-21' THEN 'SALE' ELSE NULL END AS SALE
					,CASE WHEN A.CONNECT_DATE BETWEEN '2019-03-22' AND '2019-04-21' THEN 'CONNECT' ELSE NULL END AS CONNECT
					,CASE WHEN A.CANCEL_DATE BETWEEN '2019-03-22' AND '2019-04-21' THEN 'CANCEL' ELSE NULL END AS CANCEL
                     --,A.[CONNECT1]
                     --,A.[CANCEL1]
                     ,A.[ORDERID]
                     ,A.[SUBID]
                     ,A.[PERNR]
                     ,A.[NTLOGIN]
                     ,A.[REP_TYPE]
                     ,A.[REP_SCOPE]
                     ,A.[ROLE]
                     ,A.[CORP_SYSPRIN]
                     ,A.[CUSTOMER_REGION]
                     ,A.[CUSTOMER_DIVISION]
                     ,A.[ACCOUNT_NAME]
                     ,A.[ACCOUNT_SCOPE]
                     ,A.[MULTI_SITE_INDICATOR]
                     ,A.[SALE_DATE]
                     ,A.[CONNECT_DATE]
                     ,A.[CANCEL_DATE]
                     ,A.[LEAD_SOURCE]
                     ,A.[LEAD_ASSIGN_DATE]
                     ,A.[BILLING_SYSTEM]
                     ,A.[ACCOUNT_NUMBER]
                     ,A.[SAVILLE_ACCOUNT_NUMBER]
                     ,A.[EVENT_DATE]
                     ,A.[CANCEL_OWNER_FIRST_NAME]
                     ,A.[CANCEL_OWNER_LAST_NAME]
                     ,A.[CANCEL_OWNER_PERNR]
                     ,A.[CANCEL_REASON]
                     ,A.[SUBMIT_ORDER_DATE]
                     ,A.[EXISTING_CUSTOMER]
                     ,A.[TERM]
                     ,A.[BUNDLE]
                     ,A.[PROMO]
                     ,A.[PROMO_DESCRIPTION]
                     ,A.[PROMO_$]
                     ,A.[DISCOUNT]
                     ,A.[SURVEY_TYPE]
                     ,A.[SERVICEABILITY]
                     ,A.[CONSTRUCTION_$]
                     ,A.[ADDRESS_1]
                     ,A.[ADDRESS_2]
                     ,A.[CITY]
                     ,A.[STATE]
                     ,A.[ZIP]
                     ,A.[CONTRACT_ATTACHMENT]
                     ,A.[ATTACHMENT_TYPE]
                     ,A.[OA_TASK_OWNER]
                     ,A.[OA_OWNER_PERNR]
                     ,A.[DELEGATE_PERNR]
                     ,A.[DELEGATE_FIRST_NAME]
                     ,A.[DELEGATE_LAST_NAME]
                    ,A.[DATA_EXISTING]
                     ,A.[ADDL_MODEM]
                     ,A.[DATA_SOLD]
                     ,A.[DATA_PRIMARY_PRODUCT]
                     ,A.[DATA_REVENUE]
                     ,A.[VIDEO_EXISTING]
                     ,A.[VIDEO_SOLD]
                     ,A.[VIDEO_PRIMARY_PRODUCT]
                     ,A.[VIDEO_REVENUE]
                     ,A.[VOICE_EXISTING]
                     ,A.[ADDL_LINES]
                     ,A.[VOICE_SOLD]
                     ,A.[PRIMARY_VOICE_PRODUCT]
                     ,A.[VOICE_REVENUE]
                     ,A.[NUMBER_VOICE_LINES]
                     ,A.[PRI_EXISTING]
                     ,A.[ADDL_PRI]
                     ,A.[PRI_SOLD]
                     ,A.[PRIMARY_PRI_PRODUCT]
                     ,A.[PRI_REVENUE]
                     ,A.[CHANNELS]
                     ,A.[SO_EXISTING]
                     ,A.[SO_SOLD]
                     ,A.[SO_PRIMARY_PRODUCT_NAME]
                     --,A.[PRIMARY_SO_REVENUE]
                     --,A.[SECONDARY_SO_REVENUE]
                     ,A.[SO_REVENUE]
                     --,A.[SO_DISCOUNT]
                     ,A.[INSTALL_FEES]
                     ,A.[NRC]
                     ,A.[WB_REP_LOGIN_ID]
                     ,A.[NETWORK_TYPE]
                     ,A.[PRI_TRANSFER_IND]
                     ,A.[VERTICAL]
                     ,A.[SITE_ID]
                     ,A.[SF_ACCOUNT_ID]
                     ,A.[PARENT_ACCOUNT_ID]
                     ,A.[ROOT_ACCOUNT_ID]
                     ,A.[RENEWAL_FLAG]
                     ,A.[CAMPAIGN_CODE]
                     --,A.[DATA_DISCOUNT]
                     --,A.[VIDEO_DISCOUNT]
                     --,A.[VOICE_DISCOUNT]
                     ,A.[LOADDATETIME]
       FROM   [ExternalUser].[iCoMP].[t_WSTCBSTransactionData] AS A
                     JOIN [Ext].[v_WSTSFDCiCompSMBOrdersMart] (NOLOCK) AS B ON B.[WorkBenchID] = A.[ORDERID]
       WHERE  1=1
                     AND B.[dteOrderCancelled] IS NULL
                     AND (  (A.DATA_EXISTING = 'NO'
                                         AND A.DATA_SOLD = 'YES')
                                  OR (A.VOICE_EXISTING = 'NO'
                                         AND A.VOICE_SOLD = 'YES')
                                  OR (A.VIDEO_EXISTING = 'NO'
                                         AND A.VIDEO_SOLD = 'YES')
                                  OR (A.PRI_EXISTING = 'NO' --1.0
                                         AND A.PRI_SOLD = 'YES')
								  OR (A.SO_EXISTING = 'NO' --1.0
                                         AND A.SO_SOLD = 'YES')
                           )
                     AND (A.SALE_DATE BETWEEN '2019-03-22' AND '2019-04-21'
                          OR A.CONNECT_DATE BETWEEN '2019-03-22' AND '2019-04-21'
                           OR A.CANCEL_DATE BETWEEN '2019-03-22' AND '2019-04-21'
                           )
GO
