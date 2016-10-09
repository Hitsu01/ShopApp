CREATE PROCEDURE [dbo].[sp_Delete_Customer_ById]
	@Id INT
AS
	DELETE FROM [Shop].[dbo].[Customers] WHERE [Shop].[dbo].[Customers].[Id] = @Id
RETURN 0
