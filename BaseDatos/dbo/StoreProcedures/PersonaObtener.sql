CREATE PROCEDURE [dbo].[PersonaObtener]
@IdPersona INT=NULL

AS 
	BEGIN
	SET NOCOUNT ON

	SELECT
			P.IdPersona
		,   P.Cedula
		,   P.Nombre
		,   P.Primer_Apellido
		,   P.Segundo_Apellido
		,   P.FechaNacimiento
		,   P.TieneHijos
		,   P.Cuantos
		,   P.Estado
	FROM dbo.Persona P
	WHERE
	     (@IdPersona IS NULL OR IdPersona=@IdPersona)

END