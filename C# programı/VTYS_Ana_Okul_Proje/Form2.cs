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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        
        NpgsqlConnection conn = new NpgsqlConnection("server=localHost; port=5432; Database=anaokul; user ID=postgres; password=abdullah1.");
        private void button1_Click(object sender, EventArgs e)
        {
            Application.OpenForms[0].Show();
            this.Close();
        }

        
        private void Form2_Load(object sender, EventArgs e)
        {
            bind_data();
        }
        private void bind_data()
        {
            conn.Open();
            NpgsqlCommand cmd1 = new NpgsqlCommand("SELECT   \"public\".\"ogretmen\".\"ogretmenNo\",\r\n         \"public\".\"ogretmen\".\"adi\",\r\n         \"public\".\"ogretmen\".\"soyad\",\r\n         \"public\".\"ogretmen\".\"telfon\"\r\nFROM     \"public\".\"ogretmen\"", conn);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = cmd1;
            DataTable dt = new DataTable();
            dt.Clear();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Tahoma", 13, FontStyle.Bold);
            dataGridView1.DefaultCellStyle.Font = new Font("arial", 12);
        }
        

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int index;
            index = e.RowIndex;
            DataGridViewRow selectedrow = dataGridView1.Rows[index];
            textBox1.Text = selectedrow.Cells[0].Value.ToString();
            textBox2.Text = selectedrow.Cells[1].Value.ToString();
            textBox3.Text = selectedrow.Cells[2].Value.ToString();
            textBox4.Text = selectedrow.Cells[3].Value.ToString();

        }
        private void button2_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd2 = new NpgsqlCommand("insert into  \"ogretmen\"(\"ogretmenNo\",\"adi\",\"soyad\",\"telfon\")values(@ogretmenNo,@adi,@soyad,@telfon)", conn);
            cmd2.Parameters.AddWithValue("@ogretmenNo", int.Parse(textBox1.Text));
            cmd2.Parameters.AddWithValue("@adi", textBox2.Text);
            cmd2.Parameters.AddWithValue("@soyad", textBox3.Text);
            cmd2.Parameters.AddWithValue("@telfon", textBox4.Text);

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
            NpgsqlCommand cmd3 = new NpgsqlCommand("update \"ogretmen\" set \"soyad\"=@soyad ,\"adi\"=@adi,\"telfon\"=@telfon where \"ogretmenNo\"=@ogretmenNo", conn);
            cmd3.Parameters.AddWithValue("@adi", textBox2.Text);
            cmd3.Parameters.AddWithValue("@soyad", textBox3.Text);
            cmd3.Parameters.AddWithValue("@telfon", textBox4.Text);
            cmd3.Parameters.AddWithValue("ogretmenNo", int.Parse(textBox1.Text));
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

        private void button4_Click_1(object sender, EventArgs e)
        {
                textBox1.Text = "";
                textBox2.Text = "";
                textBox3.Text = "";
                textBox4.Text = "";
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd = new NpgsqlCommand("Delete From \"ogretmen\" Where \"ogretmenNo\"=@ogretmenNo", conn);
            cmd.Parameters.AddWithValue("@ogretmenNo", int.Parse(textBox1.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            MessageBox.Show("Silmek icin Ok Basin ?", "", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            bind_data();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd4 = new NpgsqlCommand("select * from \"ogretmen\" where \"adi\"  like '%" + textBox5.Text + "%'", conn);
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
