CREATE PROCEDURE [dbo].[sp_Detele_Item_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[Items] WHERE [Shop].[dbo].[Items].[Id] = @Id
RETURN 0
