// notifiche.js
function markAsRead(idNotifica, redirect) {
    $.ajax({
        url: '/notifiche/read-notifica',  // Endpoint per gestire la richiesta
        method: 'POST',
        data: { key: idNotifica },
        success: function (response) {
           // window.location.href = redirect;  // Reindirizza alla pagina dei dettagli della notifica
            location.reload();
        },
        error: function (error) {
            console.error('Errore durante l\'aggiornamento della notifica', error);
        }
    });
}