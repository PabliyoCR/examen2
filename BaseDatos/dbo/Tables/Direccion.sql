CREATE TABLE dbo.Direccion
(
	   IdDireccion INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Direccion PRIMARY KEY CLUSTERED(IdDireccion)
	 , IdPersona INT NOT NULL
	      CONSTRAINT FK_Direccion_Persona FOREIGN KEY(IdPersona) REFERENCES dbo.Persona(IdPersona)      
	 , IdCatalogoProvincia INT NOT NULL
	      CONSTRAINT FK_Direccion_Provincia FOREIGN KEY(IdCatalogoProvincia) REFERENCES dbo.CatalogoProvincia(IdCatalogoProvincia)
	 , IdCatalogoCanton INT NOT NULL 
	       CONSTRAINT Fk_Direccion_Canton FOREIGN KEY(IdCatalogoCanton) REFERENCES dbo.CatalogoCanton(IdCatalogoCanton)
	 , IdCatalogoDistrito INT NOT NULL
	       CONSTRAINT Fk_Direccion_Distrito FOREIGN KEY(IdCatalogoDistrito) REFERENCES dbo.CatalogoDistrito(IdCatalogoDistrito)
	 , Estado BIT NOT NULL
	 , DireccionExacta VARCHAR(1000) NOT NULL
)
WITH (DATA_COMPRESSION = PAGE)
GO
