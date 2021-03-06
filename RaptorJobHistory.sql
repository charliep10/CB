SELECT [SolutionID]
      ,[ProcessName]
      ,[Ownera]
      ,[ProcessStart]
      ,[ProcessEnd]
      ,[DurationInMinutes]
      ,[Results]
FROM [QLUE].[usr].[v_WSTBISRaptor_JobHistory]
WHERE [SolutionID] IN ('3071' --WSTCommconndiscoNDW
						,'3570' --WSTRtbBigPictureCallsDaily
						,'3571' --WSTRtbBigPictureSalesDaily
						,'2797' --WSTSFDCiCompSMBOrdersMart
						,'3838' --p_WSTBIS_FlashReportData
						)
ORDER BY [ProcessStart] DESC