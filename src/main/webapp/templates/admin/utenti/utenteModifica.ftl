<div class="user-edit-container mt-6">
    <h1 class="text-2xl font-bold mb-6">Modifica Utente</h1>

    <form method="POST" action="/admin/utenti/modifica">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${utente.key}">

        <div class="form-group mb-4">
            <label for="nome" class="block font-semibold mb-2">Nome</label>
            <input type="text" id="nome" name="new-nome" value="${utente.nome}" required class="form-input w-full rounded-lg p-2 border border-gray-300">
        </div>

        <div class="form-group mb-4">
            <label for="cognome" class="block font-semibold mb-2">Cognome</label>
            <input type="text" id="cognome" name="new-cognome" value="${utente.cognome}" required class="form-input w-full rounded-lg p-2 border border-gray-300">
        </div>

        <div class="form-group mb-4">
            <label for="email" class="block font-semibold mb-2">Email</label>
            <input type="email" id="email" name="new-email" value="${utente.email}" required class="form-input w-full rounded-lg p-2 border border-gray-300">
        </div>

        <div class="form-group mb-4">
            <label for="password" class="block font-semibold mb-2">Nuova Password</label>
            <input type="password" id="password" name="new-password" value="" required class="form-input w-full rounded-lg p-2 border border-gray-300">
        </div>

        <div class="form-actions mt-6">
            <button type="submit" class="save-button bg-verde text-white font-semibold px-4 py-2 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover">Salva Modifiche</button>
            <a href="/admin/utenti" class="cancel-button text-xl font-semibold text-gray-600 px-4 py-2 ml-4 hover:text-red-500">Annulla</a>
        </div>
    </form>
</div>

<style>
    .form-input {
        font-size: 16px;
    }

    .form-group label {
        color: #333;
    }

    .save-button {
        cursor: pointer;
    }

    .cancel-button {
        cursor: pointer;
    }
</style>
