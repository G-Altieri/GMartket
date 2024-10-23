<!-- Include della navbar -->
<#include "../navbar.ftl">

<!-- Script JS per la gestione delle richieste -->
<script type="module" src="/scripts/crea_richiesta.js"></script>

<!-- Struttura centrale della pagina -->
<div class="flex flex-col items-center mt-12">
    <h2 class="text-3xl font-bold text-bluScuro mb-8">Compila le Informazioni del Prodotto</h2>

    <form action="/tecnico/creazioneProposta" method="POST" class="max-w-xl w-full">
        <!-- Campi hidden -->
        <input type="hidden" name="id_richiesta" value="${id_richiesta}">
        <input type="hidden" name="action" value="inserisciRichiesta">

        <ul class="space-y-4">
            <!-- Campo Nome Produttore -->
            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold">Nome Produttore</h2>
                <input id="nome_produttore" type="text" name="nome_produttore" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci il nome del produttore" maxlength="20">
            </li>

            <!-- Campo Nome Prodotto -->
            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold">Nome Prodotto</h2>
                <input id="nome_prodotto" type="text" name="nome_prodotto" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci il nome del prodotto" maxlength="20">
            </li>

            <!-- Campo Prezzo -->
            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold">Prezzo</h2>
                <input id="prezzo" type="number" step="0.01" name="prezzo" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci il prezzo">
            </li>

            <!-- Campo Link -->
            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold">Link</h2>
                <input id="link" type="text" name="link" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci il link al prodotto">
                </li>

            <!-- Campo Note -->
            <li class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light border border-bluScuro">
                <h2 class="text-xl font-semibold">Note</h2>
                <input id="note" type="text" name="note" class="border border-gray-300 rounded-md px-4 py-2 flex-1" placeholder="Inserisci note (OPZIONALE)" maxlength="30">
            </li>
        </ul>

        <!-- Pulsante di invio -->
        <button type="submit" class="mt-6 bg-verde font-semibold text-white rounded-full py-2 px-4 w-full">
            Invia Richiesta
        </button>
    </form>
</div>

<!-- Script per disabilitare campi con checkbox -->
<script>
    document.querySelectorAll('.checkbox-disabilita').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
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
