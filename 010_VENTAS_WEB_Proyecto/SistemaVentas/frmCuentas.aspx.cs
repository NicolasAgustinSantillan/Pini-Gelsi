using CapaDatosForms;
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
    public partial class frmCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static Respuesta<List<PlanCuentasRubros>> Obtener()
        {
            List<PlanCuentasRubros> oListaPlanCuentasRubros = new List<PlanCuentasRubros>();
            oListaPlanCuentasRubros = CD_Contable.Instancia.ObtenerPlanCuentaRubro();
            if (oListaPlanCuentasRubros != null)
            {
                return new Respuesta<List<PlanCuentasRubros>>() { estado = true, objeto = oListaPlanCuentasRubros };
            }
            else
            {
                return new Respuesta<List<PlanCuentasRubros>>() { estado = false, objeto = null };
            }
        }

        [WebMethod]
        public static Respuesta<bool> Guardar(PlanCuentasRubros oCuenta)
        {
            bool Respuesta = false;
            Respuesta = CD_Contable.Instancia.RegistrarCuenta(oCuenta);
            return new Respuesta<bool>() { estado = Respuesta };
        }
    }
}