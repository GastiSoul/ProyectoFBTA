<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión de Noticias</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #00723f;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #b08208;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
        .header-container {
            display: flex;
            align-items: center;
        }
        .header-container img {
            width: 100px; /* Ajusta el tamaño según sea necesario */
            height: auto;
            margin-right: 20px;
        }
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <a href="Inicio.aspx">Inicio</a>
            <a href="AgregarNoticia.aspx">Agregar Noticia</a>
            <a href="EditarNoticia.aspx">Editar Noticia</a>
            <a href="EliminarNoticia.aspx">Eliminar Noticia</a>
            <a href="VerNoticias.aspx">Ver Noticias</a>
        </div>
        <div class="content">
            <div class="header-container">
                <img src="https://induccionuabc.wordpress.com/wp-content/uploads/2022/12/escudo-uabc-2022-color-cont.png" alt="Escudo UABC">
                <div>
                    <h1>Bienvenido a la Gestión de Noticias</h1>
                    <p>Seleccione una opción del menú para comenzar.</p>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Fecha</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Noticia de ejemplo 1</td>
                            <td>2024-05-22</td>
                            <td>
                                <a href="EditarNoticia.aspx?id=1">Editar</a> |
                                <a href="EliminarNoticia.aspx?id=1">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Noticia de ejemplo 2</td>
                            <td>2024-05-21</td>
                            <td>
                                <a href="EditarNoticia.aspx?id=2">Editar</a> |
                                <a href="EliminarNoticia.aspx?id=2">Eliminar</a>
                            </td>
                        </tr>
                        <!-- Más filas según sea necesario -->
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
