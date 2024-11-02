$(document).ready(function () {
    // Array di percorsi in cui la freccia non deve essere visibile
    var hiddenPaths = ['/ordinante', '/tecnico', '/admin'];

    // Ottieni il percorso attuale della pagina
    var currentPath = window.location.pathname;

    // Se il percorso attuale è in uno dei percorsi specificati, nascondi la freccia
    if (hiddenPaths.includes(currentPath)) {
        $("#backArrow").hide(); // Nasconde il SVG della freccia
    }
});