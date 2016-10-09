CREATE PROCEDURE [dbo].[sp_Get_ShopDetails_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[ShopDetails] WHERE [Shop].[dbo].[ShopDetails].[Id] = @Id
RETURN 0
