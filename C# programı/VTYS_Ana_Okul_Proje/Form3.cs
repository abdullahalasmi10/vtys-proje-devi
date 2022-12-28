using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Ana_Okul_Proje
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        NpgsqlConnection conn = new NpgsqlConnection("server=localHost; port=5432; Database=anaokul; user ID=postgres; password=abdullah1.");
        private void Form3_Load(object sender, EventArgs e)
        {
            bind_data();
        }
        private void bind_data()
        {
            conn.Open();
            NpgsqlCommand cmd1 = new NpgsqlCommand("SELECT   \"public\".\"ogrenci\".\"ogrenciNo\"  As id ,\r\n    \"public\".\"ogrenci\".\"isim\"  As adi,\r\n         \"public\".\"ogrenci\".\"soyad\",\r\n         \"public\".\"ogrenci\".\"dogumtarihi\" As Dogum,\r\n         \"public\".\"ogrenci\".\"sube\",\r\n                  \"public\".\"ogrenci\".\"veliNo\"\r\nFROM     \"public\".\"ogrenci\"", conn);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = cmd1;
            DataTable dt = new DataTable();
            dt.Clear();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Tahoma", 12, FontStyle.Bold);
            dataGridView1.DefaultCellStyle.Font = new Font("arial", 10);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.OpenForms[0].Show();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
          NpgsqlCommand cmd2 = new NpgsqlCommand("insert into  \"ogrenci\"(\"ogrenciNo\",\"isim\",\"soyad\",\"dogumtarihi\",\"sube\",\"veliNo\")values(@ogrenciNo,@isim,@soyad,@dogumtarihi,@sube,@veliNo)", conn);
            cmd2.Parameters.AddWithValue("@ogrenciNo", int.Parse(textBox1.Text));
            cmd2.Parameters.AddWithValue("@isim", textBox2.Text);
            cmd2.Parameters.AddWithValue("@soyad", textBox3.Text);
            cmd2.Parameters.AddWithValue("@dogumtarihi", textBox4.Text);  
            cmd2.Parameters.AddWithValue("@sube", textBox5.Text);
            
            cmd2.Parameters.AddWithValue("@veliNo", int.Parse(textBox7.Text));

            try
            {
                cmd2.ExecuteNonQuery();
                MessageBox.Show("Eklemek IstiyorMusun ? ", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show("Bir Hata Var!", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            conn.Close();
            bind_data();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd3 = new NpgsqlCommand("update \"ogrenci\" set \"isim\"=@isim  , \"sube\"=@sube , \"soyad\"=@soyad ,\"veliNo\"=@veliNo,\"dogumtarihi\"=@dogumtarihi where \"ogrenciNo\"=@ogrenciNo", conn);
            
            cmd3.Parameters.AddWithValue("@isim", textBox2.Text);
            cmd3.Parameters.AddWithValue("@soyad", textBox3.Text);
            cmd3.Parameters.AddWithValue("@dogumtarihi", textBox4.Text);
            cmd3.Parameters.AddWithValue("@sube", textBox5.Text);
            cmd3.Parameters.AddWithValue("@veliNo", int.Parse(textBox7.Text));
            cmd3.Parameters.AddWithValue("@ogrenciNo", int.Parse(textBox1.Text));
            try
            {
                cmd3.ExecuteNonQuery();
                MessageBox.Show("Guncelmek Istiyormusunuz ?", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show("Bir Hata Var", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            conn.Close();
            bind_data();

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            

        }
        
       

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox7.Text = "";
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index;
            index = e.RowIndex;
            DataGridViewRow selectedrow = dataGridView1.Rows[index];
            textBox1.Text = selectedrow.Cells[0].Value.ToString();
            textBox2.Text = selectedrow.Cells[1].Value.ToString();
            textBox3.Text = selectedrow.Cells[2].Value.ToString();
            textBox4.Text = selectedrow.Cells[3].Value.ToString();
            textBox5.Text = selectedrow.Cells[4].Value.ToString();
            textBox7.Text = selectedrow.Cells[5].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd = new NpgsqlCommand("Delete From \"ogrenci\" Where \"ogrenciNo\"=@ogrenciNo", conn);
            cmd.Parameters.AddWithValue("@ogrenciNo", int.Parse(textBox1.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Silmek icin Ok Basin ?", "", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            bind_data();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd4 = new NpgsqlCommand("select * from \"ogrenci\" where \"isim\"  like '%" + textBox8.Text + "%'", conn);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd4);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            conn.Close();
            dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Tahoma", 10, FontStyle.Bold);
            dataGridView1.DefaultCellStyle.Font = new Font("arial", 10);

        }
    }
}
