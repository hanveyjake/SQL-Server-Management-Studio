
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertDownloads
	
	@download_ID int OUTPUT,
	@url_current varchar (150),
	@url_prev varchar(150),
	@download_date varchar(10),
	@product_ID int
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Downloads (url_current, url_prev, download_date, product_ID) 
		VALUES(@url_current, @url_prev, @download_date, @product_ID)
		SET @download_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Download has an error',10, 1); -- Second substitution argument.
	END CATCH


END
GO