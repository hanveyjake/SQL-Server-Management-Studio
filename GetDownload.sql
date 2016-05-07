USE [s16guest07]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GetDLReqs
	
AS
BEGIN TRY
	SET NOCOUNT ON;
	SELECT 
		DISTINCT Product.product_name as Product,
		Release.release_type as [Version], 
	    DATEPART(Month,Download.download_date) as Month, 
		count(*) as Count
	from Download
			JOIN Release on Download.release_Id = Release.release_Id
			JOIN Version on Release.release_Id = Version.release_Id
			JOIN Product on Version.product_Id = Product.product_Id
	GROUP BY Download.download_Id,Product.product_name,Release.release_version,Download.download_date
	ORDER BY Product,Version,[Month],[Count]
END TRY
BEGIN CATCH
	RAISERROR('There was an error in retreiving the number of download requests',10,1);
	PRINT ERROR_MESSAGE()
END CATCH


GO