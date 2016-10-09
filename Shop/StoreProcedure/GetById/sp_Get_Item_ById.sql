CREATE PROCEDURE [dbo].[sp_Get_Item_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Items] WHERE [Shop].[dbo].[Items].[Id] = @Id
RETURN 0
