/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SYS_OHI]
      ,[PRIN_OHI]
      ,[AGNT_OHI]
      ,[ACCT_STAGE_OHI]
      ,[ACCT_TRANS_FLG_OHI]
      ,[ACTIVATED_DTE_OHI]
      ,[AFT_QTY_OHI]
      ,[BEF_QTY_OHI]
      ,[BID_OHI]
      ,[BILL_AMT_OHI]
      ,[BILL_CDE_OHI]
      ,[BILL_FROM_DTE_OHI]
      ,[BILL_START_DTE_OHI]
      ,[BILL_STOP_DTE_OHI]
      ,[BILL_THRU_DTE_OHI]
      ,[CAMP_CDE_OHI]
      ,[CHARGE_AMT_OHI]
      ,[CONNECT_DTE_OHI]
      ,[CREATE_DTE_OHI]
      ,[CUST_DSC_CDE_OHI]
      ,[CUST_DSC_END_DTE_OHI]
      ,[CUST_DSC_START_DTE_OHI]
      ,[CUST_ACCT_NO_OHI]
      ,[CUST_LOC_STAGE_OHI]
      ,[CYC_ADD_DTE_OHI]
      ,[CYC_CHG_DTE_OHI]
      ,[DEACTIVATED_DTE_OHI]
      ,[DFLT_CHRG_IND_OHI]
      ,[DISCO_DTE_OHI]
      ,[DSC_CDE_OHI]
      ,[DSC_END_DTE_OHI]
      ,[DSC_GROUP_OHI]
      ,[DSC_GROUP_START_DTE_OHI]
      ,[DSC_START_DTE_OHI]
      ,[ENTRY_DTE_OHI]
      ,[ENTRY_DTE_TME_OHI]
      ,[ENTRY_OP_ID_OHI]
      ,[ENTRY_TERM_ID_OHI]
      ,[ENTRY_TME_OHI]
      ,[HSE_KEY_OHI]
      ,[ITEM_STATUS_OHI]
      ,[ITEM_TYP_OHI]
      ,[JOB_SEQ_NO_OHI]
      ,[LOB_ACCT_STAGE_OHI]
      ,[LOB_ACT_OHI]
      ,[LS_CHG_DTE_OHI]
      ,[LS_CHG_TME_OHI]
      ,[LS_CHG_USER_ID_OHI]
      ,[NET_CHG_OHI]
      ,[NO_INSTALL_OHI]
      ,[OFFER_ID_OHI]
      ,[ORDER_NO_OHI]
      ,[OUTLET_OHI]
      ,[SALESREP_OHI]
      ,[SEQ_NO_OHI]
      ,[SERV_CDE_OHI]
      ,[SERV_ID_OHI]
      ,[SOURCE_TYP_OHI]
      ,[SUB_ACCT_NO_OHI]
      ,[SUSP_START_DTE_OHI]
      ,[SUSP_STOP_DTE_OHI]
      ,[VERSION_NO_OHI]
      ,[ETF_CDE_OHI]
      ,[ETF_END_DTE_OHI]
      ,[ETF_SEASONAL_DAYS_OHI]
      ,[ETF_START_DTE_OHI]
      ,[ETF_START_DTE_OVRRD_IND_OHI]
      ,[ETF_TRIGGER_SID_OHI]
      ,[ETF_WAIVE_IND_OHI]
      ,[CLASS_CHOIC_PRICE_PLAN_ID_OHI]
      ,[CLASS_SERV_CDE_OHI]
      ,[CLIENT_INIT_SERV_CHG_OHI]
      ,[CUST_DSC_APP_SEQ_NO_OHI]
      ,[CUST_DSC_GROUP_OHI]
      ,[ITEM_REFERENCE_OHI]
      ,[MIGRATION_BID_OHI]
      ,[MIGRATION_CDE_OHI]
      ,[MKTG_SOURCE_OHI]
      ,[OFFER_COMP_ID_OHI]
      ,[OFFER_MGT_PARENT_SERV_ID_OHI]
      ,[OFFER_MGT_ROOT_SERV_ID_OHI]
      ,[ORIG_OFFER_ID_OHI]
      ,[ORIG_PRICE_PLAN_ID_OHI]
      ,[ORIG_PRICE_PLAN_START_DTE_OHI]
      ,[PENALTY_ITEM_SID_OHI]
      ,[PENALTY_OFFER_ID_OHI]
      ,[PRICE_PLAN_ID_OHI]
      ,[PRICE_PLAN_START_DTE_OHI]
      ,[PRODUCT_ID_OHI]
      ,[RATE_AREA_OHI]
      ,[REMOTE_UPDATE_OHI]
      ,[TAX_AREA_OHI]
      ,[CURR_OFFER_END_DTE_OHI]
      ,[MCP_PROMO_CHG_DTE_OHI]
      ,[PROMO_CHAIN_END_DTE_OHI]
  FROM [ExternalUser].[Vantage].[OHI_HIST_ITEM]