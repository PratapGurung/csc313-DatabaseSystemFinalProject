USE [QueensCollegeSchedulSpring2019]
GO
/****** Object:  StoredProcedure [Project3].[ShowTableStatusRowCount]    Script Date: 9/5/2019 10:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [Project3].[ShowTableStatusRowCount] 
@TableStatus VARCHAR(64)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select TableStatus = @TableStatus, TableName ='Mode of Instruction', COUNT(*) FROM [QC].[ModeOfInstruction]
	select TableStatus = @TableStatus, TableName ='Building', COUNT(*) FROM [QC].[Building]
	select TableStatus = @TableStatus, TableName ='Department', COUNT(*) FROM [QC].[Department]
	select TableStatus = @TableStatus, TableName ='Room', COUNT(*) FROM [QC].[Room]
	select TableStatus = @TableStatus, TableName ='Instructor', COUNT(*) FROM [QC].[Instructor]
	select TableStatus = @TableStatus, TableName ='Courses', COUNT(*) FROM [QC].[Courses]
	select TableStatus = @TableStatus, TableName ='Class', COUNT(*) FROM [QC].[Class]
	
	
END