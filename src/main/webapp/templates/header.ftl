<div class="h-full flex ">
    <!-- Sidebar fissa -->
    <div class="bg-primario text-white w-24 md:w-80 h-full fixed top-4 hSideBar rounded-3xl transition-all duration-300">
        <div class=" flex flex-col  items-center">
            <a href="/admin" class="p-4 pt-8 flex flex-row items-center justify-center w-full gap-2 mb-12">
                <img src="/images/logoGMarket.png" alt="Logo GMarket" class="w-12 h-auto">
                <h1 class="text-3xl font-semibold hidden md:block">GMarket</h1>
            </a>

            <ul class="menu">
                <li class="<#if currentUrl?ends_with('/admin')>active</#if>">
                    <a href="/admin" class="flex flex-row gap-2 items-center">
                        <svg class="icon w-12 h-auto" width="31" height="32" viewBox="0 0 31 32"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M11.4287 3.25488H5.13616C3.74605 3.25488 2.61914 4.39612 2.61914 5.8039V14.7255C2.61914 16.1333 3.74605 17.2745 5.13616 17.2745H11.4287C12.8188 17.2745 13.9457 16.1333 13.9457 14.7255V5.8039C13.9457 4.39612 12.8188 3.25488 11.4287 3.25488Z"/>
                            <path d="M25.2725 3.25488H18.9799C17.5898 3.25488 16.4629 4.39612 16.4629 5.8039V9.62743C16.4629 11.0352 17.5898 12.1765 18.9799 12.1765H25.2725C26.6626 12.1765 27.7895 11.0352 27.7895 9.62743V5.8039C27.7895 4.39612 26.6626 3.25488 25.2725 3.25488Z"/>
                            <path d="M11.4287 19.8235H5.13616C3.74605 19.8235 2.61914 20.9648 2.61914 22.3726V26.1961C2.61914 27.6039 3.74605 28.7451 5.13616 28.7451H11.4287C12.8188 28.7451 13.9457 27.6039 13.9457 26.1961V22.3726C13.9457 20.9648 12.8188 19.8235 11.4287 19.8235Z"/>
                            <path d="M25.2725 14.7255H18.9799C17.5898 14.7255 16.4629 15.8667 16.4629 17.2745V26.1961C16.4629 27.6038 17.5898 28.7451 18.9799 28.7451H25.2725C26.6626 28.7451 27.7895 27.6038 27.7895 26.1961V17.2745C27.7895 15.8667 26.6626 14.7255 25.2725 14.7255Z"/>
                        </svg>
                        <div class="w-full text-2xl font-semibold hidden md:block">Dashboard</div>
                    </a>
                </li>
                <li class="<#if currentUrl?contains('utenti')>active</#if>">
                    <a href="/admin/utenti" class="flex flex-row gap-2 items-center">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                             class="w-12 h-auto icon">
                            <g clip-path="url(#clip0_560_182)">
                                <path d="M7.27015 7.31307C7.27015 8.99295 6.11707 10.3548 4.69471 10.3548C3.27247 10.3548 2.11963 8.99295 2.11963 7.31307C2.11963 5.63331 3.27247 4.27155 4.69471 4.27155C6.11707 4.27155 7.27015 5.63331 7.27015 7.31307Z"/>
                                <path d="M7.63036 12.677C7.81636 12.5636 8.02216 12.4896 8.23528 12.4544C7.80256 11.8438 7.49596 11.1888 7.31884 10.405C7.27036 10.1186 6.8782 10.085 6.5866 10.3226C6.04108 10.7673 5.40472 11.0649 4.6948 11.0649C3.9712 11.0649 3.30556 10.777 2.77192 10.2952C2.60164 10.1414 2.35072 10.1181 2.15476 10.2377C1.1416 10.8567 0.374683 11.839 0.0401229 13.0058C-0.0497571 13.3184 0.0133642 13.6562 0.209444 13.9163C0.405764 14.1762 0.712485 14.3295 1.03816 14.3295H5.67832C6.2338 13.6887 6.88936 13.1292 7.63036 12.677Z"/>
                                <path d="M16.73 7.31307C16.73 8.99295 17.8829 10.3548 19.3053 10.3548C20.7278 10.3548 21.8805 8.99295 21.8805 7.31307C21.8805 5.63331 20.7278 4.27155 19.3053 4.27155C17.8829 4.27155 16.73 5.63331 16.73 7.31307Z"/>
                                <path d="M16.3701 12.677C16.1841 12.5636 15.9781 12.4896 15.7651 12.4544C16.1979 11.8438 16.5045 11.1888 16.6816 10.405C16.7302 10.1186 17.1223 10.085 17.4139 10.3226C17.9595 10.7673 18.5957 11.0649 19.3056 11.0649C20.0291 11.0649 20.6948 10.777 21.2286 10.2952C21.3989 10.1414 21.6497 10.1181 21.8457 10.2377C22.8589 10.8567 23.626 11.839 23.9603 13.0058C24.0501 13.3184 23.987 13.6562 23.7911 13.9163C23.5946 14.1762 23.2881 14.3295 22.9625 14.3295H18.3221C17.7666 13.6887 17.1112 13.1292 16.3701 12.677Z"/>
                                <path d="M19.017 17.6942C18.5133 15.9357 17.3707 14.4488 15.8579 13.4951C15.5595 13.3072 15.1721 13.3376 14.9074 13.5708C14.0955 14.2859 13.0908 14.7116 12 14.7116C10.8878 14.7116 9.86513 14.2692 9.04493 13.529C8.78309 13.2924 8.39777 13.2568 8.09669 13.4409C6.53945 14.3918 5.36081 15.9014 4.84685 17.6943C4.70873 18.1752 4.80557 18.6936 5.10677 19.0937C5.40869 19.4933 5.87993 19.7286 6.38057 19.7286H17.4833C17.9841 19.7286 18.4557 19.494 18.7575 19.0937C19.0588 18.6935 19.1552 18.1756 19.017 17.6942Z"/>
                                <path d="M15.9577 8.94566C15.9577 11.5272 14.1858 13.6203 12 13.6203C9.81428 13.6203 8.04248 11.5272 8.04248 8.94566C8.04248 6.36386 9.81428 4.27155 12 4.27155C14.1859 4.27155 15.9577 6.36398 15.9577 8.94566Z"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_560_182">
                                    <rect width="24" height="24" fill="white"/>
                                </clipPath>
                            </defs>
                        </svg>
                        <div class="w-full text-2xl font-semibold hidden md:block">Utenti</div>
                    </a>
                </li>
                <li class="<#if currentUrl?contains('categorie')>active</#if>">
                    <a href="/admin/categorie" class="flex flex-row gap-2 items-center">
                        <svg class="w-12 h-auto icon" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
                        <div class="w-full text-2xl font-semibold hidden md:block">Categoria</div>
                    </a>
                </li>
            </ul>

        </div>
        <div class=" relative h-full flex-1 ">
            <a href="/logout" class="flex flex-row gap-2 items-center justify-center bottom-4 ">
                <img src="/images/icons/dashboardAdmin/logout.svg" alt="Logout" class="w-12 h-auto">
                <div class="text-2xl font-semibold hidden md:block">LogOut</div>
            </a>
        </div>
    </div>

</div>