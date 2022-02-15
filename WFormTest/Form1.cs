using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ApiCanal13;

using System.Configuration;
using System.Configuration.Assemblies;
using System.Threading.Tasks;

namespace WFormTest
{
    public partial class Form1 : Form
    {
        string servidor = string.Empty, basededatos = string.Empty,
                usuario = string.Empty, clave = string.Empty,
                 signal = string.Empty, author = string.Empty, timestampStart = string.Empty,
                timestampEnd = string.Empty, canal13UrlCreate, canal13UrlCheckStatus;
        int idusuario = 1;
        ApiCanal13.ApiCanal13Class ApiCanal = new ApiCanal13.ApiCanal13Class();

        Task<string> resultado;

        public Form1()
        {
            InitializeComponent();

            servidor = ConfigurationManager.AppSettings["SQLServer"].ToString();
            basededatos = ConfigurationManager.AppSettings["BaseDatos"].ToString();
            usuario = ConfigurationManager.AppSettings["UsuarioSQL"].ToString();
            clave = ConfigurationManager.AppSettings["PasswordSQL"].ToString();
            signal = ConfigurationManager.AppSettings["Signal"].ToString();
            author = ConfigurationManager.AppSettings["Author"].ToString();
            timestampStart = "2022-01-25_01-00-00";
            timestampEnd = "2022-01-25_03-00-00";
            canal13UrlCreate = ConfigurationManager.AppSettings["Canal13UrlCreate"].ToString();
            canal13UrlCheckStatus = ConfigurationManager.AppSettings["Canal13UrlCheckStatus"].ToString();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            resultado = ApiCanal.CrearPeticion(servidor, basededatos, usuario, clave, signal, author, timestampStart, timestampEnd, idusuario, canal13UrlCreate);
            MessageBox.Show("Peticion Enviada");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            resultado = ApiCanal.VerificarPeticion(servidor, basededatos, usuario, clave, signal, author, timestampStart, timestampEnd, idusuario, canal13UrlCheckStatus);
            MessageBox.Show("Verificacion Finalizada");
        }
    }
}
