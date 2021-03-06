USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[TruncateTables]    Script Date: 9/5/2019 10:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pratap Gurung
-- Procedure: Truncate tables 
-- Create date: 4/14/19
-- Description:	Truncates tables 
-- =============================================
ALTER PROCEDURE [Project3].[TruncateTables] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @StartTime AS DATETIME
	SELECT @StartTime = SYSDATETIME()
	DECLARE @rows AS INT


	TRUNCATE TABLE [QC].[Building];

	TRUNCATE TABLE [QC].[Class];

	TRUNCATE TABLE [QC].[Courses];

	TRUNCATE TABLE [QC].[Department];

	TRUNCATE TABLE [QC].[Instructor];

	TRUNCATE TABLE [QC].[ModeOfInstruction];

	TRUNCATE TABLE [QC].[Room];


   	EXEC [Process].[usp_TrackWorkFlow] @StartTime
		,@WorkFlowDescription = N'Tables Truncated Successfully'
		,@WorkFlowStepTableRowCount = 0
END
