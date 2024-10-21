<#include "../../navbar.ftl">

<script type="module" src="/scripts/gestione_caratteristica.js"></script>

<form action="${currentUrl}" method="post" class="mt-6 grid grid-cols-6 gap-4">
    <div class="mt-6 col-span-3">
        <label for="nome" class="block text-lg text-bluScuro font-medium text-gray-700">Nome:</label>
        <input type="text" id="nome" name="nome" required value="${categoria.nome}"
               class=" block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
    </div>

    <div class="mt-6 col-span-3">
        <label for="padre" class="block text-lg text-bluScuro font-medium text-gray-700">Seleziona Padre:</label>
        <select id="padre" name="padre"
                class="block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
            <option value="">Nessun Padre...</option>
            <#if (categorie?size > 0)>
                <#list categorie as categoriaPadre>
                    <option value="${categoriaPadre.key}"
                            <#if categoria.padre?? && categoria.padre == categoriaPadre.key>selected</#if>>
                        ${categoriaPadre.nome}
                    </option>
                </#list>
            <#else>
                <div>Nessuna categoria disponibile</div>
            </#if>
        </select>
    </div>
    <div class="col-span-4"></div>
    <div class="col-span-1 mt-6">
        <button type="submit" name="action" value="elimina"
                class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-rosso2 px-4 py-3 transition-all duration-300 hover:bg-red-700 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
            <svg width="23" height="26" viewBox="0 0 23 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.53492 25.9629C4.52698 25.9629 2.84762 24.331 2.7746 22.291C2.37302 18.582 1.71587 9.86591 1.67937 9.75464C1.67937 9.49501 1.75238 9.23538 1.93492 9.01284C2.11746 8.82739 2.33651 8.71612 2.59206 8.71612H20.3349C20.5905 8.71612 20.846 8.82739 20.9921 9.01284C21.1746 9.19829 21.2476 9.45792 21.2111 9.75464C21.2111 9.82882 20.5175 18.582 20.1524 22.291C20.0794 24.368 18.3635 26.0371 16.319 25.9629C14.7127 26 13.1063 26 11.5 26C9.82063 26 8.14127 26 6.53492 25.9629ZM0.912698 6.63909C0.401587 6.63909 0 6.19401 0 5.67475V5.19258C0 4.67332 0.401587 4.22825 0.912698 4.22825H4.63651C5.40317 4.22825 6.06032 3.6719 6.20635 2.89301L6.38889 2.00285C6.64444 0.853067 7.66667 0 8.83492 0H14.1286C15.2968 0 16.2825 0.815978 16.5746 1.96576L16.7937 2.9301C16.9397 3.70899 17.5968 4.22825 18.3635 4.26534H22.0873C22.5984 4.26534 23 4.71041 23 5.22967V5.71184C23 6.2311 22.5984 6.63909 22.0873 6.67618H0.912698V6.63909Z"
                      fill="#F3F4F6"/>
            </svg>
            Elimina
        </button>
    </div>
    <div class="col-span-1 mt-6">
        <button type="submit" name="action" value="modifica"
                class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-giallo2 px-4 py-3 transition-all duration-300 hover:bg-yellow-700 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
            <svg width="26" height="27" viewBox="0 0 26 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18.1578 26.0194H8.18235C6.27322 26.0172 4.44289 25.2579 3.09293 23.9079C1.74297 22.5579 0.983608 20.7276 0.981445 18.8185V8.843C0.983608 6.93386 1.74297 5.10354 3.09293 3.75358C4.44289 2.40361 6.27322 1.64425 8.18235 1.64209H12.6258V3.54662H8.18235C6.77768 3.54781 5.43088 4.10634 4.43763 5.09959C3.44438 6.09284 2.88585 7.43964 2.88466 8.84432V18.8185C2.88585 20.2231 3.44438 21.5699 4.43763 22.5632C5.43088 23.5564 6.77768 24.115 8.18235 24.1162H18.1578C19.5622 24.1145 20.9085 23.5557 21.9014 22.5625C22.8942 21.5693 23.4525 20.2228 23.4537 18.8185V13.8307H25.3582V18.8185C25.356 20.7275 24.5968 22.5578 23.2469 23.9077C21.8971 25.2577 20.0669 26.0171 18.1578 26.0194Z"
                      fill="#F3F4F6"/>
                <path d="M19.3149 3.96895L10.855 12.4288L14.5518 16.1257L23.0117 7.66578L19.3149 3.96895Z"
                      fill="#F3F4F6"/>
                <path d="M22.3033 0.980547L20.0044 3.27942L23.7012 6.97625L26.0001 4.67738L22.3033 0.980547Z"
                      fill="#F3F4F6"/>
                <path d="M9.86825 13.4157L8.86011 18.1209L13.5653 17.1128L13.8626 16.8155L10.1656 13.1184L9.86825 13.4157Z"
                      fill="#F3F4F6"/>
            </svg>
            Modifica
        </button>
    </div>
</form>

<h2 class="text-xl font-semibold text-bluScuro mb-1 mt-2">Caratteristiche</h2>

<#if caratteristiche?has_content>
    <#list caratteristiche as caratteristica>
        <div class="flex flex-row justify-between items-center font-medium text-xl bg-light px-2 py-2 mt-2 rounded-md border">
            <div class="flex flex-row items-center gap-4">
                <div><span class="text-gray-600 text-md">${caratteristica_index + 1}) Nome: </span> ${caratteristica.nome}</div>
                <div><span class="text-gray-600 text-md">Unita di Misura: </span> ${caratteristica.misura}</div>
            </div>
            <div>
                <!-- Modulo per eliminare con SweetAlert2 -->
                <form id="delete-form-${caratteristica.key}" action="/admin/caratteristica" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="${caratteristica.key}" />
                    <input type="hidden" name="referrer" value="${currentUrl}" />
                    <input type="hidden" name="action" value="elimina" />
                    <button type="button" class="bg-rosso2 px-2 py-1 rounded-xl text-light transition-all duration-300 hover:bg-red-700"
                            onclick="confirmDeleteCaratteristica('${caratteristica.key}')">
                        Elimina
                    </button>
                </form>
                <form action="/admin/caratteristica" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="${caratteristica.key}" />
                    <input type="hidden" name="nome" value="${caratteristica.nome}" />
                    <input type="hidden" name="misura" value="${caratteristica.misura}" />
                    <input type="hidden" name="referrer" value="${currentUrl}" />
                    <input type="hidden" name="action" value="modifica" />
                    <button type="button"
                            class="bg-giallo2 px-2 py-1 rounded-xl text-light transition-all duration-300 hover:bg-yellow-700"
                            onclick="openEditModal('${caratteristica.key}', '${caratteristica.nome}', '${caratteristica.misura}', '${categoria.key}')">
                        Modifica
                    </button>
                </form>
            </div>
        </div>
    </#list>
<#else>
    <div class="text-gray-500">Non ci sono Caratteristiche</div>
</#if>

<div class="mt-6 flex flex-row justify-end">
    <button type="button" id="addCaratteristicaBtn" data-categoria="${categoria.key}"
            class="flex flex-row items-center justify-center col-span-2 gap-2 bg-verde px-3 py-2 transition-all duration-300 hover:bg-green-700 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-lg font-medium text-white">
        <svg width="23" height="22" viewBox="0 0 23 22" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M21.3375 5.29488C20.1481 3.42375 18.3652 1.89215 16.2791 0.990048C14.0479 0.0259833 11.5472 -0.244153 9.14761 0.224248C6.88533 0.665389 4.77594 1.7955 3.18223 3.39154C1.58075 4.995 0.494956 7.05944 0.142527 9.25275C0.0492364 9.8302 0 10.4126 0 10.9975C0 13.2602 0.730772 15.5105 2.10939 17.3519C3.47246 19.1734 5.37196 20.5687 7.57205 21.342C9.82656 22.1326 12.3532 22.2094 14.6595 21.5799C16.87 20.9752 18.8861 19.7212 20.3476 18.021C21.8636 16.2614 22.7783 14.1053 22.9649 11.8302C23.1541 9.56006 22.5736 7.24036 21.3375 5.29488ZM15.8127 11.7311H12.2832V15.1288C12.2832 15.5452 11.9256 15.855 11.5058 15.8723C11.086 15.8897 10.7284 15.5179 10.7284 15.1288V11.7311H7.17815C6.7428 11.7311 6.41888 11.3891 6.40074 10.9876C6.3826 10.5861 6.77131 10.2441 7.17815 10.2441H10.7284V6.86861C10.7284 6.45225 11.086 6.14246 11.5058 6.12512C11.9256 6.10777 12.2832 6.47951 12.2832 6.86861V10.2441H15.8127C16.248 10.2441 16.572 10.5861 16.5901 10.9876C16.6082 11.3891 16.2195 11.7311 15.8127 11.7311Z"
                  fill="#F3F4F6"/>
        </svg>
        Aggiungi Caratteristica
    </button>
</div>




<h2 class="text-xl font-semibold text-bluScuro mb-4 mt-4">Categorie Figlie</h2>
<ul class="ml-4 list-disc">
    <#if categoriaHierarchia?has_content>
        <#list categoriaHierarchia as wrapper>
            <li style="margin-left: calc(${wrapper.livello} * 20px);" class="mt-6">
                <a class="bg-white px-4 py-1.5 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-bluScuro "
                   href="/admin/categorie/visualizza/${wrapper.categoria.key}">
                    ${wrapper.categoria.nome}
                </a>

                <#if wrapper.sottocategorie?has_content>
                    <ul class="mt-6">
                        <!-- Mostriamo le sottocategorie -->
                        <@mostraSottocategorie sottocategorie=wrapper.sottocategorie />
                    </ul>
                </#if>
            </li>
        </#list>
    <#else>
        <li class="text-gray-500">Nessuna sottocategoria</li>   </#if>

</ul>

<#macro mostraSottocategorie sottocategorie>
    <#list sottocategorie as sottocategoriaWrapper>
        <li style="margin-left: calc(${sottocategoriaWrapper.livello} * 20px);" class="mt-6">
            <a class="bg-white px-4 py-1.5 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-bluScuro "
               href="/admin/categorie/visualizza/${sottocategoriaWrapper.categoria.key}">
                ${sottocategoriaWrapper.categoria.nome}
            </a>

            <#if sottocategoriaWrapper.sottocategorie?has_content>
                <ul class="mt-4">
                    <!-- Chiamiamo ricorsivamente la macro per le sottocategorie -->
                    <@mostraSottocategorie sottocategorie=sottocategoriaWrapper.sottocategorie />
                </ul>
            </#if>
        </li>
    </#list>
</#macro>

