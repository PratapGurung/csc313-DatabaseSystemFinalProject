USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadBuilding]    Script Date: 9/5/2019 10:44:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 26, 2019
-- Description:	loads Department data from table uplaodfile.coursespring2019 to qc.Department table
-- =============================================
ALTER PROCEDURE [Project3].[LoadBuilding]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Building(BuildingName , DateOfLastUpdate)
	SELECT DISTINCT SUBSTRING([Location], 0, CHARINDEX(' ', [Location])) , SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019  
	WHERE Location <> 'TBD'

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Building

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Building Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
