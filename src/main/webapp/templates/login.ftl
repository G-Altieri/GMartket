<div class="flex items-center justify-center min-h-screen">

    <!-- Contenitore del rettangolo -->
    <div class="bg-white rounded-2xl shadowContainerLogin w-full h-auto max-w-4xl flex flex-col-reverse md:flex-row relative">
        <!-- Sezione Sinistra -->
        <div class="md:w-1/2 bg-white p-6 rounded-b-2xl md:rounded-l-2xl mb-4 md:mb-0 flex flex-col w-full min-h-[500px] h-full relative justify-center items-center">
            <div class="flex flex-row items-center gap-2">
                <svg class="w-16 h-16" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_534_99)">
                        <path d="M35 70C54.33 70 70 54.33 70 35C70 15.67 54.33 0 35 0C15.67 0 0 15.67 0 35C0 54.33 15.67 70 35 70Z"
                              fill="#112E51"/>
                        <path d="M31.3184 42.2256L32.6036 34.8906C31.9618 34.3919 31.4922 33.7048 31.2607 32.9257C31.0293 32.1465 31.0475 31.3145 31.3129 30.5463C31.5783 29.778 32.0775 29.1121 32.7405 28.642C33.4035 28.1719 34.197 27.9211 35.0098 27.9248V19.7832H25.084C24.0635 19.7837 23.0849 20.1894 22.3632 20.911C21.6416 21.6327 21.2359 22.6113 21.2354 23.6318V42.4854C21.2334 42.8404 21.3129 43.1912 21.4678 43.5107C22.3018 45.1924 25.583 50.5996 34.9961 54.7559V42.5264C33.7639 42.5321 32.5334 42.4315 31.3184 42.2256ZM44.9014 19.7559H34.9961V27.8975C35.8049 27.8924 36.5952 28.1398 37.2568 28.6051C37.9183 29.0704 38.4182 29.7306 38.6868 30.4935C38.9554 31.2564 38.9794 32.0841 38.7552 32.8613C38.5311 33.6385 38.0702 34.3263 37.4366 34.8291L38.7217 42.1982C37.4924 42.4111 36.2472 42.5186 34.9996 42.5195V54.7285C44.399 50.5928 47.6939 45.165 48.5279 43.4834C48.6828 43.1639 48.7623 42.8131 48.7603 42.458V23.6182C48.7639 23.1108 48.6667 22.6078 48.4742 22.1384C48.2818 21.669 47.9979 21.2425 47.6392 20.8838C46.9116 20.1607 45.9272 19.7551 44.9014 19.7559Z"
                              fill="white"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_534_99">
                            <rect width="70" height="70" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

                <div class="text-primario font-bold text-4xl">Login</div>
            </div>
            <form action="login" method="POST" class="space-y-4 w-full">
                <#if (referrer??)>
                    <input name="referrer" type="hidden" value="${referrer}"/>
                </#if>
                <div class="mt-6">
                    <label for="email" class="block text-lg text-bluScuro font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" required
                           value="generale@generale.com"
                           class=" block w-full px-3 py-2 shadowBoxInput  border border-gray-300 rounded-md  focus:ring-primary focus-visible:ring-primary  focus:border-primary sm:text-sm">
                </div>
                <div>
                    <label for="password"
                           class="block text-lg text-bluScuro font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required
                           value="generale"
                           class=" block w-full px-3 py-2 shadowBoxInput border border-gray-300 rounded-md  focus:ring-primary focus-visible:ring-primary focus:border-primary sm:text-sm">
                </div>

                <!-- Radio Buttons Section -->
                <h2 class="text-bluScuro text-sm bg-TgialloChiaro2 px-2 py-1 rounded-xl ">Per semplificare il login nella demo, usare valori di default e selezionare un ruolo</h2>
                <div class="flex items-center space-x-4 flex-row justify-between">
                    <div>
                        <input type="radio" id="ordinante" name="role" value="ORDINANTE" required
                               class="focus:ring-primary focus:border-primary cursor-pointer" checked>
                        <label for="ordinante"
                               class="text-lg text-bluScuro font-medium text-gray-700 cursor-pointer">Ordinante</label>
                    </div>
                    <div>
                        <input type="radio" id="tecnico" name="role" value="TECNICO" required
                               class="focus:ring-primary focus:border-primary cursor-pointer">
                        <label for="tecnico" class="text-lg text-bluScuro font-medium text-gray-700 cursor-pointer">Tecnico</label>
                    </div>
                    <div>
                        <input type="radio" id="admin" name="role" value="AMMINISTRATORE" required
                               class="focus:ring-primary focus:border-primary cursor-pointer">
                        <label for="admin"
                               class="text-lg text-bluScuro font-medium text-gray-700 cursor-pointer">Admin</label>
                    </div>
                </div>

                <button id="login" name="login" type="submit"
                        class="mt-8i w-full bg-primario duration-300 transition-all text-white text-xl font-bold px-4 py-2 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                    Accedi
                </button>
            </form>
        </div>

        <!-- Sezione Destra -->
        <div class="md:w-1/2 bg-white md:bg-[#5A77DF]/[.06] p-6 rounded-t-2xl md:rounded-tl-none md:rounded-r-2xl relative flex items-center justify-center h-full flex-col min-h-[240px] md:min-h-[500px]">
            <div class="absolute inset-0 bg-no-repeat bg-cover w-full h-full top-0 left-0 rounded-t-2xl md:rounded-tl-none  md:rounded-r-2xl"
                 style="background-image: url('/images/bg/bgLoginDestra.svg');"></div>
            <div class="relative z-10 flex flex-row md:flex-col items-center justify-center gap-2">
                <img src="/images/logoGMarket.png" alt="Logo GMarket" class="w-24 h-auto">
                <p class="text-primario text-center text-2xl font-semibold">Benvenuto<br/>su <span class="font-bold">GMarket</span>
                </p>

            </div>
            <p class="text-primario text-center text-lg font-semibold absolute bottom-0 md:bottom-16">Scegli meglio,
                acquista
                facile</p>
        </div>
    </div>

</div>