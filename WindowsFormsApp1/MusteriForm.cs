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
    public partial class MusteriForm : Form
    {
        public MusteriForm()
        {
            InitializeComponent();
        }

        OtelContainer db = new OtelContainer();


        private void button1_Click(object sender, EventArgs e)
        {
            Musteri save = new Musteri();
            save.AdSoyad = textBox1.Text;
            save.Telefon = textBox2.Text;
            save.SubeNo = Convert.ToInt32(textBox3.Text);
            save.DTarih = Convert.ToDateTime(dateTimePicker1.Text);
            save.Adres = richTextBox1.Text;
            db.MusteriSet.Add(save);
            db.SaveChanges();
            dataGridView1.DataSource = db.MusteriSet.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            var sil = db.MusteriSet.Where(a => a.MusteriNo == id).FirstOrDefault();
            db.MusteriSet.Remove(sil);
            db.SaveChanges();
            dataGridView1.DataSource = db.MusteriSet.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            var guncelle = db.MusteriSet.Where(x => x.MusteriNo == id).FirstOrDefault();
            guncelle.AdSoyad = textBox1.Text;
            guncelle.Telefon = textBox2.Text;
            guncelle.SubeNo = Convert.ToInt32(textBox3.Text);
            guncelle.DTarih = Convert.ToDateTime(dateTimePicker1.Text);
            guncelle.Adres = richTextBox1.Text;
            db.SaveChanges();
            dataGridView1.DataSource = db.MusteriSet.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.MusteriSet.ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.MusteriSet.Where(x => x.AdSoyad.Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["MusteriNo"].Value.ToString();
            textBox1.Text = row.Cells["AdSoyad"].Value.ToString();
            textBox3.Text = row.Cells["SubeNo"].Value.ToString();
            textBox2.Text = row.Cells["Telefon"].Value.ToString();
            dateTimePicker1.Text = row.Cells["DTarih"].Value.ToString();
            richTextBox1.Text = row.Cells["Adres"].Value.ToString();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenuForm main = new AnaMenuForm();
            main.Show();
            this.Hide();
        }
    }
}
