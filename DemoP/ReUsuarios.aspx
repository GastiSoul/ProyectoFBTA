﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReUsuarios.aspx.cs" Inherits="DemoP.ReUsuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Usuarios</title>
    <link href="Content/RegistroUsuario.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <ul>
                <li>
                    <label for="nameU">Nombre:</label>
                    <asp:TextBox ID="nameU" runat="server" placeholder="Nombre"></asp:TextBox>
                </li>
                <li>
                    <label for="matriU">Matrícula:</label>
                    <asp:TextBox ID="matriU" runat="server" placeholder="Matrícula"></asp:TextBox>
                </li>
                <li>
                    <label for="emailU">Correo:</label>
                    <asp:TextBox ID="emailU" runat="server" placeholder="Correo Electrónico"></asp:TextBox>
                </li>
                <li>
                    <label for="contraU">Contraseña:</label>
                    <asp:TextBox ID="contraU" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
                </li>
                <li>
                    <label for="permiU">Permisos:</label>
                    <div class="checkbox-wrapper">
                        <asp:CheckBox ID="permiU" runat="server" />
                    </div>
                </li>
                <li>
                    <div class="button-container">
                        <div class="button">
                            <asp:Button ID="button" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                        </div>
                        <div class="button">
                            <asp:Button ID="btnVolver" runat="server" Text="Volver al Menú Principal" OnClick="VolverAlMenu_Click" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
    <div class="footer">
        <p>Contacto: correo@uabc.mx | Teléfono: (123) 456-7890</p>
    </div>
</body>
</html>
