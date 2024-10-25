<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>


<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-6">
    <p class="text-bluScuro text-sm text-right w-full mb-2">• Per i dettagli selezionare un rigo</p>
    <div class="flex flex-row items-center gap-2 mb-4">
        <svg class="w-8 h-8" viewBox="0 0 43 43" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M33.3104 30.7042L42.4603 39.8541C43.1799 40.5737 43.1799 41.7407 42.4603 42.4603C41.7407 43.1799 40.5737 43.1799 39.8542 42.4603L30.7042 33.3103C23.2377 39.444 12.3338 38.9026 5.50183 32.0709C-1.83394 24.7333 -1.83394 12.8395 5.50183 5.50186C12.8394 -1.83395 24.735 -1.83395 32.0707 5.50186C38.9027 12.3339 39.4438 23.2376 33.3104 30.7042ZM18.7873 10.4842C23.3738 10.4842 27.0904 14.2007 27.0904 18.7873C27.0904 19.8039 27.9161 20.6296 28.9327 20.6296C29.9511 20.6296 30.775 19.8039 30.775 18.7873C30.775 12.1657 25.4073 6.79978 18.7876 6.79978C17.7709 6.79978 16.9453 7.62547 16.9453 8.64213C16.9453 9.66055 17.7707 10.4842 18.7873 10.4842ZM29.4667 8.10788C23.5703 2.21145 14.0066 2.21145 8.10979 8.10788C2.21338 14.0043 2.21338 23.568 8.10979 29.4649C14.008 35.3613 23.5698 35.3613 29.4667 29.4649C35.3631 23.5666 35.3631 14.0048 29.4667 8.10788Z"
                  fill="#323954"/>
        </svg>
        <input type="text" id="searchInput" placeholder="Cerca per Codice, Tecnico, Stato o Data"
               class="search-bar rounded-xl border"/>
    </div>


    <div class="border border-primario rounded-2xl">
        <table class="user-list-table rounded-2xl text-bluScuro" id="userTable">
            <thead>
            <tr class="bg-trTable">
                <th>#</th>
                <th>Codice</th>
                <th>Tecnico incaricato</th>
                <th>Stato Richiesta</th>
                <th>Data Creazione</th>
            </tr>
            </thead>
            <tbody>
            <#list richieste as richiesta>
                <tr class="hover-row"
                    onclick="window.location.href='/ordinante/dettagli-richiesta?keyRichiesta=${richiesta.getKey()}'">
                    <td class="index-column"></td>
                    <td>#${richiesta.codice}</td>
                    <td>
                        <#if richiesta.tecnico??>
                            ${richiesta.tecnico.nome}
                        <#else>
                            Non assegnato
                        </#if>
                    </td>
                    <td class="font-semibold
                        <#if richiesta.stato == 'ASSEGNATO'>bg-TgialloChiaro</#if>
                        <#if richiesta.stato == 'COMPLETATO'>bg-TverdeChiaro</#if>
                        <#if richiesta.stato == 'IN_ATTESA'>bg-TrossoChiaro</#if>
                        <#if richiesta.stato == 'SPEDITO'>bg-TviolaChiaro</#if>">
                        ${richiesta.stato}
                    </td>
                    <td>${richiesta.created_at}</td>
<#--                    <td class="">-->
<#--                        <form method="GET" action="/ordinante/lista-richieste/dettagli-richiesta"-->
<#--                              class="flex justify-center">-->
<#--                            <input type="hidden" name="action" value="modifica">-->
<#--                            <input type="hidden" name="key" value="${richiesta.key}">-->
<#--                            <button type="submit"-->
<#--                                    class="edit-button bg-giallo2 hover:bg-yellow-700 font-medium mx-auto">Dettagli-->
<#--                                Richiesta-->
<#--                            </button>-->
<#--                        </form>-->
<#--                    </td>-->
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
