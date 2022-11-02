using WinFormsApp.forms;

namespace WinFormsApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void panelMenu_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnLibroDiario_Click(object sender, EventArgs e)
        {
            frmLibroDiario Frm = new frmLibroDiario();
            Frm.TopLevel = false;
            panelContenedor.Controls.Add(Frm);
            Frm.Show();
        }

        private void btnLibroMayor_Click(object sender, EventArgs e)
        {

        }

        private void btnBalance_Click(object sender, EventArgs e)
        {

        }

        
    }
}