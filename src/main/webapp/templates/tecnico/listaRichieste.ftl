<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>

<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <p class="text-bluScuro text-sm text-right w-full mb-2">• Per i dettagli selezionare un rigo</p>
    <div class="flex flex-row items-center gap-2 mb-4">
        <svg class="w-8 h-8" viewBox="0 0 43 43" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M33.3104 30.7042L42.4603 39.8541C43.1799 40.5737 43.1799 41.7407 42.4603 42.4603C41.7407 43.1799 40.5737 43.1799 39.8542 42.4603L30.7042 33.3103C23.2377 39.444 12.3338 38.9026 5.50183 32.0709C-1.83394 24.7333 -1.83394 12.8395 5.50183 5.50186C12.8394 -1.83395 24.735 -1.83395 32.0707 5.50186C38.9027 12.3339 39.4438 23.2376 33.3104 30.7042ZM18.7873 10.4842C23.3738 10.4842 27.0904 14.2007 27.0904 18.7873C27.0904 19.8039 27.9161 20.6296 28.9327 20.6296C29.9511 20.6296 30.775 19.8039 30.775 18.7873C30.775 12.1657 25.4073 6.79978 18.7876 6.79978C17.7709 6.79978 16.9453 7.62547 16.9453 8.64213C16.9453 9.66055 17.7707 10.4842 18.7873 10.4842ZM29.4667 8.10788C23.5703 2.21145 14.0066 2.21145 8.10979 8.10788C2.21338 14.0043 2.21338 23.568 8.10979 29.4649C14.008 35.3613 23.5698 35.3613 29.4667 29.4649C35.3631 23.5666 35.3631 14.0048 29.4667 8.10788Z"
                  fill="#323954"/>
        </svg>
        <input type="text" id="searchInput" placeholder="Cerca per Codice, Nome, Prezzo o Stato"
               class="search-bar rounded-xl border"/>
    </div>
    <div class="border border-primario rounded-2xl">
        <table class="user-list-table rounded-2xl" id="userTable">
            <thead>
            <tr class="bg-trTable">
                <th>#</th>
                <th>Codice</th>
                <th>Nome Ordinante</th>
                <th>Categoria</th>
                <th>Data</th>
                <th>Prendi in Carico</th>
            </tr>
            </thead>
            <tbody>
            <#list richieste as richiesta>
                <#assign isHighlighted = false />
                <#assign idNotifica = -1 />
                <#list notifiche as notifica>
                    <#if notifica.richiesta.key == richiesta.key>
                        <#assign isHighlighted = true />
                        <#assign idNotifica = notifica.key />
                    </#if>
                </#list>

                <tr class="hover-row ${isHighlighted?then('highlighted-row','')}"
                    onclick="rowClickHandler('${idNotifica}', '${richiesta.key}', '/tecnico/dettagli-richiesta?keyRichiesta=${richiesta.getKey()}')">
                    <td class="index-column "></td>
                    <td>#${richiesta.codice}</td>
                    <td>${richiesta.ordinante.nome}</td>
                    <td>${richiesta.categoria.nome}</td>
                    <td>${richiesta.created_at}</td>
                    <td class="">
                        <form method="GET" action="/tecnico/presa-in-carico" class="flex justify-center">
                            <input type="hidden" name="action" value="inCarico">
                            <input type="hidden" name="key" value="${richiesta.key}">
                            <button type="submit"
                                    class="rounded-full font-semibold text-white text-lg px-4 py-2 shadow-buttonBox hover:shadow-buttonBoxHove bg-verde hover:bg-green-700 mx-auto">
                                Prendi in Carico
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
