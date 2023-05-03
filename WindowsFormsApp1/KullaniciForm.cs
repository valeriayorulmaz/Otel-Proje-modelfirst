using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1
{
    public partial class KullaniciForm : Form
    {
        public KullaniciForm()
        {
            InitializeComponent();
        }
        OtelContainer db = new OtelContainer();

        private void button1_Click(object sender, EventArgs e)
        {
            Kullanici save = new Kullanici();
            save.KullaniciAd = textBox3.Text;
            save.Sifre = textBox4.Text;
            save.AdSoyad = textBox5.Text;
            save.DTarih = Convert.ToDateTime(dateTimePicker1.Text);
            save.Telefon = textBox6.Text;
            save.Mail = textBox7.Text;
            save.Gorev= textBox8.Text;
            save.Adres = richTextBox1.Text;
            save.Maas = Convert.ToDecimal(textBox9.Text);
            save.SubeNo = Convert.ToInt32(textBox10.Text);
            db.KullaniciSet.Add(save);
            db.SaveChanges();
            dataGridView1.DataSource = db.KullaniciSet.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox3.Tag);
            var sil = db.KullaniciSet.Where(a=>a.KullaniciNo  == id).FirstOrDefault();
            db.KullaniciSet.Remove(sil);
            db.SaveChanges();
            dataGridView1.DataSource = db.KullaniciSet.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox3.Tag);
            var guncelle = db.KullaniciSet.Where(x => x.KullaniciNo == id).FirstOrDefault();
            guncelle.KullaniciAd = textBox3.Text;
            guncelle.Sifre = textBox4.Text;
            guncelle.AdSoyad = textBox5.Text;
            guncelle.DTarih = Convert.ToDateTime(dateTimePicker1.Text);
            guncelle.Telefon = textBox6.Text;
            guncelle.Mail = textBox7.Text;
            guncelle.Gorev = textBox8.Text;
            guncelle.Adres = richTextBox1.Text;
            guncelle.Maas = Convert.ToDecimal(textBox9.Text);
            guncelle.SubeNo = Convert.ToInt32(textBox10.Text);
            db.SaveChanges();
            dataGridView1.DataSource = db.KullaniciSet.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.KullaniciSet.ToList();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.KullaniciSet.Where(x => x.AdSoyad.Contains(textBox3.Text)).ToList();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenuForm main = new AnaMenuForm();
            main.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox3.Tag = row.Cells["KullaniciNo"].Value.ToString();
            textBox3.Text = row.Cells["KullaniciAd"].Value.ToString();
            textBox4.Text = row.Cells["Sifre"].Value.ToString();
            textBox5.Text = row.Cells["AdSoyad"].Value.ToString();
            dateTimePicker1.Text = row.Cells["DTarih"].Value.ToString();
            textBox6.Text = row.Cells["Telefon"].Value.ToString();
            textBox7.Text = row.Cells["Mail"].Value.ToString();
            textBox8.Text = row.Cells["Gorev"].Value.ToString();
            richTextBox1.Text = row.Cells["Adres"].Value.ToString();
            textBox9.Text = row.Cells["Maas"].Value.ToString();
            textBox10.Text = row.Cells["SubeNo"].Value.ToString();


        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
