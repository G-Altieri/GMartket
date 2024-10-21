<div class="user-edit-container">
    <h1>Modifica Utente</h1>

    <form method="POST" action="/admin/utenti/modifica"> <!-- Modificato l'action -->
        <input type="hidden" name="action" value="update"> <!-- Allineato al controller -->
        <input type="hidden" name="id" value="${utente.key}">


        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" id="nome" name="new-nome" value="${utente.nome}" required>
        </div>

        <div class="form-group">
            <label for="cognome">Cognome</label>
            <input type="text" id="cognome" name="new-cognome" value="${utente.cognome}" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="new-email" value="${utente.email}" required>
        </div>

        <div class="form-group">
            <label for="password">Nuova Password</label>
            <input type="password" id="password" name="new-password" value="" required>
        </div>


        <div class="form-actions">
            <button type="submit" class="save-button">Salva Modifiche</button>
            <a href="/admin/utenti" class="cancel-button">Annulla</a>
        </div>
    </form>
</div>
