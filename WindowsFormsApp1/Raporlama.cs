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
    public partial class Raporlama : Form
    {
        public Raporlama()
        {
            InitializeComponent();
        }
        OtelContainer db = new OtelContainer();

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenuForm ana = new AnaMenuForm();
            ana.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var sonuc = db.MusteriSet.Where(m => m.SubeNo == 4).ToList();
            dataGridView1.DataSource = sonuc.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var sonuc = from k in db.KullaniciSet
                        join s in db.SubelerSet
            on k.SubeNo equals s.SubeNo
                        orderby k.SubeNo
                        select new
                        {
                            k.AdSoyad,
                            k.DTarih,
                            k.Gorev,
                            k.Maas,
                            k.SubeNo,
                            s.SubeAd,
                        };
            dataGridView1.DataSource = sonuc.ToList();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            var sonuc = from sube in db.SubelerSet
                        orderby sube.SubeAd descending
                        select sube;
            dataGridView1.DataSource = sonuc.ToList();

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
