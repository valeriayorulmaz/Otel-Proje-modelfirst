
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/21/2023 00:45:47
-- Generated from EDMX file: C:\Users\Aleyna\Desktop\Projects\4)Otel-Proje-modelfirst\WindowsFormsApp1\Otel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AOtel];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[KullaniciSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KullaniciSet];
GO
IF OBJECT_ID(N'[dbo].[SubelerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubelerSet];
GO
IF OBJECT_ID(N'[dbo].[MusteriSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MusteriSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'KullaniciSet'
CREATE TABLE [dbo].[KullaniciSet] (
    [KullaniciNo] int IDENTITY(1,1) NOT NULL,
    [KullaniciAd] nvarchar(max)  NULL,
    [Sifre] nvarchar(max)  NULL,
    [AdSoyad] nvarchar(max)  NULL,
    [DTarih] datetime  NULL,
    [Telefon] nvarchar(max)  NULL,
    [Mail] nvarchar(max)  NULL,
    [Gorev] nvarchar(max)  NULL,
    [Adres] nvarchar(max)  NULL,
    [Maas] decimal(18,0)  NULL,
    [SubeNo] int  NULL
);
GO

-- Creating table 'SubelerSet'
CREATE TABLE [dbo].[SubelerSet] (
    [SubeNo] int IDENTITY(1,1) NOT NULL,
    [CalisanSayisi] int  NULL,
    [Adres] nvarchar(max)  NULL,
    [OdaSayisi] int  NULL,
    [Telefon] nvarchar(max)  NULL,
    [SubeAd] nvarchar(max)  NULL
);
GO

-- Creating table 'MusteriSet'
CREATE TABLE [dbo].[MusteriSet] (
    [MusteriNo] int IDENTITY(1,1) NOT NULL,
    [AdSoyad] nvarchar(max)  NULL,
    [DTarih] datetime  NULL,
    [Telefon] nvarchar(max)  NULL,
    [Adres] nvarchar(max)  NULL,
    [SubeNo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [KullaniciNo] in table 'KullaniciSet'
ALTER TABLE [dbo].[KullaniciSet]
ADD CONSTRAINT [PK_KullaniciSet]
    PRIMARY KEY CLUSTERED ([KullaniciNo] ASC);
GO

-- Creating primary key on [SubeNo] in table 'SubelerSet'
ALTER TABLE [dbo].[SubelerSet]
ADD CONSTRAINT [PK_SubelerSet]
    PRIMARY KEY CLUSTERED ([SubeNo] ASC);
GO

-- Creating primary key on [MusteriNo] in table 'MusteriSet'
ALTER TABLE [dbo].[MusteriSet]
ADD CONSTRAINT [PK_MusteriSet]
    PRIMARY KEY CLUSTERED ([MusteriNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------