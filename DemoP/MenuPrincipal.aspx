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
        <h2>Menu <img src="img/menu.png" alt="Menu Icon"/></h2>
        <ul>
            <li class="noticia"><a href="#">Usuarios</a>
                <ul class="submenu">
                    <li><a href="RegistroUsuario.aspx">Registrar usuario</a></li>
                    <li><a href="GestionUsuarios.aspx">Gestionar usuarios</a></li>
                </ul>
            </li>

            <li class="noticia2"><a href="#">Noticias</a>
                <ul class="submenu">
                    <li><a href="RegistrarNoticia.aspx">Registrar noticia</a></li>
                    <li><a href="GestionarNoticias.aspx">Gestionar noticias</a></li>
                </ul>
            </li>

           <li><a href="#">Cierre de sesion</a></li>
        </ul>
    </div>

    <script src="Scripts/Principal.js"></script>
    <p>&nbsp;</p>
    <p style="margin-left: 40px">hola</p>
    </form>
</body>
</html>
