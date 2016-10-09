CREATE PROCEDURE [dbo].[sp_Get_Suplly_ById]
	@Id int
AS
	SELECT * FROM [Shop].[dbo].[Supplys] WHERE [Shop].[dbo].[Supplys].[Id] = @Id
RETURN 0
