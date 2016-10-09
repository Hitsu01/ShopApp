CREATE TABLE [dbo].[ShopDetails]
(
	[Id] INT NOT NULL IDENTITY,
	[Quantity] INT,
	[ShopId] INT,
	[TypeId] INT,

	CONSTRAINT [ShopDetails_PK] PRIMARY KEY([Id]),
	CONSTRAINT [ShopDetails_Shops_FK] FOREIGN KEY([ShopId]) REFERENCES [dbo].[Shops]([Id]), 
	CONSTRAINT [ShopDetails_Types_FK] FOREIGN KEY([TypeId]) REFERENCES [dbo].[Types]([Id]),
)
