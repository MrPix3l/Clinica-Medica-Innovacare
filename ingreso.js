//document.querySelector('#citas a').addEventListener('click', function() {
    //alert('¡Redirigiendo a la página para agendar una cita!');
//});


// Obtener el modal
var modal = document.getElementById("agendarCitaModal");

// Obtener el enlace que abre el modal
var agendarCitaLink = document.getElementById("agendarCitaLink");

// Obtener el elemento <span> que cierra el modal
var span = document.getElementsByClassName("close")[0];

// Cuando el usuario hace clic en el enlace, abrir el modal
agendarCitaLink.onclick = function(event) {
    event.preventDefault(); // Prevenir el comportamiento por defecto del enlace
    modal.style.display = "block"; // Mostrar el modal
}

// Cuando el usuario hace clic en <span> (x), cerrar el modal
span.onclick = function() {
    modal.style.display = "none";
}

// Cuando el usuario hace clic en cualquier parte fuera del modal, cerrarlo
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

