<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="DemoP.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="Content/RegistroUsuario.css">
</head>

<body>
        <form id="form1" runat="server">
            <p style="margin-left: 40px">GESTIÓN DE USUARIOS</p>
            <p style="margin-left: 40px">Nombre<asp:TextBox ID="name" runat="server" style="margin-left: 12px" Width="122px"></asp:TextBox>
            </p>
            <p style="margin-left: 40px">Contraseña<asp:TextBox ID="contra" runat="server" style="margin-left: 13px"></asp:TextBox>
            </p>
            <p style="margin-left: 40px">
                <asp:CheckBox ID="permissions" runat="server" Text="Permisos" />
            </p>
            <asp:Button ID="Guardar" runat="server" style="margin-left: 44px" Text="Guardar" Width="120px" />
        </form>
</body>
</html>
