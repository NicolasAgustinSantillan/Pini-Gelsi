using CapaDatosForms;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using System.Data.SqlClient;

namespace CapaNegocioForms
{
    public class CN_Contable
    {
        public List<Libro> ObtenerLibroDiario(string Fecha = null)
        {
            if (Fecha == null)
            {
                DateTime date = DateTime.Now;
                Fecha = date.ToString("yyyy-MM-dd");
            }
            List<Libro> rptListaLibroDiario = new List<Libro>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerListaLibroDiario", oConexion);
                cmd.Parameters.AddWithValue("@fechaFiltro", Fecha);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaLibroDiario.Add(new Libro()
                        {
                            Asiento = Convert.ToInt32(dr["Asiento"]),
                            Fecha = Convert.ToDateTime(dr["Fecha"]),
                            Numero = dr["Numero"].ToString(),
                            PlanCuentas = dr["PlanCuentas"].ToString(),
                            Cuenta = dr["Cuenta"].ToString(),
                            debe = dr["debe"].ToString(),
                            HaberCuenta = dr["HaberCuenta"].ToString(),
                            Debe = Convert.ToDecimal(dr["Debe"]),
                            Haber = Convert.ToDecimal(dr["Haber"])
                        });
                    }
                    dr.Close();

                    var rptListaPlanCuentasRubros = rptListaLibroDiario.OrderBy(x => x.PlanCuentas).ToList();

                    return rptListaPlanCuentasRubros;

                }
                catch (Exception ex)
                {
                    rptListaLibroDiario = null;
                    return rptListaLibroDiario;
                }
            }
        }
    }
}
