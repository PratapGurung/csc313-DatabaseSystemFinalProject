USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[AddForeignKeys]    Script Date: 9/5/2019 10:43:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Pratap Gurung
-- Procedure: AddForeignKeysToStarSchemaData
-- Create date: 04/15/2019
-- Description: Adds Foreign Keys To tables
-- =============================================

 ALTER PROCEDURE [Project3].[AddForeignKeys] 
AS
BEGIN
	SET NOCOUNT ON

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @StartTime AS DATETIME

	SELECT @StartTime = SYSDATETIME()

	
		
	
	ALTER TABLE [QC].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([DepartmentId])
	REFERENCES [QC].[Department] ([DepartmentId])

	ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Courses] FOREIGN KEY([CourseId])
	REFERENCES [QC].[Courses] ([CourseId])

	ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([RoomId])
	REFERENCES [QC].[Room] ([RoomId])

	ALTER TABLE [QC].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Building] FOREIGN KEY([BuildingId])
	REFERENCES [QC].[Building] ([BuildingId])

	ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Instructor] FOREIGN KEY([InstructorId])
	REFERENCES [QC].[Instructor] ([InstructorId])

	ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ModeOfInstruction] FOREIGN KEY([ModeId])
	REFERENCES [QC].[ModeOfInstruction] ([ModeId])



	EXEC Process.usp_TrackWorkFlow @StartTime
		,@WorkFlowDescription = 'AddForeignKeysToAllTables'
		,@WorkFlowStepTableRowCount = 0
END;