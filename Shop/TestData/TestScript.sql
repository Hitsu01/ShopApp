SELECT [Name], [Quantity] FROM ([Shop].[dbo].[Customers] INNER JOIN [Shop].[dbo].[Shops] ON [Shop].[dbo].[Customers].[Id] = [Shop].[dbo].[Shops].[CustomersId]) INNER JOIN [Shop].[dbo].[ShopDetails] ON [Shop].[dbo].[Shops].[Id] = [Shop].[dbo].[ShopDetails].[ShopId] WHERE Quantity > 1



SELECT [Shop].[dbo].[Items].[Name] FROM [Shop].[dbo].[Items] INNER JOIN [Shop].[dbo].[Types] ON [Shop].[dbo].[Items].[TypeId] = [Shop].[dbo].[Types].[Id] WHERE [Shop].[dbo].[Types].[Name] = 'Shirt'
