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


public partial class Dokrezerwacji : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    string myConnectionString = "server=localhost; user id=root; Password=student; persistsecurityinfo=True; database=mydb; port=3306";
  

    protected void Button1_Click1(object sender, EventArgs e)
    {
        decimal cena = 0;
        int ilosc=0;
        int maxid=0;
        int aktualneid;
        decimal znizka=0;
        int ilewybrano = 0;
        int iloscdni = 0;
        


        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("Checkbox1");
            if (ch.Checked == true)
                ilosc++;
               
        }

        string[] pokoje = new string[ilosc];
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("Checkbox1");
           Label lb = (Label) GridView1.Rows[i].FindControl("LabTab");
           if (ch.Checked == true)
           {
               pokoje[ilewybrano] = lb.Text;
               ilewybrano++;
           }
            
        }
    
        // Polaczenie
        conn = new MySql.Data.MySqlClient.MySqlConnection();
        conn.ConnectionString = myConnectionString;


        // Pobranie Id_rezerwacji
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT MAX(id_rezerwacja) FROM rezerwacja", conn);
        cmd.CommandType = CommandType.Text;
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            maxid = reader.GetInt32(0);

        }
        reader.Close();
        conn.Close();
        aktualneid = maxid + 1;


        //Pobranie cen
        conn.Open();

        for (int i = 0; i <ilosc; i++)
        {
            MySqlCommand cmd2 = new MySqlCommand("SELECT Cena_pokoj FROM pokoje WHERE id_pokoj=@id_pokoj", conn);
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.AddWithValue("@id_pokoj", pokoje[i]);
            MySqlDataReader reader2 = cmd2.ExecuteReader();
            while (reader2.Read())
            {
                cena = cena + reader2.GetDecimal(0);
            }
            reader2.Close();
        }

        conn.Close();

        // Pobranie znizki uzytkownika
        conn.Open();


        MySqlCommand cmd3 = new MySqlCommand("SELECT status.Znizka FROM klient INNER JOIN status ON klient.Status_id_status = status.id_status WHERE id_klient=@id_uzytkownik", conn);
            cmd3.CommandType = CommandType.Text;
            cmd3.Parameters.AddWithValue("@id_uzytkownik", Membership.GetUser().ProviderUserKey);
            MySqlDataReader reader3 = cmd3.ExecuteReader();
            while (reader3.Read())
            {
                znizka = reader3.GetDecimal(0);
            }
            reader3.Close();
        

        conn.Close();


        // Dokonanie wpisu do bazy
        
        TimeSpan x = Calendar2.SelectedDate - Calendar1.SelectedDate;
        iloscdni = x.Days+1;
        conn.Open();


        MySqlCommand cmd5 = new MySqlCommand("INSERT INTO rezerwacja(id_rezerwacja, Rezerwacja_od, Rezerwacja_do, `Cena_calkowita[zl]`, Klient_id_klient) VALUES (@id,@data_pocz,@data_konc,@cena,@id_uzytkownik)", conn);
        cmd5.CommandType = CommandType.Text;
        cmd5.Parameters.AddWithValue("@id_uzytkownik", Membership.GetUser().ProviderUserKey);
        cmd5.Parameters.AddWithValue("@cena", ((1 - znizka) * cena)*iloscdni);
        cmd5.Parameters.AddWithValue("@data_pocz", Calendar1.SelectedDate);
        cmd5.Parameters.AddWithValue("@data_konc", Calendar2.SelectedDate);
        cmd5.Parameters.AddWithValue("@id", aktualneid);
        cmd5.ExecuteNonQuery();

        for (int i = 0; i < ilosc; i++)
        {
            MySqlCommand cmd6 = new MySqlCommand("INSERT INTO pozycja_rezerwacji(Rezerwacja_id_rezerwacja, Pokoje_id_pokoj) VALUES (@id,@pokoj)", conn);
            cmd6.CommandType = CommandType.Text;
            cmd6.Parameters.AddWithValue("@id", aktualneid);
            cmd6.Parameters.AddWithValue("@pokoj", pokoje[i]);
          
            cmd6.ExecuteNonQuery();
        }

        conn.Close();
 

        Response.Redirect("../Podziekowanie/podziekowanie.aspx");
    }
 
}
