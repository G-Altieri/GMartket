<#include "../../navbar.ftl">
<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8 flex flex-col items-center justify-center ">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center">
        <svg class="w-10 h-10 fill-primario" viewBox="0 0 64 96" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M62.7999 65.6999C60.1999 55.6999 55.4999 43 48.3999 38.2C43.9999 42 38.2999 44.4 31.9999 44.4C25.6999 44.4 19.9999 42.0999 15.5999 38.2999C8.39989 42.9999 3.79989 55.6999 1.19989 65.6999C-0.600108 72.4999 4.59989 79.0999 11.5999 79.0999H12.9999C14.3999 88.3999 22.3999 95.5 32.0999 95.5C41.7999 95.5 49.7999 88.3999 51.1999 79.0999H52.5999C59.4999 79.0999 64.5999 72.4999 62.7999 65.6999ZM31.9999 90.5C24.0999 90.5 17.6999 84.0999 17.6999 76.1999C17.6999 68.2999 24.0999 61.9 31.9999 61.9C39.8999 61.9 46.2999 68.2999 46.2999 76.1999C46.2999 84.0999 39.8999 90.5 31.9999 90.5Z"
                  fill="#3E53A0"/>
            <path d="M31.9997 38.1C42.3827 38.1 50.7997 29.683 50.7997 19.3C50.7997 8.91705 42.3827 0.5 31.9997 0.5C21.6168 0.5 13.1997 8.91705 13.1997 19.3C13.1997 29.683 21.6168 38.1 31.9997 38.1Z"
                  fill="#3E53A0"/>
            <path d="M38.7997 73.6999H34.4997V69.3999C34.4997 67.9999 33.3997 66.8999 31.9997 66.8999C30.5997 66.8999 29.4997 67.9999 29.4997 69.3999V73.6999H25.1997C23.7997 73.6999 22.6997 74.7999 22.6997 76.1999C22.6997 77.5999 23.7997 78.6999 25.1997 78.6999H29.4997V82.9999C29.4997 84.3999 30.5997 85.4999 31.9997 85.4999C33.3997 85.4999 34.4997 84.3999 34.4997 82.9999V78.6999H38.7997C40.1997 78.6999 41.2997 77.5999 41.2997 76.1999C41.2997 74.7999 40.1997 73.6999 38.7997 73.6999Z"
                  fill="#3E53A0"/>
        </svg>
        <div>Aggiungi Utente</div>
    </h1>

    <form method="POST" action="gestioneutente" class="mt-6 flex flex-col items-center justify-center w-full max-w-[500px] gap-4">
        <input type="hidden" name="action" value="createUser">

        <!-- Selezione ruolo -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <h2 class="text-xl font-semibold text-bluScuro">Ruolo:</h2>
            <div class="flex gap-4">
                <input type="radio" id="role-ordinante" name="role" value="ORDINANTE" checked>
                <label for="role-ordinante" class="lblue-button">Ordinante</label>
                <input type="radio" id="role-tecnico" name="role" value="TECNICO">
                <label for="role-tecnico" class="lblue-button">Tecnico</label>
            </div>
        </div>

        <!-- Input campi utente -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="email" class="text-xl font-semibold text-bluScuro">Email:</label>
            <input type="email" id="email" name="email" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="mario@gmail.com" required>
        </div>

        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="nome" class="text-xl font-semibold text-bluScuro">Nome:</label>
            <input type="text" id="nome" name="nome" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Mario" required>
        </div>

        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="cognome" class="text-xl font-semibold text-bluScuro">Cognome:</label>
            <input type="text" id="cognome" name="cognome" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Rossi" required>
        </div>

        <!-- Input password -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="temp-password" class="text-xl font-semibold text-bluScuro">Password:</label>
            <input type="password" id="temp-password" name="temp-password" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="******" required>
        </div>

        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="confirm-password" class="text-xl font-semibold text-bluScuro">Ripeti password:</label>
            <input type="password" id="confirm-password" name="confirm-password" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="******" required>
        </div>

        <#if error?exists>
            <h2 class="text-bluScuro text-sm bg-TrossoChiaro px-2 py-1 rounded-xl text-center">${error}</h2>
        </#if>

        <!-- Pulsanti di azione -->
        <div class="mt-6 w-full">
            <button type="submit" class="flex flex-row items-center justify-center gap-2 w-full bg-verde px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
                <svg width="30" height="30" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0.000213623 38.9999C0.000213623 47.5585 0.000213623 53.2109 4.39081 57.6089C8.78141 61.9995 14.4418 61.9995 22.9998 61.9995H38.9998C47.5584 61.9995 53.2108 61.9995 57.6088 57.6089C61.9994 53.2183 61.9994 47.5579 61.9994 38.9999V23.6289C61.9994 19.9687 61.9994 17.3281 60.8588 14.5781C59.7182 11.8164 57.8471 9.95705 55.269 7.36725L54.6284 6.72662C52.0503 4.14852 50.1792 2.27742 47.4175 1.13682C44.6558 -0.00378394 42.0191 -0.00378418 38.3667 -0.00378418H22.9957C14.4371 -0.00378418 8.78469 -0.00378418 4.38669 4.38682C-0.00390625 8.77742 -0.00390625 14.4378 -0.00390625 22.9958V38.9958L0.000213623 38.9999ZM6.00021 22.9999C6.00021 14.6601 6.10177 11.1719 8.64081 8.64095C11.172 6.10185 14.6603 6.00035 22.9998 6.00035H27.9998V34.7623L21.1209 27.8834C19.992 26.7545 18.0115 26.7545 16.8826 27.8834C16.3123 28.4538 16.0037 29.2037 16.0037 30.0045C16.0037 30.8053 16.3123 31.5553 16.8826 32.1256L23.7615 39.0045C25.6912 40.9342 28.2732 42.0045 30.9998 42.0045C33.7303 42.0045 36.3084 40.9342 38.2381 39.0045L45.117 32.1256C45.6873 31.5553 45.9959 30.8053 45.9959 30.0045C45.9959 29.2038 45.6873 28.4537 45.117 27.8834C43.9881 26.7545 42.0076 26.7545 40.8787 27.8834L33.9998 34.7623V6.00035H38.3709C41.91 6.00035 43.5428 6.0316 45.1326 6.68004C46.7224 7.3402 47.8943 8.46914 50.3943 10.9691L51.0232 11.598C53.5232 14.098 54.6638 15.2777 55.3123 16.8597C55.9725 18.4495 56.0037 20.0785 56.0037 23.6214V38.9924C56.0037 47.3322 55.9022 50.8204 53.3631 53.3514C50.824 55.8905 47.3436 55.9921 39.0041 55.9921H23.0041C14.6643 55.9921 11.1761 55.8905 8.64513 53.3514C6.10603 50.8123 6.00453 47.3319 6.00453 38.9924V22.9924L6.00021 22.9999Z"
                          fill="#F3F4F6"/>
                </svg>
                Salva
            </button>
        </div>
    </form>
</div>

