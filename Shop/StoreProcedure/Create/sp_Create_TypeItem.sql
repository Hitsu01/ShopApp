CREATE PROCEDURE [dbo].[sp_Create_TypeItem]
	@Id INT,
	@Name NVARCHAR(20)
AS
	INSERT INTO [Shop].[dbo].[Types]([Name]) VALUES(@Name)
RETURN 0
