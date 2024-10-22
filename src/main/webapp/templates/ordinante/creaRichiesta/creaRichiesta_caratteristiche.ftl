<#include "../../navbar.ftl">

<script type="module" src="/scripts/crea_richiesta.js"></script>
<div class="flex flex-col items-center mt-12">  <!-- Centrato orizzontalmente, ma verso l'alto -->
    <h2 class="text-3xl font-bold text-bluScuro mb-8">Compila le Caratteristiche</h2>

    <form action="/invia_richiesta" method="POST" class="max-w-lg w-full">
<#--        <input type="hidden" name="categoria_figlio" value="${categoria_figlio}">-->

        <ul class="space-y-4">
            <#list caratteristicheList as caratteristica>
<#--                <li class="flex items-center justify-between bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">-->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                    <h2 class="text-xl font-semibold ">${caratteristica.nome!}</h2>
                    <input type="text" name="caratteristica_${caratteristica.id}" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci valore">
                    <span class="text-gray-600 ">${caratteristica.getMisura()! "N/A"}</span>
                </li>
            </#list>
        </ul>

        <button type="submit" class="mt-6 bg-verde font-semibold text-white rounded-full py-2 px-4 w-full">Invia Richiesta</button>
    </form>
</div>
