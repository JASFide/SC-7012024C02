-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InicializarBD] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN
		DELETE FROM [PokemonxEquipos]
		DELETE FROM [Equipos]
		EXEC [ReclutarEntrenadores]
		EXEC [GenerarPokemon]
		EXEC [CapturarPokemon]
	COMMIT TRAN
END