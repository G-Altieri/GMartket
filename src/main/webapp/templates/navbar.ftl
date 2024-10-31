<div class="flex flex-row justify-between mt-1">
    <div class="flex flex-row items-center gap-4">
        <a id="backArrow" class="text-4xl font-semibold text-bluScuro" href="${backPage}">
        <svg class="w-8 h-8 cursor-pointer fill-bluScuro hover:fill-primario transition-all duration-100"
             viewBox="0 0 20 14" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M18.5 8.5C19.3284 8.5 20 7.82843 20 7C20 6.17157 19.3284 5.5 18.5 5.5C17.6716 5.5 17 6.17157 17 7C17 7.82843 17.6716 8.5 18.5 8.5Z"
                  class=" "/>
            <path d="M14.5 5.50003H4.59004L6.56001 3.53C7.14003 2.94003 7.14003 1.99002 6.56001 1.41C5.96999 0.820038 5.02003 0.820038 4.44002 1.41L0.810013 5.03C-0.270004 6.12003 -0.270004 7.88004 0.810013 8.97L4.44002 12.59C4.73 12.88 5.11 13.03 5.50002 13.03C5.88002 13.03 6.26003 12.88 6.56001 12.59C7.14003 12.01 7.14003 11.06 6.56001 10.47L4.59004 8.50003H14.5C15.33 8.50003 16 7.82999 16 7.00003C16 6.17001 15.33 5.50003 14.5 5.50003Z"
                  class=""/>
        </svg></a>
        <div class="text-4xl font-semibold text-bluScuro"> ${navbarTitle}</div>


    </div>
    <div class="text-2xl font-medium text-bluScuro flex flex-row items-center gap-2 relative">

        <a href="<#if user.ruolo == 'AMMINISTRATORE'>
              /admin/notifiche
          <#elseif user.ruolo == 'ORDINANTE'>
              /ordinante/notifiche
          <#elseif user.ruolo == 'TECNICO'>
              /tecnico/notifiche
          <#else>
              /notifiche
          </#if>" class="relative">
            <#if notificheNonLette?? && (notificheNonLette?size > 0)>
            <span class="notification-badge2"></span></#if>
            <svg class="w-8 h-8 mr-4 cursor-pointer" viewBox="0 0 52 61" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M30.5899 55.5901L30.5313 55.6487C30.5313 55.6487 28.961 57.0003 26.0118 57.0003C23.4806 57.0003 21.8712 56.012 21.4727 55.6292C21.0508 55.2073 20.5508 55.0002 20.0118 55.0002C19.4727 55.0002 18.9727 55.2112 18.6016 55.5901C18.2226 55.969 18.0117 56.469 18.0117 57.0003C18.0117 57.5316 18.2227 58.0394 18.6016 58.4105C18.8633 58.68 21.3204 61.0003 26.0118 61.0003C30.7032 61.0003 33.1602 58.68 33.422 58.4105C33.8009 58.0316 34.0118 57.5316 34.0118 56.9886C34.0118 56.4495 33.8009 55.9495 33.422 55.5784C32.711 54.8674 31.3009 54.8674 30.5939 55.5784L30.5899 55.5901Z"
                      fill="#323954"/>
                <path d="M51.9411 39.32C52.2418 36.9489 51.4528 34.6208 49.7614 32.9294L44.613 27.781C44.5817 27.7303 44.5348 27.5896 44.5114 27.3592L43.863 16.9372V16.8786C43.1442 7.55827 35.7224 0.308568 26.601 0.00756836H26.0502C16.7494 0.00756836 8.90218 7.25757 8.19118 16.5196V16.5782L7.51149 27.3672C7.49196 27.6054 7.43336 27.7461 7.40211 27.7969L2.26151 32.9375C0.570107 34.6289 -0.218992 36.957 0.081808 39.3281C0.570088 43.1367 3.88261 46.0078 7.79271 46.0078H44.2537C48.1639 46.0078 51.4725 43.1367 51.9646 39.3281L51.9411 39.32ZM4.03106 38.8083C3.89044 37.6677 4.26153 36.5583 5.07016 35.7497L10.2421 30.5778C10.953 29.8669 11.3905 28.8161 11.4804 27.6364L12.16 16.8084C12.7186 9.53892 18.7694 3.99942 26.031 3.99942H26.4529C33.531 4.22989 39.3049 9.89782 39.8629 17.1794L40.5114 27.6404C40.6012 28.8201 41.0426 29.8592 41.7302 30.5623L46.9216 35.7537C47.7302 36.5623 48.113 37.6756 47.9607 38.8123C47.7302 40.6326 46.1209 42.0037 44.2224 42.0037L7.76937 41.9998C5.87097 41.9998 4.25766 40.6286 4.03106 38.8083Z"
                      fill="#323954"/>
            </svg>
        </a>

        <p>${user.nome} ${user.cognome}</p>
        <img src="/images/icons/dashboardAdmin/avatarUser.svg" alt="avatar"
             class="w-10 h-auto border border-bluScuro rounded-full">
    </div>
</div>
<div class="bg-griggioScuro h-1 w-full rounded-3xl mt-2"></div>

<script>
    $(document).ready(function () {
        // Array di percorsi in cui la freccia non deve essere visibile
        var hiddenPaths = ['/ordinante', '/tecnico', '/admin'];

        // Ottieni il percorso attuale della pagina
       var currentPath = window.location.pathname;

        // Se il percorso attuale è in uno dei percorsi specificati, nascondi la freccia
        if (hiddenPaths.includes(currentPath)) {
            $("#backArrow").hide(); // Nasconde il SVG della freccia
        } else {
            // Aggiunge un evento di click sul SVG per tornare indietro
          /*  $("#backArrow").on("click", function () {
                window.history.back(); // Torna alla pagina precedente
            }); */
        }
    });
</script>