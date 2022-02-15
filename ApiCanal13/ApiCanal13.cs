using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Text.RegularExpressions;

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;


using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Web;
using System.Threading.Tasks;

namespace ApiCanal13
{
    public class ApiCanal13Class
    {
        /// <summary>
        /// Registra en Base de Datos MSSQL Server, lo contenido en Peticiones a Canal 13
        /// </summary>
        /// <param name="SQLServer">IP o Instancia de Servidor MSSQL Server</param>
        /// <param name="SQLDataBase">Nombre de Base de Datos</param>
        /// <param name="SQLUserName">Nombre de usuario para conexión a Base de Datos</param>
        /// <param name="SQLPassword">Clave de usuario para conexión a Base de Datos</param>
        /// <param name="Signal">Id de Senal de Canal 13</param>
        /// <param name="Author">Usuario de Senal de Canal 13</param>
        /// <param name="TimestampStart">Fecha Inicio de Peticion </param>
        /// <param name="TimestampEnd">Fecha Fin de Peticion</param>
        /// <param name="IdUsuario">Id de Usuario del Sistema</param>
        /// <param name="Canal13URLCreate">Uri Canal 13</param>
        /// <returns>Mensaje de resultados</returns>
        public async Task<string> CrearPeticion(string SQLServer, string SQLDataBase, string SQLUserName, string SQLPassword, 
                                            string Signal, string Author, string TimestampStart, string TimestampEnd, 
                                            int IdUsuario,
                                            string Canal13URLCreate)

        {
            
            string Respuesta = string.Empty, Estado = string.Empty;
            int StatusCode = 0;
            
            SqlConnection StrCon = new SqlConnection();
            StrCon.ConnectionString = "Data Source=" + SQLServer + ";" + "Initial Catalog=" + SQLDataBase + ";" + "User id=" + SQLUserName + ";" + "Password=" + SQLPassword + ";";
            try
            {

                //CONSUMO DE API
                PeticionResponse PeticionResponse = new PeticionResponse();

                HttpClient client = new HttpClient();

                var values = new Dictionary<string, string>
                {
                    { "author", Author },
                    { "signal", Signal },
                    { "timestampStart" , TimestampStart},
                    { "timestampEnd" , TimestampEnd}
                };

                var content = new FormUrlEncodedContent(values);

                var response = await client.PostAsync(Canal13URLCreate, content);

                var responseString = await response.Content.ReadAsStringAsync();

                PeticionResponse = JsonConvert.DeserializeObject<PeticionResponse>(responseString.ToString());

                StatusCode = (int)response.StatusCode;
                if (StatusCode == 201) //CREATED
                {
                    PeticionResponse = JsonConvert.DeserializeObject<PeticionResponse>(responseString.ToString());

                    Estado = PeticionResponse.Status;
                }
                else
                {
                    Estado = response.StatusCode.ToString();
                }

                //GUARDAMOS EN BASE DE DATOS
                StrCon.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = StrCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_peticiones";
                cmd.Parameters.Add(new SqlParameter("@i_operacion", SqlDbType.VarChar)).Value = "I";
                cmd.Parameters.Add(new SqlParameter("@i_author", SqlDbType.VarChar)).Value = Author;
                cmd.Parameters.Add(new SqlParameter("@i_signal", SqlDbType.VarChar)).Value = Signal;
                cmd.Parameters.Add(new SqlParameter("@i_timestampStart", SqlDbType.VarChar)).Value = TimestampStart;
                cmd.Parameters.Add(new SqlParameter("@i_timestampEnd", SqlDbType.VarChar)).Value = TimestampEnd;
                cmd.Parameters.Add(new SqlParameter("@i_estado_peticion", SqlDbType.VarChar)).Value = Estado;
                cmd.Parameters.Add(new SqlParameter("@i_id_usuario", SqlDbType.Int)).Value = IdUsuario;
                cmd.Parameters.Add(new SqlParameter("@i_create_status_code", SqlDbType.VarChar)).Value = StatusCode.ToString();
                cmd.Parameters.Add(new SqlParameter("@i_create_response", SqlDbType.VarChar)).Value = responseString;
                int resultado = cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
               Respuesta = ex.Message.ToString();
               System.Diagnostics.EventLog.WriteEntry("DLL_CANAL_133", ex.Message.ToString(), System.Diagnostics.EventLogEntryType.Error);
            }
            
            finally
            {
                StrCon.Close();
            }

            return Respuesta;
        }



        /// <summary>
        /// Verifica el Status de Peticiones a Canal 13
        /// </summary>
        /// <param name="SQLServer">IP o Instancia de Servidor MSSQL Server</param>
        /// <param name="SQLDataBase">Nombre de Base de Datos</param>
        /// <param name="SQLUserName">Nombre de usuario para conexión a Base de Datos</param>
        /// <param name="SQLPassword">Clave de usuario para conexión a Base de Datos</param>
        /// <param name="Signal">Id de Senal de Canal 13</param>
        /// <param name="Author">Usuario de Senal de Canal 13</param>
        /// <param name="TimestampStart">Fecha Inicio de Peticion </param>
        /// <param name="TimestampEnd">Fecha Fin de Peticion</param>
        /// <param name="IdUsuario">Id de Usuario del Sistema</param>
        /// /// <param name="Canal13URLCheckStatus">Uri Canal 13</param>
        /// <returns>Mensaje de resultados</returns>
        public async Task<string> VerificarPeticion(string SQLServer, string SQLDataBase, string SQLUserName, string SQLPassword,
                                            string Signal, string Author, string TimestampStart, string TimestampEnd,
                                            int IdUsuario,
                                            string Canal13URLCheckStatus)

        {

            

            string Respuesta = string.Empty, Estado = string.Empty, FileId = String.Empty, Output = string.Empty;
            int StatusCode = 0;

            SqlConnection StrCon = new SqlConnection();
            StrCon.ConnectionString = "Data Source=" + SQLServer + ";" + "Initial Catalog=" + SQLDataBase + ";" + "User id=" + SQLUserName + ";" + "Password=" + SQLPassword + ";";

            try
            {
                //CONSUMO DE API
                CheckStatusResponse PeticionResponse = new CheckStatusResponse();

                HttpClient client = new HttpClient();

                var values = new Dictionary<string, string>
                {
                    { "author", Author },
                    { "signal", Signal },
                    { "timestampStart" , TimestampStart},
                    { "timestampEnd" , TimestampEnd}
                };

                var content = new FormUrlEncodedContent(values);

                var response = await client.PostAsync(Canal13URLCheckStatus, content);
                var responseString = await response.Content.ReadAsStringAsync();
                StatusCode = (int)response.StatusCode;

                if (StatusCode == 200) //OK
                {                  
                    PeticionResponse = JsonConvert.DeserializeObject<CheckStatusResponse>(responseString.ToString());
                
                    Estado = "FINALIZADO";
                    FileId = PeticionResponse.fileid;
                    Output = PeticionResponse.output;
                }
                else
                {
                    Estado = "ERROR";
                }
            
                //***** EJECUTAMOS SP PARA INSERTAR ***
                StrCon.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = StrCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_peticiones";
                cmd.Parameters.Add(new SqlParameter("@i_operacion", SqlDbType.VarChar)).Value = "C";
                cmd.Parameters.Add(new SqlParameter("@i_author", SqlDbType.VarChar)).Value = Author;
                cmd.Parameters.Add(new SqlParameter("@i_signal", SqlDbType.VarChar)).Value = Signal;
                cmd.Parameters.Add(new SqlParameter("@i_timestampStart", SqlDbType.VarChar)).Value = TimestampStart;
                cmd.Parameters.Add(new SqlParameter("@i_timestampEnd", SqlDbType.VarChar)).Value = TimestampEnd;
                cmd.Parameters.Add(new SqlParameter("@i_estado_peticion", SqlDbType.VarChar)).Value = Estado;
                cmd.Parameters.Add(new SqlParameter("@i_id_usuario", SqlDbType.Int)).Value = IdUsuario;
                cmd.Parameters.Add(new SqlParameter("@i_fileid", SqlDbType.VarChar)).Value = FileId;
                cmd.Parameters.Add(new SqlParameter("@i_fileurl", SqlDbType.VarChar)).Value = Output;
                cmd.Parameters.Add(new SqlParameter("@i_check_status_code", SqlDbType.VarChar)).Value = StatusCode.ToString();
                cmd.Parameters.Add(new SqlParameter("@i_check_response", SqlDbType.VarChar)).Value = responseString;
                int resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Respuesta = ex.Message.ToString();
                System.Diagnostics.EventLog.WriteEntry("DLL_CANAL_133", ex.Message.ToString(), System.Diagnostics.EventLogEntryType.Error);
            }
            finally
            {
                StrCon.Close();
            }
           
            return Respuesta;
        }



    }
}
