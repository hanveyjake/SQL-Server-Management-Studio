
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertFeature
	
	@features_ID int OUTPUT,
	@added_features varchar(200),
	@removed_features varchar(200)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO Features (added_features, removed_features) 
		VALUES(@added_features, @removed_features)
		SET @features_ID = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		RAISERROR(N'Error with features',10, 1); -- Second substitution argument.
	END CATCH


END
GO