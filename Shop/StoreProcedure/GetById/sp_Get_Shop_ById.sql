CREATE PROCEDURE [dbo].[sp_Get_Shop_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Shops] WHERE [Shop].[dbo].[Shops].[Id] = @Id
RETURN 0
