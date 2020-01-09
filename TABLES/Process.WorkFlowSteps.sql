USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [Process].[WorkFlowSteps]    Script Date: 9/5/2019 10:39:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Process].[WorkFlowSteps](
	[WorkFlowStepKey] [int] NOT NULL,
	[WorkFlowStepDescription] [nvarchar](100) NOT NULL,
	[WorkFlowStepTableRowCount] [int] NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](30) NULL,
	[StartingDateTime] [datetime2](7) NULL,
	[EndingDateTime] [datetime2](7) NULL,
	[ClassTime] [char](5) NULL,
	[QmailEmailAddress] [varchar](30) NULL
) ON [PRIMARY]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  CONSTRAINT [DFT_WorkflowSteps_WorkFlowStepKey]  DEFAULT (NEXT VALUE FOR [PkSequence].[WorkFlowStepsSequenceObject]) FOR [WorkFlowStepKey]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT ((0)) FOR [WorkFlowStepTableRowCount]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT ('Pratap') FOR [FirstName]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndingDateTime]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [Process].[WorkFlowSteps] ADD  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO


