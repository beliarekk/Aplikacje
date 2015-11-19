<%@ Page Title="Dokonaj rezerwacji" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Dokrezerwacji.aspx.cs" Inherits="Dokrezerwacji" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <style type="text/css">
        .style4
        {
            width: 254px;
        }
        .style6
        {
            height: 15px;
            width: 254px;
        }
        .style7
        {
            height: 25px;
            width: 241px;
        }
        .style8
        {
            width: 241px;
        }
    </style>

</asp:Content>



<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Dokonaj rezerwacji
    </h2>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

  

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   
      <asp:Label ID="Label1" runat="server" Text="Wybierz planowany czas pobytu" 
                Width="634px" Font-Size="Larger" Height="30px"></asp:Label>
        <table border="1" class="style6">
            <tr>
                <td class="style7">
                    Poczatek pobytu:</td>
                <td class="style6">
                    Koniec pobytu:</td>
                   
            </tr>
            <tr>
             
                <td class="style8">
                    <asp:Calendar ID="Calendar1" runat="server" Width="250px" Height="168px" 
                        ></asp:Calendar>
                </td>
                <td class="style4">
                 <asp:Calendar ID="Calendar2" runat="server" Width="250px" Height="168px" 
                         ></asp:Calendar>
                    </td>
            </tr>
            
          
            
         
           
          
            
          
        </table>
        

        <asp:Label ID="Label2" runat="server" Text="Lista dostepnych pokoi" 
            Font-Size="Larger" Height="31px"></asp:Label>
  
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
             
SelectCommand="SELECT COUNT(pokoje.Nr_pokoj) AS ID, pokoje.Nr_pokoj, pokoje.Ilosc_lozek, pokoje.Ilosc_osob, pokoje.Typ_pokoj, pokoje.`Cena_pokoj` FROM pokoje LEFT JOIN pozycja_rezerwacji ON pokoje.id_pokoj = pozycja_rezerwacji.Pokoje_id_pokoj LEFT JOIN rezerwacja ON pozycja_rezerwacji.Rezerwacja_id_rezerwacja = rezerwacja.id_rezerwacja WHERE (((((Rezerwacja_do <= @data2 AND Rezerwacja_do >= @data1) OR (Rezerwacja_od >= @data1 AND Rezerwacja_od <= @data2) OR (Rezerwacja_od < @data1 AND Rezerwacja_do > @data2)) )OR rezerwacja_od IS NULL) AND @data1<=@data2) Group BY pokoje.Nr_pokoj HAVING ID<2">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="data1" PropertyName="SelectedDate" 
                    Type="DateTime" />
                    <asp:ControlParameter ControlID="Calendar2" Name="data2" PropertyName="SelectedDate" 
                    Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
 

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Nr_pokoj" SortExpression="Nr_pokoj">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nr_pokoj") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabTab" runat="server" Text='<%# Bind("Nr_pokoj") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Ilosc_lozek" HeaderText="Ilosc_lozek" 
                    SortExpression="Ilosc_lozek" />
                <asp:BoundField DataField="Ilosc_osob" HeaderText="Ilosc_osob" 
                    SortExpression="Ilosc_osob" />
                <asp:BoundField DataField="Typ_pokoj" HeaderText="Typ_pokoj" 
                    SortExpression="Typ_pokoj" />
                <asp:BoundField DataField="Cena_pokoj" HeaderText="Cena_pokoj" 
                    SortExpression="Cena_pokoj" />
                <asp:TemplateField HeaderText="Wybierz Pokoj">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
            Text="Rezerwuj" />
          
    </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
