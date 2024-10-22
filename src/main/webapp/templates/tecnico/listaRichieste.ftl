<div class="user-list-container">


    <table class="user-list-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Codice</th>
            <th>Ordinante</th>
            <th>Tecnico incaricato</th>
            <th>Stato Richiesta</th>

        </tr>
        </thead>
        <tbody>
        <#list richieste as richiesta>
            <tr>
                <td>${richiesta.codice}</td>
                <td>${richiesta.id_ordinante}</td>
                <td>${richiesta.id_tecnico}</td>
                <td>${utente.stato}</td>


            </tr>
        </#list>
        </tbody>
    </table>


</div>
