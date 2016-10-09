CREATE PROCEDURE [dbo].[sp_Create_ShopDetails]
	@Id INT,
	@Quantity INT,
	@ShopId INT,
	@TypeId INT
AS
	INSERT INTO [Shop].[dbo].[ShopDetails]([Quantity], [ShopId], [TypeId]) VALUES(@Quantity, @ShopId, @TypeId)
RETURN 0
