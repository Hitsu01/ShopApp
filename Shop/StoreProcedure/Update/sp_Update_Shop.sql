CREATE PROCEDURE [dbo].[sp_Update_Shop]
	@Id INT,
	@DateOfSale DATE,
	@CustomersId INT 
AS
	UPDATE [Shop].[dbo].[Shops] 
	SET [DateOfSale] = @DateOfSale, [CustomersId] = @CustomersId 
	WHERE [Shop].[dbo].[Shops].[Id] = @Id
RETURN 0
