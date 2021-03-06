USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadModeOfInstruction]    Script Date: 9/5/2019 10:46:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 29, 2019
-- Description:	loads mode of Instruction table from table uplaodfile.coursespring2019 
-- =============================================
ALTER PROCEDURE [Project3].[LoadModeOfInstruction]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime as datetime
	declare @rows as int
	SELECT @StartTime = SYSDATETIME()

	INSERT INTO	QC.ModeOfInstruction(InstructionDescription , DateOfLastUpdate)
	SELECT DISTINCT [Mode of Instruction], SYSDATETIME()
	FROM Uploadfile.CoursesSpring2019  
	where [Mode of Instruction] <> N'TBD'

	DECLARE @WorkFlowDescription as NVARCHAR(35)

	SELECT @rows = COUNT(*)
	FROM QC.ModeOfInstruction

	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'Mode of Instruciton Table Loaded',
	@WorkFlowStepTableRowCount = @rows

END
