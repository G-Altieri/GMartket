<div class="user-list-container">


    <table class="user-list-table">
        <thead>
        <tr>
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
                <td>${utente.id}</td>
                <td>${utente.nome}</td>
                <td>${utente.cognome}</td>
                <td>${utente.email}</td>
                <td>${utente.ruolo}</td>
                <td>
                    <form method="GET" action="/admin/utenti/modifica">
                        <input type="hidden" name="action" value="modifica">
                        <input type="hidden" name="id" value="${utente.id}">
                        <button type="submit" class="edit-button">Modifica</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <a href="/admin/utenti/aggiungi" class="add-user-button-container">
       Aggiungi Nuovo Utente
    </a>
</div>
