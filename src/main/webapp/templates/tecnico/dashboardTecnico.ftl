<div class="">
    <#include "../navbar.ftl">

    <#--    Sezione 1 Presentazione Admin-->
    <div class="grid grid-cols-6 mt-6">
        <div class="bg-white p-4 w-full rounded-3xl md:col-span-3 col-span-4 shadow-normalBox grid grid-cols-2">
            <div class="flex flex-col">
                <div class="text-bluScuro font-semibold text-2xl">Ciao, ${user.nome} ${user.cognome}</div>

            </div>
            <div class="">
<#--                <img src="/images/icons/dashboardAdmin/vectorAdmin.svg" alt="vectorAdmin" class="w-full max-w-[380px] h-auto -mb-4">-->
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

        <a href="/tecnico/lista-richieste" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-semibold text-bluScuro ">Tutte le Richieste</div>
            <img src="/images/icons/dashboardAdmin/vectorCategorie.svg" alt="vectorAdmin" class="w-full max-w-[220px] h-auto -mb-4">
        </a>
        <a href="/tecnico/lista-richiesteProprie" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-semibold text-bluScuro ">Tutte le Mie Richieste</div>
            <img src="/images/icons/dashboardAdmin/vectorCategorie.svg" alt="vectorAdmin" class="w-full max-w-[220px] h-auto -mb-4">
        </a>


    </div>
</div>