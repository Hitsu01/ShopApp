CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL IDENTITY,
	[Name] NVARCHAR(20),
	[Phone] NVARCHAR(20),

	CONSTRAINT [Customers_PK] PRIMARY KEY([Id]),


)
