USE [master]
GO
/****** Object:  Database [AOtel]    Script Date: 26.04.2023 15:22:11 ******/
CREATE DATABASE [AOtel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AOtel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AOtel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AOtel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AOtel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AOtel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AOtel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AOtel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AOtel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AOtel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AOtel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AOtel] SET ARITHABORT OFF 
GO
ALTER DATABASE [AOtel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AOtel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AOtel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AOtel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AOtel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AOtel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AOtel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AOtel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AOtel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AOtel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AOtel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AOtel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AOtel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AOtel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AOtel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AOtel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AOtel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AOtel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AOtel] SET  MULTI_USER 
GO
ALTER DATABASE [AOtel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AOtel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AOtel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AOtel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AOtel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AOtel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AOtel] SET QUERY_STORE = ON
GO
ALTER DATABASE [AOtel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AOtel]
GO
/****** Object:  Table [dbo].[KullaniciSet]    Script Date: 26.04.2023 15:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciSet](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [nvarchar](max) NULL,
	[Sifre] [nvarchar](max) NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[DTarih] [datetime] NULL,
	[Telefon] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[Gorev] [nvarchar](max) NULL,
	[Adres] [nvarchar](max) NULL,
	[Maas] [decimal](18, 0) NULL,
	[SubeNo] [int] NULL,
 CONSTRAINT [PK_KullaniciSet] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriSet]    Script Date: 26.04.2023 15:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriSet](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[DTarih] [datetime] NULL,
	[Telefon] [nvarchar](max) NULL,
	[Adres] [nvarchar](max) NULL,
	[SubeNo] [int] NOT NULL,
 CONSTRAINT [PK_MusteriSet] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubelerSet]    Script Date: 26.04.2023 15:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubelerSet](
	[SubeNo] [int] IDENTITY(1,1) NOT NULL,
	[CalisanSayisi] [int] NULL,
	[Adres] [nvarchar](max) NULL,
	[OdaSayisi] [int] NULL,
	[Telefon] [nvarchar](max) NULL,
	[SubeAd] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubelerSet] PRIMARY KEY CLUSTERED 
(
	[SubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KullaniciSet] ON 

INSERT [dbo].[KullaniciSet] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [DTarih], [Telefon], [Mail], [Gorev], [Adres], [Maas], [SubeNo]) VALUES (1, N'admin', N'123', N'aleyna', CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'54564754', N'aleyna@gmail.com', N'müdür', N'beyoğlu', CAST(800000 AS Decimal(18, 0)), 2)
INSERT [dbo].[KullaniciSet] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [DTarih], [Telefon], [Mail], [Gorev], [Adres], [Maas], [SubeNo]) VALUES (3, N'elifsahin', N'1234', N'elif', CAST(N'1988-09-29T00:00:00.000' AS DateTime), N'5564745', N'elif@gmail.com', N'müdür', N'şile', CAST(7800000 AS Decimal(18, 0)), 3)
INSERT [dbo].[KullaniciSet] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [DTarih], [Telefon], [Mail], [Gorev], [Adres], [Maas], [SubeNo]) VALUES (4, N'ada', N'1234', N'ada gün', CAST(N'1980-07-15T00:00:00.000' AS DateTime), N'5564745', N'ada@gmail.com', N'yardımcı', N'şile', CAST(7800000 AS Decimal(18, 0)), 4)
INSERT [dbo].[KullaniciSet] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [DTarih], [Telefon], [Mail], [Gorev], [Adres], [Maas], [SubeNo]) VALUES (5, N'mertözen', N'1234', N'mert özen', CAST(N'1999-01-12T00:00:00.000' AS DateTime), N'5564745', N'mert@gmail.com', N'danışman', N'sinop', CAST(7800000 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[KullaniciSet] OFF
GO
SET IDENTITY_INSERT [dbo].[MusteriSet] ON 

INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (1, N'aleyna arı', CAST(N'1996-12-11T00:00:00.000' AS DateTime), N'3444636', N'İstanbul ', 2)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (3, N'mustafa', CAST(N'1986-05-19T00:00:00.000' AS DateTime), N'556745', N'beyoğlu', 2)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (4, N'arda', CAST(N'1990-08-04T00:00:00.000' AS DateTime), N'3663', N'istanbul', 4)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (5, N'hazal', CAST(N'2997-09-11T00:00:00.000' AS DateTime), N'67868', N'Tekirdağ', 3)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (6, N'nagihan', CAST(N'1960-12-04T00:00:00.000' AS DateTime), N'666768', N'Bursa', 4)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (7, N'leyla', CAST(N'1975-05-23T00:00:00.000' AS DateTime), N'6432786', N'Malatya', 5)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (8, N'nejla', CAST(N'1987-07-12T00:00:00.000' AS DateTime), N'22667868', N'Trabzon', 4)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (9, N'gül', NULL, N'4467', N'Kars', 5)
INSERT [dbo].[MusteriSet] ([MusteriNo], [AdSoyad], [DTarih], [Telefon], [Adres], [SubeNo]) VALUES (10, N'elif', NULL, N'12567', N'Van', 6)
SET IDENTITY_INSERT [dbo].[MusteriSet] OFF
GO
SET IDENTITY_INSERT [dbo].[SubelerSet] ON 

INSERT [dbo].[SubelerSet] ([SubeNo], [CalisanSayisi], [Adres], [OdaSayisi], [Telefon], [SubeAd]) VALUES (2, 35, N'Beyoğlu', 20, N'45362', N'Beyoğlu')
INSERT [dbo].[SubelerSet] ([SubeNo], [CalisanSayisi], [Adres], [OdaSayisi], [Telefon], [SubeAd]) VALUES (3, 50, N'Şile', 100, N'352', N'Şile')
INSERT [dbo].[SubelerSet] ([SubeNo], [CalisanSayisi], [Adres], [OdaSayisi], [Telefon], [SubeAd]) VALUES (4, 150, N'Antalya', 200, N'5567578', N'Antalya')
INSERT [dbo].[SubelerSet] ([SubeNo], [CalisanSayisi], [Adres], [OdaSayisi], [Telefon], [SubeAd]) VALUES (5, 30, N'Sinop', 70, N'3356', N'Sinop')
INSERT [dbo].[SubelerSet] ([SubeNo], [CalisanSayisi], [Adres], [OdaSayisi], [Telefon], [SubeAd]) VALUES (6, 150, N'İzmir', 200, N'4634', N'İzmir')
SET IDENTITY_INSERT [dbo].[SubelerSet] OFF
GO
USE [master]
GO
ALTER DATABASE [AOtel] SET  READ_WRITE 
GO
