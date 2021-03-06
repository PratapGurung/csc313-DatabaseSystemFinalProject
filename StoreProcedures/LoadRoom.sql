USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadRoom]    Script Date: 9/5/2019 10:46:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 29, 2019
-- Description:	loads room table from table uplaodfile.coursespring2019 
-- =============================================
ALTER PROCEDURE [Project3].[LoadRoom]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Room(RoomNumber , BuildingId, DateOfLastUpdate)
	SELECT DISTINCT A.Location, B.BuildingId , SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019  AS A
	INNER JOIN QC.Building AS B
	ON B.BuildingName =  SUBSTRING(A.[Location], 0, CHARINDEX(' ', A.[Location]))
	WHERE Location <> 'TBD'

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Room

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Room Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
