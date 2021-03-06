USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[DropForeignKeys]    Script Date: 9/5/2019 10:44:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Pratap Gurung
-- Procedure: DropForeignKeys
-- Create date: 04/16/2019
-- Description: Drops Foreign Keys 
-- =============================================
ALTER PROCEDURE [Project3].[DropForeignKeys]
  
AS
BEGIN
	SET NOCOUNT ON;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @StartTime AS DATETIME

	SELECT @StartTime = SYSDATETIME()

	ALTER TABLE QC.Instructor
	DROP CONSTRAINT IF EXISTS [FK_Instructor_Department]
	
	ALTER TABLE QC.Class
	DROP CONSTRAINT IF EXISTS [FK_Class_Instructor]
	
	ALTER TABLE QC.Class
	DROP CONSTRAINT IF EXISTS [FK_Class_ModeOfInstruction]
	 
	ALTER TABLE QC.Class
	DROP CONSTRAINT IF  EXISTS [FK_Class_Courses]
	 
	ALTER TABLE QC.Class
	DROP CONSTRAINT IF  EXISTS [FK_Class_Room]

	ALTER TABLE QC.Room
	DROP CONSTRAINT IF  EXISTS [FK_Room_Building]

	
	EXEC [Process].[usp_TrackWorkFlow] @StartTime,
	@WorkFlowDescription = N'DropForeignKeys',
	@WorkFlowStepTableRowCount = 0
END;