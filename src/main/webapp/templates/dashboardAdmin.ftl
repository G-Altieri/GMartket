<div class="">
    <#--    Header -->
    <div class="flex flex-row justify-between mt-1">
        <div class="text-4xl font-semibold text-bluScuro">Dashboard Admin</div>
        <div class="text-2xl font-medium text-bluScuro flex flex-row items-center gap-2">
            <p>Giovanni Altieri</p>
            <img src="/images/icons/avatarUser.svg" alt="avatar" class="w-8 h-auto">
        </div>
    </div>
    <div class="bg-griggioScuro h-1 w-full rounded-3xl mt-2"></div>

    <#--    Sezione 1 Presentazione Admin-->
    <div class="grid grid-cols-6 mt-6">
        <div class="bg-white p-4 w-full rounded-3xl md:col-span-3 col-span-4 shadow-normalBox grid grid-cols-2">
            <div class="flex flex-col">
                <div class="text-bluScuro font-semibold text-2xl">Ciao, Giovanni</div>
                <div class="text-bluScuro font-normal text-md mt-4">al momento ci sono 23 utenti nel sistema</div>
                <div class="text-bluScuro font-normal text-md">e ben 23 categorie</div>
            </div>
            <div class="">
                <img src="/images/icons/vectorAdmin.svg" alt="vectorAdmin" class="w-full max-w-[380px] h-auto -mb-4">
            </div>
        </div>
        <div class="col-span-2"></div>
    </div>

    <#--    Sezione 2 Gestione -->
    <div class="text-2xl font-medium text-bluScuro mt-12">Gestione Piattaforma</div>
    <div class="grid grid-cols-6 mt-2 gap-4">
        <a href="#" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-bold text-bluScuro ">Categorie</div>
            <img src="/images/icons/vectorCategorie.svg" alt="vectorAdmin" class="w-full max-w-[220px] h-auto -mb-4">
        </a>

        <a href="#" class="bg-white p-4 w-full rounded-3xl  col-span-3 min-h-[240px] shadow-buttonBox hover:shadow-buttonBoxHover duration-300 transition-all flex flex-row items-center justify-center gap-6">
            <div class="text-3xl font-bold text-bluScuro ">Utenti</div>
            <img src="/images/icons/vectorUtenti.svg" alt="vectorAdmin" class="w-full max-w-[150px] h-auto -mb-4">
        </a>

    </div>
</div>