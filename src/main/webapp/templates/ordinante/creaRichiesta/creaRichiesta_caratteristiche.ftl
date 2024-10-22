<#include "../../navbar.ftl">

<script type="module" src="/scripts/crea_richiesta.js"></script>
<div class="flex flex-col items-center mt-12">  <!-- Centrato orizzontalmente, ma verso l'alto -->
    <h2 class="text-3xl font-bold text-bluScuro mb-8">Compila le Caratteristiche</h2>

    <form action="/ordinante/invia-richiesta" method="POST" class="max-w-xl w-full">
        <input type="hidden" name="categoria_figlio" value="${categoria_figlio}">
        <input type="hidden" name="action" value="submitRichiesta">
        <input type="hidden" name="numCaratteristiche" value="${caratteristicheList?size}">
        <ul class="space-y-4">
            <#list caratteristicheList as caratteristica>
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                    <h2 class="text-xl font-semibold ">${caratteristica.nome!}</h2>

                    <input type="hidden" name="caratteristica_key_${caratteristica?index}"
                           value="${caratteristica.key}">

                    <!-- Aggiungi un id unico per collegare l'input con la checkbox -->
                    <input id="caratteristica_${caratteristica?index}" type="text"
                           name="caratteristica_${caratteristica?index}"
                           class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci valore">
                    <span class="text-gray-600 ">${caratteristica.getMisura()! "N/A"}</span>

                    <!-- Checkbox per disabilitare l'input -->
                    <label class="flex items-center gap-2">
                        <input type="checkbox" class="checkbox-disabilita"
                               data-target="caratteristica_${caratteristica?index}">
                        <span>Indifferente</span>
                    </label>

                </li>
            </#list>

            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold ">Note</h2>
                <input type="text" name="note" class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                       placeholder="Inserisci nota (OPZIONALE)">
            </li>

        </ul>

        <button type="submit" class="mt-6 bg-verde font-semibold text-white rounded-full py-2 px-4 w-full">Invia
            Richiesta
        </button>
    </form>
</div>
