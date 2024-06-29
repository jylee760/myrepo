using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace mediaplayer
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    textBox2.Text = Path.GetFileName(openFileDialog1.FileName);
                }
                catch (Exception ex) 
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

         private void button2_Click(object sender, EventArgs e)
         {
             if(textBox1.Text.Length ==0)
             {
                 MessageBox.Show("Please enter a name");
                 return;
             }
             string type = "V";
             byte[] fileContents = System.IO.File.ReadAllBytes(openFileDialog1.FileName);
             string connect = "Data Source=//localhost:1521/xepdb1;User Id=practice;Password=********";
             try
             {
                 OracleConnection connection = new OracleConnection(connect);
                 connection.Open();
                 OracleCommand command = connection.CreateCommand();
                 command.CommandText = "Insert into jl_mediainfo(MEDIA_NAME,MEDIA_TYPE,MEDIA) values(:N,:T,:M)";
                 command.Parameters.Add("N", textBox1.Text);
                 command.Parameters.Add("T",type);
                 OracleBlob blob = new OracleBlob(connection);
                 blob.Write(fileContents, 0, fileContents.Length);
                 command.Parameters.Add("M", blob);

                 command.ExecuteNonQuery();
                 connection.Close();
                 MessageBox.Show("Video Uploaded.");
             }
             catch (Exception ex)
             {
                 MessageBox.Show(ex.Message);
             }
         }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
