using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class Libro
    {
        public int Asiento { get; set; }
        public DateTime Fecha { get; set; }
        public string Numero { get; set; }
        public string PlanCuentas { get; set; }
        public string Cuenta { get; set; }
        public string debe { get; set; }
        public string HaberCuenta { get; set; }
        public decimal Debe { get; set; }
        public decimal Haber { get; set; }
        public decimal Saldo { get; set; }
    }
}