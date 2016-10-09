CREATE PROCEDURE [dbo].[sp_Delete_TypeItem_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[Types] WHERE [Shop].[dbo].[Types].[Id] = @Id
RETURN 0
