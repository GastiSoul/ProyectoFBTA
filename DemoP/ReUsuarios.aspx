<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReUsuarios.aspx.cs" Inherits="DemoP.ReUsuarios" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Usuarios</title>
    <link href="Content/RegistroUsuario.css" rel="stylesheet" />
    <script type="text/javascript">
        function togglePassword() {
            var passwordField = document.getElementById('<%= contraU.ClientID %>');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        }

        window.onload = function() {
            var passwordField = document.getElementById('<%= contraU.ClientID %>');
            passwordField.type = 'password';
        };
    </script>
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
                    <asp:TextBox ID="contraU" runat="server" TextMode="Password" ClientIDMode="Static" placeholder="Contraseña"></asp:TextBox>
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClientClick="togglePassword(); return false;" />
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
