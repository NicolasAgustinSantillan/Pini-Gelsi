using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatosForms
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

        public List<Libro> ObtenerLibroDiario(string Fecha = null)
        {
            if (Fecha == null)
            {
                DateTime date = DateTime.Now;
                Fecha = date.ToString("yyyy-MM-dd");
            }
            List <Libro> rptListaLibroDiario = new List<Libro>();
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
        public List<Libro> ObtenerLibroMayor(string Cuenta, out decimal saldo)
        {
            if (Cuenta == null || Cuenta == "")
                Cuenta = "Caja";
            List<Libro> rptListaLibroMayor = new List<Libro>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_LibroMayor", oConexion);
                cmd.Parameters.AddWithValue("@CuentaFiltro", Cuenta);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaLibroMayor.Add(new Libro()
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

                    rptListaLibroMayor.OrderBy(x => x.PlanCuentas).ToList();

                    decimal Debe = 0, Haber = 0;
                    for (int i = 0; i < rptListaLibroMayor.Count; i++)
                    {
                        Debe += rptListaLibroMayor[i].Debe;
                        Haber += rptListaLibroMayor[i].Haber;
                    }

                    saldo = Debe - Haber;

                    return rptListaLibroMayor;

                }
                catch (Exception ex)
                {
                    saldo = 0;
                    rptListaLibroMayor = null;
                    return rptListaLibroMayor;
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
