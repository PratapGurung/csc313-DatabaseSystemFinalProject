USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [QC].[Class]    Script Date: 9/5/2019 10:40:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [QC].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[ModeId] [int] NULL,
	[InstructorId] [int] NULL,
	[RoomId] [int] NULL,
	[Section] [nvarchar](30) NULL,
	[SectionCode] [int] NULL,
	[Enrolled] [int] NULL,
	[Limit] [int] NULL,
	[Day] [nvarchar](30) NULL,
	[StartingTime] [nvarchar](30) NULL,
	[EndingTime] [nvarchar](30) NULL,
	[ClassTime] [char](5) NULL,
	[LastName] [nvarchar](30) NULL,
	[Firstname] [nvarchar](30) NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
	[QmailEmailAddress] [nvarchar](30) NULL,
	[AuthorizedUserId] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT ('Pratap') FOR [Firstname]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO

ALTER TABLE [QC].[Class] ADD  DEFAULT ('42') FOR [AuthorizedUserId]
GO

ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Courses] FOREIGN KEY([CourseId])
REFERENCES [QC].[Courses] ([CourseId])
GO

ALTER TABLE [QC].[Class] CHECK CONSTRAINT [FK_Class_Courses]
GO

ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [QC].[Instructor] ([InstructorId])
GO

ALTER TABLE [QC].[Class] CHECK CONSTRAINT [FK_Class_Instructor]
GO

ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ModeOfInstruction] FOREIGN KEY([ModeId])
REFERENCES [QC].[ModeOfInstruction] ([ModeId])
GO

ALTER TABLE [QC].[Class] CHECK CONSTRAINT [FK_Class_ModeOfInstruction]
GO

ALTER TABLE [QC].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([RoomId])
REFERENCES [QC].[Room] ([RoomId])
GO

ALTER TABLE [QC].[Class] CHECK CONSTRAINT [FK_Class_Room]
GO


