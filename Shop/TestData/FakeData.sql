
SET IDENTITY_INSERT [Shop].[dbo].[Customers] ON
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(0,'Hitsu','+38068724764')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(1,'Vadym','+38068723454')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(2,'Sergo','+38068724344')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(3,'Ispano','+3806234423')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(4,'Nabe','+3806872556')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(5,'Groot','+38068724123')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(6,'Tor','+38068724123')
INSERT INTO [Shop].[dbo].[Customers]([Id],[Name],[Phone]) VALUES(7,'IronMan','+38068256784')
SET IDENTITY_INSERT [Shop].[dbo].[Customers] OFF

SET IDENTITY_INSERT [Shop].[dbo].[Shops] ON
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(0,'2016-01-22',0)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(1,'2016-06-16',1)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(2,'2016-04-14',2)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(3,'2016-01-03',3)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(4,'2016-11-02',4)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(5,'2016-10-12',5)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(6,'2016-07-21',6)
INSERT INTO [Shop].[dbo].[Shops]([Id],[DateOfSale],[CustomersId]) VALUES(7,'2016-01-11',7)

SET IDENTITY_INSERT [Shop].[dbo].[Shops] OFF


SET IDENTITY_INSERT [Shop].[dbo].[Types] ON
INSERT INTO [Shop].[dbo].[Types]([Id],[Name]) VALUES(0,'T-shirt')
INSERT INTO [Shop].[dbo].[Types]([Id],[Name]) VALUES(1,'Sneakers')
INSERT INTO [Shop].[dbo].[Types]([Id],[Name]) VALUES(2,'Shirt')

SET IDENTITY_INSERT [Shop].[dbo].[Types] OFF


SET IDENTITY_INSERT [Shop].[dbo].[ShopDetails] ON
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(0,1,0,0)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(1,1,0,1)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(2,2,1,0)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(3,1,2,2)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(4,3,3,1)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(5,1,3,0)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(6,1,4,2)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(7,5,5,2)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(8,1,6,1)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(9,2,6,0)
INSERT INTO [Shop].[dbo].[ShopDetails]([Id],[Quantity],[ShopId],[TypeId]) VALUES(10,1,7,1)

SET IDENTITY_INSERT [Shop].[dbo].[ShopDetails] OFF


SET IDENTITY_INSERT [Shop].[dbo].[Items] ON
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(0,'NIKE',36.5,7,'39',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(1,'timberland',345,5,'42',2)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(2,'adidas',459,2,'S',0)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(3,'NIKE',100.1,4,'M',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(4,'adidas',1010,7,'L',0)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(5,'NIKE',432.8,10,'42',0)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(6,'puma',99.9,7,'45',2)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(7,'timberland',124,12,'35',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(8,'NIKE',364,7,'L',0)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(9,'puma',87,6,'S',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(10,'NIKE',375,7,'XL',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(11,'adidas',365.99,2,'XS',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(12,'timberland',109,7,'40',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(13,'timberland',334,3,'42',1)
INSERT INTO [Shop].[dbo].[Items]([Id],[Name],[Price],[Quantity],[Size],[TypeId]) VALUES(14,'NIKE',123,10,'M',1)

SET IDENTITY_INSERT [Shop].[dbo].[Items] OFF


SET IDENTITY_INSERT [Shop].[dbo].[Supplys] ON
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(0,'2016-01-12',0)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(1,'2016-09-11',1)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(2,'2016-04-24',2)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(3,'2016-08-22',3)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(4,'2016-03-10',4)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(5,'2016-01-17',5)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(6,'2016-01-13',6)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(7,'2016-04-16',7)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(8,'2016-01-12',8)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(9,'2016-06-12',9)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(10,'2016-01-23',10)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(11,'2016-01-12',11)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(12,'2016-11-25',12)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(13,'2016-02-27',13)
INSERT INTO [Shop].[dbo].[Supplys]([Id],[Date_Supply],[ItemId]) VALUES(14,'2016-05-23',14)

SET IDENTITY_INSERT [Shop].[dbo].[Supplys] OFF


