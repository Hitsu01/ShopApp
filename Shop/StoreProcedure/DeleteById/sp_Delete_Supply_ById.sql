CREATE PROCEDURE [dbo].[sp_Delete_Supply_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[Supplys] WHERE [Shop].[dbo].[Supplys].[Id] = @Id
RETURN 0
