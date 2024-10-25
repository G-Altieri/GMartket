<#include "../../navbar.ftl">
<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8 flex flex-col items-center justify-center ">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center">
        <svg class="w-10 h-10 fill-primario"  viewBox="0 0 63 95" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M61.9591 65.1999C59.3591 55.1999 54.6591 42.5 47.5591 37.7C43.1591 41.5 37.4591 43.9 31.1591 43.9C24.8591 43.9 19.1591 41.5999 14.7591 37.7999C7.55907 42.4999 2.95907 55.1999 0.359072 65.1999C-1.44093 71.9999 3.75907 78.5999 10.7591 78.5999H12.1591C13.5591 87.8999 21.5591 95 31.2591 95C40.9591 95 48.9591 87.8999 50.3591 78.5999H51.7591C58.6591 78.5999 63.7591 71.9999 61.9591 65.1999ZM31.1591 90C23.2591 90 16.8591 83.5999 16.8591 75.6999C16.8591 67.7999 23.2591 61.4 31.1591 61.4C39.0591 61.4 45.4591 67.7999 45.4591 75.6999C45.4591 83.5999 39.0591 90 31.1591 90Z" fill="#3E53A0"/>
            <path d="M31.1589 37.6C41.5418 37.6 49.9589 29.183 49.9589 18.8C49.9589 8.41705 41.5418 0 31.1589 0C20.7759 0 12.3589 8.41705 12.3589 18.8C12.3589 29.183 20.7759 37.6 31.1589 37.6Z" fill="#3E53A0"/>
            <path d="M37.9589 73.1999H33.6589V68.8999C33.6589 67.4999 32.5589 66.3999 31.1589 66.3999C29.7589 66.3999 28.6589 67.4999 28.6589 68.8999V73.1999H24.3589C22.9589 73.1999 21.8589 74.2999 21.8589 75.6999C21.8589 77.0999 22.9589 78.1999 24.3589 78.1999H28.6589V82.4999C28.6589 83.8999 29.7589 84.9999 31.1589 84.9999C32.5589 84.9999 33.6589 83.8999 33.6589 82.4999V78.1999H37.9589C39.3589 78.1999 40.4589 77.0999 40.4589 75.6999C40.4589 74.2999 39.3589 73.1999 37.9589 73.1999Z" fill="#3E53A0"/>
        </svg>

        <div>Modifica Utente</div>
    </h1>

    <form method="POST" action="/admin/utenti/modifica" class="mt-6 flex flex-col items-center justify-center w-full max-w-[500px] gap-4">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${utente.key}">

        <!-- Nome -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="nome" class="text-xl font-semibold text-bluScuro">Nome:</label>
            <input type="text" id="nome" name="new-nome" value="${utente.nome}" required class="border border-gray-300 rounded-md px-4 py-2 flex-1">
        </div>

        <!-- Cognome -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="cognome" class="text-xl font-semibold text-bluScuro">Cognome:</label>
            <input type="text" id="cognome" name="new-cognome" value="${utente.cognome}" required class="border border-gray-300 rounded-md px-4 py-2 flex-1">
        </div>

        <!-- Email -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="email" class="text-xl font-semibold text-bluScuro">Email:</label>
            <input type="email" id="email" name="new-email" value="${utente.email}" required class="border border-gray-300 rounded-md px-4 py-2 flex-1">
        </div>

        <!-- Nuova Password -->
        <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
            <label for="password" class="text-xl font-semibold text-bluScuro">Nuova Password:</label>
            <input type="password" id="password" name="new-password" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Nuova password">
        </div>

        <!-- Pulsanti di azione -->
        <div class="flex flex-row items-center justify-center gap-4 w-full mt-6">
            <a href="/admin/utenti" class="flex flex-row items-center justify-center gap-2 w-full bg-rosso2 hover:bg-red-700 px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
                <svg width="30" height="30" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.75 0C8.62386 0 6.54545 0.630477 4.77762 1.8117C3.0098 2.99293 1.63194 4.67185 0.8183 6.63615C0.0046578 8.60046 -0.208228 10.7619 0.206563 12.8472C0.621354 14.9325 1.64519 16.848 3.14861 18.3514C4.65202 19.8548 6.56749 20.8787 8.65278 21.2934C10.7381 21.7082 12.8995 21.4953 14.8639 20.6817C16.8282 19.8681 18.5071 18.4902 19.6883 16.7224C20.8695 14.9546 21.5 12.8761 21.5 10.75C21.4968 7.8999 20.3632 5.16744 18.3479 3.15211C16.3326 1.13678 13.6001 0.00317619 10.75 0ZM14.28 13.22C14.3537 13.2887 14.4128 13.3715 14.4538 13.4635C14.4948 13.5555 14.5168 13.6548 14.5186 13.7555C14.5204 13.8562 14.5018 13.9562 14.4641 14.0496C14.4264 14.143 14.3703 14.2278 14.299 14.299C14.2278 14.3703 14.143 14.4264 14.0496 14.4641C13.9562 14.5018 13.8562 14.5204 13.7555 14.5186C13.6548 14.5168 13.5555 14.4948 13.4635 14.4538C13.3715 14.4128 13.2887 14.3537 13.22 14.28L10.75 11.811L8.28 14.28C8.13783 14.4125 7.94978 14.4846 7.75548 14.4812C7.56118 14.4777 7.3758 14.399 7.23838 14.2616C7.10097 14.1242 7.02226 13.9388 7.01883 13.7445C7.0154 13.5502 7.08753 13.3622 7.22001 13.22L9.689 10.75L7.22001 8.28C7.08753 8.13782 7.0154 7.94978 7.01883 7.75548C7.02226 7.56118 7.10097 7.37579 7.23838 7.23838C7.3758 7.10097 7.56118 7.02225 7.75548 7.01882C7.94978 7.0154 8.13783 7.08752 8.28 7.22L10.75 9.689L13.22 7.22C13.3622 7.08752 13.5502 7.0154 13.7445 7.01882C13.9388 7.02225 14.1242 7.10097 14.2616 7.23838C14.399 7.37579 14.4778 7.56118 14.4812 7.75548C14.4846 7.94978 14.4125 8.13782 14.28 8.28L11.811 10.75L14.28 13.22Z" fill="white"/>
                </svg>

                Annulla
            </a>
            <button type="submit" class="flex flex-row items-center justify-center gap-2 w-full bg-verde hover:bg-green-700 px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
                <svg width="30" height="30" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0.000213623 38.9999C0.000213623 47.5585 0.000213623 53.2109 4.39081 57.6089C8.78141 61.9995 14.4418 61.9995 22.9998 61.9995H38.9998C47.5584 61.9995 53.2108 61.9995 57.6088 57.6089C61.9994 53.2183 61.9994 47.5579 61.9994 38.9999V23.6289C61.9994 19.9687 61.9994 17.3281 60.8588 14.5781C59.7182 11.8164 57.8471 9.95705 55.269 7.36725L54.6284 6.72662C52.0503 4.14852 50.1792 2.27742 47.4175 1.13682C44.6558 -0.00378394 42.0191 -0.00378418 38.3667 -0.00378418H22.9957C14.4371 -0.00378418 8.78469 -0.00378418 4.38669 4.38682C-0.00390625 8.77742 -0.00390625 14.4378 -0.00390625 22.9958V38.9958L0.000213623 38.9999ZM6.00021 22.9999C6.00021 14.6601 6.10177 11.1719 8.64081 8.64095C11.172 6.10185 14.6603 6.00035 22.9998 6.00035H27.9998V34.7623L21.1209 27.8834C19.992 26.7545 18.0115 26.7545 16.8826 27.8834C16.3123 28.4538 16.0037 29.2037 16.0037 30.0045C16.0037 30.8053 16.3123 31.5553 16.8826 32.1256L23.7615 39.0045C25.6912 40.9342 28.2732 42.0045 30.9998 42.0045C33.7303 42.0045 36.3084 40.9342 38.2381 39.0045L45.117 32.1256C45.6873 31.5553 45.9959 30.8053 45.9959 30.0045C45.9959 29.2038 45.6873 28.4537 45.117 27.8834C43.9881 26.7545 42.0076 26.7545 40.8787 27.8834L33.9998 34.7623V6.00035H38.3709C41.91 6.00035 43.5428 6.0316 45.1326 6.68004C46.7224 7.3402 47.8943 8.46914 50.3943 10.9691L51.0232 11.598C53.5232 14.098 54.6638 15.2777 55.3123 16.8597C55.9725 18.4495 56.0037 20.0785 56.0037 23.6214V38.9924C56.0037 47.3322 55.9022 50.8204 53.3631 53.3514C50.824 55.8905 47.3436 55.9921 39.0041 55.9921H23.0041C14.6643 55.9921 11.1761 55.8905 8.64513 53.3514C6.10603 50.8123 6.00453 47.3319 6.00453 38.9924V22.9924L6.00021 22.9999Z"
                          fill="#F3F4F6"/>
                </svg>
                Salva Modifiche
            </button>
        </div>
    </form>
</div>
