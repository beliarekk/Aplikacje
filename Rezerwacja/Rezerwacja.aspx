<%@ Page Title="Rezerwacja" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Rezerwacja.aspx.cs" Inherits="Rezerwacja" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Moje Rezerwacje
    </h2>
    
    
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_rezerwacja" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_rezerwacja" HeaderText="Numer rezerwacji" 
                    SortExpression="id_rezerwacja" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Rezerwacja_od" HeaderText="Rezerwacja_od" 
                     />
                <asp:BoundField DataField="Rezerwacja_do" HeaderText="Rezerwacja_do" 
                    />
                <asp:BoundField DataField="Cena_calkowita[zl]" HeaderText="Cena_calkowita[zl]" 
                     />
            
                <asp:BoundField DataField="Nr_pokoj" HeaderText="Nr_pokoj" 
                    />
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
            
        
            SelectCommand="SELECT rezerwacja.id_rezerwacja, rezerwacja.Rezerwacja_od, rezerwacja.Rezerwacja_do, rezerwacja.`Cena_calkowita[zl]`, pokoje.Nr_pokoj, rezerwacja.Klient_id_klient FROM rezerwacja INNER JOIN pozycja_rezerwacji ON rezerwacja.id_rezerwacja = pozycja_rezerwacji.Rezerwacja_id_rezerwacja INNER JOIN pokoje ON pozycja_rezerwacji.Pokoje_id_pokoj = pokoje.id_pokoj WHERE rezerwacja.Klient_id_klient = @ID ORDER BY rezerwacja.id_rezerwacja, pokoje.id_pokoj">
        <SelectParameters>
         <asp:ControlParameter ControlID="Label1" Name="ID" PropertyName="Text" 
                    Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
  <br />
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server">Wpisz numer rezerwacji do usuniecia.</asp:Label>
 <br />

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
 
        <asp:Button ID="Button1" runat="server" Text="Wycofaj rezerwacje" 
            onclick="Button1_Click" />
 <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
 
 
</asp:Content>
