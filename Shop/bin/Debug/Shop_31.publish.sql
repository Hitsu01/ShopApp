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
PRINT N'Creating [dbo].[sp_Get_Customer_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Customer_ById]
	@Id int
	
AS
	SELECT * FROM [Shop].[dbo].[Customers] WHERE [Shop].[dbo].[Customers].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Item_All]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Item_All]
	
AS
	SELECT * FROM [Shop].[dbo].[Items]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Item_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Item_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Items] WHERE [Shop].[dbo].[Items].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Shop_All]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Shop_All]
	
AS
	SELECT * FROM [Shop].[dbo].[Shops]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Shop_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Shop_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Shops] WHERE [Shop].[dbo].[Shops].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_ShopDetails_All]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_ShopDetails_All]
	
AS
	SELECT * FROM [Shop].[dbo].[ShopDetails]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_ShopDetails_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_ShopDetails_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[ShopDetails] WHERE [Shop].[dbo].[ShopDetails].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Suplly_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Suplly_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Supplys] WHERE [Shop].[dbo].[Supplys].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_Supply_All]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_Supply_All]
AS
	SELECT * FROM [Shop].[dbo].[Supplys]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_TypeItem_All]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_TypeItem_All]
	
AS
	SELECT * FROM [Shop].[dbo].[Types]
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Get_TypeItem_ById]...';


GO
CREATE PROCEDURE [dbo].[sp_Get_TypeItem_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Types] WHERE [Shop].[dbo].[Types].[Id] = @Id
RETURN 0
GO
PRINT N'Update complete.';


GO
