<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión de Usuarios</title>
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
            <a href="MenuPrincipal.aspx">Inicio</a>
            <a href="AgregarUsuario.aspx">Agregar Usuario</a>
            <a href="EditarUsuario.aspx">Editar Usuario</a>
            <a href="EliminarUsuario.aspx">Eliminar Usuario</a>
            <a href="VerUsuarios.aspx">Ver Usuarios</a>
        </div>
        <div class="content">
            <div class="header-container">
                <img src="https://induccionuabc.wordpress.com/wp-content/uploads/2022/12/escudo-uabc-2022-color-cont.png" alt="Escudo UABC">
                <div>
                    <h1>Bienvenido a la Gestión de Usuarios</h1>
                    <p>Seleccione una opción del menú para comenzar.</p>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Permisos</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Usuario de ejemplo 1</td>
                            <td>usuario1@ejemplo.com</td>
                            <td><input type="checkbox" id="permiso1" name="permiso1"></td>
                            <td>
                                <a href="EditarUsuario.aspx?id=1">Editar</a> |
                                <a href="EliminarUsuario.aspx?id=1">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Usuario de ejemplo 2</td>
                            <td>usuario2@ejemplo.com</td>
                            <td><input type="checkbox" id="permiso2" name="permiso2"></td>
                            <td>
                                <a href="EditarUsuario.aspx?id=2">Editar</a> |
                                <a href="EliminarUsuario.aspx?id=2">Eliminar</a>
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
