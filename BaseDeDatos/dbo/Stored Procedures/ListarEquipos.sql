-- =============================================
-- Author:		Diego R
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE ListarEquipos

AS
BEGIN

	SET NOCOUNT ON;

SELECT   Equipos.IdEquipo, Equipos.IdEntrenador, Equipos.Nombre AS NombreEquipo, Entrenadores.Nombre AS NombreEntrenador
FROM         Entrenadores INNER JOIN
                         Equipos ON Entrenadores.Id = Equipos.IdEntrenador
END