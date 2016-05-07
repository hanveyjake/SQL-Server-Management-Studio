
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertAddress
	
	@address_ID int OUTPUT,
	@street_name varchar(40),
	@street_num int,
	@city_ID varchar(20),
	@state_ID varchar(2),
	@ZIP int,
	@country_name varchar(30)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Address (state_ID, city_ID, street_name, street_num, ZIP, country_name) 
		VALUES(@state_ID, @city_ID, @street_name, @street_num, @ZIP, @country_name)
		SET @address_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Address was not entered correctly',10, 1); -- Second substitution argument.
	END CATCH


END
GO