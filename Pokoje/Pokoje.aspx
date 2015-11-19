<%@ Page Title="Pokoje" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Pokoje.aspx.cs" Inherits="Pokoje" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 15px;
        }
        .style2
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Galeria pokoi 
    </h2>
    <br /><br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
   <asp:Timer ID="Timer1" runat="server" Interval="2000" ontick="Timer1_Tick">
    </asp:Timer>
    <asp:Image ID="Image1" runat="server" Height="420px" Width="621px" 
        style="text-align: center" />
   
   </ContentTemplate>
    </asp:UpdatePanel>
   <br /><br />
   <h2>
        Cennik pokoi 
    </h2>
    <br />
    <table border="1">
     <tr>
                <td class="style1">
                    <b>Rodzaj pokoju</b></td>
                <td class="style1">
                    <b>Cena</b></td>
                   
            </tr>
            <tr>
             
                <td class="style2">
                    Standardowy
                </td>
                <td class="style2">
                 110 zl
                    </td>
            </tr>
            <tr>
             
                <td class="style2">
                    Pokoj rodzinny
                </td>
                <td class="style2">
                 210 zl
                    </td>
            </tr>
            <tr>
             
                <td class="style2">
                    Apartament
                </td>
                <td class="style2">
                 300 zl
                    </td>
            </tr>
            <tr>
             
                <td class="style2">
                    Prezydencki
                </td>
                <td class="style2">
                 400 zl
                    </td>
            </tr>
    </table>

    <br/><br/>

    <h2>
    <font color="red">Dla nowych klientow,stalych klientow oraz gosci specjalnych przewidzane znizki!</font>
    </h2>
   
</asp:Content>
