USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [QC].[Instructor]    Script Date: 9/5/2019 10:41:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [QC].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[InstructorLastName] [nvarchar](30) NULL,
	[InstructorFirstName] [nvarchar](30) NULL,
	[ClassTime] [char](5) NULL,
	[LastName] [varchar](30) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[QmailEmailAddress] [varchar](30) NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[DateOfLastUpdate] [datetime2](7) NOT NULL,
	[AuthorizedUserId] [int] NULL,
 CONSTRAINT [PK_INSTRUCTOR] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT ('Pratap') FOR [FirstName]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [QC].[Instructor] ADD  DEFAULT ('42') FOR [AuthorizedUserId]
GO

ALTER TABLE [QC].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([DepartmentId])
REFERENCES [QC].[Department] ([DepartmentId])
GO

ALTER TABLE [QC].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO

