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

public partial class Edytujpokoje : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    string myConnectionString = "server=localhost; user id=root; Password=student; persistsecurityinfo=True; database=mydb; port=3306";
    protected void Page_Load(object sender, EventArgs e)
    {
        Blad.Visible = false;
    }
    protected void TextBox_up_Id_TextChanged(object sender, EventArgs e)
    {
        conn = new MySql.Data.MySqlClient.MySqlConnection();
        conn.ConnectionString = myConnectionString;
        int numer=0;
        int ilosclozek = 0;
        int iloscosob = 0;
        string typpokoj="";
        decimal cenapokoj = 0 ;


        

        // Pobranie Id_rezerwacji

        conn.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT Nr_pokoj, Ilosc_lozek, Ilosc_osob, Typ_pokoj, Cena_pokoj FROM pokoje WHERE @id_pokoj=id_pokoj", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id_pokoj", TextBox_up_Id.Text);
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
          numer = reader.GetInt32(0);
         ilosclozek = reader.GetInt32(1);
         iloscosob= reader.GetInt32(2);
         typpokoj = reader.GetString(3);
         cenapokoj = reader.GetDecimal(4);

         

        }
        reader.Close();
        conn.Close();

        TextBox_up_Nr.Text= Convert.ToString(numer);
        TextBox_up_IL.Text = Convert.ToString(ilosclozek);
        TextBox_up_IO.Text = Convert.ToString(iloscosob);
        DropDownList_up_Typ.Text = typpokoj;
        TextBox_up_Cena.Text = Convert.ToString(cenapokoj);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            conn.ConnectionString = myConnectionString;


            conn.Open();


            MySqlCommand cmd2 = new MySqlCommand("UPDATE pokoje SET Nr_pokoj=@nrpokoj, Ilosc_lozek=@ilosclozek, Ilosc_osob=@iloscosob, Typ_pokoj=@typpokoj, Cena_pokoj=@cenapokoj WHERE @id_pokoj=id_pokoj", conn);
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.AddWithValue("@nrpokoj", TextBox_up_Nr.Text);
            cmd2.Parameters.AddWithValue("@ilosclozek", TextBox_up_IL.Text);
            cmd2.Parameters.AddWithValue("@iloscosob", TextBox_up_IO.Text);
            cmd2.Parameters.AddWithValue("@typpokoj", DropDownList_up_Typ.Text);
            cmd2.Parameters.AddWithValue("@cenapokoj", TextBox_up_Cena.Text);
            cmd2.Parameters.AddWithValue("@id_pokoj", TextBox_up_Id.Text);
            cmd2.ExecuteNonQuery();
            conn.Close();


           

    
      

      
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            conn.ConnectionString = myConnectionString;
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("INSERT INTO pokoje (id_pokoj, Nr_pokoj, Ilosc_lozek, Ilosc_osob, Typ_pokoj, Cena_pokoj) VALUES     (@id_pokoj,@nrpokoj,@ilosclozek,@iloscosob,@typpokoj,@cenapokoj)", conn);
            cmd3.CommandType = CommandType.Text;
            cmd3.Parameters.AddWithValue("@nrpokoj", TextBox_up_Nr0.Text);
            cmd3.Parameters.AddWithValue("@ilosclozek", TextBox_up_IL0.Text);
            cmd3.Parameters.AddWithValue("@iloscosob", TextBox_up_IO0.Text);
            cmd3.Parameters.AddWithValue("@typpokoj", DropDownList_up_Typ0.Text);
            cmd3.Parameters.AddWithValue("@cenapokoj", TextBox_up_Cena0.Text);
            cmd3.Parameters.AddWithValue("@id_pokoj", TextBox_up_Id0.Text);
            cmd3.ExecuteNonQuery();
            conn.Close();

            //INSERT INTO pozycja_rezerwacji(Rezerwacja_id_rezerwacja, Pokoje_id_pokoj) VALUES (8, 7);

            MySqlCommand cmd4 = new MySqlCommand("INSERT INTO pozycja_rezerwacji(Rezerwacja_id_rezerwacja, Pokoje_id_pokoj) VALUES (8, @id_pokoj)", conn);
            cmd4.CommandType = CommandType.Text;

            conn.Open();
            cmd4.Parameters.AddWithValue("@id_pokoj", TextBox_up_Id0.Text);
            cmd4.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            Blad.Visible = true;

        }

        


    }
}
