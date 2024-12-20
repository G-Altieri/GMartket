<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>


<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center ">
        <svg class="w-10 h-12" viewBox="0 0 38 46" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M7.84229 22.8816V28.3373L10.8821 29.9629V24.509L7.84229 22.8816Z" fill="#3E53A0"/>
            <path d="M12.3026 31.1455C12.3026 31.3944 12.1712 31.6238 11.9564 31.7509C11.8445 31.818 11.7184 31.8515 11.5924 31.8515C11.4769 31.8515 11.3615 31.8233 11.255 31.7668L6.79478 29.3805C6.56395 29.2569 6.42191 29.0186 6.42191 28.7592V22.1224L0.53418 18.97V35.8191L18.2896 45.7033V28.4747L12.3024 25.2693L12.3026 31.1455Z" fill="#3E53A0"/>
            <path d="M28.2329 36.3187L33.9147 33.2793V30.6459L28.2329 33.6853V36.3187Z" fill="#3E53A0"/>
            <path d="M19.71 28.475V45.7037L37.4654 35.8194V18.9703L19.71 28.475ZM29.3159 25.8575L34.2877 23.1958C34.6339 23.0122 35.0636 23.1393 35.2501 23.4817C35.4347 23.8241 35.3069 24.253 34.9624 24.4384L29.9906 27.1001C29.8841 27.1565 29.7686 27.1848 29.655 27.1848C29.4029 27.1848 29.1578 27.0506 29.03 26.8141C28.8436 26.4717 28.9732 26.0428 29.3177 25.8575H29.3159ZM29.3159 28.6815L34.2877 26.0199C34.6339 25.8363 35.0636 25.9634 35.2501 26.3058C35.4347 26.6482 35.3069 27.0771 34.9624 27.2625L29.9906 29.9241C29.8841 29.9806 29.7686 30.0089 29.655 30.0089C29.4029 30.0089 29.1578 29.8747 29.03 29.6382C28.8436 29.2958 28.9732 28.8669 29.3177 28.6815H29.3159ZM35.335 33.7012C35.335 33.9606 35.1911 34.1989 34.9621 34.3225L27.8598 38.1208C27.7551 38.1773 27.6396 38.2055 27.5225 38.2055C27.3964 38.2055 27.2703 38.172 27.1585 38.1049C26.9436 37.9778 26.8122 37.7484 26.8122 37.4995V33.2634C26.8122 33.004 26.9561 32.7657 27.1851 32.6421L34.2874 28.8438C34.5075 28.7273 34.7739 28.7326 34.9887 28.8597C35.2036 28.9867 35.335 29.2162 35.335 29.465L35.335 33.7012Z" fill="#3E53A0"/>
            <path d="M30.575 14.4799C29.1901 19.1927 24.9836 22.6521 20.0014 23.0651C19.6711 23.0951 19.3373 23.111 19 23.111C17.4055 23.111 15.8501 22.8039 14.3677 22.1967C12.7076 21.5066 11.2019 20.4405 10.0193 19.122C8.79596 17.777 7.91174 16.1955 7.41278 14.4851L1.28369 17.7663L19.0005 27.2498L36.7173 17.7663L30.5737 14.478L30.575 14.4799Z" fill="#3E53A0"/>
            <path d="M11.0738 18.1759C12.1249 19.3479 13.4388 20.2798 14.9161 20.894C16.1732 21.4094 17.5511 21.6989 18.9999 21.6989C24.3977 21.6989 28.8649 17.7028 29.554 12.5209C29.6179 12.062 29.6535 11.5889 29.6535 11.1088C29.6535 5.26275 24.8807 0.518311 18.9998 0.518311C13.1189 0.518311 8.34619 5.26275 8.34619 11.1088C8.34619 11.5889 8.3817 12.062 8.44562 12.5209C8.72971 14.6812 9.6743 16.6369 11.0734 18.1762L11.0738 18.1759ZM19.0002 2.63623C21.2782 2.63623 23.4196 3.51698 25.0284 5.11613C25.3053 5.39148 25.3053 5.83805 25.0284 6.11513L19.5029 11.6078C19.2366 11.8726 18.8122 11.885 18.5317 11.6378L16.2323 9.6257L15.0285 11.0289L18.9631 14.3825L25.7281 7.65762C25.895 7.48994 26.1347 7.41757 26.3691 7.46346C26.6017 7.50935 26.7953 7.6682 26.8876 7.88707C27.3102 8.90198 27.5232 9.9857 27.5232 11.1083C27.5232 15.7804 23.7004 19.5805 19.0005 19.5805C14.3006 19.5805 10.4778 15.7803 10.4778 11.1083C10.4778 6.43622 14.3003 2.63623 19.0002 2.63623Z" fill="#3E53A0"/>
            <path d="M18.9999 18.1688C22.9168 18.1688 26.1022 15.0023 26.1022 11.1086C26.1022 10.5491 26.0383 10.0002 25.9122 9.47065L19.5022 15.8427C19.2394 16.1039 18.8204 16.1198 18.5381 15.8797L13.5662 11.6436C13.2697 11.3895 13.2342 10.9464 13.4881 10.6499L15.6188 8.16472C15.7431 8.01999 15.9189 7.93173 16.1088 7.91761C16.2988 7.90348 16.4853 7.96703 16.6291 8.09235L18.9692 10.1398L23.4969 5.63893C22.2327 4.60817 20.6596 4.04688 19.0012 4.04688C15.0843 4.04688 11.8989 7.21336 11.8989 11.1071C11.8989 15.0008 15.0843 18.1672 19.0012 18.1672L18.9999 18.1688Z" fill="#3E53A0"/>
        </svg>
        Ordini Evasi
    </h1>

    <p class="text-bluScuro text-sm text-right w-full mb-2">• Per i dettagli selezionare un rigo</p>
    <div class="flex flex-row items-center gap-2 mb-4">
        <svg class="w-8 h-8" viewBox="0 0 43 43" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M33.3104 30.7042L42.4603 39.8541C43.1799 40.5737 43.1799 41.7407 42.4603 42.4603C41.7407 43.1799 40.5737 43.1799 39.8542 42.4603L30.7042 33.3103C23.2377 39.444 12.3338 38.9026 5.50183 32.0709C-1.83394 24.7333 -1.83394 12.8395 5.50183 5.50186C12.8394 -1.83395 24.735 -1.83395 32.0707 5.50186C38.9027 12.3339 39.4438 23.2376 33.3104 30.7042ZM18.7873 10.4842C23.3738 10.4842 27.0904 14.2007 27.0904 18.7873C27.0904 19.8039 27.9161 20.6296 28.9327 20.6296C29.9511 20.6296 30.775 19.8039 30.775 18.7873C30.775 12.1657 25.4073 6.79978 18.7876 6.79978C17.7709 6.79978 16.9453 7.62547 16.9453 8.64213C16.9453 9.66055 17.7707 10.4842 18.7873 10.4842ZM29.4667 8.10788C23.5703 2.21145 14.0066 2.21145 8.10979 8.10788C2.21338 14.0043 2.21338 23.568 8.10979 29.4649C14.008 35.3613 23.5698 35.3613 29.4667 29.4649C35.3631 23.5666 35.3631 14.0048 29.4667 8.10788Z"
                  fill="#3E53A0"/>
        </svg>
        <input type="text" id="searchInput" placeholder="Cerca per Codice, Nome, Prezzo o Stato"
               class="search-bar rounded-xl border"/>
    </div>
    <div class="border border-primario rounded-2xl">
        <table class="user-list-table rounded-2xl" id="userTable">
            <thead>
            <tr class="bg-trTable">
                <th>#</th>
                <th>Codice Proposta</th>
                <th>Nome Prodotto</th>
                <th>Prezzo</th>
                <th>Data Ordine</th>
                <th>Stato Ordine</th>
                <#--                <th>Azione</th>-->
            </tr>
            </thead>
            <tbody>
            <#list listProposte1 as proposta>
                <#assign isHighlighted = false />
                <#assign idNotifica = -1 />
                <#list notifiche as notifica>
                    <#if notifica.ordine.key == proposta.key>
                        <#assign isHighlighted = true />
                        <#assign idNotifica = notifica.key />
                    </#if>
                </#list>
                <tr class="hover-row ${isHighlighted?then('highlighted-row','')}"
                    onclick="rowClickHandlerNotifica('${idNotifica}', '${proposta.key}', '/ordinante/dettagli-proposta?keyProposta=${proposta.getKey()}&ordini=x')">
                    <td class="index-column"></td>
                    <td>#${proposta.codiceProposta}</td>
                    <td>${proposta.nomeProdotto}</td>
                    <td>${proposta.prezzo}€</td>
                    <td>${proposta.dataOrdine}</td>
                    <td class="font-semibold
                        <#if proposta.statoOrdine == "RESPINTO_NONCONFORME">bg-TrossoChiaro</#if>
                        <#if proposta.statoOrdine == "ACCETTATO">bg-TverdeChiaro</#if>
                        <#if proposta.statoOrdine == "RESPINTO_NONFUNZIONANTE">bg-TrossoChiaro</#if>
                        <#if proposta.statoOrdine == "IN_ATTESA">bg-TgialloChiaro</#if>">
                        ${proposta.statoOrdine}
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
