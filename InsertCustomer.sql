
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertCustomer
	
	@customer_ID int OUTPUT,
	@product_ID int,
	@company_ID int,
	@address_ID int,
	@phone_number int,
	@customer_fname varchar(30),
	@customer_lname varchar(30),
	@company_name varchar(50),
	@customer_email varchar(40)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Customer (product_ID, company_ID, address_ID,phone_number, customer_fname, customer_lname, company_name, customer_email) 
		VALUES(@product_ID, @company_ID, @address_ID, @phone_number, @customer_fname, @customer_lname, @company_name, @customer_email)
		SET @customer_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Address was not entered correctly',10, 1); -- Second substitution argument.
	END CATCH


END
GO