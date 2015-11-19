<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Kontakt.aspx.cs" Inherits="Kontakt" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Kontakt
    </h2>
    <br /><br />
    <font size="5" face="TimesNewRoman">
        <b>Adres:</b><br />
        Gumniska 87A<br />
        34-343 Gumniska<br />
        <b>Tel do recepcji:</b><br />
        656545345 <br />
        <b>Nasz hotel znajdziesz tutaj:</b><br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/02.png" /></font>
</asp:Content>
