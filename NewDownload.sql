USE [s16guest07]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewDownload]
	@customer_Id int, 
	@release_version varchar(5),
	@download_platform int

AS
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @release_Id int;
	select @release_Id = release_Id from Release where release_version = @release_version;
	INSERT INTO DOWNLOAD VALUES(@customer_Id,@release_Id,@download_platform,GETDATE());;
END TRY
BEGIN CATCH
     PRINT 'ERROR: ' + ERROR_MESSAGE();
END CATCH


GO