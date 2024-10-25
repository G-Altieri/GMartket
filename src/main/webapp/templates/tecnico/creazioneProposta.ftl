<!-- Include della navbar -->
<#include "../navbar.ftl">

<!-- Script JS per la gestione delle richieste -->
<script type="module" src="/scripts/crea_richiesta.js"></script>

<!-- Struttura centrale della pagina -->
<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <div class="flex flex-col items-center ">
        <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center ">
            <svg class="w-10 h-10 " viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M99.2112 25.4141L73.7772 69.4691C73.7538 69.5082 73.7265 69.5511 73.703 69.5941L70.0702 75.8949L61.1444 70.7387L76.2574 44.5547V44.543L90.2804 20.262C90.9562 19.0628 92.0851 18.1878 93.4093 17.8245C94.7374 17.4612 96.1554 17.6448 97.3468 18.3323C98.5382 19.0198 99.4054 20.1565 99.753 21.4846C100.105 22.8166 99.9093 24.2307 99.21 25.4143L99.2112 25.4141ZM60.4692 73.6871L59.8989 83.1949L67.8481 77.9488L60.4692 73.6871ZM71.8482 78.5855L73.5435 75.6519V96.0149C73.5435 98.2141 71.7623 99.9954 69.563 99.9993H4.08304C1.88384 99.9954 0.102539 98.2141 0.102539 96.0149V3.98391C0.102539 1.78471 1.88374 0.00341172 4.08304 -0.000488281H54.235V12.2805C54.2389 16.1633 57.3834 19.3039 61.2623 19.3078H73.5433V43.4678L57.9103 70.5418C57.801 70.7371 57.7346 70.9559 57.7228 71.1785L56.84 85.9085C56.8049 86.4554 57.0822 86.971 57.5588 87.2444C58.0314 87.5179 58.6213 87.5022 59.0783 87.1976L71.3983 79.0726C71.5858 78.9476 71.7381 78.7835 71.8514 78.5882L71.8482 78.5855ZM6.17624 26.3435C6.17624 26.7302 6.32858 27.0974 6.59812 27.3669C6.87156 27.6404 7.23874 27.7927 7.62152 27.7888H66.0195C66.8203 27.7888 67.4687 27.1443 67.4687 26.3435C67.4687 25.5466 66.8203 24.8982 66.0195 24.8982H7.62152C7.23871 24.8982 6.86761 25.0505 6.59812 25.3201C6.32468 25.5935 6.17234 25.9607 6.17624 26.3435ZM6.17624 36.0935C6.17233 36.4802 6.32468 36.8474 6.59812 37.1169C6.86765 37.3903 7.23874 37.5427 7.62152 37.5427H66.0195C66.8203 37.5427 67.4687 36.8942 67.4687 36.0974C67.4687 35.2966 66.8203 34.6482 66.0195 34.6482H7.62152C7.23871 34.6482 6.86761 34.8005 6.59812 35.074C6.32468 35.3474 6.17234 35.7146 6.17624 36.1013V36.0935ZM6.17624 45.8474C6.17233 46.2302 6.32468 46.5974 6.59812 46.8708C6.86765 47.1403 7.23874 47.2927 7.62152 47.2927H66.0195C66.8203 47.2927 67.4687 46.6442 67.4687 45.8474C67.4687 45.0466 66.8203 44.4021 66.0195 44.4021H7.62152C7.23871 44.4021 6.87152 44.5544 6.59812 44.824C6.32859 45.0935 6.17624 45.4646 6.17624 45.8474ZM53.0122 84.8594C53.0122 84.4766 52.8599 84.1055 52.5865 83.836C52.3169 83.5665 51.9458 83.4141 51.5631 83.4141H7.62206C7.23144 83.4024 6.85253 83.5509 6.57516 83.8243C6.29391 84.0938 6.13766 84.4688 6.13766 84.8595C6.13766 85.2502 6.29391 85.6251 6.57516 85.8947C6.8525 86.1681 7.23141 86.3166 7.62206 86.3049H51.5631C51.9459 86.3049 52.317 86.1525 52.5865 85.883C52.8599 85.6095 53.0122 85.2422 53.0122 84.8594ZM53.0122 75.1055C53.0122 74.7227 52.8599 74.3555 52.5865 74.086C52.3169 73.8126 51.9458 73.6602 51.5631 73.6602H7.62206C7.23144 73.6524 6.85253 73.797 6.57516 74.0704C6.29391 74.3438 6.13766 74.7188 6.13766 75.1095C6.13766 75.4962 6.29391 75.8712 6.57516 76.1447C6.8525 76.4181 7.23141 76.5627 7.62206 76.5549H51.5631C51.9459 76.5549 52.317 76.4025 52.5865 76.1291C52.8599 75.8595 53.0122 75.4922 53.0122 75.1055ZM53.0122 65.3516C53.0122 64.9688 52.8599 64.5977 52.5865 64.3282C52.3169 64.0587 51.9458 63.9063 51.5631 63.9063H7.62206C7.23144 63.8946 6.85253 64.0431 6.57516 64.3165C6.29391 64.586 6.13766 64.961 6.13766 65.3517C6.13766 65.7423 6.29391 66.1173 6.57516 66.3869C6.8525 66.6603 7.23141 66.8088 7.62206 66.7971H51.5631C52.3638 66.7971 53.0122 66.1485 53.0122 65.3516ZM55.8794 57.043V57.0469C56.6763 57.0469 57.3247 56.3985 57.3247 55.5977C57.3247 54.8008 56.6763 54.1524 55.8794 54.1524H7.62144C6.82456 54.1524 6.17614 54.8009 6.17614 55.5977C6.17614 56.3985 6.82458 57.0469 7.62144 57.0469L55.8794 57.043ZM61.2622 16.414L71.5002 16.4179L57.1292 2.04692V12.2809C57.1292 14.5661 58.9808 16.4137 61.262 16.4176L61.2622 16.414Z"
                      fill="#3E53A0"/>
            </svg>
            Compila la proposta
        </h1>

        <form action="/tecnico/creazioneProposta" method="POST" class="max-w-xl w-full">
            <!-- Campi hidden -->
            <input type="hidden" name="id_richiesta" value="${id_richiesta}">
            <input type="hidden" name="action" value="inserisciRichiesta">

            <ul class="space-y-4">
                <!-- Campo Nome Produttore -->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light ">
                    <h2 class="text-xl font-semibold text-bluScuro">Nome Produttore</h2>
                    <input id="nome_produttore" type="text" name="nome_produttore"
                           class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                           placeholder="Fiat..." maxlength="20">
                </li>

                <!-- Campo Nome Prodotto -->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light ">
                    <h2 class="text-xl font-semibold text-bluScuro">Nome Prodotto</h2>
                    <input id="nome_prodotto" type="text" name="nome_prodotto"
                           class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                           placeholder="Panda..." maxlength="20">
                </li>

                <!-- Campo Prezzo -->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light ">
                    <h2 class="text-xl font-semibold text-bluScuro">Prezzo</h2>
                    <input id="prezzo" type="number" step="0.01" name="prezzo"
                           class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="12000...">
                </li>

                <!-- Campo Link -->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light ">
                    <h2 class="text-xl font-semibold text-bluScuro">Link</h2>
                    <input id="link" type="text" name="link" class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                           placeholder="www.fiat.it">
                </li>

                <!-- Campo Note -->
                <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light ">
                    <h2 class="text-xl font-semibold text-bluScuro">Note</h2>
                    <input id="note" type="text" name="note" class="border border-gray-300 rounded-md px-4 py-2 flex-1"
                           placeholder="Inserisci note (OPZIONALE)" maxlength="30">
                </li>
            </ul>

            <!-- Pulsante di invio -->
            <button type="submit"
                    class="mt-6 bg-verde font-semibold text-white rounded-full py-2 px-4 w-full shadow-buttonBox hover:shadow-buttonBoxHover">
                Invia Richiesta
            </button>
        </form>
    </div>

    <!-- Script per disabilitare campi con checkbox -->
    <script>
        document.querySelectorAll('.checkbox-disabilita').forEach(function (checkbox) {
            checkbox.addEventListener('change', function () {
                const targetId = this.getAttribute('data-target');
                const input = document.getElementById(targetId);
                if (this.checked) {
                    input.disabled = true;
                    input.value = '';
                } else {
                    input.disabled = false;
                }
            });
        });
    </script>
