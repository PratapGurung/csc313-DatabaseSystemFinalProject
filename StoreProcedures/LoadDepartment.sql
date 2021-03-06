USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadDepartment]    Script Date: 9/5/2019 10:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 26, 2019
-- Description:	loads Department data from table uplaodfile.coursespring2019 to qc.Department table
-- =============================================
ALTER PROCEDURE [Project3].[LoadDepartment]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Department([DepartmentName] , DateOfLastUpdate)
	SELECT DISTINCT SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)])) , SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019  
	

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Department

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Department Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
