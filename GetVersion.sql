USE [s16guest07]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewVersion] 
	@release_ID int, 
	@version_release_date varchar(10)

AS
BEGIN

	SET NOCOUNT ON;


	INSERT INTO [dbo].[Version.version_release_date] VALUES(GETDATE());

END

GO