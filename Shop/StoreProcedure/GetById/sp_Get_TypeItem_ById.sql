CREATE PROCEDURE [dbo].[sp_Get_TypeItem_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Types] WHERE [Shop].[dbo].[Types].[Id] = @Id
RETURN 0
