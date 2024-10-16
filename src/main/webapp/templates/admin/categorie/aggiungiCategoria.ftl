<h1>Aggiungi una nuova categoria</h1>

<form action="${currentUrl}" method="post">
    <div>
        <label for="nome">Nome Categoria:</label>
        <input type="text" id="nome" name="nome" required>
    </div>
    <div>
        <label for="padre">Padre Categoria (ID, opzionale):</label>
        <input type="number" id="padre" name="padre">
    </div>
    <div>
        <button type="submit">Salva Categoria</button>
    </div>
</form>