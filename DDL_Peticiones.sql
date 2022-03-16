USE [EYENET_13IA_DB]
GO

/****** Object:  Table [dbo].[tbl_Peticiones]    Script Date: 14/02/2022 7:19:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Peticiones](
	[id_peticion] [int] IDENTITY(1,1) NOT NULL,
	[author] [nvarchar](50) NULL,
	[signal] [nvarchar](50) NULL,
	[timestampStart] [varchar](50) NULL,
	[timestampEnd] [varchar](50) NULL,
	[fecha_peticion] [datetime] NULL,
	[estado_peticion] [varchar](10) NULL,
	[id_usuario] [int] NULL,
	[CreateStatusCode] [varchar](5) NULL,
	[CreateResponse] [varchar](100) NULL,
	[FileId] [varchar](100) NULL,
	[FileUrl] [varchar](500) NULL,
	[CheckStatusCode] [varchar](5) NULL,
	[CheckResponse] [varchar](2000) NULL,
 CONSTRAINT [PK_tbl_Peticiones] PRIMARY KEY CLUSTERED 
(
	[id_peticion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Peticiones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Peticiones_tbl_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_Usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[tbl_Peticiones] CHECK CONSTRAINT [FK_tbl_Peticiones_tbl_Usuario]
GO


