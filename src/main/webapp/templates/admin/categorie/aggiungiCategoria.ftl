<div class="">
    <#include "../../navbar.ftl">

    <div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8 flex flex-row items-center justify-center ">

        <form action="${currentUrl}" method="post" class="mt-6 flex flex-col items-center justify-center w-full max-w-[500px]  gap-4">
            <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center col-span-6">
                <svg class="w-10 h-10 fill-primario" viewBox="0 0 70 88" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18.6209 19.2151C18.9334 19.2151 19.203 18.9495 19.203 18.6487C19.1913 14.6018 19.2108 5.61768 19.203 1.64868C19.1405 1.67993 19.0936 1.74243 19.0311 1.80493C18.7186 2.15649 1.93709 18.8359 1.62109 19.2149L18.6209 19.2151Z" fill="#3E53A0"/>
                    <path d="M64.8202 62.02C55.5702 53.6216 40.2502 60.4731 40.3472 73.024C40.2769 81.0787 47.0816 87.813 55.0702 87.747C68.5782 87.7548 74.8592 70.821 64.8202 62.017V62.02ZM57.4257 75.379V81.0157C57.4257 82.3204 56.3749 83.3712 55.0702 83.3712C53.7655 83.3712 52.7147 82.3204 52.7147 81.0157V75.379H47.078C45.7733 75.379 44.7225 74.3282 44.7225 73.0235C44.7225 71.7344 45.7733 70.668 47.078 70.668H52.7147V65.0469C52.7147 63.7422 53.7655 62.6914 55.0702 62.6914C56.3749 62.6914 57.4257 63.7422 57.4257 65.0469V70.668H63.0624C64.3671 70.668 65.4179 71.7344 65.4179 73.0235C65.4179 74.3282 64.3671 75.379 63.0624 75.379H57.4257Z" fill="#3E53A0"/>
                    <path d="M35.6411 73.0229C35.4341 57.3199 54.1531 47.9179 66.5981 57.4059V5.52291C66.5981 2.62061 64.2426 0.249512 61.3247 0.249512H23.9187C23.9226 3.25341 23.9148 15.3975 23.9187 18.6475C23.9187 21.5498 21.5476 23.9209 18.6296 23.9209C15.3366 23.9287 3.35658 23.917 0.246582 23.9209V81.4829C0.246582 84.3852 2.61768 86.7563 5.51998 86.7563H41.344C37.719 83.1079 35.6565 78.3032 35.6448 73.0223L35.6411 73.0229ZM12.2031 48.9409H35.6251C38.7149 48.9878 38.7267 53.6011 35.6251 53.6518H12.2031C9.11328 53.6049 9.10148 48.9916 12.2031 48.9409ZM12.2031 59.0189H29.5661C32.6559 59.0775 32.6638 63.6791 29.5661 63.7298H12.2031C9.11328 63.6829 9.10148 59.0814 12.2031 59.0189ZM12.2031 69.0969H26.5351C29.6289 69.1555 29.6328 73.7571 26.5351 73.8078H12.2031C9.11328 73.7609 9.10538 69.1594 12.2031 69.0969Z" fill="#3E53A0"/>
                </svg>
                Aggiungi Categoria
            </h1>
            <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
                <h2 class="text-xl font-semibold text-bluScuro">Nome:</h2>
                <input id="nome_prodotto" id="nome" type="text" name="nome"
                       class="border border-gray-300 rounded-md px-4 py-2 flex-1" required
                       placeholder="Cucina..." maxlength="20">
            </div>

            <div class="flex flex-row items-center justify-between gap-4 bg-white shadow rounded-lg p-4 rounded-2xl bg-light w-full">
                <h2 class="text-xl font-semibold text-bluScuro">Categoria Padre:</h2>
                <select id="padre" name="padre"
                        class="block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
                    <option value="">Nessun Padre...</option>
                    <#if (categorie?size>0)>
                        <#list categorie as categoria>
                            <option value="${categoria.key}">${categoria.nome}</option>
                        </#list>
                    <#else>
                        <div>Nessuna categoria disponibile</div>
                    </#if>
                </select>
            </div>


            <div class=" mt-6">
                <button type="submit"
                        class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-verde px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white">
                    <svg width="30" height="30" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M0.000213623 38.9999C0.000213623 47.5585 0.000213623 53.2109 4.39081 57.6089C8.78141 61.9995 14.4418 61.9995 22.9998 61.9995H38.9998C47.5584 61.9995 53.2108 61.9995 57.6088 57.6089C61.9994 53.2183 61.9994 47.5579 61.9994 38.9999V23.6289C61.9994 19.9687 61.9994 17.3281 60.8588 14.5781C59.7182 11.8164 57.8471 9.95705 55.269 7.36725L54.6284 6.72662C52.0503 4.14852 50.1792 2.27742 47.4175 1.13682C44.6558 -0.00378394 42.0191 -0.00378418 38.3667 -0.00378418H22.9957C14.4371 -0.00378418 8.78469 -0.00378418 4.38669 4.38682C-0.00390625 8.77742 -0.00390625 14.4378 -0.00390625 22.9958V38.9958L0.000213623 38.9999ZM6.00021 22.9999C6.00021 14.6601 6.10177 11.1719 8.64081 8.64095C11.172 6.10185 14.6603 6.00035 22.9998 6.00035H27.9998V34.7623L21.1209 27.8834C19.992 26.7545 18.0115 26.7545 16.8826 27.8834C16.3123 28.4538 16.0037 29.2037 16.0037 30.0045C16.0037 30.8053 16.3123 31.5553 16.8826 32.1256L23.7615 39.0045C25.6912 40.9342 28.2732 42.0045 30.9998 42.0045C33.7303 42.0045 36.3084 40.9342 38.2381 39.0045L45.117 32.1256C45.6873 31.5553 45.9959 30.8053 45.9959 30.0045C45.9959 29.2038 45.6873 28.4537 45.117 27.8834C43.9881 26.7545 42.0076 26.7545 40.8787 27.8834L33.9998 34.7623V6.00035H38.3709C41.91 6.00035 43.5428 6.0316 45.1326 6.68004C46.7224 7.3402 47.8943 8.46914 50.3943 10.9691L51.0232 11.598C53.5232 14.098 54.6638 15.2777 55.3123 16.8597C55.9725 18.4495 56.0037 20.0785 56.0037 23.6214V38.9924C56.0037 47.3322 55.9022 50.8204 53.3631 53.3514C50.824 55.8905 47.3436 55.9921 39.0041 55.9921H23.0041C14.6643 55.9921 11.1761 55.8905 8.64513 53.3514C6.10603 50.8123 6.00453 47.3319 6.00453 38.9924V22.9924L6.00021 22.9999Z"
                              fill="#F3F4F6"/>
                    </svg>
                    Salva
                </button>
            </div>

        </form>
    </div>
</div>