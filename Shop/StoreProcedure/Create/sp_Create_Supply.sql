CREATE PROCEDURE [dbo].[sp_Create_Supply]
	@Id INT,
	@Date_Supply DATE,
	@ItemId INT
AS
	INSERT INTO [Shop].[dbo].[Supplys]([Date_Supply], [ItemId]) VALUES(@Date_Supply, @ItemId)
RETURN 0
