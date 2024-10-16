<div class="">
    <#include "../../navbar.ftl">

    <form action="${currentUrl}" method="post" class="mt-6 grid grid-cols-6 gap-4">
        <div class="mt-6 col-span-3">
            <label for="nome" class="block text-lg text-bluScuro font-medium text-gray-700">Nome:</label>
            <input type="text" id="nome" name="nome" required placeholder="Cucina..."
                   class=" block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
        </div>

        <div class="mt-6 col-span-3">
            <label for="padre" class="block text-lg text-bluScuro font-medium text-gray-700">Seleziona Padre:</label>
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
        <div class="col-span-5"></div>
        <div class="col-span-1 mt-6">
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
