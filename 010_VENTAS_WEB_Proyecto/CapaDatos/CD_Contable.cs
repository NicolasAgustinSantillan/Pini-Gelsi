using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Contable
    {
        public static CD_Contable _instancia = null;
        public static CD_Contable Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Contable();
                }
                return _instancia;
            }
        }

        public List<PlanCuentasRubros> ObtenerPlanCuentaRubro()
        {
            List<PlanCuentasRubros> rptListaPlanCuentasRubro = new List<PlanCuentasRubros>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerListaPlanCuentaRubro", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaPlanCuentasRubro.Add(new PlanCuentasRubros()
                        {
                            Numero = dr["Numero"].ToString(),
                            PlanCuentas = dr["PlanCuentas"].ToString(),
                            Rubro = dr["Rubro"].ToString(),
                            Cuenta = dr["Cuenta"].ToString()
                        });
                    }
                    dr.Close();

                    var rptListaPlanCuentasRubros = rptListaPlanCuentasRubro.OrderBy(x => x.PlanCuentas).ToList();

                    return rptListaPlanCuentasRubros;

                }
                catch (Exception ex)
                {
                    rptListaPlanCuentasRubro = null;
                    return rptListaPlanCuentasRubro;
                }
            }
        }

        public bool RegistrarCuenta(PlanCuentasRubros oCuenta)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarCuenta", oConexion);
                    cmd.Parameters.AddWithValue("PlanCuenta", oCuenta.PlanCuentas);
                    cmd.Parameters.AddWithValue("Rubro", oCuenta.Rubro);
                    cmd.Parameters.AddWithValue("Tipo", oCuenta.Cuenta);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

    }
}
