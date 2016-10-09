CREATE PROCEDURE [dbo].[sp_Update_TypeItem]
	@Id INT,
	@Name NVARCHAR(20)
AS
	UPDATE [Shop].[dbo].[Types] 
	SET [Name] = @Name
	WHERE [Shop].[dbo].[Types].[Id] = @Id
RETURN 0
