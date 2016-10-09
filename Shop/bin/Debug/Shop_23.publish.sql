﻿/*
Deployment script for Shop3

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Shop3"
:setvar DefaultFilePrefix "Shop3"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (20) NULL,
    [ShopId] INT           NULL,
    [Value]  NVARCHAR (20) NULL,
    CONSTRAINT [Customers_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Items]...';


GO
CREATE TABLE [dbo].[Items] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (20) NULL,
    [Price]    FLOAT (53)    NULL,
    [Quantity] INT           NULL,
    [Size]     NVARCHAR (20) NULL,
    [TypeId]   INT           NULL,
    CONSTRAINT [Items_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ShopDetails]...';


GO
CREATE TABLE [dbo].[ShopDetails] (
    [Id]       INT NOT NULL,
    [Quantity] INT NULL,
    [ShopId]   INT NULL,
    [TypeId]   INT NULL,
    CONSTRAINT [ShopDetails_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Shops]...';


GO
CREATE TABLE [dbo].[Shops] (
    [Id]         INT  IDENTITY (1, 1) NOT NULL,
    [DateOfSale] DATE NULL,
    CONSTRAINT [Shops_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Supplys]...';


GO
CREATE TABLE [dbo].[Supplys] (
    [Id]          INT  NOT NULL,
    [Date_Supply] DATE NULL,
    [ItemId]      INT  NULL,
    CONSTRAINT [Supplys_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Types]...';


GO
CREATE TABLE [dbo].[Types] (
    [Id]   INT           NOT NULL,
    [Name] NVARCHAR (20) NULL,
    CONSTRAINT [Types_PK] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Customers_Shops_FK]...';


GO
ALTER TABLE [dbo].[Customers]
    ADD CONSTRAINT [Customers_Shops_FK] FOREIGN KEY ([ShopId]) REFERENCES [dbo].[Shops] ([Id]);


GO
PRINT N'Creating [dbo].[Items_Types_FK]...';


GO
ALTER TABLE [dbo].[Items]
    ADD CONSTRAINT [Items_Types_FK] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[Types] ([Id]);


GO
PRINT N'Creating [dbo].[ShopDetails_Shops_FK]...';


GO
ALTER TABLE [dbo].[ShopDetails]
    ADD CONSTRAINT [ShopDetails_Shops_FK] FOREIGN KEY ([ShopId]) REFERENCES [dbo].[Shops] ([Id]);


GO
PRINT N'Creating [dbo].[ShopDetails_Types_FK]...';


GO
ALTER TABLE [dbo].[ShopDetails]
    ADD CONSTRAINT [ShopDetails_Types_FK] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[Types] ([Id]);


GO
PRINT N'Creating [dbo].[Supplys_Items_FK]...';


GO
ALTER TABLE [dbo].[Supplys]
    ADD CONSTRAINT [Supplys_Items_FK] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Items] ([Id]);


GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
