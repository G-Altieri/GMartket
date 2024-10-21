<div class="">


    <div class="form-container shadow-lg">
        <form method="POST" action="gestioneutente">
            <input type="hidden" name="action" value="createUser">
            <div class="role-selection">x
                <label class="white-label">Ruolo:</label>
                <div class="role-buttons">
                    <input type="radio" id="role-ordinante" name="role" value="ORDINANTE" checked>
                    <label for="role-ordinante" class="lblue-button">Ordinante</label>

                    <input type="radio" id="role-tecnico" name="role" value="TECNICO">
                    <label for="role-tecnico" class="lblue-button">Tecnico</label>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Email" required="">
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" placeholder="Nome" required="">
            </div>
            <div class="form-group">
                <label for="cognome">Cognome:</label>
                <input type="text" id="cognome" name="cognome" placeholder="Cognome" required="">
            </div>

            <div class="form-group">
                <label for="temp-password">Password temporanea:</label>
                <input type="password" id="temp-password" name="temp-password" placeholder="Password temporanea" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Ripeti password:</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Password temporanea" required>
            </div>
            <div class="form-buttons">
                <a href="login">
                    <div class="purple-button shadow-lg">INDIETRO</div>
                </a>
                <button type="submit"  class="orange-button shadow-lg"> SALVA </button>
            </div>
        </form>
    </div>
</div>

