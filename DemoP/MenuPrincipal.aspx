<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menu Principal</title>
    <link rel="stylesheet" href="Content/Principal.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header"></div>
        <div class="barra">
            <h2>Menu</h2>
            <ul>
                <li>
                    <a href="#">Usuarios</a>
                    <ul class="submenu">
                        <li><a href="RegistroUsuario.aspx">Registrar usuario</a></li>
                        <li><a href="GestionUsuarios.aspx">Gestionar usuarios</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Noticias</a>
                    <ul class="submenu">
                        <li><a href="RegistrarNoticia.aspx">Registrar noticia</a></li>
                        <li><a href="GestionarNoticias.aspx">Gestionar noticias</a></li>
                    </ul>
                </li>
                <li>
                    <a href="MenuPrincipal.aspx">Cierre de sesión</a>
                </li>
            </ul>
        </div>
        <div class="container">
            <div class="slideshow-container">

                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="img/img1.jpg" style="width:100%">
                    <div class="text">Caption Text</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="img/img2.jfif" style="width:100%">
                    <div class="text">Caption Two</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="img/img3.jfif" style="width:100%">
                    <div class="text">Caption Three</div>
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br>

            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
            </div>
        </div>
        <div class="footer">
            <div class="footer-links">
                <a href="https://www.uabc.mx" target="_blank">UABC</a>
                <a href="https://www.uabc.mx/alumnos" target="_blank">Alumnos</a>
                <a href="https://www.uabc.mx/docentes" target="_blank">Docentes</a>
                <a href="https://www.uabc.mx/contacto" target="_blank">Contacto</a>
            </div>
        </div>
        <div class="footer"></div>
    </form>
    <script>
        let slideIndex = 0;
        showSlides();

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n - 1);
        }

        function showSlides() {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 3000); // Cambia imagen cada 3 segundos
        }
    </script>
</body>
</html>
