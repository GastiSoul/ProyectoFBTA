<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestUsuario.aspx.cs" Inherits="DemoP.GestUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            width: 100px;
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
            <a href="MenuPrincipal.aspx">Volver al Inicio</a>
            <a href="ReUsuarios.aspx">Registrar Usuario</a>
            <a href="GestionarNoticias.aspx">Ir a Gestión de Noticias</a>
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <%# Eval("Nombre") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Matrícula">
                            <ItemTemplate>
                                <%# Eval("Matricula") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMatricula" runat="server" Text='<%# Bind("Matricula") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Correo">
                            <ItemTemplate>
                                <%# Eval("Correo") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCorreo" runat="server" Text='<%# Bind("Correo") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contraseña">
                            <ItemTemplate>
                                <%# GetPasswordDisplay(Eval("Contraseña").ToString()) %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContraseña" runat="server" Text='<%# Bind("Contraseña") %>' TextMode="Password" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Permisos">
                            <ItemTemplate>
                                <%# Eval("Permisos") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPermisos" runat="server" Text='<%# Bind("Permisos") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" />
                        <asp:ButtonField CommandName="Delete" Text="Eliminar" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
