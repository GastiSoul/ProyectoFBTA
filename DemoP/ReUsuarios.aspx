<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReUsuarios.aspx.cs" Inherits="DemoP.ReUsuarios" %>

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

    <li>
      <label for="nameU">Nombre:</label>x
        <asp:TextBox id="nameU" runat="server"></asp:TextBox>
    </li>

    <li>
      <label for="matriU">Matricula:</label>
        <asp:TextBox id="matriU" runat="server"></asp:TextBox>
    </li>
    
    <li>
      <label for="emailU">Correo Electronico:</label>
        <asp:TextBox id="emailU" runat="server"></asp:TextBox>
    </li>

    <li>
      <label for="contraU">Contraseña:</label>
         <asp:TextBox ID="contraU" runat="server" TextMode="Password"></asp:TextBox> 
    </li>
    <li>
      <label for="permiU">Permisos:</label>
        <asp:CheckBox ID="permiU" runat="server" />
    </li>
  </ul>
       <div class="button">
            <asp:Button ID="button" runat="server" Text="Guardar" OnClick="Guardar_Click" />
       </div>
    </form>

</body>
</html>
