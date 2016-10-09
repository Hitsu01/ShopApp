CREATE PROCEDURE [dbo].[sp_Update_ShopDetails]
	@Id INT,
	@Quantity INT,
	@ShopId INT,
	@TypeId INT
AS
	UPDATE [Shop].[dbo].[ShopDetails] 
	SET [Quantity] = @Quantity, [ShopId] = @ShopId, [TypeId] = @TypeId 
	WHERE [Shop].[dbo].[ShopDetails].[Id] = @Id
RETURN 0
