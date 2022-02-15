USE [master]
GO
/****** Object:  Database [EYENET_13IA_DB]    Script Date: 23/1/2022 19:05:40 ******/
CREATE DATABASE [EYENET_13IA_DB] ON  PRIMARY 
( NAME = N'EYENET_13IA_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NOAN2017\MSSQL\DATA\EYENET_13IA_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EYENET_13IA_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.NOAN2017\MSSQL\DATA\EYENET_13IA_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EYENET_13IA_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EYENET_13IA_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EYENET_13IA_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EYENET_13IA_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EYENET_13IA_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EYENET_13IA_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EYENET_13IA_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [EYENET_13IA_DB] SET  MULTI_USER 
GO
ALTER DATABASE [EYENET_13IA_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EYENET_13IA_DB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EYENET_13IA_DB', N'ON'
GO
USE [EYENET_13IA_DB]
GO
/****** Object:  Table [dbo].[tbl_Calendario_Peticiones]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Calendario_Peticiones](
	[id_calendario_peticion] [int] NOT NULL,
	[fecha_ejecucion_peticion] [smalldatetime] NULL,
	[fecha_creacion] [smalldatetime] NULL,
	[id_peticion] [int] NULL,
	[id_usuario] [int] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_tbl_Calendario_Peticiones] PRIMARY KEY CLUSTERED 
(
	[id_calendario_peticion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Datos_13IA]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Datos_13IA](
	[id_respuesta] [int] NOT NULL,
	[id_marca] [int] NULL,
	[id_peticion] [int] NULL,
	[longitud_archivo] [int] NULL,
	[tiempo_aparicion] [timestamp] NULL,
	[duracion_aparicion] [int] NULL,
	[fecha_respuesta] [smalldatetime] NULL,
	[precision_marca] [float] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_tbl_Datos_13IA] PRIMARY KEY CLUSTERED 
(
	[id_respuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Marcas]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Marcas](
	[id_marca] [int] NOT NULL,
	[imagen] [nvarchar](50) NULL,
	[nombre] [nvarchar](50) NULL,
	[id_usuario] [int] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_Marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Peticiones]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Peticiones](
	[id_peticion] [int] NOT NULL,
	[url_peticion] [nvarchar](50) NULL,
	[fecha_peticion] [nvarchar](50) NULL,
	[estado_peticion] [bit] NULL,
	[id_usuario] [int] NULL,
 CONSTRAINT [PK_tbl_Peticiones] PRIMARY KEY CLUSTERED 
(
	[id_peticion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Transcripciones]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Transcripciones](
	[id_transcripcion] [int] NOT NULL,
	[id_peticion] [int] NULL,
	[texto_transcrito] [nvarchar](max) NULL,
	[id_usuario] [int] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_Transcripciones] PRIMARY KEY CLUSTERED 
(
	[id_transcripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Usuario]    Script Date: 23/1/2022 19:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Usuario](
	[id_usuario] [int] NOT NULL,
	[nombre_usuario] [nvarchar](50) NULL,
	[login_usuario] [nvarchar](50) NULL,
	[password_usuario] [nvarchar](50) NULL,
	[estado] [bit] NULL,
	[rol_acceso] [nvarchar](50) NULL,
	[fecha_creacion] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Calendario_Peticiones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Calendario_Peticiones_tbl_Peticiones] FOREIGN KEY([id_peticion])
REFERENCES [dbo].[tbl_Peticiones] ([id_peticion])
GO
ALTER TABLE [dbo].[tbl_Calendario_Peticiones] CHECK CONSTRAINT [FK_tbl_Calendario_Peticiones_tbl_Peticiones]
GO
ALTER TABLE [dbo].[tbl_Calendario_Peticiones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Calendario_Peticiones_tbl_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_Calendario_Peticiones] CHECK CONSTRAINT [FK_tbl_Calendario_Peticiones_tbl_Usuario]
GO
ALTER TABLE [dbo].[tbl_Datos_13IA]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Datos_13IA_tbl_Marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[tbl_Marcas] ([id_marca])
GO
ALTER TABLE [dbo].[tbl_Datos_13IA] CHECK CONSTRAINT [FK_tbl_Datos_13IA_tbl_Marcas]
GO
ALTER TABLE [dbo].[tbl_Datos_13IA]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Datos_13IA_tbl_Peticiones] FOREIGN KEY([id_peticion])
REFERENCES [dbo].[tbl_Peticiones] ([id_peticion])
GO
ALTER TABLE [dbo].[tbl_Datos_13IA] CHECK CONSTRAINT [FK_tbl_Datos_13IA_tbl_Peticiones]
GO
ALTER TABLE [dbo].[tbl_Marcas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Marcas_tbl_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_Marcas] CHECK CONSTRAINT [FK_tbl_Marcas_tbl_Usuario]
GO
ALTER TABLE [dbo].[tbl_Peticiones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Peticiones_tbl_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_Peticiones] CHECK CONSTRAINT [FK_tbl_Peticiones_tbl_Usuario]
GO
ALTER TABLE [dbo].[tbl_Transcripciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Transcripciones_tbl_Peticiones] FOREIGN KEY([id_peticion])
REFERENCES [dbo].[tbl_Peticiones] ([id_peticion])
GO
ALTER TABLE [dbo].[tbl_Transcripciones] CHECK CONSTRAINT [FK_tbl_Transcripciones_tbl_Peticiones]
GO
ALTER TABLE [dbo].[tbl_Transcripciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Transcripciones_tbl_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_Transcripciones] CHECK CONSTRAINT [FK_tbl_Transcripciones_tbl_Usuario]
GO
USE [master]
GO
ALTER DATABASE [EYENET_13IA_DB] SET  READ_WRITE 
GO
