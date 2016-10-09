CREATE PROCEDURE [dbo].[sp_Create_Customer]
	@Id INT,
	@Name NVARCHAR(20),
	@Phone NVARCHAR(20)
AS
	INSERT INTO [Shop].[dbo].[Customers]([Name],[Phone]) VALUES (@Name,@Phone)
RETURN 0
