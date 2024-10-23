<#include "../../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>
<div class="mt-6">
    <a href="/admin/utenti/aggiungi"
       class="mt-12 rounded-full bg-verde font-semibold text-white text-xl px-4 py-2 shadow-buttonBox hover:shadow-buttonBoxHover">Aggiungi
        Nuovo Utente</a>
</div>
<div class="user-list-container mt-6">
    <input type="text" id="searchInput" placeholder="Cerca per Nome, Cognome, Email o Ruolo" class="search-bar rounded-xl"/>
    <div class="border border-primario rounded-2xl">
    <table class="user-list-table rounded-2xl" id="userTable">
        <thead>
        <tr class="bg-trTable ">
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
                    <form method="GET" action="/admin/utenti/modifica" class="flex justify-center">
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
</div>
