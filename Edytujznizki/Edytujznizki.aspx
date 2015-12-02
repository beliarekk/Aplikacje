<%@ Page Title="Edytuj znizki" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Edytujznizki.aspx.cs" Inherits="Edytujznizki" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Edytuj znizki
    </h2>
   
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_klient,id_status" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_klient" HeaderText="id_klient" 
                    SortExpression="id_klient" ReadOnly="True" />
                <asp:BoundField DataField="Imie" HeaderText="Imie" 
                    SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                    SortExpression="Nazwisko" />
                <asp:BoundField DataField="Nr_telefonu" HeaderText="Nr_telefonu" 
                    SortExpression="Nr_telefonu" />
                <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                <asp:BoundField DataField="id_status" HeaderText="id_status" 
                    InsertVisible="False" ReadOnly="True" SortExpression="id_status" />
                <asp:BoundField DataField="Nazwa_statusu" HeaderText="Nazwa_statusu" 
                    SortExpression="Nazwa_statusu" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
            
        SelectCommand="SELECT klient.id_klient, klient.Imie, klient.Nazwisko, klient.Nr_telefonu, klient.Mail, status.id_status, status.Nazwa_statusu FROM klient INNER JOIN status ON klient.Status_id_status = status.id_status">
        </asp:SqlDataSource>
        <br />

        <asp:Label ID="Label2" runat="server" Text="Zmien status"></asp:Label>
        <table style="width:50%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Id uzytkownika"></asp:Label>
                </td>
                <td>
                    Nowy status (Id)</td>
             
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
              
            </tr>
         
        </table>

        
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Zmien status" />

        
    
<<<<<<< HEAD
    <br />
    <asp:Label ID="Wyjatek" runat="server" Text="Bledne dane" Font-Size="Larger" 
        Visible="True"></asp:Label>

        
    
=======
>>>>>>> eabc05e76f3c1b0eff4d50a1a80e43a4efc5521c
</asp:Content>
