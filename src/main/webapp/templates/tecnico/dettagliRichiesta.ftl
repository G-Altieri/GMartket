<#include "../navbar.ftl">
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