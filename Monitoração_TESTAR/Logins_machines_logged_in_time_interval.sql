CREATE TABLE #TEMP_DIEGO (LogDate DATETIME2(3), ProcessInfo	VARCHAR(MAX), Text VARCHAR(MAX))

INSERT INTO #TEMP_DIEGO
EXEC MASTER.DBO.xp_readerrorlog 0,1,N'login',N'[CLIENT', '2017-03-30 03:00:00', '2017-03-30 03:50:00'

SELECT DISTINCT REPLACE(SUBSTRING([TEXT],PATINDEX('%CLIENT:%',[TEXT])+7,LEN([TEXT])),']','') AS 'MACHINE',
SUBSTRING([TEXT],PATINDEX('%''%',[TEXT])+1,PATINDEX('%.%',[TEXT])-PATINDEX('%''%',[TEXT])-2) AS 'USER' FROM #TEMP_DIEGO

