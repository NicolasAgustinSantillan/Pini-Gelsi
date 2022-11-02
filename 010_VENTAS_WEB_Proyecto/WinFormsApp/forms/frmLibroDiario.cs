using CapaDatosForms;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp.forms
{
    public partial class frmLibroDiario : frmBase
    {
        private List<Libro> libro;
        private decimal Saldo;
        public frmLibroDiario() 
        {
            InitializeComponent();
        }

        private void frmLibroDiario_Load(object sender, EventArgs e)
        {
            MessageBox.Show(Convert.ToString(DateTime.Now));
            traerDatos(DateTime.Now);
            llenarGrilla();
        }

        private void traerDatos(DateTime Fecha)
        {
            
            try
            {
                libro = CD_Contable.Instancia.ObtenerLibroMayor("Caja", out decimal saldo);
            }
            catch (Exception ex)
            {
                MessageBox.Show(Convert.ToString(ex));
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            traerDatos(DateTime.Now);
        }

        private void llenarGrilla()
        {
            GridView.DataSource = libro;
        }
    }
}
