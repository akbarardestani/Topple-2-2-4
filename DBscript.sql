USE [master]
GO
/****** Object:  Database [TotalSlopeDB]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
CREATE DATABASE [TotalSlopeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TotalSlopeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AKBARARDESTANI\MSSQL\DATA\TotalSlopeDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TotalSlopeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.AKBARARDESTANI\MSSQL\DATA\TotalSlopeDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TotalSlopeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TotalSlopeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TotalSlopeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TotalSlopeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TotalSlopeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TotalSlopeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TotalSlopeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TotalSlopeDB] SET  MULTI_USER 
GO
ALTER DATABASE [TotalSlopeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TotalSlopeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TotalSlopeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TotalSlopeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TotalSlopeDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TotalSlopeDB', N'ON'
GO
USE [TotalSlopeDB]
GO
/****** Object:  User [TotalSlopeDB_Login]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
CREATE USER [TotalSlopeDB_Login] FOR LOGIN [TotalSlopeDB_Login] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TotalSlopeDB_Login]
GO
/****** Object:  Table [dbo].[Tbl_Anchor]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Anchor](
	[Id_Anchor] [int] IDENTITY(1,1) NOT NULL,
	[Anchor Name] [nvarchar](50) NOT NULL,
	[Id_Slope] [int] NOT NULL,
	[Id_Model] [int] NOT NULL,
	[Height in Face] [numeric](6, 3) NOT NULL,
	[Anchor Angle] [numeric](4, 2) NOT NULL,
	[Anchor Length] [numeric](6, 3) NOT NULL,
	[Anchorage Force] [numeric](10, 0) NOT NULL,
	[Anchorage Yield Force] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Tbl_Anchor] PRIMARY KEY CLUSTERED 
(
	[Id_Anchor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Force]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Force](
	[Id_Force] [int] IDENTITY(1,1) NOT NULL,
	[Force Name] [nvarchar](50) NOT NULL,
	[Force Type] [nvarchar](50) NULL,
	[Model_Id] [int] NULL,
	[Slope_Id] [int] NOT NULL,
	[From Height In Face] [numeric](6, 3) NOT NULL,
	[To Height In Face] [numeric](6, 3) NOT NULL,
	[Force] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_Tbl_Force] PRIMARY KEY CLUSTERED 
(
	[Id_Force] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Joint]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Joint](
	[Id_Joint] [int] IDENTITY(1,1) NOT NULL,
	[Joint Name] [nvarchar](50) NOT NULL,
	[Cohesive Strength] [numeric](10, 0) NOT NULL,
	[Cohesive Strength Tolerance] [numeric](10, 0) NULL,
	[Friction Angle] [numeric](4, 2) NOT NULL,
	[Friction Angle Tolerance] [numeric](4, 2) NULL,
	[Cohesive Strength Disrtibution] [nvarchar](50) NULL,
	[Friction Angle Distribution] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Joint] PRIMARY KEY CLUSTERED 
(
	[Id_Joint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Material]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Material](
	[Id_Material] [int] IDENTITY(1,1) NOT NULL,
	[Material Name] [nvarchar](50) NOT NULL,
	[Material Type] [nvarchar](50) NOT NULL,
	[Cohesive Strength] [numeric](10, 0) NOT NULL,
	[Cohesive StrengthTolerance] [numeric](10, 0) NULL,
	[Friction Angle] [numeric](4, 2) NOT NULL,
	[Friction Angle_Tolerance] [numeric](4, 2) NULL,
	[Unit Weight] [numeric](7, 0) NOT NULL,
	[Unit Weight Tolerance] [numeric](7, 0) NULL,
	[Tensile Strength] [numeric](10, 0) NOT NULL,
	[Tensile Strength Tolerance] [numeric](10, 0) NULL,
	[Young Modulus] [numeric](10, 0) NULL,
	[Young Modulus Tolerance] [numeric](10, 0) NULL,
	[Poisson Ratio] [numeric](3, 2) NULL,
	[Poisson Ratio Tolerance] [numeric](3, 2) NULL,
	[Cohesive Strength Disrtibution] [nvarchar](50) NULL,
	[Friction Angle Distribution] [nvarchar](50) NULL,
	[Unit Weight Distribution] [nvarchar](50) NULL,
	[Tensile Strength Distribution] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Material] PRIMARY KEY CLUSTERED 
(
	[Id_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Model_Name]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Model_Name](
	[Id_Model] [int] IDENTITY(1,1) NOT NULL,
	[Model Name] [nvarchar](50) NOT NULL,
	[Horizontal Acceleration] [numeric](4, 2) NULL,
	[Horizontal Acceleration Tolerance] [numeric](4, 2) NULL,
	[Vertical Acceleration] [numeric](4, 2) NULL,
	[Vertical Acceleration Tolerance] [numeric](4, 2) NULL,
	[Model Type] [nvarchar](50) NULL,
	[Horizontal Acceleration Distribusion] [nvarchar](50) NULL,
	[Vertical Acceleration Distribusion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Model_Name] PRIMARY KEY CLUSTERED 
(
	[Id_Model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Result]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Result](
	[Id_Result] [int] IDENTITY(1,1) NOT NULL,
	[Id_Run] [int] NOT NULL,
	[Slice No] [int] NOT NULL,
	[Id_Slope] [int] NOT NULL,
	[Height] [numeric](6, 3) NOT NULL,
	[Weight] [numeric](10, 0) NOT NULL,
	[Basal angle] [numeric](4, 2) NOT NULL,
	[Force] [numeric](10, 0) NOT NULL,
	[Force Angle] [numeric](4, 2) NOT NULL,
	[Force Height] [numeric](6, 3) NOT NULL,
	[Sliding Force] [numeric](10, 0) NULL,
	[Toppling Force] [numeric](10, 0) NULL,
	[Flexural Force] [numeric](10, 0) NULL,
	[Shearing Force] [numeric](10, 0) NULL,
	[Slice Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Result] PRIMARY KEY CLUSTERED 
(
	[Id_Result] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Run]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Run](
	[Id_Run] [int] IDENTITY(1,1) NOT NULL,
	[Id_Model] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Run] PRIMARY KEY CLUSTERED 
(
	[Id_Run] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Slope]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Slope](
	[Id_Slope] [int] IDENTITY(1,1) NOT NULL,
	[Slope Name] [nvarchar](50) NOT NULL,
	[Id_Material] [int] NOT NULL,
	[Face Angle] [numeric](4, 2) NOT NULL,
	[Face Height] [numeric](6, 3) NOT NULL,
	[Face Column No] [int] NULL,
	[Face Column No Tolerance] [int] NULL,
	[Column Angle] [numeric](4, 2) NULL,
	[Column Angle Tolerance] [numeric](4, 2) NULL,
	[Id_Column_Joint] [int] NULL,
	[Basal Plane Angle] [numeric](4, 2) NOT NULL,
	[Basal Plane Angle Tolerance] [numeric](4, 2) NULL,
	[Id_Basal_Joint] [int] NOT NULL,
	[Top Water Level] [numeric](6, 3) NULL,
	[Top Water Level Tolerance] [numeric](6, 3) NULL,
	[Water Level Angle] [numeric](4, 2) NULL,
	[Water Level Angle Tolerance] [numeric](4, 2) NULL,
	[Blockiness] [numeric](5, 2) NOT NULL,
	[Blockiness Tolerance] [numeric](5, 2) NOT NULL,
	[Material Type] [nvarchar](50) NULL,
	[Face Column No Distribution] [nvarchar](50) NULL,
	[Column Angle Distribution] [nvarchar](50) NULL,
	[Basal Plane Angle Distribution] [nvarchar](50) NULL,
	[Top Water Level Distribution] [nvarchar](50) NULL,
	[Water Level Angle Distribution] [nvarchar](50) NULL,
	[Blockiness Distribution] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Slope] PRIMARY KEY CLUSTERED 
(
	[Id_Slope] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Slope_Sequence]    Script Date: 10/03/1398 07:43:31 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Slope_Sequence](
	[Id_Slope_Sequence] [int] IDENTITY(1,1) NOT NULL,
	[Id_Model] [int] NOT NULL,
	[Id_Slope] [int] NOT NULL,
	[Id_Side_joint] [int] NOT NULL,
	[Sequence No] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Slope_Secuence] PRIMARY KEY CLUSTERED 
(
	[Id_Slope_Sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Tbl_Anchor]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Anchor_Tbl_Model_Name] FOREIGN KEY([Id_Model])
REFERENCES [dbo].[Tbl_Model_Name] ([Id_Model])
GO
ALTER TABLE [dbo].[Tbl_Anchor] CHECK CONSTRAINT [FK_Tbl_Anchor_Tbl_Model_Name]
GO
ALTER TABLE [dbo].[Tbl_Anchor]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Anchor_Tbl_Slope] FOREIGN KEY([Id_Slope])
REFERENCES [dbo].[Tbl_Slope] ([Id_Slope])
GO
ALTER TABLE [dbo].[Tbl_Anchor] CHECK CONSTRAINT [FK_Tbl_Anchor_Tbl_Slope]
GO
ALTER TABLE [dbo].[Tbl_Force]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Force_Tbl_Model_Name] FOREIGN KEY([Model_Id])
REFERENCES [dbo].[Tbl_Model_Name] ([Id_Model])
GO
ALTER TABLE [dbo].[Tbl_Force] CHECK CONSTRAINT [FK_Tbl_Force_Tbl_Model_Name]
GO
ALTER TABLE [dbo].[Tbl_Force]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Force_Tbl_Slope] FOREIGN KEY([Slope_Id])
REFERENCES [dbo].[Tbl_Slope] ([Id_Slope])
GO
ALTER TABLE [dbo].[Tbl_Force] CHECK CONSTRAINT [FK_Tbl_Force_Tbl_Slope]
GO
ALTER TABLE [dbo].[Tbl_Result]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Result_Tbl_Run] FOREIGN KEY([Id_Run])
REFERENCES [dbo].[Tbl_Run] ([Id_Run])
GO
ALTER TABLE [dbo].[Tbl_Result] CHECK CONSTRAINT [FK_Tbl_Result_Tbl_Run]
GO
ALTER TABLE [dbo].[Tbl_Result]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Result_Tbl_Slope] FOREIGN KEY([Id_Slope])
REFERENCES [dbo].[Tbl_Slope] ([Id_Slope])
GO
ALTER TABLE [dbo].[Tbl_Result] CHECK CONSTRAINT [FK_Tbl_Result_Tbl_Slope]
GO
ALTER TABLE [dbo].[Tbl_Run]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Run_Tbl_Model_Name] FOREIGN KEY([Id_Model])
REFERENCES [dbo].[Tbl_Model_Name] ([Id_Model])
GO
ALTER TABLE [dbo].[Tbl_Run] CHECK CONSTRAINT [FK_Tbl_Run_Tbl_Model_Name]
GO
ALTER TABLE [dbo].[Tbl_Slope]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Tbl_Joint] FOREIGN KEY([Id_Basal_Joint])
REFERENCES [dbo].[Tbl_Joint] ([Id_Joint])
GO
ALTER TABLE [dbo].[Tbl_Slope] CHECK CONSTRAINT [FK_Tbl_Slope_Tbl_Joint]
GO
ALTER TABLE [dbo].[Tbl_Slope]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Tbl_Joint1] FOREIGN KEY([Id_Column_Joint])
REFERENCES [dbo].[Tbl_Joint] ([Id_Joint])
GO
ALTER TABLE [dbo].[Tbl_Slope] CHECK CONSTRAINT [FK_Tbl_Slope_Tbl_Joint1]
GO
ALTER TABLE [dbo].[Tbl_Slope]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Tbl_Material] FOREIGN KEY([Id_Material])
REFERENCES [dbo].[Tbl_Material] ([Id_Material])
GO
ALTER TABLE [dbo].[Tbl_Slope] CHECK CONSTRAINT [FK_Tbl_Slope_Tbl_Material]
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Joint] FOREIGN KEY([Id_Side_joint])
REFERENCES [dbo].[Tbl_Joint] ([Id_Joint])
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence] CHECK CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Joint]
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Model_Name] FOREIGN KEY([Id_Model])
REFERENCES [dbo].[Tbl_Model_Name] ([Id_Model])
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence] CHECK CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Model_Name]
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Slope] FOREIGN KEY([Id_Slope])
REFERENCES [dbo].[Tbl_Slope] ([Id_Slope])
GO
ALTER TABLE [dbo].[Tbl_Slope_Sequence] CHECK CONSTRAINT [FK_Tbl_Slope_Sequence_Tbl_Slope]
GO
USE [master]
GO
ALTER DATABASE [TotalSlopeDB] SET  READ_WRITE 
GO
