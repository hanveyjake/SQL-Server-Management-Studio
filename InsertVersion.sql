SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertVersion
	
	@version_release decimal(2,1),
	@release_version decimal(2,1), 
	@Product_ID int,
	@product_platform int

AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Version VALUES(@version_release, @Product_ID)
		INSERT INTO Release VALUES(@release_version, @Product_ID)
		INSERT INTO Product VALUES(@product_platform)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Error in inputting Version and Release information',10, 1); 
	END CATCH
END
GO