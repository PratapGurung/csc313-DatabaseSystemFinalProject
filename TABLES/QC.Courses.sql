USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [QC].[Courses]    Script Date: 9/5/2019 10:40:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [QC].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[CourseHr] [nvarchar](50) NULL,
	[CourseCredit] [nvarchar](50) NULL,
	[Semester] [nvarchar](30) NULL,
	[CourseDescription] [nvarchar](50) NULL,
	[ClassTime] [char](5) NULL,
	[LastName] [nvarchar](30) NULL,
	[Firstname] [nvarchar](30) NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
	[QmailEmailAddress] [nvarchar](30) NULL,
	[AuthorizedUserId] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_ClassTime]  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_LastName]  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_Firstname]  DEFAULT ('Pratap') FOR [Firstname]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [QC].[Courses] ADD  CONSTRAINT [DF_Class_QmailEmailAddress]  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO

ALTER TABLE [QC].[Courses] ADD  DEFAULT ('42') FOR [AuthorizedUserId]
GO


