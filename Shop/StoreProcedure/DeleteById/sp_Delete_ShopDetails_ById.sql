CREATE PROCEDURE [dbo].[sp_Delete_ShopDetails_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[ShopDetails] WHERE [Shop].[dbo].[ShopDetails].[Id] = @Id
RETURN 0
