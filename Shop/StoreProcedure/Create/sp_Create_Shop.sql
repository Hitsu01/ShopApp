CREATE PROCEDURE [dbo].[sp_Create_Shop]
	@Id INT,
	@DateOfSale DATE,
	@CustomersId INT
AS
	INSERT	INTO [Shop].[dbo].[Shops]([DateOfSale], [CustomersId]) VALUES (@DateOfSale, @CustomersId)
RETURN 0
