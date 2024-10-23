<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>
<div class="mt-6">
    <a href="/admin/richieste/aggiungi"
       class="mt-12 rounded-full bg-verde font-semibold text-white text-xl px-4 py-2 shadow-buttonBox hover:shadow-buttonBoxHover">Aggiungi Nuova Richiesta</a>
</div>

<div class="user-list-container mt-6">
    <input type="text" id="searchInput" placeholder="Cerca per Codice, Nome Ordinante, Tecnico o Stato" class="search-bar rounded-xl"/>
    <div class="border border-primario rounded-2xl">
    <table class="user-list-table rounded-2xl" id="userTable">
        <thead>
        <tr class="bg-trTable">
            <th>#</th>
            <th>Codice</th>
            <th>Nome Ordinante</th>
            <th>Tecnico incaricato</th>
            <th>Stato Richiesta</th>
            <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <#list richieste as richiesta>
            <tr>
                <td class="index-column"></td>
                <td>#${richiesta.codice}</td>
                <td>${richiesta.ordinante.nome}</td>
                <td>
                    <#if richiesta.tecnico??>
                        ${richiesta.tecnico.nome}
                    <#else>
                        Non assegnato
                    </#if>
                </td>
                <td>${richiesta.stato}</td>
                <td class="">
                    <form method="GET" action="/ordinante/lista-richieste/dettagli-richiesta" class="flex justify-center">
                        <input type="hidden" name="action" value="modifica">
                        <input type="hidden" name="key" value="${richiesta.key}">
                        <button type="submit" class="edit-button bg-giallo2 hover:bg-yellow-700 font-medium mx-auto">Dettagli Richiesta</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    </div>
</div>
