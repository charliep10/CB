USE [RptCB]
GO
/****** Object:  StoredProcedure [Rpt].[p_WSTRegionLongitudinal]    Script Date: 2/2/2018 12:31:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- USE CTRL SHIFT M shortcut to fill out brackets below.
-- SSMS TEMPLATE LOCATION (64bit):
-- C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\SqlWorkbenchProjectItems\Sql\Stored Procedure

-- =============================================
-- Process:         rpt.p_WSTRegionLongitudinal
-- Create date:     3/1/17
-- Author:          Zachary Magee
-- Description:     Pulls gross sales from iComp and derives number of sales that were connected by month.
-- Ticket:          47717
-- Supports:		C:\BIS\WDBIS\BISProjects\CB\WestBISSSRS\WSTRegionLongitudinal\WSTRegionLongitudinal - Video.rdl
--					C:\BIS\WDBIS\BISProjects\CB\WestBISSSRS\WSTRegionLongitudinal\WSTRegionLongitudinal - Data.rdl
--					C:\BIS\WDBIS\BISProjects\CB\WestBISSSRS\WSTRegionLongitudinal\WSTRegionLongitudinal - Voice.rdl
--					C:\BIS\WDBIS\BISProjects\CB\WestBISSSRS\WSTRegionLongitudinal\WSTRegionLongitudinal - PRI.rdl
--					C:\BIS\WDBIS\BISProjects\CB\WestBISSSRS\WSTRegionLongitudinal\WSTRegionLongitudinal - BVE.rdl
-- Modifications: 
-- Test:            EXEC rpt.p_WSTRegionLongitudinal @Region = 'West Division';
-- =============================================
ALTER PROCEDURE [Rpt].[p_WSTRegionLongitudinal]

--Declare parameters

@Region AS VARCHAR(25)
       
AS
BEGIN
SET NOCOUNT ON;

WITH baseCte1 AS 
(
SELECT
	 td.REGION
	,CASE WHEN pr.title IN ('BAE I','BAE II','Busines-Acct-Exec-I','Busines-Acct-Exec-II') THEN 'BAE'
		  WHEN pr.title IN ('Sr-Bus-Services-Acct-Exec','Sr BAE') THEN 'Sr. BAE'
		  WHEN pr.title IN ('BSR') THEN 'BSR'
		  WHEN pr.title IN ('OBSR') THEN 'OBSR Core'
		  WHEN pr.title IN ('OBSRW') THEN 'OBSR Web'
		  WHEN pr.title IN ('EAE','Enterprise-Account-Executive') THEN 'Enterprise'
		  ELSE 'Other'
	 END AS role
	,d1.fiscal_month_id AS sale_month_id
	,d1.fiscal_month_start AS sale_month_start
	,SUM(CASE WHEN td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS data_sales
	,SUM(CASE WHEN d2.fiscal_month_id = d1.fiscal_month_id AND td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS in_month_data
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,1,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_one_data 
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,2,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_two_data
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,3,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_three_data 
	,SUM(CASE WHEN td.CANCEL_DATE IS NOT NULL AND  td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS data_cancels 
	,SUM(CASE WHEN td.CANCEL_DATE IS NULL AND td.CONNECT_DATE IS NULL AND  td.DATA_SOLD = 'YES' AND td.DATA_EXISTING = 'NO' THEN 1 ELSE 0 END) AS data_opens
	,SUM(CASE WHEN td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS voice_sales
	,SUM(CASE WHEN d2.fiscal_month_id = d1.fiscal_month_id AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS in_month_voice
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,1,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_one_voice 
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,2,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_two_voice
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,3,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_three_voice 
	,SUM(CASE WHEN td.CANCEL_DATE IS NOT NULL AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS voice_cancels 
	,SUM(CASE WHEN td.CANCEL_DATE IS NULL AND td.CONNECT_DATE IS NULL AND td.VOICE_SOLD = 'YES' AND td.VOICE_EXISTING = 'NO' THEN 1 ELSE 0 END) AS voice_opens
	,SUM(CASE WHEN td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS video_sales
	,SUM(CASE WHEN d2.fiscal_month_id = d1.fiscal_month_id AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS in_month_video
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,1,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_one_video 
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,2,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_two_video
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,3,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS month_plus_three_video 
	,SUM(CASE WHEN td.CANCEL_DATE IS NOT NULL AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS video_cancels 
	,SUM(CASE WHEN td.CANCEL_DATE IS NULL AND td.CONNECT_DATE IS NULL AND td.VIDEO_SOLD = 'YES' AND td.VIDEO_EXISTING = 'NO' THEN 1 ELSE 0 END) AS video_opens
	,SUM(CASE WHEN td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS pri_sales
	,SUM(CASE WHEN d2.fiscal_month_id = d1.fiscal_month_id AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS in_month_pri
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,1,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS month_plus_one_pri 
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,2,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS month_plus_two_pri
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,3,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS month_plus_three_pri 
	,SUM(CASE WHEN td.CANCEL_DATE IS NOT NULL AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS pri_cancels 
	,SUM(CASE WHEN td.CANCEL_DATE IS NULL AND td.CONNECT_DATE IS NULL AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%PRI%' THEN 1 ELSE 0 END) AS pri_opens
	,SUM(CASE WHEN td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS bve_sales
	,SUM(CASE WHEN d2.fiscal_month_id = d1.fiscal_month_id AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS in_month_bve
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,1,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS month_plus_one_bve 
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,2,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS month_plus_two_bve
	,SUM(CASE WHEN d2.fiscal_month_id = LEFT(CONVERT(VARCHAR,DATEADD(m,3,CONVERT(datetime,d1.fiscal_month_id + '01',112)),112),6) AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS month_plus_three_bve 
	,SUM(CASE WHEN td.CANCEL_DATE IS NOT NULL AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS bve_cancels 
	,SUM(CASE WHEN td.CANCEL_DATE IS NULL AND td.CONNECT_DATE IS NULL AND td.PRI_SOLD = 'YES' AND td.PRI_EXISTING = 'NO' AND td.PRIMARY_PRI_PRODUCT LIKE '%BVE%' THEN 1 ELSE 0 END) AS bve_opens
FROM
	ExternalUser.iCoMP.t_WSTCBSTransactionData AS td
		INNER JOIN WISDM.Dim.Date AS d1
			ON td.SALE_DATE = d1.date_id
		LEFT JOIN WISDM.Dim.Date AS d2
			ON td.CONNECT_DATE = d2.date_id
		INNER JOIN ExternalUser.iComp.Z_BUS_PAYEEROSTER_WEST_VW AS pr
			ON td.PERNR = pr.EMPLOYEE_PERNR AND
			   REPLACE(d1.FISCAL_MONTH_DESC,',','') = pr.PERIODNAME 
WHERE
	td.division = 'West Division' AND
	td.SALE_DATE >= DATEADD(yy,-2,(DATEADD(MONTH,DATEDIFF(MONTH,0,GETDATE())-1,0)))
GROUP BY
	 td.region
	,d1.fiscal_month_id
	,d1.fiscal_month_start
	,pr.title
),

baseCte2 AS
(
SELECT
	 region
	,CASE WHEN role IN ('BAE','Sr. BAE','BSR','OBSR Core','OBSR Web','Enterprise','Other') THEN 'All Roles' ELSE role END AS role
	,sale_month_id
	,sale_month_start
	,data_sales
	,in_month_data
	,month_plus_one_data
	,month_plus_two_data
	,month_plus_three_data
	,data_cancels
	,data_opens
	,voice_sales
	,in_month_voice
	,month_plus_one_voice
	,month_plus_two_voice
	,month_plus_three_voice
	,voice_cancels
	,voice_opens
	,video_sales
	,in_month_video
	,month_plus_one_video
	,month_plus_two_video
	,month_plus_three_video
	,video_cancels
	,video_opens
	,pri_sales
	,in_month_pri
	,month_plus_one_pri
	,month_plus_two_pri
	,month_plus_three_pri
	,pri_cancels
	,pri_opens
	,bve_sales
	,in_month_bve
	,month_plus_one_bve
	,month_plus_two_bve
	,month_plus_three_bve
	,bve_cancels
	,bve_opens
FROM
	baseCte1
),

baseCte AS
(
SELECT
	 region
	,role
	,sale_month_id
	,sale_month_start
	,SUM(data_sales) AS data_sales
	,SUM(in_month_data) AS in_month_data
	,SUM(month_plus_one_data) AS month_plus_one_data
	,SUM(month_plus_two_data) AS month_plus_two_data
	,SUM(month_plus_three_data) AS month_plus_three_data
	,SUM(data_cancels) AS data_cancels
	,SUM(data_opens) AS data_opens
	,SUM(voice_sales) AS voice_sales
	,SUM(in_month_voice) AS in_month_voice
	,SUM(month_plus_one_voice) AS month_plus_one_voice
	,SUM(month_plus_two_voice) AS month_plus_two_voice
	,SUM(month_plus_three_voice) AS month_plus_three_voice
	,SUM(voice_cancels) AS voice_cancels
	,SUM(voice_opens) AS voice_opens
	,SUM(video_sales) AS video_sales
	,SUM(in_month_video) AS in_month_video
	,SUM(month_plus_one_video) AS month_plus_one_video
	,SUM(month_plus_two_video) AS month_plus_two_video
	,SUM(month_plus_three_video) AS month_plus_three_video
	,SUM(video_cancels) AS video_cancels
	,SUM(video_opens) AS video_opens
	,SUM(pri_sales) AS pri_sales
	,SUM(in_month_pri) AS in_month_pri
	,SUM(month_plus_one_pri) AS month_plus_one_pri
	,SUM(month_plus_two_pri) AS month_plus_two_pri
	,SUM(month_plus_three_pri) AS month_plus_three_pri
	,SUM(pri_cancels) AS pri_cancels
	,SUM(pri_opens) AS pri_opens
	,SUM(bve_sales) AS bve_sales
	,SUM(in_month_bve) AS in_month_bve
	,SUM(month_plus_one_bve) AS month_plus_one_bve
	,SUM(month_plus_two_bve) AS month_plus_two_bve
	,SUM(month_plus_three_bve) AS month_plus_three_bve
	,SUM(bve_cancels) AS bve_cancels
	,SUM(bve_opens) AS bve_opens
FROM
	baseCte2
WHERE
	role <> 'Other'
GROUP BY
	 region
	,role
	,sale_month_id
	,sale_month_start

UNION ALL

SELECT
	 region
	,role
	,sale_month_id
	,sale_month_start
	,data_sales
	,in_month_data
	,month_plus_one_data
	,month_plus_two_data
	,month_plus_three_data
	,data_cancels
	,data_opens
	,voice_sales
	,in_month_voice
	,month_plus_one_voice
	,month_plus_two_voice
	,month_plus_three_voice
	,voice_cancels
	,voice_opens
	,video_sales
	,in_month_video
	,month_plus_one_video
	,month_plus_two_video
	,month_plus_three_video
	,video_cancels
	,video_opens
	,pri_sales
	,in_month_pri
	,month_plus_one_pri
	,month_plus_two_pri
	,month_plus_three_pri
	,pri_cancels
	,pri_opens
	,bve_sales
	,in_month_bve
	,month_plus_one_bve
	,month_plus_two_bve
	,month_plus_three_bve
	,bve_cancels
	,bve_opens
FROM
	baseCte1
),

finalCte AS 
(
SELECT
	 'West Division' AS region
	,role
	,sale_month_id
	,sale_month_start
	,SUM(data_sales) AS data_sales
	,(SUM(in_month_data) + SUM(month_plus_one_data) + SUM(month_plus_two_data) + SUM(month_plus_three_data)) / (SUM(NULLIF(data_sales,0) * 1.0)) AS total_percent_data
	,SUM(in_month_data) AS in_month_data
	,(SUM(in_month_data) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS in_month_percent_data
	,SUM(month_plus_one_data) AS month_plus_one_data
	,(SUM(month_plus_one_data) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS month_plus_one_percent_data
	,SUM(month_plus_two_data) AS month_plus_two_data
	,(SUM(month_plus_two_data) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS month_plus_two_percent_data
	,SUM(month_plus_three_data) AS month_plus_three_data
	,(SUM(month_plus_three_data) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS month_plus_three_percent_data
	,SUM(data_cancels) AS data_cancels
	,(SUM(data_cancels) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS data_cancels_percent
	,SUM(data_opens) AS data_opens
	,(SUM(data_opens) / (SUM(NULLIF(data_sales,0)) * 1.0)) AS data_opens_percent
	,SUM(voice_sales) AS voice_sales
	,(SUM(in_month_voice) + SUM(month_plus_one_voice) + SUM(month_plus_two_voice) + SUM(month_plus_three_voice)) / (SUM(NULLIF(voice_sales,0) * 1.0)) AS total_percent_voice
	,SUM(in_month_voice) AS in_month_voice
	,(SUM(in_month_voice) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS in_month_percent_voice
	,SUM(month_plus_one_voice) AS month_plus_one_voice
	,(SUM(month_plus_one_voice) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS month_plus_one_percent_voice
	,SUM(month_plus_two_voice) AS month_plus_two_voice
	,(SUM(month_plus_two_voice) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS month_plus_two_percent_voice
	,SUM(month_plus_three_voice) AS month_plus_three_voice
	,(SUM(month_plus_three_voice) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS month_plus_three_percent_voice
	,SUM(voice_cancels) AS voice_cancels
	,(SUM(voice_cancels) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS voice_cancels_percent
	,SUM(voice_opens) AS voice_opens
	,(SUM(voice_opens) / (SUM(NULLIF(voice_sales,0)) * 1.0)) AS voice_opens_percent
	,SUM(video_sales) AS video_sales
	,(SUM(in_month_video) + SUM(month_plus_one_video) + SUM(month_plus_two_video) + SUM(month_plus_three_video)) / (SUM(NULLIF(data_sales,0) * 1.0)) AS total_percent_video
	,SUM(in_month_video) AS in_month_video
	,(SUM(in_month_video) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS in_month_percent_video
	,SUM(month_plus_one_video) AS month_plus_one_video
	,(SUM(month_plus_one_video) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS month_plus_one_percent_video
	,SUM(month_plus_two_video) AS month_plus_two_video
	,(SUM(month_plus_two_video) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS month_plus_two_percent_video
	,SUM(month_plus_three_video) AS month_plus_three_video
	,(SUM(month_plus_three_video) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS month_plus_three_percent_video
	,SUM(video_cancels) AS video_cancels
	,(SUM(video_cancels) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS video_cancels_percent
	,SUM(video_opens) AS video_opens
	,(SUM(video_opens) / (SUM(NULLIF(video_sales,0)) * 1.0)) AS video_opens_percent
	,SUM(pri_sales) AS pri_sales
	,(SUM(in_month_pri) + SUM(month_plus_one_pri) + SUM(month_plus_two_pri) + SUM(month_plus_three_pri)) / (SUM(NULLIF(pri_sales,0) * 1.0)) AS total_percent_pri
	,SUM(in_month_pri) AS in_month_pri
	,(SUM(in_month_pri) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS in_month_percent_pri
	,SUM(month_plus_one_pri) AS month_plus_one_pri
	,(SUM(month_plus_one_pri) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS month_plus_one_percent_pri
	,SUM(month_plus_two_pri) AS month_plus_two_pri
	,(SUM(month_plus_two_pri) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS month_plus_two_percent_pri
	,SUM(month_plus_three_pri) AS month_plus_three_pri
	,(SUM(month_plus_three_pri) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS month_plus_three_percent_pri
	,SUM(pri_cancels) AS pri_cancels
	,(SUM(pri_cancels) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS pri_cancels_percent
	,SUM(pri_opens) AS pri_opens
	,(SUM(pri_opens) / (SUM(NULLIF(pri_sales,0)) * 1.0)) AS pri_opens_percent
	,SUM(bve_sales) AS bve_sales
	,(SUM(in_month_bve) + SUM(month_plus_one_bve) + SUM(month_plus_two_bve) + SUM(month_plus_three_bve)) / (SUM(NULLIF(bve_sales,0) * 1.0)) AS total_percent_bve
	,SUM(in_month_bve) AS in_month_bve
	,(SUM(in_month_bve) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS in_month_percent_bve
	,SUM(month_plus_one_bve) AS month_plus_one_bve
	,(SUM(month_plus_one_bve) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS month_plus_one_percent_bve
	,SUM(month_plus_two_bve) AS month_plus_two_bve
	,(SUM(month_plus_two_bve) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS month_plus_two_percent_bve
	,SUM(month_plus_three_bve) AS month_plus_three_bve
	,(SUM(month_plus_three_bve) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS month_plus_three_percent_bve
	,SUM(bve_cancels) AS bve_cancels
	,(SUM(bve_cancels) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS bve_cancels_percent
	,SUM(bve_opens) AS bve_opens
	,(SUM(bve_opens) / (SUM(NULLIF(bve_sales,0)) * 1.0)) AS bve_opens_percent
	--,(SUM(data_sales)) + (SUM(voice_sales)) + (SUM(video_sales)) + (SUM(pri_sales)) AS total_sales
	--,(SUM(in_month_data) + SUM(month_plus_one_data) + SUM(month_plus_two_data) + SUM(month_plus_three_data) +
	-- SUM(in_month_voice) + SUM(month_plus_one_voice) + SUM(month_plus_two_voice) + SUM(month_plus_three_voice) +
	-- SUM(in_month_video) + SUM(month_plus_one_video) + SUM(month_plus_two_video) + SUM(month_plus_three_video) +
	-- SUM(in_month_pri) + SUM(month_plus_one_pri) + SUM(month_plus_two_pri) + SUM(month_plus_three_pri)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS total_percent_total
	--,(SUM(in_month_data) + SUM(in_month_voice) + SUM(in_month_video) + SUM(in_month_pri)) AS in_month_total
	--,(SUM(in_month_data) + SUM(in_month_voice) + SUM(in_month_video) + SUM(in_month_pri)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS in_month_percent_total
	--,(SUM(month_plus_one_data) + SUM(month_plus_one_voice) + SUM(month_plus_one_video) + SUM(month_plus_one_pri)) AS month_plus_one_total
	--,(SUM(month_plus_one_data) + SUM(month_plus_one_voice) + SUM(month_plus_one_video) + SUM(month_plus_one_pri)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS month_plus_one_percent_total
	--,(SUM(month_plus_two_data) + SUM(month_plus_two_voice) + SUM(month_plus_two_video) + SUM(month_plus_two_pri)) AS month_plus_two_total
	--,(SUM(month_plus_two_data) + SUM(month_plus_two_voice) + SUM(month_plus_two_video) + SUM(month_plus_two_pri)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS month_plust_two_percent_total
	--,(SUM(month_plus_three_data) + SUM(month_plus_three_voice) + SUM(month_plus_three_video) + SUM(month_plus_three_pri)) AS month_plus_three_total
	--,(SUM(month_plus_three_data) + SUM(month_plus_three_voice) + SUM(month_plus_three_video) + SUM(month_plus_three_pri)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS month_plus_three_percent_total
	--,(SUM(data_cancels) + SUM(voice_cancels) + SUM(video_cancels) + SUM(pri_cancels)) AS total_cancels
	--,(SUM(data_cancels) + SUM(voice_cancels) + SUM(video_cancels) + SUM(pri_cancels)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS total_cancels_percent
	--,(SUM(data_opens) + SUM(voice_opens) + SUM(video_opens) + SUM(pri_opens)) AS total_opens
	--,(SUM(data_opens) + SUM(voice_opens) + SUM(video_opens) + SUM(pri_opens)) /
	-- (SUM(NULLIF(data_sales,0) * 1.0) + SUM(NULLIF(voice_sales,0) * 1.0) + SUM(NULLIF(video_sales,0) * 1.0) + SUM(NULLIF(pri_sales,0) * 1.0)) AS total_opens_percent
FROM
	baseCte
WHERE
	role IS NOT NULL
GROUP BY
	 role
	,sale_month_id
	,sale_month_start

UNION ALL

SELECT
	 region
	,role	
	,sale_month_id
	,sale_month_start
	,data_sales
	,(in_month_data + month_plus_one_data + month_plus_two_data + month_plus_three_data) / (NULLIF(data_sales,0) * 1.0) AS total_percent_data
	,in_month_data
	,(in_month_data / (NULLIF(data_sales,0) * 1.0)) AS in_month_percent_data
	,month_plus_one_data
	,(month_plus_one_data / (NULLIF(data_sales,0) * 1.0)) AS month_plus_one_percent_data
	,month_plus_two_data
	,(month_plus_two_data / (NULLIF(data_sales,0) * 1.0)) AS month_plus_two_percent_data
	,month_plus_three_data
	,(month_plus_three_data / (NULLIF(data_sales,0) * 1.0)) AS month_plus_three_percent_data
	,data_cancels
	,(data_cancels / (NULLIF(data_sales,0) * 1.0)) AS data_cancels_percent
	,data_opens
	,(data_opens / (NULLIF(data_sales,0) * 1.0)) AS data_opens_percent 
	,voice_sales
	,(in_month_voice + month_plus_one_voice + month_plus_two_voice + month_plus_three_voice) / (NULLIF(voice_sales,0) * 1.0) AS total_percent_voice
	,in_month_voice
	,(in_month_voice / (NULLIF(voice_sales,0) * 1.0)) AS in_month_percent_voice
	,month_plus_one_voice
	,(month_plus_one_voice / (NULLIF(voice_sales,0) * 1.0)) AS month_plus_one_percent_voice
	,month_plus_two_voice
	,(month_plus_two_voice / (NULLIF(voice_sales,0) * 1.0)) AS month_plus_two_percent_voice
	,month_plus_three_voice
	,(month_plus_three_voice / (NULLIF(voice_sales,0) * 1.0)) AS month_plus_three_percent_voice
	,voice_cancels
	,(voice_cancels / (NULLIF(voice_sales,0) * 1.0)) AS voice_cancels_percent
	,voice_opens
	,(voice_opens / (NULLIF(voice_sales,0) * 1.0)) AS voice_opens_percent
	,video_sales
	,(in_month_video + month_plus_one_video + month_plus_two_video + month_plus_three_video) / (NULLIF(video_sales,0) * 1.0) AS total_percent_video
	,in_month_video
	,(in_month_video / (NULLIF(video_sales,0) * 1.0)) AS in_month_percent_video
	,month_plus_one_video
	,(month_plus_one_video / (NULLIF(video_sales,0) * 1.0)) AS month_plus_one_percent_video
	,month_plus_two_video
	,(month_plus_two_video / (NULLIF(video_sales,0) * 1.0)) AS month_plus_two_percent_video
	,month_plus_three_video
	,(month_plus_three_video / (NULLIF(video_sales,0) * 1.0)) AS month_plus_three_percent_video
	,video_cancels
	,(video_cancels / (NULLIF(video_sales,0) * 1.0)) AS video_cancels_percent
	,video_opens
	,(video_opens / (NULLIF(video_sales,0) * 1.0)) AS video_opens_percent
	,pri_sales
	,(in_month_pri + month_plus_one_pri + month_plus_two_pri + month_plus_three_pri) / (NULLIF(pri_sales,0) * 1.0) AS total_percent_pri
	,in_month_pri
	,(in_month_pri / (NULLIF(pri_sales,0) * 1.0)) AS in_month_percent_pri
	,month_plus_one_pri
	,(month_plus_one_pri / (NULLIF(pri_sales,0) * 1.0)) AS month_plus_one_percent_pri
	,month_plus_two_pri
	,(month_plus_two_pri / (NULLIF(pri_sales,0) * 1.0)) AS month_plus_two_percent_pri
	,month_plus_three_pri
	,(month_plus_three_pri / (NULLIF(pri_sales,0) * 1.0)) AS month_plus_three_percent_pri
	,pri_cancels
	,(pri_cancels / (NULLIF(pri_sales,0) * 1.0)) AS pri_cancels_percent
	,pri_opens
	,(pri_opens / (NULLIF(pri_sales,0) * 1.0)) AS pri_opens_percent
	,bve_sales
	,(in_month_bve + month_plus_one_bve + month_plus_two_bve + month_plus_three_bve) / (NULLIF(bve_sales,0) * 1.0) AS total_percent_bve
	,in_month_bve
	,(in_month_bve / (NULLIF(bve_sales,0) * 1.0)) AS in_month_percent_bve
	,month_plus_one_bve
	,(month_plus_one_bve / (NULLIF(bve_sales,0) * 1.0)) AS month_plus_one_percent_bve
	,month_plus_two_bve
	,(month_plus_two_bve / (NULLIF(bve_sales,0) * 1.0)) AS month_plus_two_percent_bve
	,month_plus_three_bve
	,(month_plus_three_bve / (NULLIF(bve_sales,0) * 1.0)) AS month_plus_three_percent_bve
	,bve_cancels
	,(bve_cancels / (NULLIF(bve_sales,0) * 1.0)) AS bve_cancels_percent
	,bve_opens
	,(bve_opens / (NULLIF(bve_sales,0) * 1.0)) AS bve_opens_percent
	--,data_sales + voice_sales + video_sales + pri_sales AS total_sales
	--,(in_month_data + month_plus_one_data + month_plus_two_data + month_plus_three_data +
	-- in_month_voice + month_plus_one_voice + month_plus_two_voice + month_plus_three_voice +
	-- in_month_video + month_plus_one_video + month_plus_two_video + month_plus_three_video +
	-- in_month_pri + month_plus_one_pri + month_plus_two_pri + month_plus_three_pri) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS total_percent_total
	--,(in_month_data + in_month_voice + in_month_video + in_month_pri) AS in_month_total
	--,(in_month_data + in_month_voice + in_month_video + in_month_pri) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) as in_month_percent_total
	--,(month_plus_one_data + month_plus_one_voice + month_plus_one_video + month_plus_one_pri) AS month_plus_one_total
	--,(month_plus_one_data + month_plus_one_voice + month_plus_one_video + month_plus_one_pri) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS month_plus_one_percent_total
	--,(month_plus_two_data + month_plus_two_voice + month_plus_two_video + month_plus_two_pri) AS month_plus_two_total
	--,(month_plus_two_data + month_plus_two_voice + month_plus_two_video + month_plus_two_pri) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS month_plus_two_percent_total
	--,(month_plus_three_data + month_plus_three_voice + month_plus_three_video + month_plus_three_pri) AS month_plus_three_total
	--,(month_plus_three_data + month_plus_three_voice + month_plus_three_video + month_plus_three_pri) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS month_plus_three_percent_total
	--,(data_cancels + voice_cancels + video_cancels + pri_cancels) AS total_cancels
	--,(data_cancels + voice_cancels + video_cancels + pri_cancels) / 
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS total_cancels_percent
	--,(data_opens + voice_opens + video_opens + pri_opens) AS total_opens
	--,(data_opens + voice_opens + video_opens + pri_opens) /
	-- ((NULLIF(data_sales,0) * 1.0) + (NULLIF(voice_sales,0) * 1.0) + (NULLIF(video_sales,0) * 1.0) + (NULLIF(pri_sales,0) * 1.0)) AS total_opens_percent
FROM
	baseCte
) 
SELECT
	*
FROM
	finalCte
WHERE
	region = @Region

END

