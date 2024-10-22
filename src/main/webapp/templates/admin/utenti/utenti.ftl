<#include "../../navbar.ftl">
<div class="mt-6">
    <a href="/admin/utenti/aggiungi"
       class="mt-12 rounded-full bg-verde font-semibold text-white text-xl px-4 py-2 shadow-buttonBox hover:shadow-buttonBoxHover">Aggiungi
        Nuovo Utente</a>
</div>
<div class="user-list-container mt-6">
    <input type="text" id="searchInput" placeholder="Cerca per Nome, Cognome, Email o Ruolo" class="search-bar rounded-xl"/>
    <table class="user-list-table rounded-2xl" id="userTable">
        <thead>
        <tr class="bg-light ">
            <th>ID</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Ruolo</th>
            <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <#list utenti as utente>
            <tr>
                <td class="index-column"></td> <!-- Lasciamo vuoto, sarà popolato dal JS -->
                <td>${utente.nome}</td>
                <td>${utente.cognome}</td>
                <td>${utente.email}</td>
                <td>${utente.ruolo}</td>
                <td>
                    <form method="GET" action="/admin/utenti/modifica">
                        <input type="hidden" name="action" value="modifica">
                        <input type="hidden" name="id" value="${utente.id}">
                        <button type="submit" class="edit-button bg-giallo2 hover:bg-yellow-700 font-medium">Modifica</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

</div>

<style>
    .search-bar {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        font-size: 16px;
        border: 1px solid #ccc;
    }

    .user-list-table {
        width: 100%;
        border-collapse: collapse;
    }

    .user-list-table th, .user-list-table td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
    }

    .edit-button {
        color: white;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }




    /* Colori alternati per le righe */
    .bg-light {
        background-color: #f8f9fa;
    }

    .bg-secondary {
        background-color: #e9ecef;
    }

    .bg-light-gray {
        background-color: #f2f2f2;
    }
</style>

<script>
    $(document).ready(function () {
        // Funzione per aggiornare l'ID incrementale e colorare righe alternate
        function updateRowIndices() {
            var index = 1;
            $("#userTable tbody tr:visible").each(function () {
                $(this).find(".index-column").text(index);  // Aggiorniamo l'ID incrementale

                // Rimuoviamo le classi di colore esistenti
                $(this).removeClass("bg-light-gray bg-dark-gray");

                // Applichiamo colori alternati
                if (index % 2 === 0) {
                    $(this).addClass("bg-griggioScuro");  // Grigio scuro
                } else {
                    $(this).addClass("bg-griggioChiaro"); // Grigio chiaro
                }

                index++;
            });
        }

        // Funzione per la ricerca
        $("#searchInput").on("keyup", function () {
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
</script>
