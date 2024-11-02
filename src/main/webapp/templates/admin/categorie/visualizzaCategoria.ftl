<#include "../../navbar.ftl">

<script type="module" src="/scripts/gestione_caratteristica.js"></script>
<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8 ">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center col-span-6">
        <svg class="w-10 h-10 fill-primario" viewBox="0 0 84 88" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M18.6908 19.469C19.0424 19.469 19.351 19.1604 19.351 18.8088V1.6178C19.015 1.87171 1.96399 19.0158 1.66699 19.2698C1.60449 19.3323 1.5459 19.3909 1.4834 19.469L18.6908 19.469Z"
                  fill="#3E53A0"/>
            <path d="M69.4412 34.621C69.4412 34.621 45.6252 58.41 43.4682 60.578C40.3354 63.3592 39.4213 68.2928 38.4955 72.183C38.3627 72.597 38.7767 72.9994 39.1869 72.89C43.1049 71.933 47.9838 71.0423 50.8079 67.9017C58.2806 60.4251 69.4409 49.2767 76.7649 41.9447C76.4993 41.683 69.4407 34.6244 69.4407 34.6244L69.4412 34.621Z"
                  fill="#3E53A0"/>
            <path d="M82.352 29.016C80.3403 27.0043 77.0551 27.0043 75.0278 29.016L72.6958 31.3637L80.02 38.6879L82.352 36.3559C84.3793 34.3286 84.3793 31.0434 82.352 29.02V29.016Z"
                  fill="#3E53A0"/>
            <path d="M54.059 71.156C50.227 75.1755 44.3324 76.6677 39.047 77.5115C36.1134 77.3787 33.215 74.0388 34.0118 71.0779L35.2696 66.0427C36.0977 62.7419 37.8008 59.7185 40.211 57.3239C43.1016 54.4372 67.215 30.3199 67.215 30.3199V5.51487C67.215 2.61257 64.8673 0.249268 61.9494 0.249268H23.9574V18.8083C23.9574 21.7106 21.5941 24.0739 18.6918 24.0739C15.4965 24.0856 3.14481 24.0661 0.132812 24.0739V82.4839C0.132812 85.3862 2.49611 87.7495 5.39841 87.7495H61.9494C64.8674 87.7495 67.215 85.3862 67.215 82.4839V57.9999C64.3517 60.8632 57.008 68.207 54.059 71.156ZM12.18 49.605H35.914C38.9296 49.6597 38.9452 54.1519 35.914 54.2105H12.184C9.16451 54.1636 9.15281 49.6558 12.184 49.605H12.18ZM12.18 59.812H29.774C32.7935 59.8667 32.8013 64.3589 29.774 64.4175H12.18C9.15661 64.3706 9.14881 59.8589 12.18 59.812ZM12.18 70.035H26.703C29.7225 70.0897 29.7303 74.5741 26.703 74.6405H12.18C9.15661 74.5819 9.15271 70.0858 12.18 70.035Z"
                  fill="#3E53A0"/>
        </svg>
        Modifica Categoria
    </h1>
    <form action="${currentUrl}" method="post"
          class="mt-6 flex flex-col items-center justify-center mx-auto max-w-[500px] gap-4">
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <h2 class="text-xl font-semibold text-bluScuro">Nome:</h2>
            <input id="nome_prodotto" id="nome" type="text" name="nome"
                   class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                   placeholder="Cucina..." required value="${categoria.nome}">
        </div>

        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <h2 class="text-xl font-semibold text-bluScuro">Categoria Padre:</h2>
            <select id="padre" name="padre"
                    class="block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
                <option value="">Nessun Padre...</option>
                <#if (categorie?size>0)>
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

        <#--     Gestione errore           -->
        <#if error?exists>
            <h2 class="text-bluScuro text-sm bg-TrossoChiaro px-2 py-1 rounded-xl text-center">${error}</h2>
        </#if>

        <div class="flex flex-row justify-center items-center gap-4  mt-6">
            <button type="submit" name="action" value="elimina"
                    class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-rosso2 px-4 py-3 transition-all duration-300 hover:bg-red-700 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
                <svg width="23" height="26" viewBox="0 0 23 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6.53492 25.9629C4.52698 25.9629 2.84762 24.331 2.7746 22.291C2.37302 18.582 1.71587 9.86591 1.67937 9.75464C1.67937 9.49501 1.75238 9.23538 1.93492 9.01284C2.11746 8.82739 2.33651 8.71612 2.59206 8.71612H20.3349C20.5905 8.71612 20.846 8.82739 20.9921 9.01284C21.1746 9.19829 21.2476 9.45792 21.2111 9.75464C21.2111 9.82882 20.5175 18.582 20.1524 22.291C20.0794 24.368 18.3635 26.0371 16.319 25.9629C14.7127 26 13.1063 26 11.5 26C9.82063 26 8.14127 26 6.53492 25.9629ZM0.912698 6.63909C0.401587 6.63909 0 6.19401 0 5.67475V5.19258C0 4.67332 0.401587 4.22825 0.912698 4.22825H4.63651C5.40317 4.22825 6.06032 3.6719 6.20635 2.89301L6.38889 2.00285C6.64444 0.853067 7.66667 0 8.83492 0H14.1286C15.2968 0 16.2825 0.815978 16.5746 1.96576L16.7937 2.9301C16.9397 3.70899 17.5968 4.22825 18.3635 4.26534H22.0873C22.5984 4.26534 23 4.71041 23 5.22967V5.71184C23 6.2311 22.5984 6.63909 22.0873 6.67618H0.912698V6.63909Z"
                          fill="#F3F4F6"/>
                </svg>
                Elimina
            </button>

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

    <#--    <h2 class="text-xl font-semibold text-bluScuro mb-1 mt-2">Caratteristiche</h2>-->
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center mt-8">
        <svg class="w-14 h-14 fill-primario" viewBox="0 0 109 102" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M88.4695 70.7659V35.5098L58.1289 56.0695V91.3258L72.987 81.2575V62.9003C72.987 62.4532 73.3744 62.0908 73.8521 62.0908C74.3298 62.0908 74.7172 62.4532 74.7172 62.9003V80.0849L88.4695 70.7659Z"
                  fill="#3E53A0"/>
            <path d="M57.2645 13.1914L26.6689 33.9241L57.2645 54.6569L87.8601 33.9241L57.2645 13.1914Z" fill="#3E53A0"/>
            <path d="M26.0586 70.7659L56.3992 91.3258V56.0695L26.0586 35.5098V70.7659Z" fill="#3E53A0"/>
            <path d="M105.923 93.1367H79.3817C78.9039 93.1367 78.5166 93.4992 78.5166 93.9463C78.5166 94.3933 78.9039 94.7558 79.3817 94.7558H105.923C106.401 94.7558 106.788 94.3933 106.788 93.9463C106.788 93.4992 106.401 93.1367 105.923 93.1367Z"
                  fill="#3E53A0"/>
            <path d="M101.499 99.3462H79.3817C78.9039 99.3462 78.5166 99.7087 78.5166 100.156C78.5166 100.603 78.9039 100.965 79.3817 100.965H101.499C101.977 100.965 102.364 100.603 102.364 100.156C102.364 99.7087 101.977 99.3462 101.499 99.3462Z"
                  fill="#3E53A0"/>
            <path d="M108.135 2.0686H86.0174C85.5397 2.0686 85.1523 2.43107 85.1523 2.87814C85.1523 3.3252 85.5397 3.68767 86.0174 3.68767H108.135C108.613 3.68767 109 3.3252 109 2.87814C109 2.43107 108.613 2.0686 108.135 2.0686Z"
                  fill="#3E53A0"/>
            <path d="M80.7285 9.08736C80.7285 9.53443 81.1159 9.8969 81.5936 9.8969H103.712C104.189 9.8969 104.577 9.53443 104.577 9.08736C104.577 8.6403 104.189 8.27783 103.712 8.27783H81.5936C81.1159 8.27783 80.7285 8.6403 80.7285 9.08736Z"
                  fill="#3E53A0"/>
            <path d="M6.39341 1.61784H34.0405C34.5183 1.61784 34.9056 1.25538 34.9056 0.808312C34.9056 0.361248 34.5183 -0.0012207 34.0405 -0.0012207H6.39341C5.91566 -0.0012207 5.52832 0.361248 5.52832 0.808312C5.52832 1.25538 5.91566 1.61784 6.39341 1.61784Z"
                  fill="#3E53A0"/>
            <path d="M9.71128 6.20776C9.23353 6.20776 8.84619 6.57023 8.84619 7.0173C8.84619 7.46436 9.23353 7.82683 9.71128 7.82683H26.2996C26.7773 7.82683 27.1647 7.46436 27.1647 7.0173C27.1647 6.57023 26.7773 6.20776 26.2996 6.20776H9.71128Z"
                  fill="#3E53A0"/>
            <path d="M21.4584 33.1145H13.646L1.68226 0.545214C1.52697 0.122436 1.03517 -0.102615 0.582731 0.0426966C0.130938 0.18821 -0.109556 0.648632 0.0457273 1.07141L12.2104 34.1872C12.3306 34.514 12.6591 34.7336 13.0285 34.7336H21.4584C21.9361 34.7336 22.3235 34.3711 22.3235 33.9241C22.3235 33.477 21.9361 33.1145 21.4584 33.1145Z"
                  fill="#3E53A0"/>
            <path d="M73.8524 83.915C73.3746 83.915 72.9873 84.2775 72.9873 84.7246V101.19C72.9873 101.637 73.3746 102 73.8524 102C74.3301 102 74.7175 101.637 74.7175 101.19V84.7246C74.7175 84.2775 74.3301 83.915 73.8524 83.915Z"
                  fill="#3E53A0"/>
            <path d="M71.6235 20.5838C71.7429 20.6364 71.8685 20.6613 71.992 20.6613C72.3164 20.6613 72.6274 20.4897 72.7749 20.1971L82.3761 1.15381C82.5801 0.74945 82.3951 0.267171 81.963 0.0763238C81.5303 -0.114928 81.0149 0.0587165 80.8116 0.463078L71.2104 19.5063C71.0065 19.9105 71.1914 20.393 71.6235 20.5838Z"
                  fill="#3E53A0"/>
        </svg>
        Caratteristiche
    </h1>

    <#if caratteristiche?has_content>
        <#list caratteristiche as caratteristica>
            <div class="flex flex-row justify-between items-center  font-medium text-xl bg-white shadowBoxInput px-2 py-2 mt-2 rounded-md border">
                <div class="flex flex-row items-center gap-4">
                    <div>
                        ${caratteristica_index + 1})<span class="text-gray-600 text-sm"> Nome: </span> ${caratteristica.nome}
                    </div>
                    <div><span class="text-gray-600 text-sm">Unita di Misura: </span> ${caratteristica.misura}</div>
                </div>
                <div>
                    <!-- Modulo per eliminare con SweetAlert2 -->
                    <form id="delete-form-${caratteristica.key}" action="/admin/caratteristica" method="post"
                          style="display: inline;">
                        <input type="hidden" name="id" value="${caratteristica.key}"/>
                        <input type="hidden" name="referrer" value="${currentUrl}"/>
                        <input type="hidden" name="action" value="elimina"/>
                        <button type="button"
                                class="bg-rosso2 px-2 py-1 rounded-xl text-light transition-all duration-300 hover:bg-red-700"
                                onclick="confirmDeleteCaratteristica('${caratteristica.key}')">
                            Elimina
                        </button>
                    </form>
                    <form action="/admin/caratteristica" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="${caratteristica.key}"/>
                        <input type="hidden" name="nome" value="${caratteristica.nome}"/>
                        <input type="hidden" name="misura" value="${caratteristica.misura}"/>
                        <input type="hidden" name="referrer" value="${currentUrl}"/>
                        <input type="hidden" name="action" value="modifica"/>
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


    <#--    <h2 class="text-xl font-semibold text-bluScuro mb-4 mt-4">Categorie Figlie</h2>-->
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center mt-8">
        <svg class="w-14 h-14 fill-primario"  viewBox="0 0 56 66" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M24.2899 35.29L16.2899 43.29C16.1099 43.48 15.9999 43.73 15.9999 44L15.9999 47.53L10.3599 52.23C9.93992 52.58 9.87991 53.21 10.2299 53.64C10.5799 54.06 11.2099 54.12 11.6399 53.77L15.9999 50.14L15.9999 55C15.9999 55.55 16.4499 56 16.9999 56C17.5499 56 17.9999 55.55 17.9999 55L17.9999 44.41L23.9999 38.41L23.9999 46C23.9999 46.55 24.4499 47 24.9999 47C25.5499 47 25.9999 46.55 25.9999 46L25.9999 36.41L28.7099 33.7C28.8899 33.52 28.9999 33.27 28.9999 33L28.9999 28L34.9999 39.25L34.9999 65C34.9999 65.55 35.4499 66 35.9999 66C36.5499 66 36.9999 65.55 36.9999 65L36.9999 54.76L40.2299 58.64C40.5799 59.06 41.2099 59.12 41.6399 58.77C42.0599 58.42 42.1199 57.79 41.7699 57.36L36.9999 51.64L36.9999 39C36.9999 38.84 36.9599 38.67 36.8799 38.53L28.9999 23.75L28.9999 23L28.9999 0.999999C28.9999 0.449999 28.5499 -1.17567e-06 27.9999 -1.22376e-06C27.4499 -1.27184e-06 26.9999 0.449999 26.9999 0.999999L26.9999 23L26.9999 24L26.9999 32.59L24.2899 35.29Z" fill="#3E53A0"/>
            <path d="M10.0002 17.41L10.0002 27C10.0002 27.55 10.4502 28 11.0002 28C11.5502 28 12.0002 27.55 12.0002 27L12.0002 23.41L14.2902 25.7C14.6802 26.09 15.3102 26.09 15.7002 25.7C16.0902 25.31 16.0902 24.68 15.7002 24.29L12.0002 20.59L12.0002 17C12.0002 16.73 11.8902 16.48 11.7102 16.29L6.00018 10.59L6.00018 0.999999C6.00018 0.449999 5.55018 -9.12912e-07 5.00018 -9.60995e-07C4.45018 -1.00908e-06 4.00018 0.449999 4.00018 0.999999L4.00018 11C4.00018 11.27 4.11018 11.52 4.29018 11.71L10.0002 17.41Z" fill="#3E53A0"/>
            <path d="M0.999942 26C1.54994 26 1.99994 25.55 1.99994 25L1.99994 20.41L5.70994 16.7C6.09994 16.31 6.09994 15.68 5.70994 15.29C5.50994 15.1 5.25994 15 4.99994 15C4.73994 15 4.48994 15.1 4.28994 15.29L0.289944 19.29C0.109944 19.48 -5.71492e-05 19.73 -5.71728e-05 20L-5.76099e-05 25C-5.7658e-05 25.55 0.449942 26 0.999942 26Z" fill="#3E53A0"/>
            <path d="M46 21C45.45 21 45 21.45 45 22L45 26.59L41.29 30.3C41.11 30.48 41 30.73 41 31L41 37C41 37.55 41.45 38 42 38C42.55 38 43 37.55 43 37L43 31.41L46.71 27.7C46.89 27.52 47 27.27 47 27L47 22C47 21.45 46.55 21 46 21Z" fill="#3E53A0"/>
            <path d="M41.77 21.64L45 17.76L45 18C45 18.27 45.11 18.52 45.29 18.71L49 22.41L49 31C49 31.3 49.14 31.59 49.38 31.78L54 35.48L54 43C54 43.55 54.45 44 55 44C55.55 44 56 43.55 56 43L56 35C56 34.7 55.86 34.41 55.62 34.22L50.99 30.52L50.99 22C50.99 21.73 50.88 21.48 50.7 21.29L47 17.59L47 0.999999C47 0.449999 46.55 -8.26145e-07 46 -8.74228e-07C45.45 -9.2231e-07 45 0.449999 45 0.999999L45 14.64L40.23 20.36C39.88 20.78 39.93 21.42 40.36 21.77C40.79 22.12 41.42 22.06 41.77 21.64Z" fill="#3E53A0"/>
            <path d="M16.45 9.83L19 11.54L19 15C19 15.55 19.45 16 20 16C20.55 16 21 15.55 21 15L21 11C21 10.67 20.83 10.35 20.55 10.17L18 8.47L18 2C18 1.45 17.55 1 17 1C16.45 1 16 1.45 16 2L16 9C16 9.33 16.17 9.65 16.45 9.83Z" fill="#3E53A0"/>
            <path d="M14 13C14.55 13 15 12.55 15 12L15 9C15 8.45 14.55 8 14 8C13.45 8 13 8.45 13 9L13 12C13 12.55 13.45 13 14 13Z" fill="#3E53A0"/>
        </svg>
        Categorie Figlie
    </h1>
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
</div>
