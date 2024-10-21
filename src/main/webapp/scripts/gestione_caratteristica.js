//import {sweetAlert} from './sweetAlert.js';

document.addEventListener("DOMContentLoaded", () => {

    //Modal Conferma Delete Caratteristica
    function confirmDeleteCaratteristica(caratteristicaId) {
         Swal.fire({
            title: 'Sei sicuro?',
            text: "Questa azione non può essere annullata!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sì, elimina!',
            cancelButtonText: 'Annulla'
        }).then((result) => {
            if (result.isConfirmed) {
                // Se l'utente conferma, invia il form
                document.getElementById('delete-form-' + caratteristicaId).submit();
            }
        })
    }

    // Esporta la funzione globalmente
    window.confirmDeleteCaratteristica = confirmDeleteCaratteristica;

    //Modal Inserimento Caratteristica
    document.getElementById('addCaratteristicaBtn').addEventListener('click', function () {
        const categoria = this.dataset.categoria;
        Swal.fire({
            title: 'Aggiungi Caratteristica',
            html: `
            <form id="caratteristicaForm">
                <label for="caratteristicaNome" class="block text-left font-semibold text-lg">Nome:</label>
                <input type="text" id="caratteristicaNome" name="nome" class="swal2-input" placeholder="Inserisci il nome" required>

                <label for="caratteristicaMisura" class="block text-left font-semibold text-lg mt-4">Unita di Misura:</label>
                <input type="text" id="caratteristicaMisura" name="misura" class="swal2-input" placeholder="Inserisci l'unità di misura" required>
            </form>
        `,
            showCancelButton: true,
            confirmButtonText: 'Invia',
            cancelButtonText: 'Annulla',
            preConfirm: () => {
                const nome = Swal.getPopup().querySelector('#caratteristicaNome').value;
                const misura = Swal.getPopup().querySelector('#caratteristicaMisura').value;

                if (!nome || !misura) {
                    Swal.showValidationMessage(`Per favore, compila tutti i campi.`);
                    return false;
                }

                // Crea un oggetto con i dati del form
                return { nome: nome, misura: misura, categoria: categoria};
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // Dati da inviare
                const formData = result.value;

                // Qui puoi fare una chiamata API o un form submit classico
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/caratteristica';  // Imposta l'azione appropriata
                form.innerHTML = `
                <input type="hidden" name="nome" value="${formData.nome}">
                <input type="hidden" name="misura" value="${formData.misura}">
                <input type="hidden" name="categoria" value="${formData.categoria}">
                <input type="hidden" name="referrer" value="${window.location.href}">
                <input type="hidden" name="action" value="aggiungi">
            `;
                document.body.appendChild(form);
                form.submit();
            }
        });
    });

    //Modal Inserimento Caratteristica
    document.getElementById('addCaratteristicaBtn').addEventListener('click', function () {
        const categoria = this.dataset.categoria;
        Swal.fire({
            title: 'Aggiungi Caratteristica',
            html: `
            <form id="caratteristicaForm">
                <label for="caratteristicaNome" class="block text-left font-semibold text-lg">Nome:</label>
                <input type="text" id="caratteristicaNome" name="nome" class="swal2-input" placeholder="Inserisci il nome" required>

                <label for="caratteristicaMisura" class="block text-left font-semibold text-lg mt-4">Unita di Misura:</label>
                <input type="text" id="caratteristicaMisura" name="misura" class="swal2-input" placeholder="Inserisci l'unità di misura" required>
            </form>
        `,
            showCancelButton: true,
            confirmButtonText: 'Invia',
            cancelButtonText: 'Annulla',
            preConfirm: () => {
                const nome = Swal.getPopup().querySelector('#caratteristicaNome').value;
                const misura = Swal.getPopup().querySelector('#caratteristicaMisura').value;

                if (!nome || !misura) {
                    Swal.showValidationMessage(`Per favore, compila tutti i campi.`);
                    return false;
                }

                // Crea un oggetto con i dati del form
                return { nome: nome, misura: misura, categoria: categoria};
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // Dati da inviare
                const formData = result.value;

                // Qui puoi fare una chiamata API o un form submit classico
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/caratteristica';  // Imposta l'azione appropriata
                form.innerHTML = `
                <input type="hidden" name="nome" value="${formData.nome}">
                <input type="hidden" name="misura" value="${formData.misura}">
                <input type="hidden" name="categoria" value="${formData.categoria}">
                <input type="hidden" name="referrer" value="${window.location.href}">
                <input type="hidden" name="action" value="aggiungi">
            `;
                document.body.appendChild(form);
                form.submit();
            }
        });
    });

    // Modal Modifica Caratteristica
    function openEditModal(id, nome, misura, categoria) {
        Swal.fire({
            title: 'Modifica Caratteristica',
            html: `
        <form id="caratteristicaForm">
            <label for="caratteristicaNome" class="block text-left font-semibold text-lg">Nome:</label>
            <input type="text" id="caratteristicaNome" name="nome" class="swal2-input" placeholder="Inserisci il nome" value="${nome}" required>

            <label for="caratteristicaMisura" class="block text-left font-semibold text-lg mt-4">Unita di Misura:</label>
            <input type="text" id="caratteristicaMisura" name="misura" class="swal2-input" placeholder="Inserisci l'unità di misura" value="${misura}" required>
        </form>
    `,
            showCancelButton: true,
            confirmButtonText: 'Salva',
            cancelButtonText: 'Annulla',
            preConfirm: () => {
                const nome = Swal.getPopup().querySelector('#caratteristicaNome').value;
                const misura = Swal.getPopup().querySelector('#caratteristicaMisura').value;

                if (!nome || !misura) {
                    Swal.showValidationMessage(`Per favore, compila tutti i campi.`);
                    return false;
                }

                return { id: id, nome: nome, misura: misura, categoria: categoria };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const formData = result.value;

                // Crea un form per inviare i dati
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/caratteristica';  // Imposta l'azione appropriata
                form.innerHTML = `
                <input type="hidden" name="id" value="${formData.id}">
                <input type="hidden" name="nome" value="${formData.nome}">
                <input type="hidden" name="misura" value="${formData.misura}">
                <input type="hidden" name="categoria" value="${formData.categoria}">
                <input type="hidden" name="referrer" value="${window.location.href}">
                <input type="hidden" name="action" value="modifica">
            `;
                document.body.appendChild(form);
                form.submit();
            }
        });
    }
    // Esporta la funzione globalmente
    window.openEditModal = openEditModal;
});

