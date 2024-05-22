<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link href="Estilos.css" rel="stylesheet">
</head>
<body>
    <form id="form1">
        <div class="center">
            <img src="https://induccionuabc.wordpress.com/wp-content/uploads/2022/12/escudo-uabc-2022-color-cont.png" alt="Escudo UABC">
            <p>
                <label for="TxtUser">Usuario:</label>
                <input type="text" id="TxtUser" name="TxtUser" placeholder="Usuario" />
            </p>
            <p>
                <label for="TxtPassword">Contraseña:</label>
                <input type="password" id="TxtPassword" name="TxtPassword" placeholder="Contraseña" />
            </p>
            <p>
                <button id="BtnLogin">Iniciar Sesión</button>
            </p>
        </div>
    </form>
    <div class="footer">
        <p>Contacto: correo@uabc.mx | Teléfono: (123) 456-7890</p>
    </div>

    <script>
        document.getElementById("BtnLogin").addEventListener("click", function (event) {
            event.preventDefault(); // Evitar que el formulario se envíe

            // Simular inicio de sesión exitoso
            // Aquí podrías realizar la validación de usuario y contraseña
            // y cualquier lógica adicional relacionada con el inicio de sesión

            // Una vez que el inicio de sesión sea exitoso, redirigir al usuario a la página principal
            window.location.href = "MenuPrincipal.aspx";
        });
    </script>

</body>
</html>
