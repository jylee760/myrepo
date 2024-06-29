using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace mediaplayer
{
    public partial class Form4 : Form
    {
        private string _Name;
        public Form4(string name)
        {
            InitializeComponent();
            _Name = name;
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            string connect = "Data Source=//localhost:1521/xepdb1;User Id=practice;Password=********";
            OracleConnection connection = new OracleConnection(connect);
            try
            {
                connection.Open();
                OracleCommand command = connection.CreateCommand();
                command.CommandText = "Select MEDIA from jl_mediainfo where media_name = :name";
                command.Parameters.Add("name",_Name);
                OracleDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    OracleBlob blob = reader.GetOracleBlob(reader.GetOrdinal("MEDIA"));
                    byte[] buffer = new byte[blob.Length];
                    blob.Read(buffer, 0, buffer.Length);
                    reader.Close();
                    connection.Close();
                    string filePath = Path.Combine(Application.StartupPath, "output.wmv");
                    File.WriteAllBytes(filePath, buffer);
                    axWindowsMediaPlayer1.URL = filePath;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Form4_FormClosing(object sender, FormClosingEventArgs e)
        {
            axWindowsMediaPlayer1.close();
        }

        private void axWindowsMediaPlayer1_Enter(object sender, EventArgs e)
        {

        }
    }
}
