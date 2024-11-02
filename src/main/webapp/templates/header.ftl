<div class="h-full flex ">
    <#assign currentUrlValue = currentUrl!"">
    <!-- Sidebar fissa -->
    <div class="bg-primario text-white w-24 md:w-80 h-full fixed top-4 hSideBar rounded-3xl transition-all duration-300">
        <div class=" flex flex-col  items-center">
            <a href="/home" class="p-4 pt-8 flex flex-row items-center justify-center w-full gap-2 mb-12">
                <img src="/images/logoGMarket.png" alt="Logo GMarket" class="w-12 h-auto" />
                <h1 class="text-3xl font-semibold hidden md:block">GMarket</h1>
            </a>
            <#if currentUrlValue?starts_with('/admin')>
                <ul class="menu">
                    <li class="<#if currentUrlValue?ends_with('/admin')>active</#if>">
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
                    <li class="<#if currentUrlValue?contains('utenti')>active</#if>">
                        <a href="/admin/utenti" class="flex flex-row gap-2 items-center">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 xmlns="http://www.w3.org/2000/svg"
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
                    <li class="<#if currentUrlValue?contains('categorie')>active</#if>">
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
                            <div class="w-full text-2xl font-semibold hidden md:block">Categorie</div>
                        </a>
                    </li>
                </ul>
            </#if>
            <#if currentUrlValue?starts_with('/ordinante')>
                <ul class="menu">
                    <li class="<#if currentUrlValue?ends_with('/ordinante')>active</#if>">
                        <a href="/ordinante" class="flex flex-row gap-2 items-center">
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
                    <li class="<#if currentUrlValue?contains('crea-richiesta')>active</#if>">
                        <a href="/ordinante/crea-richiesta" class="flex flex-row gap-2 items-center">
                            <svg class="w-12 h-auto icon" width="76" height="76" viewBox="0 0 76 76" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M23.418 0.5C17.6836 0.5 13 5.1836 13 10.918V13H10.918C5.1836 13 0.5 17.6836 0.5 23.418V65.086C0.5 70.8165 5.1836 75.5 10.918 75.5H52.586C58.3165 75.5 63 70.8164 63 65.082V63H65.082C70.8164 63 75.5 58.3164 75.5 52.582V10.918C75.5 5.1836 70.8164 0.5 65.082 0.5H23.418ZM23.418 4.668H65.086C68.5821 4.668 71.3321 7.418 71.3321 10.918V52.586C71.3321 56.0821 68.5821 58.8321 65.0821 58.8321H63.0001V23.4181C63.0001 17.6837 58.3165 13.0001 52.5821 13.0001H17.1681V10.9181C17.1681 7.4181 19.918 4.668 23.418 4.668ZM10.918 17.168H52.586C56.0821 17.168 58.8321 19.918 58.8321 23.418V33.832H4.6681V23.418C4.6681 19.918 7.418 17.168 10.918 17.168ZM31.75 42.168C32.9023 42.168 33.832 43.1016 33.832 44.25V52.582H42.164C43.3163 52.582 44.246 53.5156 44.246 54.664C44.246 55.8163 43.3124 56.746 42.164 56.746H33.832V65.078C33.832 66.2342 32.9023 67.1678 31.75 67.1678C30.5977 67.1678 29.668 66.2342 29.668 65.0819V56.7499H21.3321C20.1837 56.7499 19.2501 55.8163 19.2501 54.6679C19.2501 53.5156 20.1837 52.582 21.3321 52.582H29.6641V44.25C29.668 43.0977 30.5977 42.168 31.75 42.168Z" fill="black"/>
                                <path d="M13 21.332C10.7227 21.332 8.83203 23.2226 8.83203 25.5C8.83203 27.7774 10.7226 29.668 13 29.668C15.2774 29.668 17.168 27.7774 17.168 25.5C17.168 23.2226 15.2774 21.332 13 21.332Z" fill="black"/>
                            </svg>

                            <div class="w-full text-xl font-semibold hidden md:block">Nuova Richiesta</div>
                        </a>
                    </li>
                    <li class="<#if currentUrlValue?contains('lista-richieste')>active</#if>">
                        <a href="/ordinante/lista-richieste" class="flex flex-row gap-2 items-center">
                            <svg class="w-12 h-auto icon"  width="76" height="80" viewBox="0 0 76 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M54.9671 46.131C50.8441 46.131 47.9651 49.185 47.9651 53.557C47.9651 58.119 51.1061 61.829 54.9671 61.829C58.8291 61.829 61.9711 58.118 61.9711 53.557C61.9711 49.185 59.0911 46.131 54.9671 46.131ZM54.9671 58.829C52.7601 58.829 50.9651 56.464 50.9651 53.557C50.9651 50.869 52.5361 49.131 54.9671 49.131C57.4001 49.131 58.9711 50.868 58.9711 53.557C58.9711 56.464 57.1751 58.829 54.9671 58.829ZM54.9651 37.207C54.8301 37.207 54.6991 37.225 54.5651 37.228V10.918C54.5651 5.39597 50.0861 0.917969 44.5651 0.917969H10.1001C4.5791 0.917969 0.100098 5.39597 0.100098 10.918V59.311C0.100098 64.834 4.5791 69.311 10.1001 69.311H37.2851C41.0001 75.172 47.5281 79.082 54.9661 79.082C66.5101 79.082 75.9021 69.689 75.9021 58.144C75.9021 46.599 66.5091 37.207 54.9651 37.207ZM22.1191 11.418H32.5451C33.6491 11.418 34.5451 12.314 34.5451 13.418C34.5451 14.522 33.6491 15.418 32.5451 15.418H22.1191C21.0141 15.418 20.1191 14.522 20.1191 13.418C20.1191 12.314 21.0141 11.418 22.1191 11.418ZM10.4571 23.104H44.2071C45.3111 23.104 46.2071 24 46.2071 25.104C46.2071 26.208 45.3111 27.104 44.2071 27.104H10.4571C9.3521 27.104 8.4571 26.208 8.4571 25.104C8.4571 24 9.3521 23.104 10.4571 23.104ZM10.4571 30.89H44.2071C45.3111 30.89 46.2071 31.786 46.2071 32.89C46.2071 33.994 45.3111 34.89 44.2071 34.89H10.4571C9.3521 34.89 8.4571 33.994 8.4571 32.89C8.4571 31.786 9.3521 30.89 10.4571 30.89ZM10.4571 38.676H44.2071C44.8161 38.676 45.3521 38.958 45.7191 39.388C43.9591 40.259 42.3431 41.367 40.9051 42.676H10.4571C9.3521 42.676 8.4571 41.78 8.4571 40.676C8.4571 39.572 9.3521 38.676 10.4571 38.676ZM34.0321 58.248H10.4571C9.3521 58.248 8.4571 57.352 8.4571 56.248C8.4571 55.144 9.3521 54.248 10.4571 54.248H34.4041C34.1661 55.512 34.0271 56.812 34.0271 58.144C34.0271 58.18 34.0321 58.213 34.0321 58.248ZM10.4571 50.462C9.3521 50.462 8.4571 49.566 8.4571 48.462C8.4571 47.358 9.3521 46.462 10.4571 46.462H37.5991C36.7211 47.763 36.0041 49.178 35.4331 50.664L10.4571 50.462ZM54.9651 76.082C51.6541 76.082 48.5611 75.165 45.8971 73.594C45.9171 72.877 45.9601 71.978 46.0031 71.733C46.7811 67.432 51.3071 66.529 54.9671 66.529C57.4971 66.529 63.4431 67.087 64.0051 72.25C64.0231 72.413 64.0361 73.07 64.0411 73.589C61.3751 75.163 58.2781 76.082 54.9651 76.082ZM66.9171 71.481C66.1421 66.496 61.7201 63.529 54.9671 63.529C48.2761 63.529 43.9331 66.324 43.0501 71.206C43.0361 71.283 43.0251 71.381 43.0131 71.482C39.3501 68.195 37.0281 63.442 37.0281 58.145C37.0281 48.254 45.0751 40.207 54.9661 40.207C64.8561 40.207 72.9021 48.254 72.9021 58.145C72.9001 63.441 70.5791 68.195 66.9171 71.481Z" fill="black"/>
                            </svg>

                            <div class="w-full text-lg font-semibold hidden md:block">Le mie Richieste</div>
                        </a>
                    </li>
                    <li class="<#if currentUrlValue?contains('lista-ordini')>active</#if>">
                        <a href="/ordinante/lista-ordini" class="flex flex-row gap-2 items-center">
                            <svg class="icon w-12 h-auto" width="86" height="93" viewBox="0 0 86 93" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                      d="M28.944 44.446L22.564 40.761L0.968 53.227L7.357 56.913L28.944 44.446ZM45.118 26.613V51.546L23.531 39.079V14.148L29.911 17.834V27.599C29.911 27.906 30.057 28.195 30.303 28.378C30.549 28.562 30.869 28.616 31.161 28.53L33.534 27.817L37.003 32.176C37.195 32.413 37.478 32.543 37.77 32.543C37.87 32.543 37.98 32.526 38.089 32.489C38.472 32.353 38.737 31.984 38.737 31.573V22.928L45.117 26.614L45.118 26.613ZM35.826 48.419L14.23 60.884L9.292 58.033L30.888 45.568L35.826 48.42V48.419ZM8.324 67.054L10.076 66.527C10.45 66.415 10.861 66.543 11.107 66.851L13.261 69.553V62.566L8.323 59.714V67.055L8.324 67.054ZM52.475 3.686L46.095 0L24.499 12.467L30.888 16.153L52.475 3.686ZM31.855 26.294L33.608 25.768C33.982 25.654 34.393 25.784 34.639 26.094L36.793 28.796V21.807L31.855 18.954V26.294ZM37.77 20.126L59.357 7.659L54.419 4.808L32.823 17.273L37.77 20.126ZM65.81 70.186L62.433 66.814C62.205 66.583 61.904 66.467 61.602 66.467C61.292 66.467 60.99 66.583 60.762 66.814C60.296 67.276 60.296 68.027 60.762 68.489L65.116 72.848C65.874 73.605 67.106 73.605 67.863 72.848L78.488 62.227C78.707 62.006 78.826 61.708 78.826 61.391C78.826 61.072 78.707 60.776 78.488 60.552C78.26 60.331 77.968 60.209 77.648 60.209C77.328 60.209 77.036 60.331 76.808 60.552L67.178 70.185C66.995 70.367 66.749 70.47 66.493 70.47C66.237 70.47 65.991 70.367 65.808 70.185L65.81 70.186ZM75.44 59.181C76.033 58.593 76.809 58.269 77.649 58.269C78.489 58.269 79.274 58.593 79.858 59.181C81.081 60.4 81.081 62.381 79.858 63.601L69.242 74.221C68.484 74.979 67.489 75.357 66.495 75.357C65.501 75.357 64.505 74.979 63.748 74.221L59.385 69.862C58.171 68.643 58.171 66.66 59.385 65.443C60.608 64.224 62.589 64.224 63.812 65.443L66.496 68.128L75.44 59.181ZM69.626 51.13C78.27 51.13 85.307 58.164 85.307 66.812C85.307 75.46 78.269 82.494 69.626 82.494C60.983 82.494 53.944 75.458 53.944 66.812C53.944 58.166 60.972 51.13 69.626 51.13ZM23.531 92.303V67.371L45.118 54.904V79.837L23.531 92.303ZM37.77 49.539L44.15 53.227L22.563 65.692L16.174 62.006L37.77 49.539ZM61.302 8.78L39.706 21.247L46.095 24.932L67.682 12.468L61.302 8.78ZM47.063 51.546V26.613L68.65 14.148V39.08L47.063 51.546ZM15.207 63.686L21.587 67.372V92.304L0 79.839V54.908L6.38 58.594V68.359C6.38 68.666 6.526 68.954 6.773 69.137C7.019 69.32 7.339 69.376 7.631 69.289L10.004 68.577L13.473 72.936C13.665 73.171 13.948 73.302 14.24 73.302C14.34 73.302 14.45 73.283 14.559 73.248C14.942 73.11 15.207 72.743 15.207 72.332V63.687V63.686Z"
                                      fill="black"/>
                            </svg>
                            <div class="w-full text-2xl font-semibold hidden md:block">I mie Ordini</div>
                        </a>
                    </li>
                </ul>
            </#if>
            <#if currentUrlValue?starts_with('/tecnico')>
                <ul class="menu">
                    <li class="<#if currentUrlValue?ends_with('/tecnico')>active</#if>">
                        <a href="/tecnico" class="flex flex-row gap-2 items-center">
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
                    <li class="<#if currentUrlValue?ends_with('/tecnico/lista-richieste')>active</#if>">
                        <a href="/tecnico/lista-richieste" class="flex flex-row gap-2 items-center">
                            <svg class="icon w-richiesteLibere h-auto" width="67" height="64" viewBox="0 0 67 64" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M19.5477 46.4623C20.2877 46.4623 21.0267 47.1123 20.7507 48.0203C20.6197 48.4463 20.5007 48.8693 20.4127 49.3013C20.0847 50.8893 17.6977 50.3893 18.0317 48.8013C18.1407 48.2843 18.2507 47.7583 18.4437 47.2633C18.6627 46.7063 19.1047 46.4673 19.5477 46.4623ZM26.1157 37.4413C27.2507 37.3273 28.1727 38.8693 27.1257 39.4733C25.4597 40.4363 22.9227 42.9563 22.2877 44.5253C21.6507 46.0913 19.3187 45.0833 20.0627 43.5613C21.0687 41.2333 23.2447 38.9113 25.6257 37.5973C25.7917 37.5033 25.9537 37.4563 26.1157 37.4413ZM29.2607 28.0823C27.9167 28.0823 26.8347 29.1653 26.8347 30.4683C26.8347 31.7633 27.4437 32.3733 28.1977 32.3733H30.8967V34.1193C24.4907 34.8483 17.1567 39.4633 15.4747 49.1763C13.1037 48.7973 12.2407 52.1813 14.4997 52.9883C20.0057 55.1133 28.8997 55.6763 32.7027 55.6763C36.5057 55.6763 45.3997 55.1133 50.9057 52.9883C53.1717 52.1813 52.3017 48.7973 49.9307 49.1763C48.2487 39.4633 40.9147 34.8483 34.5087 34.1193V32.3733H37.2077C37.9617 32.3733 38.5707 31.7643 38.5707 30.4683C38.5707 29.1653 37.4887 28.0823 36.1447 28.0823H29.2607Z"
                                      fill="black"/>
                                <path d="M14.6568 56.1913C12.0628 56.1233 10.4948 60.5033 14.0528 61.3993C20.5058 63.0303 28.8188 63.4823 32.7028 63.4823C36.5868 63.4823 44.8998 63.0303 51.3528 61.3993C55.1498 60.4463 53.1148 55.5243 50.2238 56.2693C44.6968 57.6863 36.0778 58.2543 32.7028 58.2543C29.3278 58.2543 20.7088 57.6863 15.1818 56.2693C15.0068 56.2223 14.8288 56.1963 14.6568 56.1913Z"
                                      fill="black"/>
                                <path d="M2.22577 26.1532C2.88177 27.9812 4.65777 27.6742 6.55377 26.7102L13.7878 23.0192L22.5888 20.8632C23.5638 20.6232 23.6728 19.8942 22.6518 19.4672C21.3818 18.9292 20.8768 18.1912 20.3668 17.4242C19.9448 16.7952 19.8868 16.6392 19.2668 16.7892L12.4698 18.4562L3.26677 23.3062C2.21377 23.8532 1.88177 25.1912 2.22577 26.1532Z"
                                      fill="black"/>
                                <path d="M3.73588 19.5963L11.5329 16.1443L18.4019 15.2793C19.0269 15.2023 19.4229 15.0503 19.3549 14.3533C19.2769 13.4623 19.5539 11.8993 19.8509 11.4203C20.1049 11.0083 19.8239 10.4563 19.3299 10.4783L10.3509 10.8153C8.63188 11.6453 1.22588 15.7793 1.22588 15.7793C0.256879 16.3203 -0.196121 17.3633 0.0798787 18.2023C0.604879 19.8113 1.85088 20.4293 3.73588 19.5963Z"
                                      fill="black"/>
                                <path d="M2.81369 8.87725L24.6577 8.19125L36.7767 12.1073L41.3297 11.5083C42.4957 11.2103 42.7927 12.6643 41.6477 13.0913L36.7767 14.7113L24.8977 11.1133C23.3297 10.9673 22.4547 11.5663 22.0737 12.4573C21.3397 14.1403 22.0167 16.7073 24.4447 17.8273L40.8297 26.3323C44.2357 28.1033 47.9797 28.0563 52.0427 26.5313L62.4337 22.6193C64.8617 21.7073 66.2577 19.7033 66.4137 17.5613C66.5797 15.4253 65.7107 11.2853 64.7827 9.74425C63.4177 7.47825 62.0637 6.82725 60.6267 6.60825C59.1897 6.38925 57.6427 6.72825 56.0737 6.59725C53.2357 6.38925 51.9757 6.14525 49.2607 5.23925L35.1197 0.503252C32.9287 -0.230748 31.4167 -0.0437489 29.0727 0.320251L1.89069 3.75425C-0.905305 4.10225 0.088695 8.87725 2.81369 8.87725Z"
                                      fill="black"/>
                            </svg>

                            <div class="w-full text-xl font-semibold hidden md:block">Richieste Libere</div>
                        </a>
                    </li>
                    <li class="<#if currentUrlValue?ends_with('/tecnico/lista-richiesteProprie')>active</#if>">
                        <a href="/tecnico/lista-richiesteProprie" class="flex flex-row gap-2 items-center">
                            <svg class="icon w-12 h-auto" width="90" height="90" viewBox="0 0 90 90" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M59.8 10.19L50.5 1.616V10.09L59.8 10.19ZM17.537 21.015C17.2015 21.015 16.8797 20.8817 16.6425 20.6445C16.4053 20.4073 16.272 20.0855 16.272 19.75C16.272 19.4145 16.4053 19.0927 16.6425 18.8555C16.8797 18.6183 17.2015 18.485 17.537 18.485H52.389C52.7245 18.485 53.0463 18.6183 53.2835 18.8555C53.5207 19.0927 53.654 19.4145 53.654 19.75C53.654 20.0855 53.5207 20.4073 53.2835 20.6445C53.0463 20.8817 52.7245 21.015 52.389 21.015H17.537ZM9.453 21.015C9.1175 21.015 8.79574 20.8817 8.55851 20.6445C8.32128 20.4073 8.188 20.0855 8.188 19.75C8.188 19.4145 8.32128 19.0927 8.55851 18.8555C8.79574 18.6183 9.1175 18.485 9.453 18.485H11.953C12.2885 18.485 12.6103 18.6183 12.8475 18.8555C13.0847 19.0927 13.218 19.4145 13.218 19.75C13.218 20.0855 13.0847 20.4073 12.8475 20.6445C12.6103 20.8817 12.2885 21.015 11.953 21.015H9.453ZM17.537 30.668C17.2015 30.668 16.8797 30.5347 16.6425 30.2975C16.4053 30.0603 16.272 29.7385 16.272 29.403C16.272 29.0675 16.4053 28.7457 16.6425 28.5085C16.8797 28.2713 17.2015 28.138 17.537 28.138H52.389C52.7245 28.138 53.0463 28.2713 53.2835 28.5085C53.5207 28.7457 53.654 29.0675 53.654 29.403C53.654 29.7385 53.5207 30.0603 53.2835 30.2975C53.0463 30.5347 52.7245 30.668 52.389 30.668H17.537ZM9.453 30.668C9.1175 30.668 8.79574 30.5347 8.55851 30.2975C8.32128 30.0603 8.188 29.7385 8.188 29.403C8.188 29.0675 8.32128 28.7457 8.55851 28.5085C8.79574 28.2713 9.1175 28.138 9.453 28.138H11.953C12.2885 28.138 12.6103 28.2713 12.8475 28.5085C13.0847 28.7457 13.218 29.0675 13.218 29.403C13.218 29.7385 13.0847 30.0603 12.8475 30.2975C12.6103 30.5347 12.2885 30.668 11.953 30.668H9.453ZM17.537 40.321C17.2015 40.321 16.8797 40.1877 16.6425 39.9505C16.4053 39.7133 16.272 39.3915 16.272 39.056C16.272 38.7205 16.4053 38.3987 16.6425 38.1615C16.8797 37.9243 17.2015 37.791 17.537 37.791H52.389C52.7245 37.791 53.0463 37.9243 53.2835 38.1615C53.5207 38.3987 53.654 38.7205 53.654 39.056C53.654 39.3915 53.5207 39.7133 53.2835 39.9505C53.0463 40.1877 52.7245 40.321 52.389 40.321H17.537ZM9.453 40.321C9.1175 40.321 8.79574 40.1877 8.55851 39.9505C8.32128 39.7133 8.188 39.3915 8.188 39.056C8.188 38.7205 8.32128 38.3987 8.55851 38.1615C8.79574 37.9243 9.1175 37.791 9.453 37.791H11.953C12.2885 37.791 12.6103 37.9243 12.8475 38.1615C13.0847 38.3987 13.218 38.7205 13.218 39.056C13.218 39.3915 13.0847 39.7133 12.8475 39.9505C12.6103 40.1877 12.2885 40.321 11.953 40.321H9.453ZM17.537 49.974C17.2015 49.974 16.8797 49.8407 16.6425 49.6035C16.4053 49.3663 16.272 49.0445 16.272 48.709C16.272 48.3735 16.4053 48.0517 16.6425 47.8145C16.8797 47.5773 17.2015 47.444 17.537 47.444H52.389C52.7245 47.444 53.0463 47.5773 53.2835 47.8145C53.5207 48.0517 53.654 48.3735 53.654 48.709C53.654 49.0445 53.5207 49.3663 53.2835 49.6035C53.0463 49.8407 52.7245 49.974 52.389 49.974H17.537ZM9.453 49.974C9.1175 49.974 8.79574 49.8407 8.55851 49.6035C8.32128 49.3663 8.188 49.0445 8.188 48.709C8.188 48.3735 8.32128 48.0517 8.55851 47.8145C8.79574 47.5773 9.1175 47.444 9.453 47.444H11.953C12.2885 47.444 12.6103 47.5773 12.8475 47.8145C13.0847 48.0517 13.218 48.3735 13.218 48.709C13.218 49.0445 13.0847 49.3663 12.8475 49.6035C12.6103 49.8407 12.2885 49.974 11.953 49.974H9.453ZM17.537 59.627C17.2015 59.627 16.8797 59.4937 16.6425 59.2565C16.4053 59.0193 16.272 58.6975 16.272 58.362C16.272 58.0265 16.4053 57.7047 16.6425 57.4675C16.8797 57.2303 17.2015 57.097 17.537 57.097H52.389C52.7245 57.097 53.0463 57.2303 53.2835 57.4675C53.5207 57.7047 53.654 58.0265 53.654 58.362C53.654 58.6975 53.5207 59.0193 53.2835 59.2565C53.0463 59.4937 52.7245 59.627 52.389 59.627H17.537ZM9.453 59.627C9.1175 59.627 8.79574 59.4937 8.55851 59.2565C8.32128 59.0193 8.188 58.6975 8.188 58.362C8.188 58.0265 8.32128 57.7047 8.55851 57.4675C8.79574 57.2303 9.1175 57.097 9.453 57.097H11.953C12.2885 57.097 12.6103 57.2303 12.8475 57.4675C13.0847 57.7047 13.218 58.0265 13.218 58.362C13.218 58.6975 13.0847 59.0193 12.8475 59.2565C12.6103 59.4937 12.2885 59.627 11.953 59.627H9.453ZM17.537 69.28C17.2015 69.28 16.8797 69.1467 16.6425 68.9095C16.4053 68.6723 16.272 68.3505 16.272 68.015C16.272 67.6795 16.4053 67.3577 16.6425 67.1205C16.8797 66.8833 17.2015 66.75 17.537 66.75H52.389C52.7245 66.75 53.0463 66.8833 53.2835 67.1205C53.5207 67.3577 53.654 67.6795 53.654 68.015C53.654 68.3505 53.5207 68.6723 53.2835 68.9095C53.0463 69.1467 52.7245 69.28 52.389 69.28H17.537ZM9.453 69.28C9.1175 69.28 8.79574 69.1467 8.55851 68.9095C8.32128 68.6723 8.188 68.3505 8.188 68.015C8.188 67.6795 8.32128 67.3577 8.55851 67.1205C8.79574 66.8833 9.1175 66.75 9.453 66.75H11.953C12.2885 66.75 12.6103 66.8833 12.8475 67.1205C13.0847 67.3577 13.218 67.6795 13.218 68.015C13.218 68.3505 13.0847 68.6723 12.8475 68.9095C12.6103 69.1467 12.2885 69.28 11.953 69.28H9.453ZM85.924 56.79C83.6473 54.5133 80.6516 53.0966 77.4474 52.7811C74.2431 52.4657 71.0287 53.2711 68.3517 55.0601C65.6748 56.8491 63.701 59.511 62.7667 62.5922C61.8325 65.6734 61.9955 68.9832 63.2281 71.9576C64.4607 74.9321 66.6866 77.3871 69.5264 78.9043C72.3662 80.4215 75.6443 80.907 78.802 80.2782C81.9597 79.6493 84.8016 77.945 86.8436 75.4556C88.8855 72.9661 90.001 69.8457 90 66.626C90.0018 64.7989 89.6426 62.9894 88.9432 61.3014C88.2437 59.6135 87.2177 58.0803 85.924 56.79ZM64.372 55.08V11.52C64.3724 11.3453 64.3363 11.1724 64.2661 11.0124C64.1958 10.8525 64.0929 10.7089 63.964 10.591L59.373 6.36H68.494V52.031C67.0035 52.808 65.6404 53.8082 64.452 54.997L64.369 55.08H64.372ZM61.842 74.856V83.218H0V0H47.971V11.336H47.976C47.976 11.6686 48.1075 11.9877 48.3419 12.2238C48.5762 12.4598 48.8944 12.5936 49.227 12.596L61.842 12.732V58.396C60.3981 60.8985 59.638 63.7368 59.638 66.626C59.638 69.5152 60.3981 72.3535 61.842 74.856ZM68.5 81.221V89.58H6.655V85.75H61.84C62.4659 85.75 63.0692 85.5164 63.532 85.095C63.567 85.0677 63.6004 85.0383 63.632 85.007C63.8677 84.7725 64.0546 84.4937 64.1821 84.1867C64.3096 83.8797 64.3752 83.5505 64.375 83.218V78.172C64.403 78.199 64.43 78.227 64.458 78.255C65.6464 79.4438 67.0095 80.444 68.5 81.221ZM69.059 67.139C68.844 66.882 68.74 66.5501 68.7697 66.2164C68.7994 65.8827 68.9605 65.5745 69.2175 65.3595C69.4745 65.1445 69.8064 65.0405 70.1401 65.0702C70.4738 65.0999 70.782 65.261 70.997 65.518L74.065 69.19L81.209 61.305C81.3185 61.177 81.4525 61.0723 81.6031 60.997C81.7538 60.9217 81.918 60.8774 82.086 60.8667C82.2541 60.8559 82.4226 60.879 82.5816 60.9345C82.7406 60.99 82.8869 61.0768 83.0117 61.1898C83.1366 61.3027 83.2376 61.4396 83.3087 61.5923C83.3798 61.7449 83.4195 61.9103 83.4256 62.0786C83.4317 62.2469 83.404 62.4147 83.3441 62.5721C83.2842 62.7295 83.1934 62.8733 83.077 62.995L75.022 71.885C74.967 71.9564 74.9043 72.0214 74.835 72.079C74.578 72.2937 74.2464 72.3976 73.9128 72.368C73.5793 72.3384 73.2711 72.1776 73.056 71.921L69.059 67.139Z" fill="black"/>
                            </svg>

                            <div class="w-full text-xl font-semibold hidden md:block">Le mie Richieste</div>
                        </a>
                    </li>
                    <li class="<#if currentUrlValue?ends_with('/tecnico/lista-ordini')>active</#if>">
                        <a href="/tecnico/lista-ordini" class="flex flex-row gap-2 items-center">
                            <svg class="icon w-12 h-auto" width="86" height="93" viewBox="0 0 86 93" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                      d="M28.944 44.446L22.564 40.761L0.968 53.227L7.357 56.913L28.944 44.446ZM45.118 26.613V51.546L23.531 39.079V14.148L29.911 17.834V27.599C29.911 27.906 30.057 28.195 30.303 28.378C30.549 28.562 30.869 28.616 31.161 28.53L33.534 27.817L37.003 32.176C37.195 32.413 37.478 32.543 37.77 32.543C37.87 32.543 37.98 32.526 38.089 32.489C38.472 32.353 38.737 31.984 38.737 31.573V22.928L45.117 26.614L45.118 26.613ZM35.826 48.419L14.23 60.884L9.292 58.033L30.888 45.568L35.826 48.42V48.419ZM8.324 67.054L10.076 66.527C10.45 66.415 10.861 66.543 11.107 66.851L13.261 69.553V62.566L8.323 59.714V67.055L8.324 67.054ZM52.475 3.686L46.095 0L24.499 12.467L30.888 16.153L52.475 3.686ZM31.855 26.294L33.608 25.768C33.982 25.654 34.393 25.784 34.639 26.094L36.793 28.796V21.807L31.855 18.954V26.294ZM37.77 20.126L59.357 7.659L54.419 4.808L32.823 17.273L37.77 20.126ZM65.81 70.186L62.433 66.814C62.205 66.583 61.904 66.467 61.602 66.467C61.292 66.467 60.99 66.583 60.762 66.814C60.296 67.276 60.296 68.027 60.762 68.489L65.116 72.848C65.874 73.605 67.106 73.605 67.863 72.848L78.488 62.227C78.707 62.006 78.826 61.708 78.826 61.391C78.826 61.072 78.707 60.776 78.488 60.552C78.26 60.331 77.968 60.209 77.648 60.209C77.328 60.209 77.036 60.331 76.808 60.552L67.178 70.185C66.995 70.367 66.749 70.47 66.493 70.47C66.237 70.47 65.991 70.367 65.808 70.185L65.81 70.186ZM75.44 59.181C76.033 58.593 76.809 58.269 77.649 58.269C78.489 58.269 79.274 58.593 79.858 59.181C81.081 60.4 81.081 62.381 79.858 63.601L69.242 74.221C68.484 74.979 67.489 75.357 66.495 75.357C65.501 75.357 64.505 74.979 63.748 74.221L59.385 69.862C58.171 68.643 58.171 66.66 59.385 65.443C60.608 64.224 62.589 64.224 63.812 65.443L66.496 68.128L75.44 59.181ZM69.626 51.13C78.27 51.13 85.307 58.164 85.307 66.812C85.307 75.46 78.269 82.494 69.626 82.494C60.983 82.494 53.944 75.458 53.944 66.812C53.944 58.166 60.972 51.13 69.626 51.13ZM23.531 92.303V67.371L45.118 54.904V79.837L23.531 92.303ZM37.77 49.539L44.15 53.227L22.563 65.692L16.174 62.006L37.77 49.539ZM61.302 8.78L39.706 21.247L46.095 24.932L67.682 12.468L61.302 8.78ZM47.063 51.546V26.613L68.65 14.148V39.08L47.063 51.546ZM15.207 63.686L21.587 67.372V92.304L0 79.839V54.908L6.38 58.594V68.359C6.38 68.666 6.526 68.954 6.773 69.137C7.019 69.32 7.339 69.376 7.631 69.289L10.004 68.577L13.473 72.936C13.665 73.171 13.948 73.302 14.24 73.302C14.34 73.302 14.45 73.283 14.559 73.248C14.942 73.11 15.207 72.743 15.207 72.332V63.687V63.686Z"
                                      fill="black"/>
                            </svg>

                            <div class="w-full text-xl font-semibold hidden md:block">Ordini</div>
                        </a>
                    </li>
                </ul>
            </#if>
        </div>
        <div class=" relative h-full flex-1 ">
            <a href="/logout" class="flex flex-row gap-2 items-center justify-center bottom-4 ">
                <img src="/images/icons/dashboardAdmin/logout.svg" alt="Logout" class="w-12 h-auto" />
                <div class="text-2xl font-semibold hidden md:block">LogOut</div>
            </a>
        </div>
    </div>

</div>
