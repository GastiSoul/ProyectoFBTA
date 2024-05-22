document.addEventListener('DOMContentLoaded', function () {
    // Seleccionamos el elemento "Noticias" y su submenu
    var noticias = document.querySelector('.noticia2');
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

    // Ocultamos el submenu cuando el cursor sale de la barra de navegación o el submenu
    noticias.addEventListener('mouseleave', function (event) {
        // Verificamos si el cursor ha salido del área del menú principal o del submenu
        if (!noticias.contains(event.relatedTarget) && !submenu.contains(event.relatedTarget)) {
            submenu.style.display = 'none';
        }
    });

    submenu.addEventListener('mouseleave', function (event) {
        // Verificamos si el cursor ha salido del área del submenu
        if (!submenu.contains(event.relatedTarget)) {
            submenu.style.display = 'none';
        }
    });
});
