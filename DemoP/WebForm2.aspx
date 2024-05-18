<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="DemoP.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="Content/RegistroUsuario.css">
</head>

<body>
    <form id="form1" runat="server">
        <ul>
    <li>
      <label for="name">Matricula:</label>
        <asp:TextBox id="name" runat="server"></asp:TextBox>
    </li>
    <li>
      <label for="mail">Contraseña:</label>
         <asp:TextBox ID="contra" runat="server" TextMode="Password"></asp:TextBox> 
    </li>
    <li>
      <label for="msg">Permisos:</label>
        <asp:CheckBox ID="permissions" runat="server" />
    </li>
  </ul>
       <div class="button">
            <asp:Button ID="button" runat="server" Text="Guardar" OnClick="Guardar_Click" />
       </div>
    </form>
    
</body>
</html>
