$(document).ready(function () {
    // Funzione per aggiornare l'ID incrementale e colorare righe alternate
    function updateRowIndices() {
        var index = 1;
        $("#userTable tbody tr:visible, #userTable2 tbody tr:visible").each(function () {
            $(this).find(".index-column").text(index);  // Aggiorniamo l'ID incrementale

            // Rimuoviamo le classi di colore esistenti
            $(this).removeClass("bg-light bg-griggioScuro");

            // Applichiamo colori alternati
            if (index % 2 === 0) {
                $(this).addClass("bg-griggioScuro");  // Colore per le righe pari
            } else {
                $(this).addClass("bg-light"); // Colore per le righe dispari
            }

            index++;
        });
    }

    // Funzione per la ricerca
    $("#searchInput, #searchInput2").on("keyup", function () {
        var value = $(this).val().toLowerCase(); // Prendiamo il valore di input in lowercase
        $("#userTable tbody tr").filter(function () {
            // Mostriamo o nascondiamo le righe in base al testo cercato
            $(this).toggle(
                $(this).text().toLowerCase().indexOf(value) > -1
            );
        });
        updateRowIndices(); // Aggiorniamo gli ID e i colori dopo la ricerca
    });

    // Aggiorniamo gli ID e i colori all'inizio
    updateRowIndices();
});
