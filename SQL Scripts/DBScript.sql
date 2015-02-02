USE [master]
GO
/****** Object:  Database [ElevatorDB]    Script Date: 02/02/2015 12:07:06 ******/
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
/****** Object:  Table [dbo].[Buildings]    Script Date: 02/02/2015 12:07:06 ******/
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
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 02/02/2015 12:07:06 ******/
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
SET IDENTITY_INSERT [dbo].[ActivityLog] ON
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (1, 3, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43000BF9C49 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (2, 3, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A43000BFB690 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (3, 3, N'Move from Floor 5 to Floor 7', 1, N'', CAST(0x0000A43000BFCF70 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (4, 3, N'Move from Floor 2 to Floor 5', 2, N'Call button UP pressed at Floor 5', CAST(0x0000A43000BFECBB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (5, 3, N'Move from Floor 5 to Floor 8', 2, N'', CAST(0x0000A43000BFF276 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (6, 1, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A43000C0847F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (7, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43000C08AAD AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (8, 1, N'Move from Floor 2 to Floor 5', 1, N'', CAST(0x0000A43000C090BE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (9, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43000C195B6 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (10, 2, N'Move from Floor 1 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A43000C1B157 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (11, 2, N'Move from Floor 7 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43000C1B604 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (12, 2, N'Move from Floor 5 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43000C1B860 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (13, 2, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A43000C1BF34 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (14, 2, N'Move from Floor 3 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43000C1C345 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (15, 2, N'Move from Floor 5 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A43000C1C61A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (16, 2, N'Move from Floor 2 to Floor 5', 2, N'', CAST(0x0000A43000C1CB88 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (17, 2, N'Move from Floor 1 to Floor 2', 3, N'Call button UP pressed at Floor 2', CAST(0x0000A43000C1CFC4 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (18, 2, N'Move from Floor 7 to Floor 8', 1, N'Call button UP pressed at Floor 8', CAST(0x0000A43000C1D25B AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (19, 2, N'Move from Floor 5 to Floor 6', 2, N'Call button UP pressed at Floor 6', CAST(0x0000A43000C1D4B2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (20, 2, N'Move from Floor 2 to Floor 5', 3, N'Call button UP pressed at Floor 5', CAST(0x0000A43000C1D83F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (21, 2, N'Move from Floor 5 to Floor 4', 3, N'Call button UP pressed at Floor 4', CAST(0x0000A43000C1DA97 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (22, 2, N'Move from Floor 8 to Floor 9', 1, N'Call button DOWN pressed at Floor 9', CAST(0x0000A43000C1DCC7 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (23, 2, N'Move from Floor 6 to Floor 5', 2, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43000C1DE85 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (24, 2, N'Move from Floor 4 to Floor 3', 3, N'Call button UP pressed at Floor 3', CAST(0x0000A43000C1E052 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (25, 1, N'Move from Floor 1 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A433008D3661 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (26, 1, N'Move from Floor 3 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A433008D39DB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (27, 1, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A433009242D2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (28, 1, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A4330093D2D7 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (29, 1, N'Move from Floor 4 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A4330093E328 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (30, 1, N'Move from Floor 3 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A4330093F75F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (31, 1, N'Move from Floor 1 to Floor 3', 1, N'', CAST(0x0000A4330094EA50 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (32, 1, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A433009565E5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (33, 1, N'Move from Floor 4 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300956EE0 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (34, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300957942 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (35, 1, N'Move from Floor 5 to Floor 4', 1, N'', CAST(0x0000A43300957E7F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (36, 3, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A4330095D07F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (37, 3, N'Move from Floor 4 to Floor 8', 1, N'', CAST(0x0000A4330095E024 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (38, 3, N'Move from Floor 8 to Floor 4', 1, N'Call button DOWN pressed at Floor 4', CAST(0x0000A4330095E968 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (39, 3, N'Move from Floor 4 to Floor 7', 1, N'Call button DOWN pressed at Floor 7', CAST(0x0000A4330096030C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (40, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300965D95 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (41, 1, N'Move from Floor 4 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A433009665D6 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (42, 3, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300968070 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (43, 3, N'Move from Floor 5 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300968ABE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (44, 3, N'Move from Floor 3 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A4330096944C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (45, 3, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A433009699AA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (46, 3, N'Move from Floor 4 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300969E49 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (47, 1, N'Move from Floor 1 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A4330096C979 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (48, 3, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300976378 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (49, 3, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A43300976920 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (50, 3, N'Move from Floor 5 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A433009770E1 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (51, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A4330097FDAB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (52, 1, N'Move from Floor 4 to Floor 5', 1, N'', CAST(0x0000A4330098027A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (53, 1, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A43300999164 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (54, 1, N'Move from Floor 4 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300999972 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (55, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A4330099A1C3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (56, 2, N'Move from Floor 1 to Floor 9', 3, N'', CAST(0x0000A433009ABDCD AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (57, 2, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A433009AC9EF AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (58, 2, N'Move from Floor 9 to Floor 6', 3, N'Call button DOWN pressed at Floor 6', CAST(0x0000A433009ACD25 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (59, 2, N'Move from Floor 4 to Floor 8', 1, N'Call button UP pressed at Floor 8', CAST(0x0000A433009AD291 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (60, 2, N'Move from Floor 1 to Floor 3', 2, N'Call button UP pressed at Floor 3', CAST(0x0000A433009AD491 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (61, 2, N'Move from Floor 6 to Floor 5', 3, N'Call button DOWN pressed at Floor 5', CAST(0x0000A433009AD636 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (62, 2, N'Move from Floor 3 to Floor 1', 2, N'Call button UP pressed at Floor 1', CAST(0x0000A433009AE25A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (63, 2, N'Move from Floor 8 to Floor 3', 1, N'', CAST(0x0000A433009AE2DA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (64, 2, N'Move from Floor 5 to Floor 6', 3, N'Call button UP pressed at Floor 6', CAST(0x0000A433009AE59C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (65, 2, N'Move from Floor 6 to Floor 9', 3, N'Call button UP pressed at Floor 9', CAST(0x0000A433009AEC06 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (66, 2, N'Move from Floor 9 to Floor 7', 3, N'Call button UP pressed at Floor 7', CAST(0x0000A433009AED37 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (67, 2, N'Move from Floor 7 to Floor 6', 3, N'Call button DOWN pressed at Floor 6', CAST(0x0000A433009AF053 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (68, 2, N'Move from Floor 3 to Floor 5', 1, N'', CAST(0x0000A433009AF8CF AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (69, 2, N'Move from Floor 6 to Floor 4', 3, N'Call button DOWN pressed at Floor 4', CAST(0x0000A433009AFAF9 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (70, 2, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A433009AFE04 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (71, 2, N'Move from Floor 5 to Floor 8', 1, N'Call button UP pressed at Floor 8', CAST(0x0000A433009B027A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (72, 2, N'Move from Floor 8 to Floor 6', 1, N'Call button DOWN pressed at Floor 6', CAST(0x0000A433009B0645 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (73, 2, N'Move from Floor 6 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A433009B09D2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (74, 2, N'Move from Floor 7 to Floor 9', 1, N'Call button DOWN pressed at Floor 9', CAST(0x0000A433009B0C29 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (75, 2, N'Move from Floor 1 to Floor 10', 1, N'Call button DOWN pressed at Floor 10', CAST(0x0000A433009D99F3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (76, 2, N'Move from Floor 10 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A433009DA0FF AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (77, 2, N'Move from Floor 1 to Floor 9', 1, N'Call button UP pressed at Floor 9', CAST(0x0000A433009DE07D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (78, 2, N'Move from Floor 9 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A433009DE52E AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (79, 2, N'Move from Floor 1 to Floor 10', 1, N'Call button DOWN pressed at Floor 10', CAST(0x0000A433009E2CAE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (80, 2, N'Move from Floor 10 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A433009E33B9 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (81, 2, N'Move from Floor 7 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A433009E386A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (82, 2, N'Move from Floor 1 to Floor 3', 2, N'', CAST(0x0000A433009F9A41 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (83, 2, N'Move from Floor 3 to Floor 5', 2, N'', CAST(0x0000A433009FE52C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (84, 2, N'Move from Floor 1 to Floor 4', 1, N'', CAST(0x0000A433009FE9F7 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (85, 2, N'Move from Floor 4 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A433009FEBFF AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (86, 2, N'Move from Floor 1 to Floor 10', 3, N'', CAST(0x0000A433009FEF5E AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (87, 2, N'Move from Floor 10 to Floor 7', 3, N'Call button UP pressed at Floor 7', CAST(0x0000A433009FF2EE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (88, 2, N'Move from Floor 1 to Floor 5', 2, N'Call button UP pressed at Floor 5', CAST(0x0000A43300A08BC9 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (89, 2, N'Move from Floor 1 to Floor 4', 3, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A08D64 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (90, 2, N'Move from Floor 1 to Floor 10', 1, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300A09024 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (91, 2, N'Move from Floor 5 to Floor 7', 2, N'Call button DOWN pressed at Floor 7', CAST(0x0000A43300A09379 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (92, 2, N'Move from Floor 4 to Floor 6', 3, N'Call button UP pressed at Floor 6', CAST(0x0000A43300A0984F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (93, 2, N'Move from Floor 10 to Floor 9', 1, N'Call button DOWN pressed at Floor 9', CAST(0x0000A43300A09A5D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (94, 2, N'Move from Floor 7 to Floor 8', 2, N'Call button UP pressed at Floor 8', CAST(0x0000A43300A09E22 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (95, 2, N'Move from Floor 6 to Floor 2', 3, N'Call button UP pressed at Floor 2', CAST(0x0000A43300A0A30D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (96, 2, N'Move from Floor 9 to Floor 10', 1, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300A0A5E5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (97, 2, N'Move from Floor 8 to Floor 1', 2, N'Call button UP pressed at Floor 1', CAST(0x0000A43300A0A9B3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (98, 2, N'Move from Floor 2 to Floor 6', 3, N'Call button UP pressed at Floor 6', CAST(0x0000A43300A0AC62 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (99, 2, N'Move from Floor 10 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300A0B15D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (100, 2, N'Move from Floor 1 to Floor 7', 2, N'Call button UP pressed at Floor 7', CAST(0x0000A43300A0B315 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (101, 2, N'Move from Floor 6 to Floor 10', 3, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300A0B3CE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (102, 2, N'Move from Floor 1 to Floor 3', 3, N'Call button UP pressed at Floor 3', CAST(0x0000A43300A13739 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (103, 2, N'Move from Floor 1 to Floor 6', 2, N'Call button UP pressed at Floor 6', CAST(0x0000A43300A1393D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (104, 2, N'Move from Floor 1 to Floor 10', 1, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300A13C8E AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (105, 2, N'Move from Floor 6 to Floor 4', 2, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300A13DF5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (106, 2, N'Move from Floor 1 to Floor 8', 4, N'Call button UP pressed at Floor 8', CAST(0x0000A43300A13EA5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (107, 2, N'Move from Floor 3 to Floor 8', 3, N'Call button UP pressed at Floor 8', CAST(0x0000A43300A142A2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (108, 2, N'Move from Floor 4 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A43300A143DB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (109, 2, N'Move from Floor 10 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300A144C6 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (110, 2, N'Move from Floor 8 to Floor 9', 3, N'Call button UP pressed at Floor 9', CAST(0x0000A43300A14628 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (111, 2, N'Move from Floor 8 to Floor 7', 4, N'Call button DOWN pressed at Floor 7', CAST(0x0000A43300A149F3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (112, 2, N'Move from Floor 5 to Floor 6', 1, N'Call button UP pressed at Floor 6', CAST(0x0000A43300A14BAC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (113, 2, N'Move from Floor 2 to Floor 3', 2, N'Call button UP pressed at Floor 3', CAST(0x0000A43300A14E94 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (114, 2, N'Move from Floor 7 to Floor 8', 4, N'Call button UP pressed at Floor 8', CAST(0x0000A43300A15158 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (115, 4, N'Move from Floor 1 to Floor 2', 2, N'Call button UP pressed at Floor 2', CAST(0x0000A43300A1B55F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (116, 4, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300A1B702 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (117, 4, N'Move from Floor 5 to Floor 4', 1, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300A1BAA6 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (118, 4, N'Move from Floor 2 to Floor 3', 2, N'Call button UP pressed at Floor 3', CAST(0x0000A43300A1BCDE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (119, 4, N'Move from Floor 4 to Floor 6', 1, N'Call button DOWN pressed at Floor 6', CAST(0x0000A43300A1BFA4 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (120, 4, N'Move from Floor 3 to Floor 4', 2, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300A1C061 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (121, 4, N'Move from Floor 6 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300A1C7E1 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (122, 4, N'Move from Floor 4 to Floor 5', 2, N'Call button UP pressed at Floor 5', CAST(0x0000A43300A1C8EA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (123, 4, N'Move from Floor 1 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43300A1CC93 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (124, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A45352 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (125, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300A4547C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (126, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A49CCB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (127, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300A49DF8 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (128, 1, N'Move from Floor 1 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43300A4DB9A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (129, 1, N'Move from Floor 3 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300A4DFF3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (130, 1, N'Move from Floor 2 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A4E5AE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (131, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300A4EA64 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (132, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A58D99 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (133, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300A9F93C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (134, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300AA644A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (135, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button UP pressed at Floor 2', CAST(0x0000A43300AA699B AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (136, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300AA9282 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (137, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button UP pressed at Floor 2', CAST(0x0000A43300AA9736 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (138, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AAEEC3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (139, 1, N'Move from Floor 5 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300AAF5CC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (140, 1, N'Move from Floor 1 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43300AAFA7E AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (141, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AC0AB5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (142, 1, N'Move from Floor 5 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300AC0E3C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (143, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AC965D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (144, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300ACBDFC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (145, 1, N'Move from Floor 5 to Floor 2', 1, N'Call button UP pressed at Floor 2', CAST(0x0000A43300ACC3DC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (146, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300ACEC07 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (147, 1, N'Move from Floor 5 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300ACEF8C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (148, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300ADC185 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (149, 1, N'Move from Floor 5 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43300ADC633 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (150, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AEC9A9 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (151, 1, N'Move from Floor 5 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300AECD2C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (152, 1, N'Move from Floor 4 to Floor 2', 1, N'Call button UP pressed at Floor 2', CAST(0x0000A43300AED2C0 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (153, 1, N'Move from Floor 2 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300AED644 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (154, 1, N'Move from Floor 1 to Floor 4', 1, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300AEF162 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (155, 1, N'Move from Floor 4 to Floor 3', 1, N'Call button UP pressed at Floor 3', CAST(0x0000A43300AEF4E6 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (156, 1, N'Move from Floor 3 to Floor 2', 1, N'Call button UP pressed at Floor 2', CAST(0x0000A43300AEF97D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (157, 1, N'Move from Floor 2 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300AEFE2F AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (158, 1, N'Move from Floor 1 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AF0667 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (159, 1, N'Move from Floor 5 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300AF0B19 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (160, 1, N'Move from Floor 3 to Floor 2', 1, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300AF0EA2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (161, 2, N'Move from Floor 1 to Floor 4', 3, N'Call button UP pressed at Floor 4', CAST(0x0000A43300AF4AC9 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (162, 2, N'Move from Floor 1 to Floor 6', 2, N'Call button UP pressed at Floor 6', CAST(0x0000A43300AF4C11 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (163, 2, N'Move from Floor 1 to Floor 8', 1, N'Call button UP pressed at Floor 8', CAST(0x0000A43300AF4D27 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (164, 2, N'Move from Floor 6 to Floor 7', 2, N'Call button UP pressed at Floor 7', CAST(0x0000A43300AF4F9D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (165, 2, N'Move from Floor 4 to Floor 1', 3, N'Call button UP pressed at Floor 1', CAST(0x0000A43300AF50AE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (166, 2, N'Move from Floor 1 to Floor 7', 4, N'Call button UP pressed at Floor 7', CAST(0x0000A43300AF5144 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (167, 2, N'Move from Floor 7 to Floor 5', 2, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300AF5457 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (168, 2, N'Move from Floor 8 to Floor 3', 1, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300AF5562 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (169, 2, N'Move from Floor 1 to Floor 3', 3, N'Call button UP pressed at Floor 3', CAST(0x0000A43300AF5634 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (170, 2, N'Move from Floor 7 to Floor 3', 4, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300AF58CB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (171, 2, N'Move from Floor 3 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300AF5A21 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (172, 2, N'Move from Floor 5 to Floor 9', 2, N'Call button UP pressed at Floor 9', CAST(0x0000A43300AF5B65 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (173, 2, N'Move from Floor 3 to Floor 8', 3, N'Call button UP pressed at Floor 8', CAST(0x0000A43300AF5E6D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (174, 2, N'Move from Floor 3 to Floor 7', 4, N'Call button DOWN pressed at Floor 7', CAST(0x0000A43300AF5FDC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (175, 2, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300AF61EA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (176, 2, N'Move from Floor 1 to Floor 5', 1, N'Call button UP pressed at Floor 5', CAST(0x0000A43300C090F7 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (177, 2, N'Move from Floor 1 to Floor 2', 4, N'Call button UP pressed at Floor 2', CAST(0x0000A43300C091F4 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (178, 2, N'Move from Floor 1 to Floor 8', 2, N'Call button DOWN pressed at Floor 8', CAST(0x0000A43300C095AE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (179, 2, N'Move from Floor 1 to Floor 7', 3, N'Call button UP pressed at Floor 7', CAST(0x0000A43300C095D3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (180, 2, N'Move from Floor 5 to Floor 8', 1, N'Call button UP pressed at Floor 8', CAST(0x0000A43300C096C3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (181, 2, N'Move from Floor 7 to Floor 6', 3, N'Call button UP pressed at Floor 6', CAST(0x0000A43300C09D65 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (182, 2, N'Move from Floor 2 to Floor 10', 4, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300C09EDE AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (183, 2, N'Move from Floor 8 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300C0A279 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (184, 2, N'Move from Floor 4 to Floor 1', 1, N'Call button UP pressed at Floor 1', CAST(0x0000A43300C0AAD5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (185, 2, N'Move from Floor 10 to Floor 7', 4, N'Call button UP pressed at Floor 7', CAST(0x0000A43300C0ACCB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (186, 2, N'Move from Floor 1 to Floor 4', 1, N'Call button UP pressed at Floor 4', CAST(0x0000A43300C0B1B5 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (187, 2, N'Move from Floor 7 to Floor 4', 4, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300C0B42B AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (188, 2, N'Move from Floor 4 to Floor 9', 1, N'Call button UP pressed at Floor 9', CAST(0x0000A43300C0BA41 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (189, 2, N'Move from Floor 4 to Floor 10', 4, N'Call button DOWN pressed at Floor 10', CAST(0x0000A43300C0BDD2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (190, 2, N'Move from Floor 9 to Floor 7', 1, N'Call button DOWN pressed at Floor 7', CAST(0x0000A43300C0BEF2 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (191, 2, N'Move from Floor 8 to Floor 9', 2, N'', CAST(0x0000A43300C0C5B4 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (192, 2, N'Move from Floor 7 to Floor 4', 1, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300C0CB9D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (193, 2, N'Move from Floor 9 to Floor 7', 2, N'Call button UP pressed at Floor 7', CAST(0x0000A43300C0CEEA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (194, 2, N'Move from Floor 10 to Floor 9', 4, N'Call button DOWN pressed at Floor 9', CAST(0x0000A43300C0D116 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (195, 3, N'Move from Floor 1 to Floor 3', 3, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300C3221C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (196, 3, N'Move from Floor 1 to Floor 5', 2, N'Call button UP pressed at Floor 5', CAST(0x0000A43300C322F3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (197, 3, N'Move from Floor 1 to Floor 7', 1, N'Call button UP pressed at Floor 7', CAST(0x0000A43300C32370 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (198, 3, N'Move from Floor 3 to Floor 2', 3, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300C325A3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (199, 3, N'Move from Floor 5 to Floor 6', 2, N'Call button UP pressed at Floor 6', CAST(0x0000A43300C328AB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (200, 3, N'Move from Floor 6 to Floor 3', 2, N'Call button DOWN pressed at Floor 3', CAST(0x0000A43300C32E93 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (201, 3, N'Move from Floor 3 to Floor 5', 2, N'', CAST(0x0000A43300C33439 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (202, 3, N'Move from Floor 7 to Floor 8', 1, N'', CAST(0x0000A43300C335FA AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (203, 3, N'Move from Floor 2 to Floor 4', 3, N'', CAST(0x0000A43300C3394A AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (204, 3, N'Move from Floor 5 to Floor 1', 2, N'', CAST(0x0000A43300C33F51 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (205, 3, N'Move from Floor 4 to Floor 7', 3, N'Call button UP pressed at Floor 7', CAST(0x0000A43300C3401D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (206, 3, N'Move from Floor 7 to Floor 6', 3, N'Call button DOWN pressed at Floor 6', CAST(0x0000A43300C344BB AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (207, 3, N'Move from Floor 8 to Floor 7', 1, N'Call button DOWN pressed at Floor 7', CAST(0x0000A43300C34817 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (208, 3, N'Move from Floor 6 to Floor 4', 3, N'Call button DOWN pressed at Floor 4', CAST(0x0000A43300C34C2D AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (209, 3, N'Move from Floor 1 to Floor 3', 2, N'Call button UP pressed at Floor 3', CAST(0x0000A43300C3507C AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (210, 4, N'Move from Floor 1 to Floor 3', 2, N'Call button UP pressed at Floor 3', CAST(0x0000A43300C59EC3 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (211, 4, N'Move from Floor 1 to Floor 6', 1, N'Call button DOWN pressed at Floor 6', CAST(0x0000A43300C5A0EC AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (212, 4, N'Move from Floor 3 to Floor 2', 2, N'Call button DOWN pressed at Floor 2', CAST(0x0000A43300C5A247 AS DateTime))
INSERT [dbo].[ActivityLog] ([ActivityId], [BuildingId], [ActivityDescription], [LiftNumber], [CallButtonActivity], [ActivityDate]) VALUES (213, 4, N'Move from Floor 6 to Floor 5', 1, N'Call button DOWN pressed at Floor 5', CAST(0x0000A43300C5A474 AS DateTime))
SET IDENTITY_INSERT [dbo].[ActivityLog] OFF
/****** Object:  StoredProcedure [dbo].[GetBuildings]    Script Date: 02/02/2015 12:07:06 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivityLogs]    Script Date: 02/02/2015 12:07:06 ******/
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
/****** Object:  StoredProcedure [dbo].[AddActivityLog]    Script Date: 02/02/2015 12:07:06 ******/
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
/****** Object:  Default [DF_ActivityLog_ActivityDate]    Script Date: 02/02/2015 12:07:06 ******/
ALTER TABLE [dbo].[ActivityLog] ADD  CONSTRAINT [DF_ActivityLog_ActivityDate]  DEFAULT (getdate()) FOR [ActivityDate]
GO
