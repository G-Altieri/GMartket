<#include "../../navbar.ftl">

<script type="module" src="/scripts/crea_richiesta.js"></script>

<div class="flex flex-col items-center mt-12">  <!-- Centrato orizzontalmente, ma verso l'alto -->
    <h2 class="text-3xl font-bold text-primary mb-8">Seleziona una Categoria</h2>

    <form id="richiestaForm" class="w-full max-w-lg"> <!-- Max larghezza 500px -->
        <!-- Select della categoria padre -->
        <div class="mb-6">
            <select id="categoriaPadre" name="categoriaPadre"
                    class="block w-full max-w-lg px-4 py-3 border border-gray-300 rounded-md text-lg text-primary">
                <option value="">-- Seleziona una categoria --</option>
                <#-- Lista delle categorie padre -->
                <#list rootCategory as categoria>
                    <option value="${categoria.key}">${categoria.nome}</option>
                </#list>
            </select>
        </div>

        <!-- Container per le categorie figlie -->
        <div id="categorieFiglieContainer" class="space-y-4"></div>

        <!-- Pulsante Avanti (inizialmente nascosto) -->
        <div id="submitButtonContainer" class="mt-8 flex justify-end">
            <a type="button" id="btnAvanti" href="/ordinante/crea-richiesta-caratteristiche"
                    class="hidden bg-green-500 text-white font-semibold py-3 px-6 rounded-md hover:bg-green-600">
                Avanti
            </a>
        </div>
    </form>
</div>
