using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
namespace mediaplayer
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            string connect = "Data Source=//localhost:1521/xepdb1;User Id=practice;Password=Ewqh9783";
            string query = "Select MEDIA_NAME from jl_mediainfo";
            OracleConnection connection = new OracleConnection(connect);
            DataSet ds = new DataSet();
            try
            {
                connection.Open();
                OracleDataAdapter loadVideos = new OracleDataAdapter(query,connection);
                loadVideos.Fill(ds);
                connection.Close();
                dataGridView1.DataSource = ds.Tables[0];
            }
            catch(Exception ex)
            {
            MessageBox.Show(ex.Message); 
            }    
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dataGridView = (DataGridView)sender;
            string media_name = dataGridView.Rows[dataGridView.CurrentRow.Index].Cells[0].Value.ToString();
            Form4 f = new Form4(media_name);
            this.Hide();
            f.ShowDialog();
            this.Show();
        }
    }
}
