-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CapturarPokemon] 
AS
BEGIN
DECLARE @CantidadEntrenadores int
DECLARE @CantidadPokemon int
Declare @ContadorEntrenador int=1
Declare @ContadorPokemon int=1
Declare @Equipo VARCHAR(MAX)
Declare @IdEntrenador VARCHAR(MAX)
Declare @IdEquipo UniqueIdentifier


IF OBJECT_ID('tempdb..#TempEntrenadores', 'U') IS NOT NULL
DROP TABLE #TempEntrenadores

SELECT ROW_NUMBER() OVER(ORDER BY Id DESC) AS Fila,   
    * INTO #TempEntrenadores
FROM Entrenadores  

SELECT @CantidadEntrenadores=COUNT(Id) FROM #TempEntrenadores
SELECT @CantidadEntrenadores

IF OBJECT_ID('tempdb..#TempPokemon', 'U') IS NOT NULL
DROP TABLE #TempPokemon

SELECT ROW_NUMBER() OVER(ORDER BY Id DESC) AS Fila,   
    * INTO #TempPokemon
FROM Pokemon  

SELECT @CantidadPokemon=COUNT(Id) FROM #TempPokemon
SELECT @CantidadPokemon

BEGIN TRAN
	DELETE FROM Equipos
	SELECT @ContadorEntrenador
	WHILE (@ContadorEntrenador) <= @CantidadEntrenadores 
	BEGIN  
		SELECT @Equipo=(Nombre+' TEAM'), @IdEntrenador=Id FROM #TempEntrenadores WHERE Fila=@ContadorEntrenador
		SET @IdEquipo=NEWID()

		INSERT INTO [dbo].[Equipos]	
		SELECT @IdEquipo,@IdEntrenador,@Equipo 
		--SELECT NEWID(),@IdEntrenador,@Equipo FROM #TempPokemon WHERE Fila BETWEEN @ContadorPokemon AND @ContadorPokemon+5	
		
		INSERT INTO [PokemonxEquipos]
		SELECT Id,@IdEquipo FROM #TempPokemon WHERE Fila BETWEEN @ContadorPokemon AND @ContadorPokemon+5	
		--INSERT INTO [PokemonxEquipos]
		--SELECT @IdEquipo, Id FROM #TempPokemon WHERE Fila BETWEEN @ContadorPokemon AND @ContadorPokemon+5	
		SELECT* FROM [PokemonxEquipos]
		SET @ContadorEntrenador  += 1
		SET @ContadorPokemon  += 6
	END
	SELECT * FROM Equipos
COMMIT TRAN
END