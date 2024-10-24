<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>

<div class="border border-primario rounded-2xl">
    <table class="user-list-table rounded-2xl text-bluScuro" id="userTable">
        <thead>
        <tr class="bg-trTable">
            <th>#</th>
            <th>Codice Proposta</th>
            <th>Nome Produttore</th>
            <th>Nome Prodotto</th>
            <th>Prezzo</th>
            <th>Stato Ordine</th>
            <th>Azione</th>
        </tr>
        </thead>
        <tbody>
        <#list listProposte as proposta>
            <tr>
                <td class="index-column"></td>
                <td>#${proposta.codiceProposta}</td>
                <td>${proposta.nomeProduttore}</td>
                <td>${proposta.nomeProdotto}</td>
                <td>${proposta.prezzo}</td>


                <td class="font-semibold" >
                        <#if proposta.statoOrdine == "RESPINTO_NONCONFORME">bg-TrossoChiaro</#if>
                        <#if proposta.statoOrdine == "ACCETTATO">bg-TverdeChiaro</#if>
                        <#if proposta.statoOrdine == "RESPINTO_NONFUNZIONANTE">bg-TrossoChiaro</#if>
                    ${proposta.statoOrdine}
                </td>
                <td> Dettagli pulsante</td>

            </tr>
        </#list>

        </tbody>
    </table>
</div>

