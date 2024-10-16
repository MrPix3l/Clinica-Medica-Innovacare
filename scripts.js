document.getElementById('contactoBtn').addEventListener('click', function() {
    window.scrollTo({
        top: document.body.scrollHeight, // Altura total de la página
        behavior: 'smooth' // Desplazamiento suave
    });
});

document.getElementById('horarioBtn').addEventListener('click', function() {
    window.scrollTo({
        top: document.body.scrollHeight-1000, // Altura total de la página
        behavior: 'smooth' // Desplazamiento suave
    });
});