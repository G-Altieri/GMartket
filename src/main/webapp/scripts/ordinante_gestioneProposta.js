document.addEventListener("DOMContentLoaded", () => {
    // Funzione per rifiutare la proposta con una motivazione
    function rejectProposta(key) {
        Swal.fire({
            title: 'Stai rifiutando la proposta del tecnico',
            html: `
                <label for="motivazioneRifiuto" class="block text-left font-semibold text-lg">Inserisci la motivazione:</label>
                <textarea id="motivazioneRifiuto" class="swal2-textarea" placeholder="Scrivi la tua motivazione qui..." required></textarea>
            `,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Invia',
            cancelButtonText: 'Annulla',
            preConfirm: () => {
                const motivazione = Swal.getPopup().querySelector('#motivazioneRifiuto').value;
                if (!motivazione) {
                    Swal.showValidationMessage('Per favore, inserisci una motivazione.');
                    return false;
                }
                return motivazione;
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // Dati da inviare
                const motivazione = result.value;

                // Crea e invia il form con la motivazione e gli altri dati nascosti
                const form = document.createElement('form');
                form.method = 'GET';
                form.action = '/ordinante/lista-richieste/modProposta';
                form.innerHTML = `
                    <input type="hidden" name="action" value="modProposta">
                    <input type="hidden" name="valoreMod" value="rifiuta">
                    <input type="hidden" name="key" value="${key}">
                    <input type="hidden" name="motivazione" value="${motivazione}">
                `;
                document.body.appendChild(form);
                form.submit();
            }
        });
    }

    // Esporta la funzione globalmente
    window.rejectProposta = rejectProposta;
});
