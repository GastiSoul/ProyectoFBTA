<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarNoticias.aspx.cs" Inherits="DemoP.RegistrarNoticias" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Registrar Noticia</title>
    <link href="Content/RegistrarNoticias.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <ul>
                <li>
                    <label for="titulo">Título:</label>
                    <asp:TextBox ID="tituloU" runat="server" placeholder="Título"></asp:TextBox>
                </li>
                <li>
                    <label for="autor">Autor:</label>
                    <asp:TextBox ID="autorU" runat="server" placeholder="Autor"></asp:TextBox>
                </li>
                <li>
                    <label for="cuerpo">Cuerpo:</label>
                    <asp:TextBox ID="cuerpoU" runat="server" TextMode="MultiLine" Rows="5" placeholder="Cuerpo de la noticia"></asp:TextBox>
                </li>
                <li>
                    <label for="fecha">Fecha de Publicación:</label>
                    <asp:TextBox ID="fechaU" runat="server" placeholder="Fecha de Publicación"></asp:TextBox>
                </li>
                <li>
                    <label for="categoria">Categoría:</label>
                    <asp:DropDownList ID="categoriaU" runat="server">
                        <asp:ListItem>Deportes</asp:ListItem>
                        <asp:ListItem>Anuncios</asp:ListItem>
                        <asp:ListItem>Cultura</asp:ListItem>
                        <asp:ListItem>Eventos</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Notificarse en:</label><br />
                    <asp:CheckBox ID="emailCheckbox" runat="server" Text="Correo Electrónico" /><br />
                    <asp:CheckBox ID="alumnosappCheckBox" runat="server" Text="App Estudiantes" /><br />
                    <asp:CheckBox ID="maestrosappCheckBox" runat="server" Text="App Docentes" /><br />
                    <asp:CheckBox ID="alumnosCheckbox" runat="server" Text="Portal Alumnos" /><br />
                    <asp:CheckBox ID="academicosCheckbox" runat="server" Text="Portal Academicos" />
                </li>
                <li>
                    <label for="imagen">Imagen (URL):</label>
                    <asp:TextBox ID="imagenU" runat="server" placeholder="URL de la imagen"></asp:TextBox>
                </li>
                <li>
                    <div class="button">
                        <asp:Button ID="buttonU" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                    </div>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
