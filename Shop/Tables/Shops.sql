CREATE TABLE [dbo].[Shops]
(
	[Id] INT NOT NULL IDENTITY,
	[DateOfSale] DATE,
	[CustomersId] INT,

	CONSTRAINT [Shops_PK] PRIMARY KEY([Id]),
	CONSTRAINT [Shops_Customers_FK] FOREIGN KEY([CustomersID]) REFERENCES [dbo].[Customers]([Id]),
)
