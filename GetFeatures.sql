USE [s16guest07]
GO
	SET ANSI_NULLS ON
GO
	SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFeatureCount] @release_version varchar(5)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @new_features int;
	select @new_features = count(*) from Feature where feature_Id in
	 (
		select release_Id from Version where release_Id = 
		(
			select release_Id from Release where release_version = @release_version
		) 
	 )
  if @new_features >= 1
	PRINT CONVERT(varchar(32),@new_features) + ' features are in the ' + @release_version + ' release'
  else
	PRINT 'It is a bug–fix release. There are no new features'
END

GO