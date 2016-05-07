SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertMaster
	
	

	@company_ID int,
	@customer_ID int,
	@downloads_ID int,
	@release_ID int,
	@product_ID int
	
AS


BEGIN

	DECLARE @address_ID int
	EXEC dbo.InsertAddress 
		@city, 
		@street_name, 
		@street_num, 
		@country_name, 
		@ZIP, 
		@state_ID
	DECLARE @company_ID int 
	EXEC dbo.InsertCompany 
		@address_ID, 
		@phone_number, 
		@company_name
	

		


END
GO
