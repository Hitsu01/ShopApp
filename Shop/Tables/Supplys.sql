CREATE TABLE [dbo].[Supplys]
(
	[Id] INT NOT NULL IDENTITY,
	[Date_Supply] DATE,
	[ItemId] INT,

	CONSTRAINT [Supplys_PK] PRIMARY KEY([Id]),
	CONSTRAINT [Supplys_Items_FK] FOREIGN KEY([ItemId]) REFERENCES [dbo].[Items]([Id])

)
