-- =============================================
-- Author:		Diego R
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE ListarPokemonEquipo 

	@IdEquipo UniqueIdentifier
AS
BEGIN

	SET NOCOUNT ON;

	SELECT   Pokemon.Numero, Pokemon.Nivel
	FROM         Pokemon INNER JOIN
							 PokemonxEquipos ON Pokemon.Id = PokemonxEquipos.IdPokemon
	WHERE     (PokemonxEquipos.IdEquipo = @IdEquipo)
END