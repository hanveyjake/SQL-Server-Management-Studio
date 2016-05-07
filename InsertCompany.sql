
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertCompany
	@company_ID int OUTPUT,
	@address_ID int,
	@phone_number varchar(10),
	@company_name varchar(50)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Company (address_ID, phone_number, company_name) 
		VALUES(@address_ID, @phone_number, @company_name)
		SET @company_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Company values were not entered correctly',10, 1); -- Second substitution argument.
	END CATCH


END
GO