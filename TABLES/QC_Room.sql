USE [QueensCollegeSchedulSpring2019]
GO

/****** Object:  Table [QC].[Room]    Script Date: 9/5/2019 10:41:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [QC].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NULL,
	[RoomNumber] [nvarchar](30) NULL,
	[ClassTime] [char](5) NULL,
	[LastName] [nvarchar](30) NULL,
	[FirstName] [nvarchar](30) NULL,
	[QmailEmailAddress] [nvarchar](30) NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
	[AuthorizedUserId] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_ClassTime]  DEFAULT ('9:15') FOR [ClassTime]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_LastName]  DEFAULT ('Gurung') FOR [LastName]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_FirstName]  DEFAULT ('Pratap') FOR [FirstName]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_QmailEmailAddress]  DEFAULT ('Pratap.Gurung42@qmail.cuny.edu') FOR [QmailEmailAddress]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [QC].[Room] ADD  CONSTRAINT [DF_Room_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [QC].[Room] ADD  DEFAULT ('42') FOR [AuthorizedUserId]
GO

ALTER TABLE [QC].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Building] FOREIGN KEY([BuildingId])
REFERENCES [QC].[Building] ([BuildingId])
GO

ALTER TABLE [QC].[Room] CHECK CONSTRAINT [FK_Room_Building]
GO


