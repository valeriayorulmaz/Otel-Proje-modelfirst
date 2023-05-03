using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class AnaMenuForm : Form
    {
        public AnaMenuForm()
        {
            InitializeComponent();
        }
        OtelContainer db = new OtelContainer();


        private void button1_Click(object sender, EventArgs e)
        {
            MusteriForm musteri = new MusteriForm();
            musteri.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SubeForm sube = new SubeForm();
            sube.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Raporlama rapor = new Raporlama();
            rapor.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            KullaniciForm user = new KullaniciForm();
            user.Show();
            this.Hide();
        }
    }
}
