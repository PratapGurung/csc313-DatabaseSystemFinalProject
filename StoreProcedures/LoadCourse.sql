USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadCourse]    Script Date: 9/5/2019 10:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 29, 2019
-- Description:	loads course table from table uplaodfile.coursespring2019 
-- =============================================
ALTER PROCEDURE [Project3].[LoadCourse]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Courses(CourseName,CourseDescription, CourseHr, CourseCredit, Semester, DateOfLastUpdate)
	SELECT distinct SUBSTRING(OLD.[Course (hr, crd)], 0,  CHARINDEX('(', OLD.[Course (hr, crd)])),--COURSE NAME IS UPTO ( WHITE SPACE
					old.Description,
					SUBSTRING(OLD.[Course (hr, crd)], CHARINDEX('(', OLD.[Course (hr, crd)])+1, 1 ),--COURSE HR IS UPTO WHITE SPACE STARTING FROM ( 
					LEFT(RIGHT(	OLD.[Course (hr, crd)], 2), 1), 
					OLD.Semester,SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019  as OLD


	

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Courses

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Course Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
