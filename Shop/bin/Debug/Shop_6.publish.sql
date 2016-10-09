﻿/*
Deployment script for Shop

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Shop"
:setvar DefaultFilePrefix "Shop"
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
USE [$(DatabaseName)];


GO
PRINT N'Dropping [dbo].[Shop_FK]...';


GO
ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [Shop_FK];


GO
PRINT N'Dropping [dbo].[Shops_FK]...';


GO
ALTER TABLE [dbo].[Items] DROP CONSTRAINT [Shops_FK];


GO
PRINT N'Starting rebuilding table [dbo].[Shops]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Shops] (
    [Id]         INT  IDENTITY (1, 1) NOT NULL,
    [DateOfSale] DATE NULL,
    CONSTRAINT [tmp_ms_xx_constraint_Shops_PK1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Shops])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Shops] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Shops] ([Id], [DateOfSale])
        SELECT   [Id],
                 [DateOfSale]
        FROM     [dbo].[Shops]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Shops] OFF;
    END

DROP TABLE [dbo].[Shops];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Shops]', N'Shops';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_Shops_PK1]', N'Shops_PK', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[Shops_FK]...';


GO
ALTER TABLE [dbo].[Items] WITH NOCHECK
    ADD CONSTRAINT [Shops_FK] FOREIGN KEY ([ShopId]) REFERENCES [dbo].[Shops] ([Id]);


GO
PRINT N'Creating [dbo].[Coustomers_Shops_FK]...';


GO
ALTER TABLE [dbo].[Customers] WITH NOCHECK
    ADD CONSTRAINT [Coustomers_Shops_FK] FOREIGN KEY ([ShopId]) REFERENCES [dbo].[Shops] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Items] WITH CHECK CHECK CONSTRAINT [Shops_FK];

ALTER TABLE [dbo].[Customers] WITH CHECK CHECK CONSTRAINT [Coustomers_Shops_FK];


GO
PRINT N'Update complete.';


GO
