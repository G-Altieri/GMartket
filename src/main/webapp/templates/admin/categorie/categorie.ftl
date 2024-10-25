<div class="">
    <#include "../../navbar.ftl">

    <div class="bg-light p-6 rounded-2xl shadow-normalBox grid grid-cols-6 mt-6 gap-4">
        <#--    Aggiungi Categoria -->
        <a class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-verde px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white"
           href="/admin/categorie/aggiungi">
            <svg width="23" height="22" viewBox="0 0 23 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21.3375 5.29488C20.1481 3.42375 18.3652 1.89215 16.2791 0.990048C14.0479 0.0259833 11.5472 -0.244153 9.14761 0.224248C6.88533 0.665389 4.77594 1.7955 3.18223 3.39154C1.58075 4.995 0.494956 7.05944 0.142527 9.25275C0.0492364 9.8302 0 10.4126 0 10.9975C0 13.2602 0.730772 15.5105 2.10939 17.3519C3.47246 19.1734 5.37196 20.5687 7.57205 21.342C9.82656 22.1326 12.3532 22.2094 14.6595 21.5799C16.87 20.9752 18.8861 19.7212 20.3476 18.021C21.8636 16.2614 22.7783 14.1053 22.9649 11.8302C23.1541 9.56006 22.5736 7.24036 21.3375 5.29488ZM15.8127 11.7311H12.2832V15.1288C12.2832 15.5452 11.9256 15.855 11.5058 15.8723C11.086 15.8897 10.7284 15.5179 10.7284 15.1288V11.7311H7.17815C6.7428 11.7311 6.41888 11.3891 6.40074 10.9876C6.3826 10.5861 6.77131 10.2441 7.17815 10.2441H10.7284V6.86861C10.7284 6.45225 11.086 6.14246 11.5058 6.12512C11.9256 6.10777 12.2832 6.47951 12.2832 6.86861V10.2441H15.8127C16.248 10.2441 16.572 10.5861 16.5901 10.9876C16.6082 11.3891 16.2195 11.7311 15.8127 11.7311Z"
                      fill="#F3F4F6"/>
            </svg>
            <div class="">Aggiungi Categoria</div>
        </a>

        <div class="col-span-4"></div>

        <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center col-span-6">
            <svg class="w-10 h-10 fill-primario" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M14.8052 5.28882V7.29486L11.4247 9.2292V6.33958C11.6416 6.6998 12.0871 6.84834 12.4662 6.65201L14.8052 5.28882Z"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M14.9707 3.33386L15.3079 4.01251L15.3087 4.01165C15.3736 4.14738 15.3292 4.30958 15.2037 4.39238C15.2037 4.39238 12.4618 5.99208 12.2007 6.14232C12.0897 6.19696 11.9753 6.14232 11.9155 6.03989C11.7764 5.81111 11.6484 5.54479 11.5203 5.30746L14.9707 3.33386Z"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M7.75929 2.93264L11.1362 1L14.5132 2.93264L11.1362 4.86527L7.75929 2.93264Z"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M10.8486 6.33952V9.22914L7.46819 7.2948V5.28876C8.24159 5.74033 9.0184 6.1919 9.79007 6.64262C10.1734 6.85176 10.6267 6.70572 10.8486 6.33952Z"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M10.8476 16.8315C10.8476 16.9903 10.9774 17.1201 11.1362 17.1201C11.2949 17.1201 11.4247 16.9903 11.4247 16.8315V13.0208H19.431V16.8315C19.4276 16.9101 19.4566 16.986 19.5112 17.0424C19.5658 17.0987 19.6401 17.1303 19.7186 17.1303C19.7972 17.1303 19.8723 17.0987 19.9261 17.0424C19.9807 16.986 20.0097 16.9101 20.0072 16.8315V12.7341C20.0063 12.5753 19.8774 12.4464 19.7186 12.4464H11.4248V10.9398C11.4248 10.781 11.295 10.6512 11.1362 10.6512C10.9775 10.6512 10.8477 10.781 10.8477 10.9398V12.4456H2.55384C2.39507 12.4456 2.26617 12.5745 2.26532 12.7332V16.8307C2.26276 16.9092 2.29178 16.9852 2.34641 17.0415C2.40019 17.0979 2.47531 17.1295 2.55384 17.1295C2.63238 17.1295 2.70665 17.0979 2.76128 17.0415C2.81591 16.9852 2.84493 16.9092 2.84152 16.8307V13.0208H10.8478L10.8476 16.8315Z"/>
                <path d="M18.6191 18.7898C18.0121 19.3968 18.0121 20.381 18.6191 20.988C19.226 21.595 20.2102 21.595 20.8173 20.988C21.4242 20.3811 21.4242 19.3969 20.8173 18.7898C20.2103 18.1829 19.2261 18.1829 18.6191 18.7898Z"/>
                <path d="M9.5827 19.8892C9.5827 20.7472 10.2784 21.4429 11.1363 21.4429C11.9942 21.4429 12.6899 20.7472 12.6899 19.8892C12.6899 19.0305 11.9942 18.3348 11.1363 18.3348C10.2784 18.3348 9.5827 19.0305 9.5827 19.8892Z"/>
                <path d="M1.04155 19.5333C0.84436 20.3682 1.36165 21.2056 2.19653 21.4028C3.03223 21.6 3.86878 21.0827 4.06599 20.247C4.26317 19.4121 3.74588 18.5747 2.91101 18.3775C2.07531 18.1803 1.23875 18.6976 1.04155 19.5333Z"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M10.7515 5.3076L10.3588 6.03745C10.2973 6.14159 10.1778 6.20135 10.0651 6.13989L7.07061 4.38994C6.92805 4.30714 6.90671 4.13727 6.97159 3.99641L7.30109 3.33228L10.7515 5.3076Z"/>
            </svg>
            Lista Categorie
        </h1>

        <div class="col-span-2 my-2 text-lg font-medium text-bluScuro flex-row items-center flex gap-4">
            <div class="rounded-full h-8 w-8 bg-primario/30"></div>
            Ha un Padre
        </div>
        <div class="col-span-2 my-2 text-lg font-medium text-bluScuro flex-row items-center flex gap-4">
            <div class="rounded-full h-8 w-8 bg-bluChiaro/10"></div>
            Non ha il Padre
        </div>
        <div class="col-span-2"></div>

        <#--    Lista Categorie -->
        <#if (categorie?size>0)>
            <#list categorie as categoria>
                <a class="flex flex-row items-center justify-center gap-2 w-full px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-bluScuro
                <#if categoria.getPadre()?has_content && categoria.getPadre() != 0>
                   bg-primario/30
                <#else>
                    bg-bluChiaro/10
                </#if>" href="/admin/categorie/visualizza/${categoria.key}">
                    <div class="">
                        ${categoria.nome}
                    </div>
                </a>
            </#list>
        <#else>
            <div>Nessuna categoria disponibile</div>
        </#if>
    </div>


</div>