<#include "../navbar.ftl">
<script type="module" src="/scripts/ordinante_gestioneProposta.js"></script>
<div class=" p-6 rounded-xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold mb-4">Dettagli Richiesta</h1>

    <div class="detail-item mb-3">
        <p><strong>Codice Richiesta:</strong> <span class="text-bluScuro">${codice}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Ordinante:</strong> <span class="text-bluScuro">${nomeOrdinante}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Tecnico incaricato:</strong> <span class="text-bluScuro">${nomeTecnico}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Stato della Richiesta:</strong> <span class="text-bluScuro">${statoRichiesta}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Note:</strong> <span class="text-bluScuro">${note}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Data di Creazione:</strong> <span class="text-bluScuro">${dataCreazione}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Categoria:</strong> <span class="text-bluScuro">${categoria.nome}</span></p>
    </div>
    <div class="detail-item mb-3">
        <p><strong>Caratteristiche Richiesta:</strong>
            <#list caratteristicheList as richCar>
            <div class="text-bluScuro">${richCar.caratteristica.nome}: <strong>${richCar.valore}</strong> ${richCar.caratteristica.misura}</div>
        </#list>
        </p>
    </div>

</div>

<div class=" p-6 rounded-xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold mb-4">Proposte di Ordine</h1>
    <table class="user-list-table rounded-2xl" id="userTable">
        <thead>
        <tr class="bg-trTable">
            <th>#</th>
            <th>Codice Proposta</th>
            <th>Nome Produttore</th>
            <th>Prezzo</th>
            <th>Stato Proposta</th>
            <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <#list proposte as proposta>
            <tr>
                <td class="index-column"></td>
                <td>#${proposta.codiceProposta}</td>
                <td>${proposta.nomeProduttore}</td>
                <td>${proposta.prezzo}</td>
                <td>${proposta.statoProposta}</td>
                <td class="">
                    <#if proposta.statoProposta == "IN_SOSPESO">
                        <form method="GET" action="/ordinante/lista-richieste/modProposta" class="flex justify-center">
                            <input type="hidden" name="action" value="modProposta">
                            <input type="hidden" name="valoreMod" value="accetta">
                            <input type="hidden" name="key" value="${proposta.key}">
                            <button type="submit" class="edit-button bg-verde hover:bg-yellow-700 font-medium mx-auto">Accetta Proposta</button>
                        </form>

                        <button onclick="rejectProposta('${proposta.key}')" class="edit-button bg-rosso2 hover:bg-yellow-700 font-medium mx-auto">Rifiuta Proposta</button>
                    <#elseif proposta.statoProposta == "ACCETTATO">
                        <p class="text-green-600 font-medium mx-auto">Proposta Accettata</p>
                    <#elseif proposta.statoProposta == "RIFIUTATO">
                        <p class="text-red-600 font-medium mx-auto">Proposta Rifiutata</p>
                    </#if>
                </td>
            </tr>
        </#list>

        </tbody>
    </table>

</div>