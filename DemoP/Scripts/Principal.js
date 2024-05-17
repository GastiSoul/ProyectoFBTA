document.addEventListener('DOMContentLoaded', function () {
    var noticias = document.querySelector('.noticia');
    var submenu = noticias.querySelector('.submenu');

    // Agregamos un evento de clic a la opción "Noticias"
    noticias.addEventListener('click', function () {
        // Si el submenu está oculto, lo mostramos; si está visible, lo ocultamos
        if (submenu.style.display === 'none' || submenu.style.display === '') {
            submenu.style.display = 'block';
        } else {
            submenu.style.display = 'none';
        }
    });

    // Ocultamos el submenu cuando el cursor sale de la barra de navegación
    submenu.addEventListener('mouseleave', function () {
        submenu.style.display = 'none';
    });
});