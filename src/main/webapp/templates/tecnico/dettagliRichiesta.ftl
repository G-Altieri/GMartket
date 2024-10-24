<#include "../navbar.ftl">
<script type="module" src="/scripts/table.js"></script>
<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center ">
        <svg class="w-10 h-10"  viewBox="0 0 24 32" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M20.8 9.4377e-05H3.2C2.35917 -0.00638378 1.55009 0.320872 0.950208 0.910089C0.350324 1.49931 0.0086068 2.30238 0 3.14319V28.857C0.0086068 29.6978 0.350324 30.5009 0.950208 31.0901C1.55009 31.6793 2.35917 32.0066 3.2 32.0001H20.8C21.6408 32.0066 22.4499 31.6793 23.0498 31.0901C23.6497 30.5009 23.9914 29.6978 24 28.857V3.14319C23.9914 2.30238 23.6497 1.49931 23.0498 0.910089C22.4499 0.320872 21.6408 -0.00638378 20.8 9.4377e-05ZM8.2539 6.20129C8.44171 5.60205 8.77293 5.05769 9.21882 4.61548C9.66472 4.17327 10.2118 3.84657 10.8126 3.66373C11.4134 3.4809 12.0497 3.44746 12.6663 3.56632C13.283 3.68518 13.8613 3.95274 14.3511 4.34579C14.8409 4.73883 15.2273 5.24547 15.4769 5.82174C15.7265 6.398 15.8316 7.02647 15.7832 7.6526C15.7348 8.27872 15.5344 8.88357 15.1992 9.41464C14.8641 9.94572 14.4044 10.387 13.86 10.7001C13.5829 10.8557 13.3515 11.0815 13.189 11.3546C13.0265 11.6278 12.9387 11.9389 12.9342 12.2567V12.3567C12.9342 12.6219 12.8288 12.8763 12.6413 13.0638C12.4538 13.2513 12.1994 13.3567 11.9342 13.3567C11.669 13.3567 11.4146 13.2513 11.2271 13.0638C11.0396 12.8763 10.9342 12.6219 10.9342 12.3567V12.2567C10.9392 11.5878 11.1198 10.932 11.4578 10.3548C11.7958 9.7776 12.2795 9.29929 12.8604 8.96769C13.2117 8.76713 13.4879 8.45719 13.6467 8.08511C13.8055 7.71303 13.8382 7.29924 13.74 6.90679C13.6611 6.57798 13.4927 6.2774 13.2536 6.03828C13.0145 5.79917 12.7139 5.63083 12.3851 5.55189C11.9942 5.45449 11.5823 5.48683 11.2114 5.64403C10.8405 5.80123 10.5307 6.07477 10.3289 6.42339C10.2595 6.54153 10.2038 6.66721 10.1629 6.79799C10.0838 7.05117 9.90731 7.26254 9.67234 7.38561C9.43736 7.50868 9.16313 7.53337 8.90995 7.45424C8.65677 7.37512 8.4454 7.19866 8.32233 6.96368C8.19926 6.72871 8.17477 6.45447 8.2539 6.20129ZM12.93 15.5001C12.9328 15.5674 12.9261 15.6347 12.91 15.7001C12.8981 15.7613 12.8814 15.8215 12.86 15.8801C12.83 15.9401 12.8 16.0001 12.77 16.0601C12.7295 16.1125 12.6861 16.1626 12.64 16.2101C12.4503 16.3959 12.1955 16.5 11.93 16.5001C11.7988 16.5036 11.6686 16.4762 11.55 16.4201C11.4307 16.3715 11.322 16.3002 11.23 16.2101C11.1839 16.1626 11.1405 16.1125 11.1 16.0601C11.0702 16.0001 11.0402 15.9401 11.01 15.8801L10.95 15.7001C10.9389 15.6339 10.9323 15.5671 10.93 15.5001C10.9329 15.2332 11.0407 14.9782 11.23 14.7901C11.4214 14.6116 11.6733 14.5123 11.935 14.5123C12.1967 14.5123 12.4486 14.6116 12.64 14.7901C12.8266 14.9792 12.9308 15.2344 12.93 15.5001ZM19 28.0001H5C4.73478 28.0001 4.48043 27.8947 4.29289 27.7072C4.10536 27.5197 4 27.2653 4 27.0001C4 26.7349 4.10536 26.4805 4.29289 26.293C4.48043 26.1054 4.73478 26.0001 5 26.0001H19C19.2652 26.0001 19.5196 26.1054 19.7071 26.293C19.8946 26.4805 20 26.7349 20 27.0001C20 27.2653 19.8946 27.5197 19.7071 27.7072C19.5196 27.8947 19.2652 28.0001 19 28.0001ZM19 24.0001H5C4.73478 24.0001 4.48043 23.8947 4.29289 23.7072C4.10536 23.5197 4 23.2653 4 23.0001C4 22.7349 4.10536 22.4805 4.29289 22.293C4.48043 22.1054 4.73478 22.0001 5 22.0001H19C19.2652 22.0001 19.5196 22.1054 19.7071 22.293C19.8946 22.4805 20 22.7349 20 23.0001C20 23.2653 19.8946 23.5197 19.7071 23.7072C19.5196 23.8947 19.2652 24.0001 19 24.0001ZM19 20.0001H5C4.73478 20.0001 4.48043 19.8947 4.29289 19.7072C4.10536 19.5197 4 19.2653 4 19.0001C4 18.7349 4.10536 18.4805 4.29289 18.293C4.48043 18.1054 4.73478 18.0001 5 18.0001H19C19.2652 18.0001 19.5196 18.1054 19.7071 18.293C19.8946 18.4805 20 18.7349 20 19.0001C20 19.2653 19.8946 19.5197 19.7071 19.7072C19.5196 19.8947 19.2652 20.0001 19 20.0001Z" fill="#3E53A0"/>
        </svg>
        Richiesta</h1>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-2 content-center gap-y-6 place-content-center">

        <div class="text-bluScuro flex items-center flex-row gap-2  text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M61.9218 39.309C61.7421 38.5277 61.2616 37.8676 60.582 37.4496C60.1015 37.1488 59.5625 37.0004 59.0117 37.0004C58.7812 37.0004 58.5508 37.0316 58.3203 37.0785L50.3086 38.9574L45.1797 17.1484L54.6914 14.9101C56.3008 14.5312 57.3008 12.9101 56.9219 11.3007C56.7422 10.5194 56.2617 9.85927 55.5821 9.44127C55.1016 9.14049 54.5626 8.99205 54.0118 8.99205C53.7813 8.99205 53.5509 9.0233 53.3204 9.07018L43.8087 11.3085L41.9298 3.30848C41.7501 2.52723 41.2696 1.86708 40.59 1.43738C40.1095 1.1366 39.5705 0.988159 39.0197 0.988159C38.7892 0.988159 38.5587 1.01941 38.3283 1.06628C37.547 1.24597 36.8869 1.72644 36.4572 2.40608C36.0275 3.08577 35.9064 3.89438 36.0861 4.67558L37.965 12.6756L16.156 17.8045L13.9177 8.29278C13.738 7.51153 13.2575 6.85138 12.5779 6.43338C12.0974 6.1326 11.5584 5.98416 11.0076 5.98416C10.7771 5.98416 10.5466 6.01541 10.3162 6.06229C9.53492 6.24198 8.87478 6.72245 8.44508 7.40209C8.01539 8.08178 7.8943 8.89039 8.07399 9.67159L10.3123 19.1833L2.31229 21.0622C1.53104 21.2419 0.870883 21.7223 0.452883 22.402C0.0310034 23.0817 -0.0978965 23.8903 0.0817935 24.6715C0.402104 26.0309 1.60129 26.9801 3.00369 26.9801C3.23416 26.9801 3.46463 26.9488 3.6951 26.902L11.7068 25.0231L16.8357 46.8321L7.324 49.0704C6.54275 49.2501 5.8826 49.7305 5.4646 50.4102C5.04272 51.0899 4.91382 51.8985 5.09351 52.6797C5.41382 54.0391 6.61301 54.9883 8.01541 54.9883C8.24588 54.9883 8.47635 54.957 8.70682 54.9101L18.2185 52.6718L20.0974 60.6718C20.4177 62.0312 21.6169 62.9804 23.0193 62.9804C23.2498 62.9804 23.4803 62.9492 23.7107 62.9023C25.3201 62.5234 26.3201 60.9023 25.9412 59.2929L24.0623 51.2929L45.8713 46.164L48.1096 55.6757C48.4299 57.0351 49.6291 57.9843 51.0315 57.9843C51.262 57.9843 51.4925 57.9531 51.7229 57.9062C53.3323 57.5273 54.3323 55.9062 53.9534 54.2968L51.7151 44.7851L59.7151 42.9062C61.3245 42.5273 62.3245 40.9062 61.9456 39.2968L61.9218 39.309ZM22.6598 45.4692L17.5309 23.6602L39.3399 18.5313L44.4688 40.3403L22.6598 45.4692Z"
                      fill="#323954"/>
            </svg>
            <p><strong>Codice Richiesta:</strong> <span class="text-bluScuro">${richiesta.codice}</span></p>
        </div>

        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 667 800" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M649.049 631.587C619.471 579.009 571.027 519.456 492.16 485.602C447.054 517.158 392.257 535.738 333.183 535.738C274.077 535.738 219.28 517.159 174.172 485.602C95.3067 519.456 46.8614 579.011 17.3004 631.587C-21.9324 701.325 8.827 800 76.6786 800C144.532 800 333.185 800 333.185 800C333.185 800 521.819 800 589.674 800C657.524 800 688.283 701.325 649.049 631.587Z"
                      fill="#323954"/>
                <path d="M333.183 469.752C449.033 469.752 542.919 375.833 542.919 259.998V209.752C542.919 93.9187 449.033 0 333.183 0C217.316 0 123.415 93.9188 123.415 209.753V260C123.415 375.833 217.318 469.752 333.183 469.752Z"
                      fill="#323954"/>
            </svg>

            <p><strong>Ordinante:</strong> <span
                        class="text-bluScuro">${richiesta.getOrdinante().getNome()} ${richiesta.getOrdinante().getCognome()}</span>
            </p>
        </div>


        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 82 96" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M35.3401 49.5121C34.8948 49.8402 34.4612 50.1332 34.0432 50.3636C30.4573 52.3284 26.1174 52.3284 22.5352 50.3636C22.1172 50.1332 21.6836 49.8402 21.2383 49.5121V54.0316C21.2383 54.8675 21.0195 55.68 20.6094 56.3949C21.5586 56.7621 22.3867 57.2347 23.168 57.7582C24.6289 58.7308 25.7422 60.1176 28.2891 60.1176C30.8946 60.1176 32.3321 58.7231 33.8868 57.7309C34.586 57.2817 35.3009 56.8715 36.0509 56.5395C35.5899 55.7934 35.3399 54.9262 35.3399 54.0356L35.3401 49.5121Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M42.629 58.8951C42.6251 58.9224 42.6251 58.9537 42.6212 58.981L40.9415 72.801C41.1759 72.9768 41.3868 73.1877 41.5665 73.426C41.5665 73.426 43.1563 75.551 44.4923 77.3362C46.0665 79.4417 46.9181 82.0003 46.9181 84.6331V95.9141H56.0314V73.9691C56.0314 69.9418 54.4337 66.0824 51.5861 63.2351C49.1603 60.8093 46.0002 59.2898 42.6291 58.8913L42.629 58.8951ZM13.957 58.8951C10.5859 59.2935 7.42179 60.8131 4.99999 63.2389C2.15229 66.0866 0.554688 69.9459 0.554688 73.9729V95.9179H9.66799V84.6369C9.66799 82.008 10.5195 79.4455 12.0938 77.34C13.4297 75.5548 15.0196 73.4298 15.0196 73.4298C15.1993 73.1876 15.4102 72.9805 15.6446 72.8048L13.9649 58.9848C13.961 58.9574 13.9571 58.9262 13.9571 58.8988L13.957 58.8951ZM17.0898 58.8091L18.7148 72.1721H37.8708L39.4919 58.8171C35.3591 59.1882 33.6247 63.2351 28.2929 63.2351C22.914 63.2351 22.1249 59.1179 17.0899 58.8054L17.0898 58.8091Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M42.9769 23.4181H13.6099V35.5981C13.6099 38.8442 15.3794 41.8325 18.2232 43.3911C20.0865 44.4106 22.2193 46.6255 24.0396 47.6216C26.688 49.0747 29.8951 49.0747 32.5435 47.6216C34.3677 46.6216 36.5005 44.4107 38.3599 43.3911C41.2076 41.8325 42.9732 38.8442 42.9732 35.5981V23.4181H42.9769ZM22.0429 39.3241C26.1874 42.0975 30.332 41.871 34.4769 39.3632C35.2151 38.9178 35.4495 37.953 35.0042 37.2187C34.5589 36.4804 33.594 36.2421 32.8597 36.6913C29.8324 38.5233 26.805 38.7577 23.7816 36.7304C23.0668 36.2499 22.0941 36.4413 21.6136 37.1601C21.1331 37.8749 21.3245 38.8476 22.0433 39.3281L22.0429 39.3241ZM32.8009 26.4331V28.0893C32.8009 28.9526 33.5001 29.6518 34.3634 29.6518C35.2266 29.6518 35.9259 28.9526 35.9259 28.0893V26.4331C35.9259 25.5698 35.2266 24.8706 34.3634 24.8706C33.5001 24.8706 32.8009 25.5698 32.8009 26.4331ZM20.6559 26.4331V28.0893C20.6559 28.9526 21.3551 29.6518 22.2184 29.6518C23.0816 29.6518 23.7809 28.9526 23.7809 28.0893V26.4331C23.7809 25.5698 23.0816 24.8706 22.2184 24.8706C21.3551 24.8706 20.6559 25.5698 20.6559 26.4331Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M12.7891 95.918V84.637C12.7891 82.68 13.4219 80.7776 14.5938 79.2112C15.9297 77.426 17.5196 75.301 17.5196 75.301H39.0626C39.0626 75.301 40.6524 77.426 41.9884 79.2112C43.1603 80.7776 43.7931 82.68 43.7931 84.637V95.918H12.7891Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M5.03076 20.293C4.16748 20.293 3.46826 19.5938 3.46826 18.7305C3.46826 17.8673 4.16748 17.168 5.03076 17.168H10.3238C11.3081 11.4805 14.9293 6.69504 19.8824 4.11304V20.293H5.03076ZM36.6988 20.293V4.11304C41.6519 6.69504 45.273 11.4802 46.2574 17.168H51.5504C52.4136 17.168 53.1129 17.8673 53.1129 18.7305C53.1129 19.5938 52.4136 20.293 51.5504 20.293H36.6988Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M33.5741 3.10165C33.5741 1.43365 32.2225 0.0821533 30.5546 0.0821533H26.0234C24.3554 0.0821533 23.0039 1.43375 23.0039 3.10165V20.2927H33.5699V3.10165H33.5741Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M63.1879 65.0311C58.9535 62.9686 56.0317 58.6209 56.0317 53.5971C56.0317 50.8237 56.9224 48.2612 58.4301 46.1674V46.265C58.4301 51.9564 63.0512 56.577 68.7421 56.577C74.4335 56.577 79.0541 51.9559 79.0541 46.265V46.1674C80.5619 48.2572 81.4525 50.8236 81.4525 53.5971C81.4525 58.6205 78.5306 62.9682 74.2963 65.0311V95.9181H63.1913V65.0311H63.1879Z"
                      fill="#323954"/>
            </svg>

            <p><strong>Tecnico incaricato:</strong> <span
                        class="text-bluScuro">${richiesta.getTecnico().getNome()} ${richiesta.getTecnico().getCognome()}</span>
            </p>
        </div>


        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_638_34)">
                    <path fill-rule="evenodd" clip-rule="evenodd"
                          d="M40 80C50.6087 80 60.7828 75.7857 68.2843 68.2843C75.7857 60.7828 80 50.6087 80 40C80 29.3913 75.7857 19.2172 68.2843 11.7157C60.7828 4.21427 50.6087 0 40 0C29.3913 0 19.2172 4.21427 11.7157 11.7157C4.21427 19.2172 0 29.3913 0 40C0 50.6087 4.21427 60.7828 11.7157 68.2843C19.2172 75.7857 29.3913 80 40 80ZM35.8067 23.8667C38.9969 23.0391 42.3609 23.176 45.4733 24.26C46.726 24.6958 48.1006 24.6162 49.2946 24.0386C50.4885 23.461 51.4042 22.4327 51.84 21.18C52.2758 19.9273 52.1962 18.5528 51.6186 17.3588C51.041 16.1648 50.0127 15.2492 48.76 14.8133C43.7785 13.0807 38.3951 12.8642 33.2906 14.1912C28.1861 15.5182 23.5897 18.329 20.0827 22.2683C16.5757 26.2075 14.3155 31.0982 13.5881 36.322C12.8606 41.5458 13.6985 46.868 15.9959 51.6155C18.2932 56.3631 21.9467 60.3228 26.4945 62.9939C31.0422 65.665 36.28 66.9276 41.5453 66.6219C46.8106 66.3163 51.867 64.4561 56.0751 61.2767C60.2833 58.0973 63.4541 53.7415 65.1867 48.76C65.4025 48.1397 65.494 47.483 65.456 46.8274C65.418 46.1717 65.2513 45.53 64.9652 44.9388C64.6792 44.3476 64.2796 43.8185 63.7891 43.3818C63.2986 42.945 62.7269 42.6091 62.1067 42.3933C61.4864 42.1775 60.8297 42.086 60.174 42.124C59.5184 42.162 58.8766 42.3287 58.2854 42.6148C57.6942 42.9008 57.1652 43.3004 56.7284 43.7909C56.2917 44.2814 55.9558 44.8531 55.74 45.4733C54.7951 48.1938 53.1614 50.6229 50.9982 52.524C48.835 54.4251 46.2161 55.7333 43.3969 56.3209C40.5776 56.9085 37.6542 56.7556 34.9116 55.8771C32.169 54.9986 29.7009 53.4244 27.7478 51.308C25.7947 49.1916 24.4234 46.6053 23.7674 43.8011C23.1115 40.997 23.1933 38.0707 24.005 35.3076C24.8166 32.5445 26.3304 30.0388 28.3987 28.0349C30.467 26.031 33.0193 24.5972 35.8067 23.8733V23.8667Z"
                          fill="#323954"/>
                </g>
                <defs>
                    <clipPath id="clip0_638_34">
                        <rect width="80" height="80" fill="white"/>
                    </clipPath>
                </defs>
            </svg>
            <p><strong>Stato della Richiesta:</strong> <span class="text-bluScuro">${richiesta.getStato()}</span></p>
        </div>

        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 58 58" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M43.5 18.125H14.5C13.4977 18.125 12.6875 17.3148 12.6875 16.3125C12.6875 15.312 13.4977 14.5 14.5 14.5H43.5C44.5023 14.5 45.3125 15.312 45.3125 16.3125C45.3125 17.3148 44.5023 18.125 43.5 18.125ZM43.5 29H14.5C13.4977 29 12.6875 28.1898 12.6875 27.1875C12.6875 26.187 13.4977 25.375 14.5 25.375H43.5C44.5023 25.375 45.3125 26.187 45.3125 27.1875C45.3125 28.1898 44.5023 29 43.5 29ZM43.5 39.875H14.5C13.4977 39.875 12.6875 39.0648 12.6875 38.0625C12.6875 37.062 13.4977 36.25 14.5 36.25H43.5C44.5023 36.25 45.3125 37.062 45.3125 38.0625C45.3125 39.0648 44.5023 39.875 43.5 39.875ZM50.75 0H7.25C3.27337 0 0 3.56881 0 7.54906V50.7917C0 54.7737 3.22444 58 7.20287 58H50.4183C54.3967 58 58 54.7303 58 50.75V7.25C58 3.26975 54.7266 0 50.75 0Z"
                      fill="#323954"/>
            </svg>

            <p><strong>Note:</strong> <span class="text-bluScuro">${richiesta.getNote()?default("Nessuna nota")}</span></p>
        </div>

        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 90 86" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M23.4491 66.098H14.1288V75.4183H23.4491V66.098ZM12.1091 62.0589H25.4681C26.5853 62.0589 27.4876 62.9652 27.4876 64.0784V77.4374C27.4876 78.5546 26.5813 79.4569 25.4681 79.4569H12.1091C10.9919 79.4569 10.0896 78.5507 10.0896 77.4374V64.0784C10.0896 62.9612 10.9958 62.0589 12.1091 62.0589ZM49.6601 66.098H40.3398V75.4183H49.6601V66.098ZM38.3201 62.0589H51.6791C52.7963 62.0589 53.6986 62.9652 53.6986 64.0784V77.4374C53.6986 78.5546 52.7923 79.4569 51.6791 79.4569H38.3201C37.2029 79.4569 36.3006 78.5507 36.3006 77.4374V64.0784C36.3006 62.9612 37.2068 62.0589 38.3201 62.0589ZM23.4491 43.2739H14.1288V52.5942H23.4491V43.2739ZM12.1091 39.2309H25.4681C26.5853 39.2309 27.4876 40.1372 27.4876 41.2504V54.6094C27.4876 55.7266 26.5813 56.6289 25.4681 56.6289H12.1091C10.9919 56.6289 10.0896 55.7227 10.0896 54.6094V41.2504C10.0896 40.1332 10.9958 39.2309 12.1091 39.2309ZM49.6601 43.2739H40.3398V52.5942H49.6601V43.2739ZM38.3201 39.2309H51.6791C52.7963 39.2309 53.6986 40.1372 53.6986 41.2504V54.6094C53.6986 55.7266 52.7923 56.6289 51.6791 56.6289H38.3201C37.2029 56.6289 36.3006 55.7227 36.3006 54.6094V41.2504C36.3006 40.1332 37.2068 39.2309 38.3201 39.2309ZM75.8711 43.2739H66.5508V52.5942H75.8711V43.2739ZM64.5311 39.2309H77.8901C79.0073 39.2309 79.9096 40.1372 79.9096 41.2504V54.6094C79.9096 55.7266 79.0033 56.6289 77.8901 56.6289H64.5311C63.4139 56.6289 62.5116 55.7227 62.5116 54.6094V41.2504C62.5116 40.1332 63.4178 39.2309 64.5311 39.2309ZM81.3631 77.2859C83.41 75.2273 85.4529 73.1726 87.1522 71.4695H75.5902V83.0825C78.0902 80.5786 79.7269 78.9341 81.3675 77.2856L81.3631 77.2859ZM17.8401 0.0589318H14.9417C14.7307 0.0589318 14.5393 0.144869 14.3987 0.285492C14.2581 0.426112 14.1722 0.617522 14.1722 0.828462V8.05116C14.1722 8.2621 14.2581 8.4535 14.3987 8.59413C14.5393 8.73475 14.7307 8.82069 14.9417 8.82069H17.8401C18.051 8.82069 18.2424 8.73475 18.3831 8.59413C18.5237 8.45351 18.6096 8.2621 18.6096 8.05116V4.14096V4.13706V0.828456C18.6096 0.617516 18.5237 0.426116 18.3831 0.285486C18.2424 0.144866 18.051 0.0589318 17.8401 0.0589318ZM46.4491 0.0589318H43.5507C43.3397 0.0589318 43.1483 0.144869 43.0077 0.285492C42.8671 0.426112 42.7812 0.617522 42.7812 0.828462V8.05116C42.7812 8.2621 42.8671 8.4535 43.0077 8.59413C43.1483 8.73475 43.3397 8.82069 43.5507 8.82069H46.4491C46.66 8.82069 46.8514 8.73475 46.9921 8.59413C47.1327 8.45351 47.2186 8.2621 47.2186 8.05116V4.14096V4.13706V0.828456C47.2186 0.617516 47.1327 0.426116 46.9921 0.285486C46.8514 0.144866 46.66 0.0589318 46.4491 0.0589318ZM75.0581 0.0589318H72.1597C71.9487 0.0589318 71.7573 0.144869 71.6167 0.285492C71.4761 0.426112 71.3902 0.617522 71.3902 0.828462V4.14096V4.14487V8.05107C71.3902 8.26201 71.4761 8.45341 71.6167 8.59404C71.7573 8.73466 71.9487 8.8206 72.1597 8.8206H75.0581C75.269 8.8206 75.4604 8.73466 75.6011 8.59404C75.7417 8.45342 75.8276 8.26201 75.8276 8.05107V0.828368C75.8276 0.617428 75.7417 0.426028 75.6011 0.285398C75.4604 0.144778 75.269 0.0589318 75.0581 0.0589318ZM89.9961 27.6059V67.4259H73.5661C72.4489 67.4259 71.5466 68.3322 71.5466 69.4454V85.9374L2.91359 85.9413C2.11672 85.9413 1.38629 85.6132 0.858888 85.0859C0.331548 84.5585 0.00341797 83.8281 0.00341797 83.0312V27.6052L89.9961 27.6059ZM0.00408792 23.5668V9.07483C0.00408792 8.27795 0.332208 7.54753 0.859558 7.02013C1.3869 6.49279 2.11736 6.16466 2.91426 6.16466H10.1331V8.05526C10.1331 9.37946 10.6721 10.5826 11.5433 11.4537C12.4143 12.3248 13.6175 12.8639 14.9417 12.8639H17.8401C19.1643 12.8639 20.3674 12.3248 21.2385 11.4537C22.1095 10.5826 22.6487 9.37946 22.6487 8.05526V6.16466H38.7387V8.05526C38.7387 9.37946 39.2777 10.5826 40.1489 11.4537C41.0199 12.3248 42.2231 12.8639 43.5473 12.8639H46.4457C47.7699 12.8639 48.973 12.3248 49.8441 11.4537C50.7152 10.5825 51.2543 9.37946 51.2543 8.05526V6.16466H67.3443V8.05526C67.3443 9.37946 67.8833 10.5826 68.7545 11.4537C69.6256 12.3248 70.8287 12.8639 72.1529 12.8639H75.0513C76.3755 12.8639 77.5786 12.3248 78.4497 11.4537C79.3208 10.5826 79.8599 9.37946 79.8599 8.05526V6.16466H87.0787C87.8755 6.16466 88.606 6.49279 89.1334 7.02013C89.6607 7.54747 89.9888 8.27793 89.9888 9.07483V23.5668H0.00408792Z"
                      fill="#323954"/>
            </svg>
            <p><strong>Data di Creazione:</strong> <span class="text-bluScuro">${richiesta.created_at}</span></p>
        </div>


        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M8 0C3.58172 0 0 3.58172 0 8V20C0 24.4183 3.58172 28 8 28H20C24.4183 28 28 24.4183 28 20V8C28 3.58172 24.4183 0 20 0H8Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M47.9502 1.55654C47.7432 0.64607 46.9337 0 46 0C45.0663 0 44.2568 0.64607 44.0498 1.55654L42.9432 6.42294C42.4314 8.6738 40.6738 10.4314 38.4229 10.9432L33.5565 12.0498C32.6461 12.2568 32 13.0663 32 14C32 14.9337 32.6461 15.7432 33.5565 15.9502L38.4229 17.0568C40.6738 17.5686 42.4314 19.3262 42.9432 21.5771L44.0498 26.4435C44.2568 27.3539 45.0663 28 46 28C46.9337 28 47.7432 27.3539 47.9502 26.4435L49.0568 21.5771C49.5686 19.3262 51.3262 17.5686 53.5771 17.0568L58.4435 15.9502C59.3539 15.7432 60 14.9337 60 14C60 13.0663 59.3539 12.2568 58.4435 12.0498L53.5771 10.9432C51.3262 10.4314 49.5686 8.6738 49.0568 6.42294L47.9502 1.55654Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M0 40C0 35.5817 3.58172 32 8 32H20C24.4183 32 28 35.5817 28 40V52C28 56.4183 24.4183 60 20 60H8C3.58172 60 0 56.4183 0 52V40Z"
                      fill="#323954"/>
                <path fill-rule="evenodd" clip-rule="evenodd"
                      d="M40 32C35.5817 32 32 35.5817 32 40V52C32 56.4183 35.5817 60 40 60H52C56.4183 60 60 56.4183 60 52V40C60 35.5817 56.4183 32 52 32H40Z"
                      fill="#323954"/>
            </svg>

            <p><strong>Categoria:</strong> <span class="text-bluScuro">${richiesta.getCategoria().nome}</span></p>
        </div>


    </div>
    <div class="mt-6 ">
        <div class="text-bluScuro flex items-center flex-row gap-2 text-xl ">
            <svg class="w-8 h-8" viewBox="0 0 68 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M58 4.32996C59.1046 4.32996 60 3.43453 60 2.32996C60 1.22539 59.1046 0.329956 58 0.329956C56.8954 0.329956 56 1.22539 56 2.32996C56 3.43453 56.8954 4.32996 58 4.32996Z"
                      fill="#323954"/>
                <path d="M66 27C67.1046 27 68 26.1046 68 25C68 23.8954 67.1046 23 66 23C64.8954 23 64 23.8954 64 25C64 26.1046 64.8954 27 66 27Z"
                      fill="#323954"/>
                <path d="M58 23H41.74C41.4104 21.7329 40.7749 20.5661 39.8891 19.6019C39.0034 18.6378 37.8946 17.9057 36.66 17.47L39.53 9.34C40.0808 7.7778 41.1029 6.42509 42.4552 5.46858C43.8076 4.51207 45.4236 3.99893 47.08 4H50C50.5304 4 51.0391 3.78929 51.4142 3.41421C51.7893 3.03914 52 2.53043 52 2C52 1.46957 51.7893 0.960861 51.4142 0.585788C51.0391 0.210716 50.5304 1.64989e-06 50 1.64989e-06H47.08C44.5974 -0.00129984 42.1755 0.767422 40.1481 2.20023C38.1207 3.63303 36.5875 5.65938 35.76 8L34 13L32.24 8C31.4125 5.65938 29.8793 3.63303 27.8519 2.20023C25.8245 0.767422 23.4026 -0.00129984 20.92 1.64989e-06H18C17.4696 1.64989e-06 16.9609 0.210716 16.5858 0.585788C16.2107 0.960861 16 1.46957 16 2C16 2.53043 16.2107 3.03914 16.5858 3.41421C16.9609 3.78929 17.4696 4 18 4H20.92C22.5764 3.99893 24.1924 4.51207 25.5448 5.46858C26.8971 6.42509 27.9192 7.7778 28.47 9.34L31.34 17.47C30.1054 17.9057 28.9966 18.6378 28.1109 19.6019C27.2251 20.5661 26.5896 21.7329 26.26 23H10C9.46957 23 8.96086 23.2107 8.58579 23.5858C8.21071 23.9609 8 24.4696 8 25C8 25.5304 8.21071 26.0391 8.58579 26.4142C8.96086 26.7893 9.46957 27 10 27H26.26C26.5896 28.2671 27.2251 29.4339 28.1109 30.3981C28.9966 31.3622 30.1054 32.0943 31.34 32.53L28.47 40.66C27.9192 42.2222 26.8971 43.5749 25.5448 44.5314C24.1924 45.4879 22.5764 46.0011 20.92 46H18C17.4696 46 16.9609 46.2107 16.5858 46.5858C16.2107 46.9609 16 47.4696 16 48C16 48.5304 16.2107 49.0391 16.5858 49.4142C16.9609 49.7893 17.4696 50 18 50H20.92C23.4026 50.0013 25.8245 49.2326 27.8519 47.7998C29.8793 46.367 31.4125 44.3406 32.24 42L34 37L35.76 42C36.5875 44.3406 38.1207 46.367 40.1481 47.7998C42.1755 49.2326 44.5974 50.0013 47.08 50H50C50.5304 50 51.0391 49.7893 51.4142 49.4142C51.7893 49.0391 52 48.5304 52 48C52 47.4696 51.7893 46.9609 51.4142 46.5858C51.0391 46.2107 50.5304 46 50 46H47.08C45.4236 46.0011 43.8076 45.4879 42.4552 44.5314C41.1029 43.5749 40.0808 42.2222 39.53 40.66L36.66 32.53C37.8946 32.0943 39.0034 31.3622 39.8891 30.3981C40.7749 29.4339 41.4104 28.2671 41.74 27H58C58.5304 27 59.0391 26.7893 59.4142 26.4142C59.7893 26.0391 60 25.5304 60 25C60 24.4696 59.7893 23.9609 59.4142 23.5858C59.0391 23.2107 58.5304 23 58 23ZM34 29C33.2089 29 32.4355 28.7654 31.7777 28.3259C31.1199 27.8864 30.6072 27.2616 30.3045 26.5307C30.0017 25.7998 29.9225 24.9956 30.0769 24.2196C30.2312 23.4437 30.6122 22.731 31.1716 22.1716C31.731 21.6122 32.4437 21.2312 33.2196 21.0769C33.9956 20.9225 34.7998 21.0017 35.5307 21.3045C36.2616 21.6072 36.8864 22.1199 37.3259 22.7777C37.7654 23.4355 38 24.2089 38 25C38 26.0609 37.5786 27.0783 36.8284 27.8284C36.0783 28.5786 35.0609 29 34 29Z"
                      fill="#323954"/>
                <path d="M58 49.67C59.1046 49.67 60 48.7746 60 47.67C60 46.5655 59.1046 45.67 58 45.67C56.8954 45.67 56 46.5655 56 47.67C56 48.7746 56.8954 49.67 58 49.67Z"
                      fill="#323954"/>
                <path d="M10 4.32996C11.1046 4.32996 12 3.43453 12 2.32996C12 1.22539 11.1046 0.329956 10 0.329956C8.89543 0.329956 8 1.22539 8 2.32996C8 3.43453 8.89543 4.32996 10 4.32996Z"
                      fill="#323954"/>
                <path d="M2 27C3.10457 27 4 26.1046 4 25C4 23.8954 3.10457 23 2 23C0.89543 23 0 23.8954 0 25C0 26.1046 0.89543 27 2 27Z"
                      fill="#323954"/>
                <path d="M10 49.67C11.1046 49.67 12 48.7746 12 47.67C12 46.5655 11.1046 45.67 10 45.67C8.89543 45.67 8 46.5655 8 47.67C8 48.7746 8.89543 49.67 10 49.67Z"
                      fill="#323954"/>
            </svg>
            <p><strong>Caratteristiche Richieste:</strong></p>
        </div>

        <div class="pl-14">
            <ol class="text-bluScuro text-lg " style="list-style-type: decimal;">
                <#list caratteristicheList as richCar>
                    <li class="mt-1">${richCar.caratteristica.nome}:
                        <strong>${richCar.valore}</strong> ${richCar.caratteristica.misura}
                    </li>
                </#list>
            </ol>
        </div>
    </div>
</div>

<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold text-center gap-2 flex flex-row items-center justify-center">
        <svg class="w-12 h-12" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M15.5 5V7.5H17V9L18.5 9.5L19.5 8.5L21.5 10.5L20.5 11.5L21.5 13.5H22.5V16.5H21.5L20.5 18L21.5 19L19.5 21L18.5 20L17 21V22H14V21L12.5 20L11.5 21L10 20H1L0.5 19V1L1 0.5H11.5L15.5 5Z" fill="#3E53A0"/>
            <path d="M1.42212 0C0.640121 0 0 0.64018 0 1.42212V18.8906C0 19.6725 0.640121 20.3127 1.42212 20.3127H10.1465C10.1713 20.3106 10.1957 20.3058 10.2194 20.2982L11.1795 21.248C11.3098 21.3768 11.52 21.3752 11.6482 21.2444L12.3614 20.5236C12.7414 20.7253 13.1386 20.8893 13.5509 21.0119V22.0273C13.5512 22.2102 13.6998 22.3581 13.8827 22.3575H16.9042C16.9387 22.3576 16.9731 22.3521 17.006 22.3415C17.1064 22.3088 17.1851 22.23 17.2179 22.1297C17.2287 22.0966 17.2343 22.0621 17.2344 22.0273V21.0119C17.6468 20.8892 18.044 20.7254 18.424 20.5236L19.1386 21.2444C19.2667 21.3739 19.4752 21.3755 19.6053 21.248L21.754 19.1231C21.8829 18.9947 21.8839 18.7861 21.7561 18.6565L21.0409 17.9336C21.2588 17.5351 21.4329 17.1171 21.5628 16.682H22.5803C22.5936 16.6819 22.6069 16.681 22.6201 16.6794C22.787 16.6597 22.9127 16.5178 22.912 16.3497V13.3303C22.9117 13.1474 22.7631 12.9995 22.5802 13.0001H21.5664C21.4363 12.5645 21.2611 12.1453 21.0429 11.7464L21.756 11.0255C21.8852 10.8957 21.8843 10.6855 21.754 10.5568L19.6053 8.434C19.4758 8.30602 19.2673 8.30671 19.1386 8.43556L18.426 9.15438C18.0459 8.95199 17.647 8.78918 17.2344 8.66604V7.65423C17.2343 7.58461 17.2122 7.51679 17.1714 7.46044C17.1091 7.37507 17.0098 7.32457 16.9042 7.32454H15.7684L15.7736 4.62706C15.7695 4.54157 15.7324 4.461 15.6702 4.40226C14.2299 2.93602 12.7585 1.36714 11.4803 0.109553C11.4217 0.0441719 11.3395 0.00476 11.2519 0H1.42212ZM10.7088 0.478518C10.7079 0.489536 10.7082 0.4934 10.7072 0.505906C10.707 0.508576 10.7074 0.509756 10.7072 0.512106C10.7071 0.512767 10.7073 0.512995 10.7072 0.513656C10.7072 0.514394 10.7073 0.515046 10.7072 0.515726C10.7065 0.517096 10.7058 0.518476 10.7052 0.519856C10.705 0.508333 10.7052 0.496041 10.7052 0.496085C10.7052 0.496104 10.7076 0.483676 10.7088 0.478518ZM11.2638 0.590137C11.2733 0.592987 11.2793 0.595588 11.287 0.597888L11.2968 0.609773C11.2892 0.607213 11.2799 0.603443 11.2695 0.599953C11.2669 0.596123 11.2665 0.594237 11.2638 0.590137ZM1.42212 0.662484H10.6953V4.39658C10.6953 4.47262 10.7098 4.54555 10.7362 4.61155C10.7362 4.61223 10.7362 4.61293 10.7362 4.61361C10.7635 4.68133 10.8045 4.74169 10.8535 4.79292C10.9017 4.84325 10.9612 4.88712 11.0312 4.91798C11.0999 4.94824 11.1753 4.96517 11.254 4.965L15.1115 4.95725L15.1079 7.32452H13.8827C13.7001 7.32397 13.5515 7.47157 13.5509 7.65421V8.67016C13.1386 8.79274 12.7414 8.95678 12.3614 9.15849L11.6482 8.43555C11.5194 8.30533 11.3092 8.30463 11.1795 8.43399L9.03138 10.5568C9.0066 10.5813 8.98584 10.6096 8.96988 10.6405C8.95802 10.6655 8.94934 10.6919 8.94404 10.7191H2.50369C2.32104 10.7185 2.1725 10.8661 2.17193 11.0488C2.17107 11.2324 2.32003 11.3816 2.50369 11.3811H9.38122L9.74399 11.748C9.55359 12.0963 9.39647 12.4609 9.27322 12.8378C9.25561 12.8916 9.2388 12.9457 9.22258 13.0001H8.20508C8.02203 12.9992 7.87311 13.1472 7.87281 13.3303V14.3731H2.50369C2.32084 14.3725 2.17222 14.5204 2.17193 14.7033C2.17136 14.8868 2.32023 15.0356 2.50369 15.0351H7.87281V16.3497C7.87196 16.5335 8.02122 16.6828 8.20508 16.682H9.22258C9.35243 17.1167 9.52839 17.5338 9.74605 17.932L9.02931 18.6565C8.90146 18.7861 8.90239 18.9947 9.03137 19.1231L9.56621 19.6523H1.42211C0.995032 19.6523 0.660413 19.3174 0.660413 18.8906V1.42212C0.660413 0.995265 0.995035 0.662484 1.42212 0.662484ZM11.3552 0.908461L14.6584 4.29684L11.3552 4.30511V0.908461ZM2.50369 3.41008C2.32003 3.4095 2.17107 3.5587 2.17193 3.74236C2.17222 3.92522 2.32084 4.07314 2.50369 4.07257H7.17363C7.35588 4.07228 7.50356 3.92461 7.50384 3.74236C7.50469 3.5593 7.35669 3.41037 7.17363 3.41008H2.50369ZM2.50369 7.0646C2.32003 7.06401 2.17107 7.21321 2.17193 7.39687C2.1725 7.57953 2.32104 7.72713 2.50369 7.72656H10.9651C11.1477 7.72715 11.2963 7.57953 11.2968 7.39687C11.2977 7.21321 11.1487 7.06402 10.9651 7.0646H2.50369ZM14.2129 7.98443H16.5724V8.88513C16.5728 9.03641 16.6758 9.16812 16.8225 9.20501C17.3554 9.34003 17.8658 9.54979 18.3397 9.82822C18.4702 9.90475 18.6359 9.88305 18.7423 9.77551L19.3748 9.1368L21.0527 10.7951L20.4197 11.4338C20.3134 11.5419 20.2942 11.7084 20.3732 11.8379C20.6683 12.3273 20.8891 12.8585 21.0295 13.4124C21.0672 13.5585 21.199 13.6606 21.3498 13.6605H22.25V16.0195H21.3457C21.1942 16.0197 21.0623 16.1227 21.0253 16.2696C20.8852 16.8228 20.6656 17.3512 20.3711 17.84C20.2923 17.9696 20.3117 18.1361 20.4181 18.2441L21.0527 18.887L19.3748 20.5453L18.7423 19.9045C18.6639 19.8253 18.5508 19.7909 18.4415 19.813C18.4057 19.8202 18.3713 19.8333 18.3397 19.8518C17.866 20.1294 17.355 20.3385 16.8225 20.4729C16.6756 20.5098 16.5726 20.6418 16.5724 20.7933V21.6956H14.2129V20.7933C14.2127 20.6418 14.1097 20.5098 13.9628 20.4729C13.4303 20.3386 12.9189 20.1293 12.4451 19.8518C12.3147 19.7755 12.1493 19.7972 12.043 19.9045L11.41 20.5453L9.73262 18.887L10.3672 18.2441C10.4733 18.137 10.4935 17.9716 10.4163 17.8421C10.1217 17.3531 9.90025 16.8229 9.76 16.2696C9.72307 16.1227 9.59108 16.0197 9.43962 16.0195H8.53529V13.6605H9.43962C9.47602 13.6604 9.51217 13.6543 9.54658 13.6424C9.65186 13.6065 9.73206 13.5201 9.76 13.4124C9.90017 12.8593 10.1198 12.3288 10.4142 11.84C10.4919 11.7109 10.4726 11.5456 10.3672 11.4379L9.73262 10.7951L11.41 9.1368L12.043 9.77757C12.1493 9.88486 12.3147 9.90655 12.4451 9.83028C12.9189 9.55277 13.4303 9.34345 13.9628 9.20914C14.1097 9.17221 14.2127 9.04022 14.2129 8.88875V7.98443ZM15.3927 10.9377C13.2409 10.9377 11.4901 12.6889 11.4901 14.8403C11.4901 16.9916 13.2409 18.7423 15.3927 18.7423C17.5444 18.7423 19.2968 16.9916 19.2968 14.8403C19.2968 12.6889 17.5444 10.9377 15.3927 10.9377ZM15.3927 11.5997C17.1871 11.5997 18.6348 13.0464 18.6348 14.8403C18.6348 16.6341 17.1871 18.0824 15.3927 18.0824C13.5983 18.0824 12.1505 16.6341 12.1505 14.8403C12.1505 13.0464 13.5983 11.5997 15.3927 11.5997ZM15.1798 12.3624V12.7386C14.8244 12.7672 14.5212 12.8694 14.277 13.0549C13.9882 13.2723 13.8434 13.5518 13.8434 13.8936C13.8434 14.1914 13.9302 14.4337 14.1039 14.6201C14.2794 14.8047 14.5481 14.9351 14.91 15.0118C15.0052 15.0312 15.0903 15.0441 15.1798 15.0599V16.4789C14.9876 16.4632 14.7855 16.4198 14.5731 16.3466C14.3025 16.2534 14.0639 16.1215 13.8574 15.9497H13.8191V16.6293C14.0623 16.7371 14.3004 16.8183 14.5343 16.8732C14.728 16.9182 14.9466 16.9406 15.1798 16.9486V17.3186H15.6056V16.9378C15.7618 16.9226 15.9078 16.8986 16.0314 16.8566C16.227 16.7909 16.3983 16.6997 16.5445 16.5828C16.678 16.4749 16.7809 16.3433 16.8541 16.188C16.929 16.0326 16.9662 15.8757 16.9662 15.7167C16.9662 15.4243 16.8898 15.1967 16.7362 15.034C16.5827 14.8714 16.3545 14.7496 16.051 14.6692C15.9293 14.6381 15.7706 14.6082 15.6056 14.5783V13.2068C15.7899 13.225 15.9712 13.2643 16.1492 13.3262C16.4033 13.412 16.6082 13.5206 16.7636 13.6522H16.8019V13.0104C16.6172 12.93 16.4057 12.8627 16.1663 12.8078C15.9933 12.7683 15.8033 12.7486 15.6056 12.7376V12.3624L15.1798 12.3624ZM15.1798 13.2057V14.4961C15.1262 14.4857 15.0448 14.4726 15.0035 14.4635C14.7824 14.4124 14.6272 14.3387 14.5395 14.2418C14.4518 14.145 14.4088 14.0118 14.4088 13.8419C14.4088 13.6518 14.4958 13.4964 14.6713 13.3758C14.8071 13.2834 14.9774 13.2274 15.1798 13.2057ZM15.6056 15.1405C15.6929 15.1574 15.7851 15.1715 15.8645 15.1927C16.0454 15.2402 16.1798 15.3073 16.2675 15.3932C16.3571 15.4791 16.4019 15.6122 16.4019 15.7932C16.4019 16.0033 16.3075 16.1714 16.1192 16.2975C15.9866 16.3872 15.8139 16.4437 15.6056 16.4696V15.1405Z" fill="#F3F4F6"/>
        </svg>
        Proposte</h1>
    <div class="my-6 text-xl text-bluScuro font-semibold flex flex-row items-center justify-center">
        <#if isPrimoInSospeso?exists && isPrimoInSospeso == "true">
            <p class="bg-TgialloChiaro font-semibold px-3 py-2 rounded-full">In attesa della risposta dell' Ordinante</p>
        <#else>
            <a href="/tecnico/creazioneProposta?idRichiesta=${richiesta.key}"
               class="rounded-full bg-verde font-semibold text-white text-lg px-4 py-2 shadow-buttonBox hover:shadow-buttonBoxHover">Crea
                una nuova Proposta</a>
        </#if>
    </div>
    <div class="border border-primario rounded-2xl">
        <table class="user-list-table rounded-2xl text-bluScuro" id="userTable">
            <thead>
            <tr class="bg-trTable">
                <th>#</th>
                <th>Codice Proposta</th>
                <th>Nome Produttore</th>
                <th>Prezzo</th>
                <th>Stato Proposta</th>
                <th>Azione</th>
            </tr>
            </thead>
            <tbody>
            <#list listProposte as proposta>
                <tr>
                    <td class="index-column"></td>
                    <td>#${proposta.codiceProposta}</td>
                    <td>${proposta.nomeProduttore}</td>
                    <td>${proposta.prezzo}</td>

                    <td class="font-semibold
                        <#if proposta.statoProposta == "IN_SOSPESO">bg-TgialloChiaro</#if>
                        <#if proposta.statoProposta == "ACCETTATO">bg-TverdeChiaro</#if>
                        <#if proposta.statoProposta == "RIFIUTATO">bg-TrossoChiaro</#if>
                        <#if proposta.statoProposta == "SPEDITO">bg-TviolaChiaro</#if>">
                        ${proposta.statoProposta}
                    </td>


                    <td class="">
                        <#if proposta.statoProposta == "IN_SOSPESO">
                            <p class=" font-medium mx-auto">In attesa di risposta</p>
                        <#elseif proposta.statoProposta == "ACCETTATO">
                            <p class="font-medium mx-auto">In attesa di spedizione</p>
                        <#elseif proposta.statoProposta == "RIFIUTATO">
                            <p class=" font-medium mx-auto">Motivazione: <strong>${proposta.motivazione}</strong></p>
                        <#elseif proposta.statoProposta == "SPEDITO">
                            <p class=" font-medium mx-auto">In attesa di consegna</p>
                        </#if>
                    </td>
                </tr>
            </#list>

            </tbody>
        </table>
    </div>
</div>
