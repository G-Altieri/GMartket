$(document).ready(function () {
    // Funzione generica per aggiornare gli indici e alternare i colori
    function updateRowIndices(tableId) {
        let index = 1;
        $(`#${tableId} tbody tr:visible`).each(function () {
            $(this).find(".index-column").text(index); // Aggiorna indice incrementale
            $(this).removeClass("bg-light bg-griggioScuro"); // Rimuove i colori esistenti
            $(this).addClass(index % 2 === 0 ? "bg-griggioScuro" : "bg-light"); // Colora righe
            index++;
        });
    }

    // Funzione di ricerca associata a un campo input e una tabella specifici
    function enableSearch(inputId, tableId) {
        $(`#${inputId}`).on("keyup", function () {
            let value = $(this).val().toLowerCase(); // Prende il valore del campo di ricerca
            $(`#${tableId} tbody tr`).filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1); // Mostra/Nasconde righe
            });
            updateRowIndices(tableId); // Aggiorna indici e colori dopo la ricerca
        });
    }

    // Abilita la ricerca per entrambe le tabelle
    enableSearch("searchInput", "userTable");
    enableSearch("searchInput2", "userTable2");

    // Aggiorna indici e colori iniziali per entrambe le tabelle
    updateRowIndices("userTable");
    updateRowIndices("userTable2");
});
