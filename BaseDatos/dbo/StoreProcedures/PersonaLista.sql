CREATE PROCEDURE dbo.PersonaLista

AS
	BEGIN
		SET NOCOUNT ON

		SELECT 
		IdPersona,
		Nombre

		FROM	
			dbo.Persona

			WHERE
					Estado=1

	END