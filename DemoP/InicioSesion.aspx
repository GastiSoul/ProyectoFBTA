<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="pruebalogin2.InicioSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Iniciar Sesión</title>
    <link href="Estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <img src="https://induccionuabc.wordpress.com/wp-content/uploads/2022/12/escudo-uabc-2022-color-cont.png" alt="Escudo UABC" />
            <p>
                <label for="TxtUser">Usuario:</label>
                <asp:TextBox ID="TxtUser" runat="server" placeholder="Usuario"></asp:TextBox>
            </p>
            <p>
                <label for="TxtPassword">Contraseña:</label>
                <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="BtnLogin" runat="server" Text="Iniciar Sesión" OnClick="BtnLogin_Click" />
            </p>
        </div>
    </form>
    <div class="footer">
        <p>Contacto: correo@uabc.mx | Teléfono: (123) 456-7890</p>
    </div>
</body>
</html>
