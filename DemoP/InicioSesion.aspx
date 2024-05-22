<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="DemoP.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="Estilos.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
     <div class="center">
         <asp:Image ID="Image1" runat="server" ImageUrl="https://induccionuabc.wordpress.com/wp-content/uploads/2022/12/escudo-uabc-2022-color-cont.png" />
     </div>
     <div class="center">
         <p><asp:Label ID="Label3" runat="server" Text="Usuario:"></asp:Label> 
             <asp:TextBox ID="TxtUser" runat="server" style="margin-left: 27px" Width="141px" Height="18px" OnTextChanged="TxtUser_TextChanged"></asp:TextBox></p>
         <p><asp:Label ID="Label2" runat="server" Text="Contraseña:"></asp:Label> 
             <asp:TextBox ID="TxtPassword" runat="server" style="margin-left: 4px" TextMode="Password" Width="143px" OnTextChanged="TxtPassword_TextChanged"></asp:TextBox></p>
         <p><asp:Button ID="BtnLogin" runat="server" style="margin-left: 86px" Text="Iniciar Sesion" OnClick="BtnLogin_Click" /></p>
     </div>
     <p>
         &nbsp;</p>
     <p>
         &nbsp;</p>
    </form>
</body>
</html>
