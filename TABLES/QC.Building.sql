USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [QC].[Building]    Script Date: 9/5/2019 10:39:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [QC].[Building](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](30) NULL,
	[ClassTime] [char](5) NULL,
	[LastName] [nvarchar](30) NULL,
	[FirstName] [nvarchar](30) NULL,
	[QmailEmailAddress] [nvarchar](30) NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
	[AuthorizedUserId] [int] NULL,
 CONSTRAINT [PK_BuildingLocation] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_ClassTime]  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_LastName]  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_FirstName]  DEFAULT ('Pratap') FOR [FirstName]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_QmailEmailAddress]  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [QC].[Building] ADD  CONSTRAINT [DF_Building_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [QC].[Building] ADD  DEFAULT ('42') FOR [AuthorizedUserId]
GO


