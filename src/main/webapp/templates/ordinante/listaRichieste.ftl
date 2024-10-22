<div class="user-list-container">


    <table class="user-list-table">
        <thead>
        <tr>
            <th>Codice</th>
            <th>Nome Ordinante</th>
            <th>Tecnico incaricato</th>
            <th>Stato Richiesta</th>

        </tr>
        </thead>
        <tbody>
        <#list richieste as richiesta>
            <tr>
                <td>${richiesta.codice}</td>
                <td>${richiesta.ordinante.nome}</td>
                <td>
                <#if richiesta.tecnico??>
                    ${richiesta.tecnico.nome}
                <#else>
                    Non assegnato
                </#if>
                </td>
                <td>${richiesta.stato}</td>

                <td>
                    <form method="GET" action="/ordinante/lista-richieste/dettagli-richiesta">
                        <input type="hidden" name="action" value="modifica">
                        <input type="hidden" name="key" value="${richiesta.key}">
                        <button type="submit" class="edit-button">Dettagli Richiesta</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>


</div>
