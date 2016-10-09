CREATE PROCEDURE [dbo].[sp_Update_Item]
	@Id INT,
	@Name NVARCHAR(20),
	@Price FLOAT,
	@Quantity INT,
	@Size NVARCHAR(20),
	@TypeId INT 
AS
	UPDATE [Shop].[dbo].[Items] 
	SET [Name] = @Name, [Price] = @Price, [Quantity] = @Quantity, [Size] = @Size, [TypeId] = @TypeId 
	WHERE [Shop].[dbo].[Items].[Id] = @Id
RETURN 0
