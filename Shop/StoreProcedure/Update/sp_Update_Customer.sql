CREATE PROCEDURE [dbo].[sp_Update_Customer]
	@Id INT,
	@Name NVARCHAR(20),
	@Phone NVARCHAR(20) 
AS
	UPDATE [Shop].[dbo].[Customers] 
	SET [Name] = @Name, [Phone] = @Phone 
	WHERE [Shop].[dbo].[Customers].[Id] = @Id
RETURN 0
