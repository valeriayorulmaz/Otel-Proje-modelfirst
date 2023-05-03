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
    public partial class SubeForm : Form
    {
        public SubeForm()
        {
            InitializeComponent();
        }

        OtelContainer db = new OtelContainer();


        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.SubelerSet.ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Subeler save = new Subeler();
            save.SubeAd = textBox1.Text;
            save.CalisanSayisi = Convert.ToInt32(textBox2.Text);
            save.OdaSayisi = Convert.ToInt32(textBox3.Text);
            save.Telefon = textBox4.Text;
            save.Adres = richTextBox1.Text;
            db.SubelerSet.Add(save);
            db.SaveChanges();
            dataGridView1.DataSource = db.SubelerSet.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            var sil = db.SubelerSet.Where(a => a.SubeNo == id).FirstOrDefault();
            db.SubelerSet.Remove(sil);
            db.SaveChanges();
            dataGridView1.DataSource = db.SubelerSet.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            var guncelle = db.SubelerSet.Where(x => x.SubeNo == id).FirstOrDefault();
            guncelle.SubeAd = textBox1.Text;
            guncelle.CalisanSayisi = Convert.ToInt32(textBox2.Text);
            guncelle.OdaSayisi = Convert.ToInt32(textBox3.Text);
            guncelle.Telefon = textBox4.Text;
            guncelle.Adres = richTextBox1.Text;
            db.SaveChanges();
            dataGridView1.DataSource = db.SubelerSet.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["SubeNo"].Value.ToString();
            textBox1.Text = row.Cells["SubeAd"].Value.ToString();
            textBox2.Text = row.Cells["CalisanSayisi"].Value.ToString();
            textBox3.Text = row.Cells["OdaSayisi"].Value.ToString();
            textBox4.Text = row.Cells["Telefon"].Value.ToString();
            richTextBox1.Text = row.Cells["Adres"].Value.ToString();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.SubelerSet.Where(x => x.SubeAd.Contains(textBox1.Text)).ToList();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenuForm main = new AnaMenuForm();
            main.Show();
            this.Hide();
        }
    }
}
