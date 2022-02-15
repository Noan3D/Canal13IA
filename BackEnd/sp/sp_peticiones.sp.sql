use EYENET_13IA_DB
go

IF OBJECT_ID('sp_peticiones', 'P') IS NOT NULL
  DROP PROCEDURE sp_peticiones
GO

CREATE PROCEDURE sp_peticiones
	@i_operacion VARCHAR(1) = NULL,
	@i_author varchar(50) = null,
	@i_signal varchar(50) = null,
	@i_timestampStart varchar(50) = null,
	@i_timestampEnd varchar(50) = null,
	@i_estado_peticion varchar(10)  =null,
	@i_id_usuario int =null,
	@i_create_status_code varchar(5) = null,
	@i_create_response varchar(100) = null,
	@i_check_status_code varchar(5) = null,
	@i_check_response varchar(2000) = null,
	@i_fileid varchar(100) =null,
	@i_fileurl varchar(500) =null
AS
BEGIN
	
	SET NOCOUNT ON;

    if @i_operacion = 'I' -- create request
	begin
		INSERT INTO EYENET_13IA_DB..tbl_Peticiones
		(author, signal, timestampStart, timestampEnd, fecha_peticion, estado_peticion, id_usuario, CreateStatusCode, CreateResponse)
		VALUES
		(@i_author, @i_signal, @i_timestampStart, @i_timestampEnd, GETDATE(), @i_estado_peticion, @i_id_usuario, @i_create_status_code, @i_create_response)
	end

	if @i_operacion = 'C' -- update check status request
	begin
		UPDATE EYENET_13IA_DB..tbl_Peticiones
		SET 
			estado_peticion = @i_estado_peticion,
			FileId =  @i_fileid,
			FileUrl = @i_fileurl,
			CheckStatusCode = @i_check_status_code,
			CheckResponse = @i_check_response
		WHERE timestampStart = @i_timestampStart and timestampEnd = @i_timestampEnd
		and author = @i_author and signal = @i_signal
	end
END
GO
