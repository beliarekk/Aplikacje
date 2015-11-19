<%@ Page Title="Edytuj pokoje" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Edytujpokoje.aspx.cs" Inherits="Edytujpokoje" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Edytuj pokoje
    </h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   
<ContentTemplate>


        <asp:Label ID="Label1" runat="server" Text="Dostepne pokoje:"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_pokoj" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_pokoj" HeaderText="id_pokoj" 
                    InsertVisible="False" ReadOnly="True" SortExpression="id_pokoj" />
                <asp:BoundField DataField="Nr_pokoj" HeaderText="Nr_pokoj" 
                    SortExpression="Nr_pokoj" />
                <asp:BoundField DataField="Ilosc_lozek" HeaderText="Ilosc_lozek" 
                    SortExpression="Ilosc_lozek" />
                <asp:BoundField DataField="Ilosc_osob" HeaderText="Ilosc_osob" 
                    SortExpression="Ilosc_osob" />
                <asp:BoundField DataField="Typ_pokoj" HeaderText="Typ_pokoj" 
                    SortExpression="Typ_pokoj" />
                <asp:BoundField DataField="Cena_pokoj" HeaderText="Cena_pokoj" 
                    SortExpression="Cena_pokoj" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
            SelectCommand="SELECT pokoje.* FROM pokoje"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Edytuj pokoj:"></asp:Label>
        <br />

        <table style="width:100%;">
            <tr>
                <td>
                    Id_pokoj</td>
                <td>
                    Nr_pokoj</td>
                <td>
                    Ilosc_lozek</td>
                    <td>
                        Ilosc_osob</td>
                <td>
                    Typ_pokoj</td>
                <td>
                    Cena_pokoj</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox_up_Id" runat="server" 
                        ontextchanged="TextBox_up_Id_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_Nr" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_IL" runat="server"></asp:TextBox>
                </td>
                    <td>
                        <asp:TextBox ID="TextBox_up_IO" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList_up_Typ" runat="server">
                        <asp:ListItem>Apartament</asp:ListItem>
                        <asp:ListItem>Pokoj_rodzinny</asp:ListItem>
                        <asp:ListItem>Standardowy</asp:ListItem>
                        <asp:ListItem>Prezydencki</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_Cena" runat="server"></asp:TextBox>
                </td>
            </tr>
        
        </table>

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Zmien dane" />
            <br />
        <asp:Label ID="Label3" runat="server" Text="Dodaj nowy pokoj:"></asp:Label>
        <br />

        <table style="width:100%;">
            <tr>
                <td>
                    Id_pokoj</td>
                <td>
                    Nr_pokoj</td>
                <td>
                    Ilosc_lozek</td>
                    <td>
                        Ilosc_osob</td>
                <td>
                    Typ_pokoj</td>
                <td>
                    Cena_pokoj</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox_up_Id0" runat="server" 
                        ontextchanged="TextBox_up_Id_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_Nr0" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_IL0" runat="server"></asp:TextBox>
                </td>
                    <td>
                        <asp:TextBox ID="TextBox_up_IO0" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList_up_Typ0" runat="server">
                        <asp:ListItem>Apartament</asp:ListItem>
                        <asp:ListItem>Pokoj_rodzinny</asp:ListItem>
                        <asp:ListItem>Standardowy</asp:ListItem>
                        <asp:ListItem>Prezydencki</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TextBox_up_Cena0" runat="server"></asp:TextBox>
                </td>
            </tr>
        
        </table>

        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Dodaj pokoj" />
            <br />

        <asp:Label ID="Blad" runat="server" Text="Wystapil blad" Font-Size="Medium" 
            Visible="False"></asp:Label>

   </ContentTemplate>    
</asp:UpdatePanel>
    </asp:Content>
