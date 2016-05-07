
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertRelease
	
	@release_ID int OUTPUT,
	@features_ID int,
	@iteration_ID int, 
	@release_date varchar(10),
	@release_depricated bit,
	@release_version decimal(2,1),
	@release_type varchar(50)

	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Release (features_ID, iteration_ID, release_date, release_depricated, release_version, release_type) 
		VALUES(@features_ID, @iteration_ID, @release_date, @release_depricated, @release_version, @release_type)
		SET @release_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Error with features',10, 1); -- Second substitution argument.
	END CATCH


END
GO