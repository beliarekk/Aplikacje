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

public partial class Edytujznizki : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    string myConnectionString = "server=localhost; user id=root; Password=student; persistsecurityinfo=True; database=mydb; port=3306";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new MySql.Data.MySqlClient.MySqlConnection();
        conn.ConnectionString = myConnectionString;



        conn.Open();


        MySqlCommand cmd3 = new MySqlCommand("UPDATE klient SET Status_id_status=@idzn WHERE @iduz=id_klient", conn);
        cmd3.CommandType = CommandType.Text;
        cmd3.Parameters.AddWithValue("@iduz", TextBox1.Text);
        cmd3.Parameters.AddWithValue("@idzn", TextBox2.Text);
        
        cmd3.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Edytujznizki.aspx");

    }
}
