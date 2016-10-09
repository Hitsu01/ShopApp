
DELETE FROM [Shop].[dbo].[ShopDetails] WHERE [Id] >= 0
DELETE FROM [Shop].[dbo].[Shops] WHERE [Id] >= 0
DELETE FROM [Shop].[dbo].[Customers] WHERE [Id] >= 0
DELETE FROM [Shop].[dbo].[Supplys] WHERE [Id] >= 0
DELETE FROM [Shop].[dbo].[Items] WHERE [Id] >= 0
DELETE FROM [Shop].[dbo].[Types] WHERE [Id] >= 0




DBCC CHECKIDENT('[Shop].[dbo].[ShopDetails]',RESEED,0)
DBCC CHECKIDENT('[Shop].[dbo].[Shops]',RESEED,0)
DBCC CHECKIDENT('[Shop].[dbo].[Supplys]',RESEED,0)
DBCC CHECKIDENT('[Shop].[dbo].[Customers]',RESEED,0)
DBCC CHECKIDENT('[Shop].[dbo].[Items]',RESEED,0)
DBCC CHECKIDENT('[Shop].[dbo].[Types]',RESEED,0)
