
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertProduct
	
	@product_ID int OUTPUT,
	@product_name varchar(30),
	@product_description varchar(200), 
	@release_ID int,
	@company_ID int,
	@feature_ID int, 
	@download_ID int,
	@product_platform varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Product (product_name, product_description, release_ID, company_ID, feature_ID, download_ID, product_platform) 
		VALUES(@product_name, @product_description, @release_ID, @company_ID, @feature_ID, @download_ID, @product_platform)
		SET @product_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Error with product',10, 1); -- Second substitution argument.
	END CATCH


END
GO