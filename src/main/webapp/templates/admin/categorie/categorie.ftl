<div class="">
    <#include "../../navbar.ftl">

    <div class="grid grid-cols-6 mt-6 gap-4">
        <#--    Aggiungi Categoria -->
        <a class="flex flex-row items-center justify-center col-span-2 gap-2 w-full bg-verde px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-white"
           href="/admin/categorie/aggiungi">
            <svg width="23" height="22" viewBox="0 0 23 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21.3375 5.29488C20.1481 3.42375 18.3652 1.89215 16.2791 0.990048C14.0479 0.0259833 11.5472 -0.244153 9.14761 0.224248C6.88533 0.665389 4.77594 1.7955 3.18223 3.39154C1.58075 4.995 0.494956 7.05944 0.142527 9.25275C0.0492364 9.8302 0 10.4126 0 10.9975C0 13.2602 0.730772 15.5105 2.10939 17.3519C3.47246 19.1734 5.37196 20.5687 7.57205 21.342C9.82656 22.1326 12.3532 22.2094 14.6595 21.5799C16.87 20.9752 18.8861 19.7212 20.3476 18.021C21.8636 16.2614 22.7783 14.1053 22.9649 11.8302C23.1541 9.56006 22.5736 7.24036 21.3375 5.29488ZM15.8127 11.7311H12.2832V15.1288C12.2832 15.5452 11.9256 15.855 11.5058 15.8723C11.086 15.8897 10.7284 15.5179 10.7284 15.1288V11.7311H7.17815C6.7428 11.7311 6.41888 11.3891 6.40074 10.9876C6.3826 10.5861 6.77131 10.2441 7.17815 10.2441H10.7284V6.86861C10.7284 6.45225 11.086 6.14246 11.5058 6.12512C11.9256 6.10777 12.2832 6.47951 12.2832 6.86861V10.2441H15.8127C16.248 10.2441 16.572 10.5861 16.5901 10.9876C16.6082 11.3891 16.2195 11.7311 15.8127 11.7311Z"
                      fill="#F3F4F6"/>
            </svg>
            <div class="">Aggiungi</div>
        </a>
        <div class="col-span-4"></div>
        <div class="col-span-6 my-2 text-2xl font-medium text-bluScuro">Lista Categorie</div>
        <#--    Lista Categorie -->
        <#list 1..10 as i>
            <a class="flex flex-row items-center justify-center gap-2 w-full bg-light px-4 py-3 rounded-full shadow-buttonBox hover:shadow-buttonBoxHover text-xl font-semibold text-bluScuro"
               href="/admin/categorie/aggiungi">
                <div class="">
                    Cucina ${i}
                </div>
            </a>
        </#list>
    </div>


</div>