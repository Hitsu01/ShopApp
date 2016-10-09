CREATE PROCEDURE [dbo].[sp_Update_Supply]
	@Id INT,
	@Date_Supply DATE,
	@ItemId INT
AS
	UPDATE [Shop].[dbo].[Supplys] 
	SET [Date_Supply] = @Date_Supply, [ItemId] = @ItemId
	WHERE [Shop].[dbo].[Supplys].[Id] = @Id
RETURN 0
