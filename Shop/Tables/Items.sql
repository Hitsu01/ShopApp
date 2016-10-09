CREATE TABLE [dbo].[Items]
(
	[Id] INT NOT NULL IDENTITY,
	[Name] NVARCHAR(20),
	[Price] FLOAT,
	[Quantity] INT,
	[Size] NVARCHAR(20),
	[TypeId] INT, 


	CONSTRAINT [Items_PK] PRIMARY KEY([Id]),
	CONSTRAINT [Items_Types_FK] FOREIGN KEY([TypeId]) REFERENCES [dbo].[Types]([Id]),
)
