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
PRINT N'Dropping [dbo].[Shops_FK]...';


GO
ALTER TABLE [dbo].[Items] DROP CONSTRAINT [Shops_FK];


GO
PRINT N'Altering [dbo].[Items]...';


GO
ALTER TABLE [dbo].[Items] ALTER COLUMN [ShopId] INT NULL;


GO
PRINT N'Creating [dbo].[Shops_FK]...';


GO
ALTER TABLE [dbo].[Items] WITH NOCHECK
    ADD CONSTRAINT [Shops_FK] FOREIGN KEY ([ShopId]) REFERENCES [dbo].[Shops] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Items] WITH CHECK CHECK CONSTRAINT [Shops_FK];


GO
PRINT N'Update complete.';


GO
