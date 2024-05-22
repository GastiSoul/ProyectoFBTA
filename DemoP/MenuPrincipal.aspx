<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="DemoP.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menu Principal</title>
    <link rel="stylesheet" href="Content/Principal.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header"></div>
        <div class="barra">
            <h2>Menu </h2>
            <ul>
                <li class="noticia">
                    <a href="#">Usuarios</a>
                    <ul class="submenu">
                        <li><a href="RegistroUsuario.aspx">Registrar usuario</a></li>
                        <li><a href="GestionUsuarios.aspx">Gestionar usuarios</a></li>
                    </ul>
                </li>
                <li class="noticia2">
                    <a href="#">Noticias</a>
                    <ul class="submenu">
                        <li><a href="RegistrarNoticia.aspx">Registrar noticia</a></li>
                        <li><a href="GestionarNoticias.aspx">Gestionar noticias</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Cierre de sesión</a>
                </li>
            </ul>
        </div>
        <div class="container">
            <img src="img/banner.jpg" alt="Banner Image"/>
        </div>
        <div class="footer">
            <div class="footer-links">
                <a href="https://www.uabc.mx" target="_blank">UABC</a>
                <a href="https://www.uabc.mx/alumnos" target="_blank">Alumnos</a>
                <a href="https://www.uabc.mx/docentes" target="_blank">Docentes</a>
                <a href="https://www.uabc.mx/contacto" target="_blank">Contacto</a>
            </div>
        </div>
        <div class="footer"></div>
    </form>
</body>
</html>