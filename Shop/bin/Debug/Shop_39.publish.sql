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
PRINT N'Creating [dbo].[sp_Update_Item]...';


GO
CREATE PROCEDURE [dbo].[sp_Update_Item]
	@Id INT,
	@Name NVARCHAR(20),
	@Price FLOAT,
	@Quantity INT,
	@Size NVARCHAR(20),
	@TypeId INT 
AS
	UPDATE [Shop].[dbo].[Items] 
	SET [Name] = @Name, [Price] = @Price, [Quantity] = @Quantity, [Size] = @Size, [TypeId] = @TypeId 
	WHERE [Shop].[dbo].[Items].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Update_Shop]...';


GO
CREATE PROCEDURE [dbo].[sp_Update_Shop]
	@Id INT,
	@DateOfSale DATE,
	@CustomersId INT 
AS
	UPDATE [Shop].[dbo].[Shops] 
	SET [DateOfSale] = @DateOfSale, [CustomersId] = @CustomersId 
	WHERE [Shop].[dbo].[Shops].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Update_ShopDetails]...';


GO
CREATE PROCEDURE [dbo].[sp_Update_ShopDetails]
	@Id INT,
	@Quantity INT,
	@ShopId INT,
	@TypeId INT
AS
	UPDATE [Shop].[dbo].[ShopDetails] 
	SET [Quantity] = @Quantity, [ShopId] = @ShopId, [TypeId] = @TypeId 
	WHERE [Shop].[dbo].[ShopDetails].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Update_Supply]...';


GO
CREATE PROCEDURE [dbo].[sp_Update_Supply]
	@Id INT,
	@Date_Supply DATE,
	@ItemId INT
AS
	UPDATE [Shop].[dbo].[Supplys] 
	SET [Date_Supply] = @Date_Supply, [ItemId] = @ItemId
	WHERE [Shop].[dbo].[Supplys].[Id] = @Id
RETURN 0
GO
PRINT N'Creating [dbo].[sp_Update_TypeItem]...';


GO
CREATE PROCEDURE [dbo].[sp_Update_TypeItem]
	@Id INT,
	@Name NVARCHAR(20)
AS
	UPDATE [Shop].[dbo].[Types] 
	SET [Name] = @Name
	WHERE [Shop].[dbo].[Types].[Id] = @Id
RETURN 0
GO
PRINT N'Update complete.';


GO
