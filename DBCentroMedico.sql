USE [master]
GO
/****** Object:  Database [CentroMedico]    Script Date: 23/08/2022 14:20:09 ******/
CREATE DATABASE [CentroMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CentroMedico', FILENAME = '' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CentroMedico_log', FILENAME = '' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CentroMedico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CentroMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CentroMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CentroMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CentroMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CentroMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CentroMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CentroMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CentroMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CentroMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CentroMedico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CentroMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CentroMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CentroMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CentroMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CentroMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CentroMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CentroMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CentroMedico] SET RECOVERY FULL 
GO
ALTER DATABASE [CentroMedico] SET  MULTI_USER 
GO
ALTER DATABASE [CentroMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CentroMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CentroMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CentroMedico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CentroMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CentroMedico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CentroMedico', N'ON'
GO
ALTER DATABASE [CentroMedico] SET QUERY_STORE = OFF
GO
USE [CentroMedico]
GO
/****** Object:  User [UserPrueba]    Script Date: 23/08/2022 14:20:09 ******/
CREATE USER [UserPrueba] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Facturacion]
GO
/****** Object:  DatabaseRole [AdminTurnos]    Script Date: 23/08/2022 14:20:09 ******/
CREATE ROLE [AdminTurnos]
GO
/****** Object:  Schema [Facturacion]    Script Date: 23/08/2022 14:20:09 ******/
CREATE SCHEMA [Facturacion]
GO
/****** Object:  UserDefinedDataType [dbo].[historia]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[historia] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observacion]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[observacion] FROM [varchar](1000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[pais]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[pais] FROM [char](3) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 23/08/2022 14:20:09 ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedFunction [dbo].[Concatenar]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[Concatenar] (
				@nombre varchar(50),
				@apellido varchar(50)
				)
RETURNS	VARCHAR(100)

AS
BEGIN

	DECLARE @Resultado varchar(100)
	SET @Resultado = @apellido + ',' + @nombre
	RETURN @Resultado

END
GO
/****** Object:  UserDefinedFunction [dbo].[FechaTexto]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FechaTexto] (@fecha datetime)

RETURNS VARCHAR(60)
AS

BEGIN

DECLARE @dia varchar(20)
DECLARE @mes varchar(20)
DECLARE @fechatexto varchar(50)

SET @dia = (CASE WHEN datepart(dw,@fecha)= 1 THEN 'Domingo ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 2 THEN 'Lunes ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 3 THEN 'Martes ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 4 THEN 'Miercoles ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 5 THEN 'Jueves ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 6 THEN 'Viernes ' + convert(char(2),datepart(dd,@fecha))
					WHEN datepart(dw,@fecha)= 7 THEN 'Sabado ' + convert(char(2),datepart(dd,@fecha))
				END)

SET @mes = (CASE WHEN datepart(mm,@fecha)= 1 THEN 'Enero'
				WHEN datepart(mm,@fecha)= 2 THEN 'Febrero'
				WHEN datepart(mm,@fecha)= 3 THEN 'Marzo'
				WHEN datepart(mm,@fecha)= 4 THEN 'Abril'
				WHEN datepart(mm,@fecha)= 5 THEN 'Mayo'
				WHEN datepart(mm,@fecha)= 6 THEN 'Junio'
				WHEN datepart(mm,@fecha)= 7 THEN 'Julio'
				WHEN datepart(mm,@fecha)= 8 THEN 'Agosto'
				WHEN datepart(mm,@fecha)= 9 THEN 'Septiembre'
				WHEN datepart(mm,@fecha)= 10 THEN 'Octubre'
				WHEN datepart(mm,@fecha)= 11 THEN 'Noviembre'
				WHEN datepart(mm,@fecha)= 12 THEN 'Diciembre'
			END)

SET @fechatexto = @dia + ' de '+ @mes
RETURN @fechatexto
END
GO
/****** Object:  UserDefinedFunction [dbo].[listaPaises]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[listaPaises]()
	RETURNS @paises TABLE (idpais char(3),pais varchar(50))

	AS
	BEGIN
		
		INSERT INTO @paises VALUES ('MEX','Mexico')
		INSERT INTO @paises VALUES ('ARG','Argentina')
		INSERT INTO @paises VALUES ('CHI','Chile')
		INSERT INTO @paises VALUES ('PER','Peru')

		RETURN

	END
GO
/****** Object:  UserDefinedFunction [dbo].[ObtenerPais]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ObtenerPais] (
				@idpaciente paciente
				)
RETURNS	VARCHAR(50)

AS
BEGIN

	DECLARE @pais varchar(50)
	SET @pais = (select PA.pais From paciente P
					INNER JOIN Pais PA
					ON PA.idPais = P.idPais
					WHERE idPaciente = @idpaciente)
	RETURN @pais

END
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](20) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fNacimiento] [date] NULL,
	[domicilio] [varchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [int] NULL,
	[email] [varchar](30) NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [varchar](300) NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [dbo].[turno] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PacientesTurnosPendientes]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[PacientesTurnosPendientes] AS 

SELECT P.nombre,P.idPaciente,P.apellido,T.idTurno,T.estado
	FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
WHERE isnull(T.estado,0) = 0
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [dbo].[medico] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MedicoEspecialidad] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_MedicosEspecialidades]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_MedicosEspecialidades] AS


select M.idMedico,M.nombre,M.apellido,ME.idEspecialidad,ME.descripcion from Medico M
INNER JOIN MedicoEspecialidad ME
ON ME.idMedico = M.idMedico
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](30) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia](
	[idHistoria] [dbo].[historia] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Historia] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idHistoria] [dbo].[historia] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacienteLog]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacienteLog](
	[idpaciente] [dbo].[paciente] NOT NULL,
	[idpais] [dbo].[pais] NULL,
	[fechaAlta] [datetime] NULL,
 CONSTRAINT [PK_PacienteLog] PRIMARY KEY CLUSTERED 
(
	[idpaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[estado] [tinyint] NULL,
	[obs] [dbo].[observacion] NULL,
 CONSTRAINT [PK__Pago__BD2295ADC8A0CEF2] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idPago] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idPaciente] ASC,
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[pais] [varchar](30) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idestado] [smallint] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TurnoEstado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[Historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Paciente]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Concepto] FOREIGN KEY([concepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Concepto]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Paciente]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pago]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Turno]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idestado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Medico]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
/****** Object:  StoredProcedure [dbo].[Alta_especialidades]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Alta_especialidades] (
			@especialidad varchar(30)

			)


as
IF NOT EXISTS (SELECT TOP 1 idEspecialidad from Especialidad where especialidad= @especialidad)
BEGIN
	INSERT INTO Especialidad
	VALUES (@especialidad)
	PRINT 'La especialidad se agrego correctamente.'
	RETURN
END

ELSE
BEGIN
	PRINT 'La especialidad ya existe.'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[Alta_medico]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[Alta_medico](
			
			@nombre varchar(50),
			@apellido varchar(50),
			@especialidad int,
			@descripcion varchar(50)

			
			)

AS

set nocount on

IF NOT EXISTS(SELECT top 1 idMedico FROM Medico WHERE nombre=@nombre and apellido=@apellido)
BEGIN
	INSERT INTO Medico(nombre,apellido)
	VALUES (@nombre,@apellido)

	DECLARE @auxIdMedico int
	SET @auxIdMedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad(idMedico,idEspecialidad,descripcion)
	VALUES (@auxIdMedico,@especialidad,@descripcion)

	PRINT 'El medico se agregó correctamente'
	RETURN
END

ELSE
BEGIN
	PRINT 'El medico ya existe.'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[Alta_Paciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Alta_Paciente](
	@dni varchar(20),
	@nombre varchar(50),
	@apellido varchar(50),
	@fNacimiento varchar(8),
	@domicilio varchar(50),
	@idPais varchar(3),
	@telefono varchar(20)='',
	@email varchar (30),
	@observacion varchar(1000)=''
	)

as

IF NOT EXISTS(SELECT * FROM Paciente WHERE dni=@dni)
BEGIN
	INSERT INTO Paciente(dni,nombre,apellido,fnacimiento,domicilio,idpais,telefono,email,observacion)
	VALUES (@dni,@nombre,@apellido,@fnacimiento,@domicilio,@idpais,@telefono,@email,@observacion)
	PRINT 'El paciente se agrego correctamente'
	RETURN
END

ELSE
BEGIN
	PRINT 'El paciente ya existe.'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[Alta_Turnos]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Alta_Turnos](
			
			@fecha char(14), -- 20210222 12:00
			@idpaciente paciente,
			@idmedico medico,
			@observacion observacion= ''

			
			)

AS
/*
ESTADO = 0 - PENDIENTE
ESTADO = 1 - PENDIENTE
ESTADO = 2 - CANCELADO
*/

set nocount on

IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno (fechaTurno,estado,observacion)
	VALUES (@fecha,0,@observacion)

	DECLARE @auxIdTurno turno
	SET @auxIdTurno = @@IDENTITY

	INSERT INTO TurnoPaciente(idTurno,idPaciente,idMedico)
	VALUES (@auxIdTurno,@idpaciente,@idmedico)

	PRINT 'El turno se agregó correctamente'
	RETURN
END

ELSE
BEGIN
	PRINT 'El turno ya existe.'
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[DEL_Turno]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[DEL_Turno](
				@idturno turno)

AS 

SET NOCOUNT ON

IF EXISTS(SELECT * FROM Turno WHERE idTurno = @idturno)

BEGIN
	DELETE FROM Turno WHERE idTurno = @idturno
	DELETE FROM TurnoPaciente WHERE idTurno = @idturno
END

ELSE
	SELECT 0 AS Resultado
GO
/****** Object:  StoredProcedure [dbo].[SEL_EspecialidadesMedicas]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SEL_EspecialidadesMedicas]

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Especialidad)
	SELECT * FROM Especialidad

ELSE 
	SELECT 0 AS Resultado
GO
/****** Object:  StoredProcedure [dbo].[SEL_HistoriaPaciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SEL_HistoriaPaciente](
				@idpaciente paciente)

AS
SET NOCOUNT ON


IF EXISTS (
			SELECT * FROM PACIENTE P
			INNER JOIN HistoriaPaciente HP
			ON HP.idPaciente = P.idPaciente
			INNER JOIN Historia H
			ON H.idHistoria = HP.idHistoria
			INNER JOIN MedicoEspecialidad ME
			ON ME.idMedico = HP.idMedico
			INNER JOIN MEDICO M
			ON M.idMedico = ME.idMedico
			WHERE P.idPaciente = @idpaciente
)

	SELECT * FROM PACIENTE P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente = P.idPaciente
	INNER JOIN Historia H
	ON H.idHistoria = HP.idHistoria
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN MEDICO M
	ON M.idMedico = ME.idMedico
	WHERE P.idPaciente = @idpaciente

ELSE
	SELECT 0 AS resultado


GO
/****** Object:  StoredProcedure [dbo].[SEL_TurnosPacientes]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SEL_TurnosPacientes](

		@idpaciente paciente
		)

AS
SET NOCOUNT ON


IF EXISTS (SELECT * FROM Paciente P

			INNER JOIN TurnoPaciente TP
			ON TP.idPaciente = P.idPaciente

			INNER JOIN Turno T
			ON T.idTurno = TP.idTurno

			INNER JOIN MedicoEspecialidad M
			ON M.idMedico = TP.idMedico
			WHERE P.idPaciente = @idpaciente

)

	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico = TP.idMedico
	WHERE P.idPaciente = @idpaciente

ELSE

SELECT 0 AS Resultado




GO
/****** Object:  StoredProcedure [dbo].[UPD_Paciente]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	CREATE PROC [dbo].[UPD_Paciente](
				@idPaciente paciente,
				@nombre varchar(50),
				@apellido varchar(50),
				@fNacimiento date,
				@domicilio varchar(50),
				@telefono int,
				@email varchar(30),
				@observacion observacion)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * from Paciente where idPaciente = @idPaciente)
	UPDATE Paciente SET nombre = @nombre,
						apellido = @apellido,
						fNacimiento = @fNacimiento,
						domicilio = @domicilio,
						telefono = @telefono,
						email = @email,
						observacion = @observacion

	WHERE idPaciente = @idPaciente

ELSE 
	SELECT 0 AS Resultado


GO
/****** Object:  StoredProcedure [dbo].[UPD_Turno]    Script Date: 23/08/2022 14:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	CREATE proc [dbo].[UPD_Turno](
				@idturno turno,
				@estado tinyint,
				@observacion observacion)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idturno)
		UPDATE Turno SET estado = @estado,
						observacion = @observacion
		WHERE idTurno = @idturno
ELSE
	SELECT  0 AS Resultado

	
GO
USE [master]
GO
ALTER DATABASE [CentroMedico] SET  READ_WRITE 
GO
