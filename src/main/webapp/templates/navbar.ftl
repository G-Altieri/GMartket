<div class="flex flex-row justify-between mt-1">
    <div class="flex flex-row items-center gap-4">
        <svg id="backArrow" class="w-8 h-8 cursor-pointer fill-bluScuro hover:fill-primario transition-all duration-100" viewBox="0 0 20 14" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M18.5 8.5C19.3284 8.5 20 7.82843 20 7C20 6.17157 19.3284 5.5 18.5 5.5C17.6716 5.5 17 6.17157 17 7C17 7.82843 17.6716 8.5 18.5 8.5Z" class=" " />
            <path d="M14.5 5.50003H4.59004L6.56001 3.53C7.14003 2.94003 7.14003 1.99002 6.56001 1.41C5.96999 0.820038 5.02003 0.820038 4.44002 1.41L0.810013 5.03C-0.270004 6.12003 -0.270004 7.88004 0.810013 8.97L4.44002 12.59C4.73 12.88 5.11 13.03 5.50002 13.03C5.88002 13.03 6.26003 12.88 6.56001 12.59C7.14003 12.01 7.14003 11.06 6.56001 10.47L4.59004 8.50003H14.5C15.33 8.50003 16 7.82999 16 7.00003C16 6.17001 15.33 5.50003 14.5 5.50003Z" class=""/>
        </svg>
        <div class="text-4xl font-semibold text-bluScuro"> ${navbarTitle}</div>
    </div>
    <div class="text-2xl font-medium text-bluScuro flex flex-row items-center gap-2">
        <p>${user.nome} ${user.cognome}</p>
        <img src="/images/icons/dashboardAdmin/avatarUser.svg" alt="avatar"
             class="w-10 h-auto border border-bluScuro rounded-full">
    </div>
</div>
<div class="bg-griggioScuro h-1 w-full rounded-3xl mt-2"></div>

<script>
    $(document).ready(function() {
        // Array di percorsi in cui la freccia non deve essere visibile
        var hiddenPaths = ['/ordinante', '/tecnico', '/admin'];

        // Ottieni il percorso attuale della pagina
        var currentPath = window.location.pathname;

        // Se il percorso attuale è in uno dei percorsi specificati, nascondi la freccia
        if (hiddenPaths.includes(currentPath)) {
            $("#backArrow").hide(); // Nasconde il SVG della freccia
        } else {
            // Aggiunge un evento di click sul SVG per tornare indietro
            $("#backArrow").on("click", function() {
                window.history.back(); // Torna alla pagina precedente
            });
        }
    });
</script>