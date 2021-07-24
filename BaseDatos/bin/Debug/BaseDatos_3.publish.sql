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
PRINT N'Creating Procedure [dbo].[MarcaVehiculoActualizar]...';


GO
CREATE PROCEDURE [dbo].[MarcaVehiculoActualizar]
@MarcaVehiculoId INT,
@Descripcion VARCHAR(250),
@Estado BIT

AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY

       UPDATE MarcaVehiculo
       SET
       Descripcion=@Descripcion,
       Estado=@Estado
       WHERE 
           MarcaVehiculoId=@MarcaVehiculoId

       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError
    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Creating Procedure [dbo].[MarcaVehiculoEliminar]...';


GO
CREATE PROCEDURE [dbo].[MarcaVehiculoEliminar]
@MarcaVehiculoId INT
AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY
     
     DELETE FROM MarcaVehiculo
     WHERE
         MarcaVehiculoId=@MarcaVehiculoId

       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError

    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Creating Procedure [dbo].[MarcaVehiculoInsertar]...';


GO
CREATE PROCEDURE [dbo].[MarcaVehiculoInsertar]
@Descripcion VARCHAR(250),
@Estado BIT

AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY
       INSERT INTO MarcaVehiculo
       ( Descripcion, Estado)
       VALUES
       (@Descripcion, @Estado)


       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError
    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Creating Procedure [dbo].[MarcaVehiculoObtener]...';


GO
CREATE PROCEDURE [dbo].[MarcaVehiculoObtener]
	@MarcaVehiculoId INT=NULL
AS
BEGIN
  SET NOCOUNT ON

SELECT 
      MarcaVehiculoId
	, Descripcion
	, Estado
FROM MarcaVehiculo
WHERE (@MarcaVehiculoId IS NULL OR MarcaVehiculoId=@MarcaVehiculoId)

END
GO
PRINT N'Creating Procedure [dbo].[VehiculoActualizar]...';


GO
CREATE PROCEDURE dbo.VehiculoActualizar
	@VehiculoId INT,
	@MarcaVehiculoId INT,
    @Matricula VARCHAR(250),
	@Color VARCHAR(250),
	@Modelo VARCHAR(250),
	@Estado BIT,
	@FechaModelo DATE
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	UPDATE dbo.Vehiculo SET
	 MarcaVehiculoId=@MarcaVehiculoId,
	 Matricula=@Matricula,
	 Color=@Color,
	 Modelo=@Modelo,
	 Estado=@Estado,
	 FechaModelo=@FechaModelo

	WHERE VehiculoId=@VehiculoId

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
PRINT N'Creating Procedure [dbo].[VehiculoEliminar]...';


GO
CREATE PROCEDURE dbo.VehiculoEliminar
 @VehiculoId INT
  
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	DELETE FROM DBO.Vehiculo WHERE VehiculoId=@VehiculoId


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
PRINT N'Creating Procedure [dbo].[VehiculoInsertar]...';


GO
CREATE PROCEDURE dbo.VehiculoInsertar
    @MarcaVehiculoId INT,
	@Matricula varchar(250)	,
	@Color varchar(250)	,
	@Modelo varchar(250),
	@Estado BIT,
	@FechaModelo DATE
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
		INSERT INTO dbo.Vehiculo 
		(
	     MarcaVehiculoId
	    , Matricula 
	    , Color
	    , Modelo 
	    , Estado 
		, FechaModelo
		)
		VALUES
		(
		 @MarcaVehiculoId
	    , @Matricula 
	    , @Color
	    , @Modelo 
	    , @Estado 
		, @FechaModelo
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
PRINT N'Creating Procedure [dbo].[VehiculoObtener]...';


GO
CREATE PROCEDURE [dbo].VehiculoObtener
@VehiculoId INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT
			V.VehiculoId
		,   V.Matricula
		,   V.Color
		,   V.Modelo
		,   V.Estado
		,   V.FechaModelo
		,   MV.MarcaVehiculoId
		,	MV.Descripcion
				

	FROM dbo.Vehiculo V
	 INNER JOIN dbo.MarcaVehiculo MV
         ON V.MarcaVehiculoId = MV.MarcaVehiculoId
	WHERE
	     (@VehiculoId IS NULL OR VehiculoId=@VehiculoId)

END
GO
PRINT N'Update complete.';


GO