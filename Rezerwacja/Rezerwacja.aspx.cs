using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;
using System.Data;


public partial class Rezerwacja : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    string myConnectionString = "server=localhost; user id=root; Password=student; persistsecurityinfo=True; database=mydb; port=3306";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Label lb=Label1;
        lb.Text = Convert.ToString(Membership.GetUser().ProviderUserKey);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_uzytk_rez = 0;
        int id_uzytk_str = Convert.ToInt32(Membership.GetUser().ProviderUserKey);
        string id_rez = TextBox1.Text;

        conn = new MySql.Data.MySqlClient.MySqlConnection();
        conn.ConnectionString = myConnectionString;

        conn.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT Klient_id_klient FROM rezerwacja WHERE id_rezerwacja=@id_rez", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id_rez", id_rez);
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            id_uzytk_rez = reader.GetInt32(0);

        }
        reader.Close();
        conn.Close();






        if (id_uzytk_rez == id_uzytk_str)
        {
            conn.Open();
            MySqlCommand cmd1 = new MySqlCommand("DELETE FROM pozycja_rezerwacji WHERE Rezerwacja_id_rezerwacja=@id_rez", conn);
            cmd1.CommandType = CommandType.Text;
            cmd1.Parameters.AddWithValue("@id_rez", id_rez);
            cmd1.ExecuteNonQuery();

            MySqlCommand cmd2 = new MySqlCommand("DELETE FROM rezerwacja WHERE id_rezerwacja=@id_rez", conn);
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.AddWithValue("@id_rez", id_rez);
            cmd2.ExecuteNonQuery();
          
            conn.Close();

            Response.Redirect("../Podziekowanie/podziekowaniezausuniecie.aspx");
            

        }
        else
        {
            Label3.Text = "Zly numer rezerwacji";
        }
    }
}
