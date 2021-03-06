USE [master]
GO
/****** Object:  Database [ElevatorDB]    Script Date: 02/04/2015 14:22:26 ******/
CREATE DATABASE [ElevatorDB] ON  PRIMARY 
( NAME = N'ElevatorDB', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\ElevatorDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ElevatorDB_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\ElevatorDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ElevatorDB] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElevatorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElevatorDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ElevatorDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ElevatorDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ElevatorDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ElevatorDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ElevatorDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ElevatorDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ElevatorDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ElevatorDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ElevatorDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ElevatorDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ElevatorDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ElevatorDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ElevatorDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ElevatorDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ElevatorDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ElevatorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ElevatorDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ElevatorDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ElevatorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ElevatorDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ElevatorDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ElevatorDB] SET  READ_WRITE
GO
ALTER DATABASE [ElevatorDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ElevatorDB] SET  MULTI_USER
GO
ALTER DATABASE [ElevatorDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ElevatorDB] SET DB_CHAINING OFF
GO
USE [ElevatorDB]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 02/04/2015 14:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] NOT NULL,
	[BuildingName] [varchar](50) NULL,
	[NumberOfFloors] [int] NOT NULL,
	[NumberOfElevators] [int] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [NumberOfFloors], [NumberOfElevators]) VALUES (1, N'Building #1', 5, 1)
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [NumberOfFloors], [NumberOfElevators]) VALUES (2, N'Building #2', 10, 4)
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [NumberOfFloors], [NumberOfElevators]) VALUES (3, N'Building #3', 8, 3)
INSERT [dbo].[Buildings] ([BuildingId], [BuildingName], [NumberOfFloors], [NumberOfElevators]) VALUES (4, N'Building #4', 6, 2)
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 02/04/2015 14:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[ActivityDescription] [varchar](255) NOT NULL,
	[LiftNumber] [int] NOT NULL,
	[CallButtonActivity] [varchar](255) NULL,
	[ActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetBuildings]    Script Date: 02/04/2015 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBuildings] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
	SELECT 
		BuildingId
		, BuildingName
		, NumberOfFloors
		, NumberOfElevators
	FROM
		dbo.Buildings
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetActivityLogs]    Script Date: 02/04/2015 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActivityLogs] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ActivityId]
      , alog.[BuildingId]
      , bldg.BuildingName
      , bldg.NumberOfFloors
      , bldg.NumberOfElevators
      ,[ActivityDescription]
      ,[LiftNumber]
      ,[CallButtonActivity]
      ,[ActivityDate]
  FROM [dbo].[ActivityLog] as alog
  INNER JOIN [dbo].[Buildings] as bldg ON alog.BuildingId = bldg.BuildingId
  ORDER BY alog.[BuildingId], [ActivityId]



END
GO
/****** Object:  StoredProcedure [dbo].[AddActivityLog]    Script Date: 02/04/2015 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddActivityLog] 
	@BuildingId int,
	@ActivityDescription varchar(255),
	@LiftNumber int,
	@CallButtonActivity varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [ElevatorDB].[dbo].[ActivityLog]
           ([BuildingId]
           ,[ActivityDescription]
           ,[LiftNumber]
           ,[CallButtonActivity]
           ,[ActivityDate])
     VALUES
           (@BuildingId
           ,@ActivityDescription
           ,@LiftNumber
           ,@CallButtonActivity
           ,GETDATE())



END
GO
/****** Object:  Default [DF_ActivityLog_ActivityDate]    Script Date: 02/04/2015 14:22:26 ******/
ALTER TABLE [dbo].[ActivityLog] ADD  CONSTRAINT [DF_ActivityLog_ActivityDate]  DEFAULT (getdate()) FOR [ActivityDate]
GO
/****** Object:  ForeignKey [FK_ActivityLog_Building]    Script Date: 02/04/2015 14:22:26 ******/
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_ActivityLog_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [FK_ActivityLog_Building]
GO
