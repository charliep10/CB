USE DevCB

CREATE FUNCTION fnConvertToCaseInsensitiveId
(@InputId CHAR(15)
)
RETURNS CHAR(18)
AS
BEGIN
DECLARE @ErrorStringReally INT
IF LEN(@InputId) <> 15

SET @ErrorStringReally
= 'Input Salesforce Id must be exactly 15 characters input was"'+@InputId+'"'

DECLARE @OutputId CHAR(18)

DECLARE @Hash VARCHAR(3)

SET @Hash = ''

DECLARE @Chunk TINYINT

DECLARE @ThisChunk CHAR(5)

DECLARE @CharPos TINYINT

DECLARE @ThisHashDigit TINYINT

SET @Chunk = 1

WHILE @Chunk <= 3

BEGIN

SELECT @ThisChunk = RIGHT(LEFT(@InputId,@Chunk*5),5)

SET @ThisHashDigit = 0

SET @CharPos = 1

WHILE @CharPos <= 5

BEGIN

IF ASCII(SUBSTRING(@ThisChunk,@CharPos,1)) BETWEEN 65 AND 90

SET @ThisHashDigit += POWER(2,@CharPos-1)

SET @CharPos += 1

END

IF @ThisHashDigit >= 26

SET @Hash += CHAR(@ThisHashDigit+48-26)

ELSE

SET @Hash += CHAR(@ThisHashDigit+65)

SET @Chunk += 1

END

SET @OutputId = @InputId + @Hash

RETURN @OutputId

END



SELECT [CreatedById]
		,[CreatedDate]
		,[Field]
		,[Id]
		,[IsDeleted]
		,[NewValue]
		,[OldValue]
		,[OpportunityId]
FROM [ExternalUser].[SFDC].[OpportunityFieldHistory]
WHERE [OpportunityId] like '0061200000WH1Ro%'
--https://comcast.my.salesforce.com/0061200000WH1Ro
/*select * 
FROM [ExternalUser].[SFDC].[Opportunity_Combined]
where OpportunityNumber__c = 'O-13477937' 
--[Autonumber_for_Name_ID_field_ENT__c]
--.id = OpportunityFieldHistory.opportunityid*/