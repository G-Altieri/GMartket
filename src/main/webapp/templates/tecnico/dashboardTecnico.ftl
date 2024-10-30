<div class="">
    <#include "../navbar.ftl">

    <#--    Sezione 1 Presentazione Admin-->
    <div class="grid grid-cols-6 mt-6">
        <div class="bg-white p-4 w-full rounded-3xl md:col-span-3 col-span-4 shadow-normalBox grid grid-cols-2">
            <div class="flex flex-col">
                <div class="text-bluScuro font-semibold text-2xl">Ciao, ${user.nome} ${user.cognome}</div>

            </div>
            <div class="">
                <img src="/images/icons/dashboardTecnico/vectorTecnico.svg" alt="vectorTecnico"
                     class="w-full max-w-[220px] h-auto ">
            </div>
        </div>
        <div class="col-span-2"></div>
    </div>

    <#--    Sezione 2 Gestione -->
    <div class="text-2xl font-medium text-bluScuro mt-12">Gestione Piattaforma</div>
    <div class="grid grid-cols-6 mt-2 gap-4">
        <#--        <a href="/admin/categorie" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">-->
        <#--            <div class="text-3xl font-semibold text-bluScuro ">Categorie</div>-->
        <#--            <img src="/images/icons/dashboardAdmin/vectorCategorie.svg" alt="vectorAdmin" class="w-full max-w-[220px] h-auto -mb-4">-->
        <#--        </a>-->

        <a href="/tecnico/lista-richieste"
           class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] relative shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <#if notificheRichiesteLibere?? && (notificheRichiesteLibere?size > 0)>
                <div class="notification-container flex items-center justify-center">
                    <svg class="bell-icon fill-rosso2 w-12 h-12" viewBox="0 0 32 32"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M26.25 17c0-8.338-4.457-12.506-9-13.15v-1.85c0-0.69-0.56-1.25-1.25-1.25s-1.25 0.56-1.25 1.25v0 1.85c-4.542 0.644-9 4.813-9 13.15-0.048 3.211-1.434 6.089-3.624 8.108l-0.008 0.007c-0.227 0.226-0.368 0.539-0.368 0.885 0 0.69 0.559 1.25 1.25 1.25h7.917c0.573 2.313 2.631 4 5.083 4s4.51-1.687 5.075-3.964l0.008-0.036h7.917c0.69-0 1.25-0.56 1.25-1.25 0-0.345-0.139-0.657-0.365-0.883l0 0c-2.214-2.016-3.606-4.901-3.635-8.112l-0-0.005zM16 28.75c-1.058-0.004-1.974-0.606-2.428-1.485l-0.007-0.015h4.871c-0.462 0.894-1.378 1.496-2.435 1.5h-0.001zM5.709 24.75c1.587-2.137 2.541-4.827 2.541-7.739 0-0.004 0-0.007 0-0.011v0.001c0-7.386 4.018-10.75 7.75-10.75 2.113 0.028 3.991 1.014 5.222 2.543l0.010 0.013c1.581 2.074 2.533 4.702 2.533 7.552 0 0.219-0.006 0.438-0.017 0.654l0.001-0.030c-0 0.042-0.001 0.092-0.001 0.141 0 2.876 0.955 5.529 2.565 7.659l-0.023-0.032zM5 11.708c0 0 0 0 0.001 0 0.69 0 1.25-0.56 1.25-1.25 0-0.534-0.335-0.99-0.806-1.169l-0.009-0.003-3-1.114c-0.129-0.050-0.279-0.078-0.436-0.078-0.69 0-1.25 0.56-1.25 1.25 0 0.534 0.335 0.99 0.806 1.169l0.009 0.003 3 1.114c0.129 0.049 0.279 0.078 0.435 0.078h0zM7.116 5.884c0.226 0.224 0.537 0.363 0.881 0.363 0.69 0 1.25-0.56 1.25-1.25 0-0.344-0.139-0.655-0.363-0.881l-3-3c-0.226-0.225-0.537-0.363-0.881-0.363-0.69 0-1.25 0.56-1.25 1.25 0 0.344 0.139 0.655 0.363 0.881l-0-0zM31.172 8.908c-0.182-0.48-0.638-0.815-1.172-0.815-0.156 0-0.306 0.029-0.444 0.081l0.009-0.003-3 1.114c-0.48 0.182-0.815 0.638-0.815 1.172 0 0.69 0.56 1.25 1.25 1.25 0 0 0 0 0.001 0h-0c0.156-0 0.306-0.029 0.444-0.081l-0.009 0.003 3-1.114c0.48-0.182 0.814-0.638 0.814-1.172 0-0.156-0.029-0.306-0.081-0.444l0.003 0.009zM24 6.25c0.001 0 0.001 0 0.002 0 0.345 0 0.657-0.14 0.883-0.366l3-3c0.226-0.226 0.366-0.539 0.366-0.884 0-0.691-0.56-1.251-1.251-1.251-0.346 0-0.658 0.14-0.885 0.367v0l-3 3c-0.226 0.226-0.366 0.539-0.366 0.884 0 0.69 0.56 1.25 1.25 1.25 0 0 0.001 0 0.001 0h-0z"></path>
                    </svg>
                </div>
                <span class="notification-badge"></span>
            </#if>
            <div class="text-3xl font-semibold text-bluScuro ">Richieste Libere</div>
            <img src="/images/icons/dashboardTecnico/vectorLibere.svg" alt="vectorLibere"
                 class="w-full max-w-[220px] h-auto -mb-4">
        </a>
        <a href="/tecnico/lista-richiesteProprie"
           class="bg-white p-4 w-full rounded-3xl relative col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <#if notificheMyRichieste?? && (notificheMyRichieste?size > 0)>
                    <div class="notification-container flex items-center justify-center">
                        <svg class="bell-icon fill-rosso2 w-12 h-12" viewBox="0 0 32 32"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M26.25 17c0-8.338-4.457-12.506-9-13.15v-1.85c0-0.69-0.56-1.25-1.25-1.25s-1.25 0.56-1.25 1.25v0 1.85c-4.542 0.644-9 4.813-9 13.15-0.048 3.211-1.434 6.089-3.624 8.108l-0.008 0.007c-0.227 0.226-0.368 0.539-0.368 0.885 0 0.69 0.559 1.25 1.25 1.25h7.917c0.573 2.313 2.631 4 5.083 4s4.51-1.687 5.075-3.964l0.008-0.036h7.917c0.69-0 1.25-0.56 1.25-1.25 0-0.345-0.139-0.657-0.365-0.883l0 0c-2.214-2.016-3.606-4.901-3.635-8.112l-0-0.005zM16 28.75c-1.058-0.004-1.974-0.606-2.428-1.485l-0.007-0.015h4.871c-0.462 0.894-1.378 1.496-2.435 1.5h-0.001zM5.709 24.75c1.587-2.137 2.541-4.827 2.541-7.739 0-0.004 0-0.007 0-0.011v0.001c0-7.386 4.018-10.75 7.75-10.75 2.113 0.028 3.991 1.014 5.222 2.543l0.010 0.013c1.581 2.074 2.533 4.702 2.533 7.552 0 0.219-0.006 0.438-0.017 0.654l0.001-0.030c-0 0.042-0.001 0.092-0.001 0.141 0 2.876 0.955 5.529 2.565 7.659l-0.023-0.032zM5 11.708c0 0 0 0 0.001 0 0.69 0 1.25-0.56 1.25-1.25 0-0.534-0.335-0.99-0.806-1.169l-0.009-0.003-3-1.114c-0.129-0.050-0.279-0.078-0.436-0.078-0.69 0-1.25 0.56-1.25 1.25 0 0.534 0.335 0.99 0.806 1.169l0.009 0.003 3 1.114c0.129 0.049 0.279 0.078 0.435 0.078h0zM7.116 5.884c0.226 0.224 0.537 0.363 0.881 0.363 0.69 0 1.25-0.56 1.25-1.25 0-0.344-0.139-0.655-0.363-0.881l-3-3c-0.226-0.225-0.537-0.363-0.881-0.363-0.69 0-1.25 0.56-1.25 1.25 0 0.344 0.139 0.655 0.363 0.881l-0-0zM31.172 8.908c-0.182-0.48-0.638-0.815-1.172-0.815-0.156 0-0.306 0.029-0.444 0.081l0.009-0.003-3 1.114c-0.48 0.182-0.815 0.638-0.815 1.172 0 0.69 0.56 1.25 1.25 1.25 0 0 0 0 0.001 0h-0c0.156-0 0.306-0.029 0.444-0.081l-0.009 0.003 3-1.114c0.48-0.182 0.814-0.638 0.814-1.172 0-0.156-0.029-0.306-0.081-0.444l0.003 0.009zM24 6.25c0.001 0 0.001 0 0.002 0 0.345 0 0.657-0.14 0.883-0.366l3-3c0.226-0.226 0.366-0.539 0.366-0.884 0-0.691-0.56-1.251-1.251-1.251-0.346 0-0.658 0.14-0.885 0.367v0l-3 3c-0.226 0.226-0.366 0.539-0.366 0.884 0 0.69 0.56 1.25 1.25 1.25 0 0 0.001 0 0.001 0h-0z"></path>
                        </svg>
                    </div>
                    <span class="notification-badge"></span>
            </#if>
            <div class="text-3xl font-semibold text-bluScuro ">Mie Richieste</div>
            <img src="/images/icons/dashboardTecnico/vectorMieRichieste.svg" alt="vectorMieRichieste"
                 class="w-full max-w-[220px] h-auto -mb-4">
        </a>
        <a href="/tecnico/lista-ordini"
           class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover relative duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <#if notificheMyOrdini?? && (notificheMyOrdini?size > 0)>
                <div class="notification-container flex items-center justify-center">
                    <svg class="bell-icon fill-rosso2 w-12 h-12" viewBox="0 0 32 32"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M26.25 17c0-8.338-4.457-12.506-9-13.15v-1.85c0-0.69-0.56-1.25-1.25-1.25s-1.25 0.56-1.25 1.25v0 1.85c-4.542 0.644-9 4.813-9 13.15-0.048 3.211-1.434 6.089-3.624 8.108l-0.008 0.007c-0.227 0.226-0.368 0.539-0.368 0.885 0 0.69 0.559 1.25 1.25 1.25h7.917c0.573 2.313 2.631 4 5.083 4s4.51-1.687 5.075-3.964l0.008-0.036h7.917c0.69-0 1.25-0.56 1.25-1.25 0-0.345-0.139-0.657-0.365-0.883l0 0c-2.214-2.016-3.606-4.901-3.635-8.112l-0-0.005zM16 28.75c-1.058-0.004-1.974-0.606-2.428-1.485l-0.007-0.015h4.871c-0.462 0.894-1.378 1.496-2.435 1.5h-0.001zM5.709 24.75c1.587-2.137 2.541-4.827 2.541-7.739 0-0.004 0-0.007 0-0.011v0.001c0-7.386 4.018-10.75 7.75-10.75 2.113 0.028 3.991 1.014 5.222 2.543l0.010 0.013c1.581 2.074 2.533 4.702 2.533 7.552 0 0.219-0.006 0.438-0.017 0.654l0.001-0.030c-0 0.042-0.001 0.092-0.001 0.141 0 2.876 0.955 5.529 2.565 7.659l-0.023-0.032zM5 11.708c0 0 0 0 0.001 0 0.69 0 1.25-0.56 1.25-1.25 0-0.534-0.335-0.99-0.806-1.169l-0.009-0.003-3-1.114c-0.129-0.050-0.279-0.078-0.436-0.078-0.69 0-1.25 0.56-1.25 1.25 0 0.534 0.335 0.99 0.806 1.169l0.009 0.003 3 1.114c0.129 0.049 0.279 0.078 0.435 0.078h0zM7.116 5.884c0.226 0.224 0.537 0.363 0.881 0.363 0.69 0 1.25-0.56 1.25-1.25 0-0.344-0.139-0.655-0.363-0.881l-3-3c-0.226-0.225-0.537-0.363-0.881-0.363-0.69 0-1.25 0.56-1.25 1.25 0 0.344 0.139 0.655 0.363 0.881l-0-0zM31.172 8.908c-0.182-0.48-0.638-0.815-1.172-0.815-0.156 0-0.306 0.029-0.444 0.081l0.009-0.003-3 1.114c-0.48 0.182-0.815 0.638-0.815 1.172 0 0.69 0.56 1.25 1.25 1.25 0 0 0 0 0.001 0h-0c0.156-0 0.306-0.029 0.444-0.081l-0.009 0.003 3-1.114c0.48-0.182 0.814-0.638 0.814-1.172 0-0.156-0.029-0.306-0.081-0.444l0.003 0.009zM24 6.25c0.001 0 0.001 0 0.002 0 0.345 0 0.657-0.14 0.883-0.366l3-3c0.226-0.226 0.366-0.539 0.366-0.884 0-0.691-0.56-1.251-1.251-1.251-0.346 0-0.658 0.14-0.885 0.367v0l-3 3c-0.226 0.226-0.366 0.539-0.366 0.884 0 0.69 0.56 1.25 1.25 1.25 0 0 0.001 0 0.001 0h-0z"></path>
                    </svg>
                </div>
                <span class="notification-badge"></span>
            </#if>
            <div class="text-3xl font-semibold text-bluScuro ">Ordini</div>
            <img src="/images/icons/dashboardTecnico/vectorOrdini.svg" alt="vectorOrdini"
                 class="w-full max-w-[220px] h-auto -mb-4">
        </a>

    </div>
</div>
