CREATE PROCEDURE [dbo].[sp_Create_Item]
	@Id INT,
	@Name NVARCHAR(20),
	@Price FLOAT,
	@Quantity INT,
	@Size NVARCHAR(20),
	@TypeId INT
AS
	INSERT INTO [Shop].[dbo].[Items]([Name],[Price],[Quantity],[Size],[TypeId]) VALUES (@Name, @Price, @Quantity, @Size, @TypeId)
RETURN 0
