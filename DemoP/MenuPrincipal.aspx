<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="DemoP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link rel="stylesheet" href="Content/Principal.css?v=1.0"/>
</head>

<body>
    <form id="form1" runat="server">
    <div class="barra">
        <h2>Menu <img src="img/menu.png" </h2>
        <ul>
            <li><a href="#">Usuarios</a>
                <ul class="submenu">
                    <li><a href="RegistroUsuario.aspx">Registrar usuario</a></li>
                    <li><a href="#">Gestionar usuarios</a></li>
                </ul>
            </li>

            <li class="noticia"><a href="#">Noticias</a>
                
            </li>

            <li><a href="#">Cierre de sesion</a></li>
        </ul>
    </div>

      <script src="Scripts/Principal.js"></script>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
