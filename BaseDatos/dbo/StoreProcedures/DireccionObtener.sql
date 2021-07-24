CREATE PROCEDURE [dbo].DireccionObtener
@IdDireccion INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT

			D.IdDireccion
		,   D.Estado
		,   D.DireccionExacta

	    ,    CP.IdCatalogoProvincia
		,	CP.NombreCatalogoProvincia		
	
		,   CC.IdCatalogoCanton
		,	CC.NombreCatalogoCanton

		,   CD.IdCatalogoDistrito
		,	CD.NombreCatalogoDistrito

		,   P.IdPersona
		,	P.Nombre
	
				

	FROM dbo.Direccion D
	 INNER JOIN dbo.CatalogoProvincia CP
         ON D.IdCatalogoProvincia = CP.IdCatalogoProvincia
     INNER JOIN dbo.CatalogoCanton CC
         ON D.IdCatalogoCanton = CC.IdCatalogoCanton
	 INNER JOIN dbo.CatalogoDistrito CD
         ON D.IdCatalogoDistrito = CD.IdCatalogoDistrito
	 INNER JOIN dbo.Persona P
         ON D.IdPersona = P.IdPersona
	WHERE
	     (@IdDireccion IS NULL OR IdDireccion=@IdDireccion)

END