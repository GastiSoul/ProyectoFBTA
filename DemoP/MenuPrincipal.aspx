<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="DemoP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link rel="stylesheet" href="Principal.css">
</head>

<body>
    <div class="barra">
        <h2>Menu <img src="img/menu.png" </h2>
        <ul>
            <li><a href="#">Usuarios</a></li>
            <h1>UN MENSAJE NUEVO</h1>
            <h1>PONGO OTRO H1</h1>
            <h1>Hola soy el quesa Hola</h1>
            <li class="noticia"><a href="#">Noticias</a>
                <ul class="submenu">
                    <li><a href="#">Consultar noticias</a></li>
                    <li><a href="#">Eliminar noticias</a></li>
                    <li><a href="#">Crear noticias</a></li>
                    <li><a href="#">Modificar noticias</a></li>
                </ul>
            </li>

            <li><a href="#">Cierre de sesion</a></li>
        </ul>
    </div>

      <script src="Principal.js"></script>
</body>
</html>
