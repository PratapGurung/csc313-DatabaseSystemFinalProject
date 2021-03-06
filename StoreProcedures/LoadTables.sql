USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[LoadTables]    Script Date: 9/5/2019 10:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pratap Gurung
-- Create date: April 29,, 2019
-- Description:	load all the data into class table 
-- =============================================
ALTER  PROCEDURE [Project3].[LoadTables]
    -- Add the parameters for the stored procedure here

AS
BEGIN
    SET NOCOUNT ON;
	TRUNCATE TABLE Process.WorkflowSteps
	DECLARE @Startime as datetime
	select @Startime = sysdatetime()
	
	ALTER SEQUENCE [PkSequence].[WorkFlowStepsSequenceObject] 
	 RESTART WITH 1 

	EXEC Process.usp_TrackWorkFlow @Startime, @WorkFlowDescription = 'Load Started', @WorkFlowStepTableRowCount = 0

    --	Drop All of the foreign keys prior to truncating tables in the star schema
 	--
    EXEC  [Project3].[DropForeignKeys];
	--
	--	Check row count before truncation
	EXEC	[Project3].[ShowTableStatusRowCount] @TableStatus = N'''Pre-truncate of tables''';
											    
		
    --
    --	Always truncate the Star Schema Data
    --
    EXEC  [Project3].[TruncateTables] ;
    --

    --	Load the tables
		EXEC [Project3].[LoadBuilding];
		EXEC [Project3].[LoadDepartment];
		EXEC [Project3].[LoadModeOfInstruction];
	    EXEC [Project3].[LoadRoom];
	    EXEC [Project3].[LoadInstructor];
	    EXEC [Project3].[LoadCourse];
		EXEC [Project3].[LoadClass];

  --
    --	Recreate all of the foreign keys prior after loading the star schema
     exec [Project3].[AddForeignKeys]
 	--
		--	Check row count after truncation
	EXEC	[Project3].[ShowTableStatusRowCount] @TableStatus = N'''Post-truncate of tables''';
											    

	
END;
