-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GenerarPokemon] 

AS
BEGIN
	DECLARE @i INTEGER;
	DECLARE @cantidad INTEGER;
	SET @i = 1;
	
	SELECT @cantidad=COUNT(Id) FROM Entrenadores
	IF (@cantidad>0)
	DELETE FROM Pokemon
	BEGIN TRAN		
		WHILE @i <= (@cantidad*6)
		BEGIN
			INSERT INTO [dbo].[Pokemon]
				   ([Id]
				   ,[Numero]
				   ,[Nivel])
			 VALUES
				   (NEWID()
				   ,floor(rand()*252+1)
				   ,floor(rand()*101+1))
		   SET @i = @i + 1;
		END;
	COMMIT TRAN
	SELECT * FROM Pokemon
END