USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Process].[usp_TrackWorkFlow]    Script Date: 9/5/2019 10:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gururng
-- Create date: April 29,2019
-- Description:	load the steps in to work flow step table
-- =============================================
ALTER PROCEDURE[Process].[usp_TrackWorkFlow]
	-- Add the parameters for the stored procedure here
	@StartTime DATETIME2, 
	@WorkFlowDescription NVARCHAR(100),
	@WorkFlowStepTableRowCount int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Process.WorkflowSteps(
		StartingDateTime, WorkFlowStepDescription,
		[WorkFlowStepTableRowCount]
	)

	SELECT @StartTime, @WorkFlowDescription, @WorkFlowStepTableRowCount
END
