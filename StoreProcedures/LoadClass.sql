USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadClass]    Script Date: 9/5/2019 10:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 29, 2019
-- Description:	loads course table from table uplaodfile.coursespring2019 
-- =============================================
ALTER PROCEDURE [Project3].[LoadClass]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.Class(CourseId,
				ModeId, InstructorId,
				RoomId, 
				 Section,SectionCode, Enrolled, Limit , day, StartingTime, EndingTime , DateOfLastUpdate)
	
	SELECT   C.CourseId, 
			MOD.ModeId, I.InstructorId, R.RoomId,OLD.Sec, OLD.Code, OLD.Enrolled, OLD.Limit, OLD.Day, 
			 CASE 
			 WHEN OLD.Time = N'TBD' THEN 'TBD'
			 ELSE SUBSTRING(OLD.Time, 0,  CHARINDEX('-', OLD.Time))
			 END,
			 CASE 
			 WHEN OLD.Time = N'TBD' THEN 'TBD'
			 ELSE  SUBSTRING(OLD.Time, CHARINDEX('-', OLD.Time) + 1 , LEN(OLD.Time))
			 END,
			 SYSDATETIME()

	FROM Uploadfile.CoursesSpring2019  as OLD
	INNER JOIN QC.Courses AS C                                                      
	on C.CourseName = SUBSTRING(OLD.[Course (hr, crd)], 0,  CHARINDEX('(', OLD.[Course (hr, crd)]))
	INNER JOIN QC.ModeOfInstruction AS MOD
	ON OLD.[Mode of Instruction] = MOD.InstructionDescription
	--for all those null or TBD, it needs to be left outer join
	LEFT OUTER JOIN (select A.InstructorId, B.DepartmentName, A.InstructorFirstName, A.InstructorLastName from qc.Instructor as A 
						inner join qc.Department as B 
						on a.DepartmentId = b.DepartmentId) AS I
	on OLD.Instructor = CONCAT(I.InstructorFirstName, N',' , I.InstructorLastName) and I.DepartmentName = SUBSTRING([Course (hr, crd)], 1, CHARINDEX(' ', [Course (hr, crd)]))
	
	--for all those null or TBD, it needs to be left outer join
	LEFT OUTER JOIN  QC.Room AS R
	ON OLD.[Location] = R.RoomNumber
	

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.Class

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Class Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
