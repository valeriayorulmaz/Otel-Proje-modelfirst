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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        OtelContainer db = new OtelContainer();

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Kullanici save = new Kullanici();
            save.KullaniciAd = textBox3.Text;
            save.Sifre = textBox4.Text;
            save.AdSoyad = textBox5.Text;
            save.DTarih = Convert.ToDateTime(dateTimePicker1.Text);
            save.Telefon = textBox6.Text;
            save.Mail = textBox7.Text;
            save.Gorev = textBox8.Text;
            save.Adres = richTextBox1.Text;
            save.Maas = Convert.ToInt32(textBox9.Text);
            save.SubeNo = Convert.ToInt32(textBox10.Text);

            db.KullaniciSet.Add(save);
            db.SaveChanges();

            MessageBox.Show("Kayıt oldunuz");
            groupBox2.Visible = false;

        }

        public bool Giris(string kadi, string sifre)
        {
            var login = from Kullanici in db.KullaniciSet
                        where Kullanici.KullaniciAd == kadi &&
                        Kullanici.Sifre == sifre
                        select Kullanici;
            if (login.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Giris(textBox1.Text, textBox2.Text))
            {
                AnaMenuForm go = new AnaMenuForm();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Giriş Başarısız");
                textBox1.Clear();
                textBox2.Clear();
            }
        }
    }
}
