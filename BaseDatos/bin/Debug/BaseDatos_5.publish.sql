﻿/*
Deployment script for LaboratorioProgra6

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "LaboratorioProgra6"
:setvar DefaultFilePrefix "LaboratorioProgra6"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [dbo].[Agencias]...';


GO
CREATE TABLE [dbo].[Agencias] (
    [AgenciaId]           INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]              VARCHAR (250) NOT NULL,
    [IdCatalogoProvincia] INT           NOT NULL,
    [IdCatalogoCanton]    INT           NOT NULL,
    [IdCatalogoDistrito]  INT           NOT NULL,
    [Estado]              BIT           NOT NULL,
    CONSTRAINT [Agencia] PRIMARY KEY CLUSTERED ([AgenciaId] ASC)
)
WITH (DATA_COMPRESSION = PAGE);


GO
PRINT N'Creating Table [dbo].[CatalogoCanton]...';


GO
CREATE TABLE [dbo].[CatalogoCanton] (
    [IdCatalogoCanton]     INT          IDENTITY (1, 1) NOT NULL,
    [NombreCatalogoCanton] VARCHAR (50) NULL,
    [IdCatalogoProvincia]  INT          NOT NULL,
    CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED ([IdCatalogoCanton] ASC)
)
WITH (DATA_COMPRESSION = PAGE);


GO
PRINT N'Creating Table [dbo].[CatalogoDistrito]...';


GO
CREATE TABLE [dbo].[CatalogoDistrito] (
    [IdCatalogoDistrito]     INT          IDENTITY (1, 1) NOT NULL,
    [NombreCatalogoDistrito] VARCHAR (50) NULL,
    [IdCatalogoCanton]       INT          NOT NULL,
    CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED ([IdCatalogoDistrito] ASC)
)
WITH (DATA_COMPRESSION = PAGE);


GO
PRINT N'Creating Table [dbo].[CatalogoProvincia]...';


GO
CREATE TABLE [dbo].[CatalogoProvincia] (
    [IdCatalogoProvincia]     INT          IDENTITY (1, 1) NOT NULL,
    [NombreCatalogoProvincia] VARCHAR (50) NULL,
    CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED ([IdCatalogoProvincia] ASC)
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Agencia_Provincia]...';


GO
ALTER TABLE [dbo].[Agencias] WITH NOCHECK
    ADD CONSTRAINT [FK_Agencia_Provincia] FOREIGN KEY ([IdCatalogoProvincia]) REFERENCES [dbo].[CatalogoProvincia] ([IdCatalogoProvincia]);


GO
PRINT N'Creating Foreign Key [dbo].[Fk_Agencia_Canton]...';


GO
ALTER TABLE [dbo].[Agencias] WITH NOCHECK
    ADD CONSTRAINT [Fk_Agencia_Canton] FOREIGN KEY ([IdCatalogoCanton]) REFERENCES [dbo].[CatalogoCanton] ([IdCatalogoCanton]);


GO
PRINT N'Creating Foreign Key [dbo].[Fk_Agencia_Distrito]...';


GO
ALTER TABLE [dbo].[Agencias] WITH NOCHECK
    ADD CONSTRAINT [Fk_Agencia_Distrito] FOREIGN KEY ([IdCatalogoDistrito]) REFERENCES [dbo].[CatalogoDistrito] ([IdCatalogoDistrito]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Canton_Provincia]...';


GO
ALTER TABLE [dbo].[CatalogoCanton] WITH NOCHECK
    ADD CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY ([IdCatalogoProvincia]) REFERENCES [dbo].[CatalogoProvincia] ([IdCatalogoProvincia]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Distrito_Canton]...';


GO
ALTER TABLE [dbo].[CatalogoDistrito] WITH NOCHECK
    ADD CONSTRAINT [FK_Distrito_Canton] FOREIGN KEY ([IdCatalogoCanton]) REFERENCES [dbo].[CatalogoCanton] ([IdCatalogoCanton]);


GO
PRINT N'Creating Procedure [dbo].[AgenciaActualizar]...';


GO
CREATE PROCEDURE dbo.AgenciaActualizar
    @AgenciaId INT,
	@Nombre VARCHAR(500),
	@IdCatalogoProvincia INT,
	@IdCatalogoCanton INT,
	@IdCatalogoDistrito INT,
    @Estado BIT
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	UPDATE dbo.Agencias SET
	    Nombre=@Nombre,
		IdCatalogoProvincia=@IdCatalogoProvincia,
		IdCatalogoCanton=@IdCatalogoCanton,
		IdCatalogoDistrito=@IdCatalogoDistrito,
		Estado=@Estado

	WHERE AgenciaId=@AgenciaId

		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creating Procedure [dbo].[AgenciaEliminar]...';


GO
CREATE PROCEDURE [dbo].[AgenciaEliminar]
@AgenciaId INT
  
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
	DELETE FROM Dbo.Agencias WHERE AgenciaId=@AgenciaId


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creating Procedure [dbo].[AgenciaInsertar]...';


GO
CREATE PROCEDURE dbo.AgenciaInsertar
	@Nombre VARCHAR(500),
	@IdCatalogoProvincia INT,
	@IdCatalogoCanton INT,
	@IdCatalogoDistrito INT,
    @Estado BIT
	
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
		INSERT INTO dbo.Agencias 
		(	       
	      Nombre,
		  IdCatalogoProvincia,
		  IdCatalogoCanton,
		  IdCatalogoDistrito,
		  Estado
		)
		VALUES
		(
		
	      @Nombre,
		  @IdCatalogoProvincia,
		  @IdCatalogoCanton,
		  @IdCatalogoDistrito,
		  @Estado
		)


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creating Procedure [dbo].[AgenciaObtener]...';


GO
CREATE PROCEDURE [dbo].AgenciaObtener
@AgenciaId INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT
			A.AgenciaId
		,   A.Nombre
		,   A.Estado

		,   CP.IdCatalogoProvincia
		,	CP.NombreCatalogoProvincia

		,   CC.IdCatalogoCanton
		,	CC.NombreCatalogoCanton

		,   CD.IdCatalogoDistrito
		,	CD.NombreCatalogoDistrito
	
				

	FROM dbo.Agencias A
	 INNER JOIN dbo.CatalogoProvincia CP
         ON A.IdCatalogoProvincia = CP.IdCatalogoProvincia
     INNER JOIN dbo.CatalogoCanton CC
         ON A.IdCatalogoCanton = CC.IdCatalogoCanton
	 INNER JOIN dbo.CatalogoDistrito CD
         ON A.IdCatalogoDistrito = CD.IdCatalogoDistrito
	WHERE
	     (@AgenciaId IS NULL OR AgenciaId=@AgenciaId)

END
GO
PRINT N'Creating Procedure [dbo].[CatalogoCantonLista]...';


GO
CREATE PROCEDURE [dbo].[CatalogoCantonLista]
@IdCatalogoProvincia INT=null
AS
	BEGIN
		SET NOCOUNT ON
		SELECT 
		IdCatalogoCanton,
		NombreCatalogoCanton

		FROM	
			dbo.CatalogoCanton

	    WHERE
		    IdCatalogoProvincia=@IdCatalogoProvincia


	END
GO
PRINT N'Creating Procedure [dbo].[CatalogoDistritoLista]...';


GO
CREATE PROCEDURE [dbo].CatalogoDistritoLista
@IdCatalogoCanton INT=null
AS
	BEGIN
		SET NOCOUNT ON
		SELECT 
		IdCatalogoDistrito,
		NombreCatalogoDistrito

		FROM	
			dbo.CatalogoDistrito

	    WHERE
		    IdCatalogoCanton=@IdCatalogoCanton


	END
GO
PRINT N'Creating Procedure [dbo].[CatalogoProvinciaLista]...';


GO
CREATE PROCEDURE [dbo].[CatalogoProvinciaLista]
AS
	BEGIN
		SET NOCOUNT ON



		SELECT 
		IdCatalogoProvincia,
		NombreCatalogoProvincia

		FROM	
			dbo.CatalogoProvincia

	


	END
GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Agencias] WITH CHECK CHECK CONSTRAINT [FK_Agencia_Provincia];

ALTER TABLE [dbo].[Agencias] WITH CHECK CHECK CONSTRAINT [Fk_Agencia_Canton];

ALTER TABLE [dbo].[Agencias] WITH CHECK CHECK CONSTRAINT [Fk_Agencia_Distrito];

ALTER TABLE [dbo].[CatalogoCanton] WITH CHECK CHECK CONSTRAINT [FK_Canton_Provincia];

ALTER TABLE [dbo].[CatalogoDistrito] WITH CHECK CHECK CONSTRAINT [FK_Distrito_Canton];


GO
PRINT N'Update complete.';


GO
