SELECT F.*,
	CAST(event_date as Date) as event_date_short
FROM BUSSERV_DW_DEV.DBO.SALES_FLASH_SF_DAILY F
WHERE LINE_OF_BUSINESS = 'VOICEEDGE SELECT'
	AND Division_Name = 'West Division'
