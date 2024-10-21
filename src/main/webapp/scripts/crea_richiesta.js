$(document).ready(function() {
    // Funzione per caricare le categorie figlie
    function caricaCategorieFiglie(categoriaId, container) {
        // Effettua la richiesta AJAX per ottenere le categorie figlie
        $.ajax({
            url: "/ordinante/crea-richiesta",  // Modifica l'URL secondo la tua logica
            method: "GET",
            data: { categoriaId: categoriaId },  // Usa categoriaId come parametro
            dataType: 'json',
            success: function(data) {
                // Rimuovi tutte le select figlie che sono state create dopo questa
                $(container).nextAll('.categoriaFiglia').remove();

                // Verifica se ci sono categorie figlie
                if (data.length > 0) {
                    // Crea una nuova select per le categorie figlie
                    var newSelect = $('<select>', {
                        class: 'categoriaFiglia block w-full max-w-lg px-4 py-3 border border-gray-300 rounded-md text-lg text-primary mb-4'
                    });

                    newSelect.append('<option value="">-- Seleziona una categoria --</option>');

                    // Aggiungi le opzioni alla nuova select
                    $.each(data, function(index, categoria) {
                        newSelect.append('<option value="' + categoria.key + '">' + categoria.nome + '</option>');
                    });

                    // Aggiungi la nuova select al container delle categorie figlie
                    $('#categorieFiglieContainer').append(newSelect);
                }

                // Mostra il pulsante "Avanti" solo se non ci sono più categorie figlie
                if (data.length === 0) {
                    $('#submitButton').removeClass('hidden');
                } else {
                    $('#submitButton').addClass('hidden');
                }
            },
            error: function(xhr, status, error) {
                console.error("Errore nella richiesta AJAX:", error);
            }
        });
    }

    // Quando cambia la select della categoria padre
    $('#categoriaPadre').on('change', function() {
        var selectedCategoriaId = $(this).val();

        $('#categorieFiglieContainer').empty();
        $('#submitButton').addClass('hidden');

        if (selectedCategoriaId) {
            caricaCategorieFiglie(selectedCategoriaId, this);
        } else {
            // Se non è selezionata alcuna categoria, rimuovi tutte le select figlie
            $('#categorieFiglieContainer').empty();
            $('#submitButton').addClass('hidden');  // Nascondi il pulsante Avanti
        }
    });

    // Quando cambia una select di una categoria figlia
    $('#categorieFiglieContainer').on('change', '.categoriaFiglia', function() {
        var selectedCategoriaId = $(this).val();
        caricaCategorieFiglie(selectedCategoriaId, this);
    });
});