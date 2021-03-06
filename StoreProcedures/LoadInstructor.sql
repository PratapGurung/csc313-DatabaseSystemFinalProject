USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadInstructor]    Script Date: 9/5/2019 10:45:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 26, 2019
-- Description:	loads instructor data from table uplaodfile.coursespring2019 to qc.instructor table
-- =============================================
ALTER PROCEDURE [Project3].[LoadInstructor]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Instructor(DepartmentId,
	InstructorFirstName, InstructorLastName, DateOfLastUpdate)
	SELECT distinct  B.DepartmentId,
				 SUBSTRING(A.Instructor, 0, CHARINDEX(',', A.Instructor)),	
					SUBSTRING(A.Instructor, CHARINDEX(',', A.Instructor)+ 1, LEN(A.Instructor)) 
					, SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019   as A
	inner join QC.Department as B 
	on B.DepartmentName =   SUBSTRING(A.[Course (hr, crd)], 0,  CHARINDEX(' ', A.[Course (hr, crd)]))
	where Instructor <> N'TBD'

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Instructor

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Instructor Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
