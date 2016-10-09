CREATE PROCEDURE [dbo].[sp_Get_Customer_ById]
	@Id int
	
AS
	SELECT * FROM [Shop].[dbo].[Customers] WHERE [Shop].[dbo].[Customers].[Id] = @Id
RETURN 0
