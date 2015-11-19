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



public partial class Register : System.Web.UI.Page
{

    MySql.Data.MySqlClient.MySqlConnection conn;
    string myConnectionString = "server=localhost; user id=root; Password=student; persistsecurityinfo=True; database=mydb; port=3306";
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {

    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Password_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {

       
            conn = new MySql.Data.MySqlClient.MySqlConnection();
            conn.ConnectionString = myConnectionString;




            MySqlCommand cmd = new MySqlCommand("Insert INTO Klient(id_klient, Imie, Nazwisko, Nr_telefonu, Mail,Status_id_status) VALUES (@id_klient,@Imie,@Nazwisko, @Nr_telefonu,@Mail,@Status) ", conn);

            cmd.CommandType = CommandType.Text;
            //specify the data to be inserted into the table
            cmd.Parameters.AddWithValue("@id_klient", Membership.GetUser(CreateUserWizard1.UserName).ProviderUserKey);
            cmd.Parameters.AddWithValue("@Imie", txtImie.Text);
            cmd.Parameters.AddWithValue("@Nazwisko", txtNazwisko.Text);
            cmd.Parameters.AddWithValue("@Nr_telefonu", txtTel.Text);
            cmd.Parameters.AddWithValue("@Mail", Membership.GetUser().Email);
            cmd.Parameters.AddWithValue("@Status", 1);


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        
        

        

    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {

    }
    protected void txtNazwa_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {

    }
    protected void ContinueButton_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
    protected void CreateUserWizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Page.IsValid)
        {
            
        }
        
    }
}