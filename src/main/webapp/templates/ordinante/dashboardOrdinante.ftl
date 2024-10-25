<div class="">
    <#include "../navbar.ftl">

    <#--    Sezione 1 Presentazione Admin-->
    <div class="grid grid-cols-6 mt-6">
        <div class="bg-white p-4 w-full rounded-3xl md:col-span-3 col-span-4 shadow-normalBox grid grid-cols-2">
            <div class="flex flex-col">
                <div class="text-bluScuro font-semibold text-2xl">Ciao, ${user.nome} ${user.cognome}</div>
            </div>
            <div class="">
                <img src="/images/icons/dashboardOrdinante/vectorOrdinante.svg" alt="vectorOrdinante" class="w-full max-w-[380px] h-auto -mb-4">
            </div>
        </div>
        <div class="col-span-2"></div>
    </div>

    <#--    Sezione 2 Gestione -->
    <div class="text-2xl font-medium text-bluScuro mt-12">Gestione Piattaforma</div>
    <div class="grid grid-cols-6 mt-2 gap-4">
        <a href="/ordinante/crea-richiesta" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-semibold text-bluScuro ">Nuova Richiesta</div>
            <img src="/images/icons/dashboardOrdinante/vectorRichiesta.svg" alt="vectorOrdinante" class="w-full max-w-[220px] h-auto ">
        </a>
        <a href="/ordinante/lista-richieste" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-semibold text-bluScuro ">Le mie Richieste</div>
            <img src="/images/icons/dashboardOrdinante/vectorMieRichieste.svg" alt="vectorOrdinante" class="w-full max-w-[220px] h-auto -mb-4">
        </a>
        <a href="/ordinante/lista-ordini" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-semibold text-bluScuro ">I miei Ordini</div>
            <img src="/images/icons/dashboardTecnico/vectorOrdini.svg" alt="vectorOrdinante" class="w-full max-w-[220px] h-auto -mb-4">
        </a>
    </div>
</div>