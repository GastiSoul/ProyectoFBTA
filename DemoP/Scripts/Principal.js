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
    noticias.addEventListener('mouseout', function (event) {
        // Verificamos si el cursor ha salido del área del menú principal
        if (!noticias.contains(event.relatedTarget)) {
            submenu.style.display = 'none';
        }
    });

    submenu.addEventListener('mouseout', function (event) {
        // Verificamos si el cursor ha salido del área del submenu
        if (!submenu.contains(event.relatedTarget)) {
            submenu.style.display = 'none';
        }
    });
});