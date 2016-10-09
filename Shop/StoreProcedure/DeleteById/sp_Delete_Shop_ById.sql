CREATE PROCEDURE [dbo].[sp_Delete_Shop_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[Shops] WHERE [Shop].[dbo].[Shops].[Id] = @Id
RETURN 0
