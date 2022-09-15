using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaVentas
{
    public partial class frmLibroMayor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static Respuesta<List<Libro>> Obtener()
        {
            List<Libro> oListaRol = new List<Libro>();
            oListaRol = CD_Contable.Instancia.ObtenerLibroMayor();

            if (oListaRol != null)
            {
                return new Respuesta<List<Libro>>() { estado = true, objeto = oListaRol };
            }
            else
            {
                return new Respuesta<List<Libro>>() { estado = false, objeto = null };
            }
        }
    }
}