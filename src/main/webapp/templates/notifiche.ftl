<#include "./navbar.ftl">

<script src="/scripts/notifiche.js"></script>

<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center ">
        <svg class="w-12 h-10" viewBox="0 0 90 86" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M89.8 24.9999C89.8 11.2999 78.7 0.199951 65 0.199951C51.3 0.199951 40.2 11.2999 40.2 24.9999C40.2 25.6999 40.2 26.2999 40.3 26.9999H9.10001C4.10001 26.9999 0 31.0999 0 36.0999V76.8999C0 81.8999 4.10001 85.9999 9.10001 85.9999H74.9C79.9 85.9999 84 81.8999 84 76.8999V40.9999H83.9C87.6 36.6999 89.8 31.0999 89.8 24.9999ZM65 4.19995C76.5 4.19995 85.8 13.4999 85.8 24.9999C85.8 36.4999 76.5 45.8 65 45.8C53.5 45.8 44.2 36.4999 44.2 24.9999C44.2 13.4999 53.5 4.19995 65 4.19995ZM74.9 81.9999H9.10001C6.30001 81.9999 4 79.6999 4 76.8999V36.0999C4 33.2999 6.30001 30.9999 9.10001 30.9999H40.9C43.1 39.6999 49.8 46.4999 58.4 48.8999L41.9 60.5999L8.2 36.3L5.89999 39.4999L28.4 55.7L5.8 74.2L8.3 77.3L31.7 58.0999L41.8 65.3999L52.2 58.0999L75.9 77.4999L78.4 74.3999L55.5 55.7L64 49.7C64.3 49.7 64.6 49.7 64.9 49.7C70.5 49.7 75.7 47.7999 79.9 44.5999V76.8C80 79.7 77.7 81.9999 74.9 81.9999Z"
                  fill="#3E53A0"/>
            <path d="M64.9999 42.5999C74.6999 42.5999 82.5999 34.6999 82.5999 24.9999C82.5999 15.2999 74.6999 7.3999 64.9999 7.3999C55.2999 7.3999 47.3999 15.2999 47.3999 24.9999C47.3999 34.6999 55.2999 42.5999 64.9999 42.5999ZM64.9999 11.3999C72.4999 11.3999 78.5999 17.4999 78.5999 24.9999C78.5999 32.4999 72.4999 38.5999 64.9999 38.5999C57.4999 38.5999 51.3999 32.4999 51.3999 24.9999C51.3999 17.4999 57.4999 11.3999 64.9999 11.3999Z"
                  fill="#3E53A0"/>
            <path d="M67.2002 15.8999H63.2002V25.9999H67.2002V15.8999Z" fill="#3E53A0"/>
            <path d="M67.2002 28.8999H63.2002V32.6999H67.2002V28.8999Z" fill="#3E53A0"/>
        </svg>

        Notifiche non lette
    </h1>
    <#if notificheNonLette?size == 0>
        <div class="text-lg font-semibold text-bluScuro flex flex-row justify-center">Non ci sono Notifiche da leggere</div>
    <#else>
        <#list notificheNonLette as notifica>
            <div
                    class="flex flex-col cursor-pointer justify-center text-bluScuro relative border rounded-2xl border-bluScuro mt-4 p-4 hover:bg-giallo2/50 ${notifica.letta?then('','highlighted-row')}"
                    onclick="markAsRead(${notifica.key}, '/home')"
            >
                <div class="text-lg font-semibold flex flex-row justify-between">${notifica.titolo}
                    <div class="text-sm font-normal">${notifica.created_at}</div>
                </div>
                <div class="mt-2 text-sm font-medium">${notifica.contenuto}</div>
            </div>
        </#list>
    </#if>

    <h1 class="text-primario text-2xl font-bold mb-4 text-center flex gap-2 items-center justify-center mt-8">
        <svg class="w-12 h-12" viewBox="0 0 50 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M39.6002 27.7001H39.5002V14.5001C39.5002 13.2001 38.8002 11.9001 37.7002 11.2001L22.2002 1.2001C20.9002 0.400098 19.3002 0.400098 18.0002 1.2001L2.5002 11.2001C1.4002 11.9001 0.700195 13.2001 0.700195 14.5001V35.9001C0.700195 37.4001 1.9002 38.6001 3.4002 38.6001H29.9002C30.4002 43.6001 34.6002 47.5001 39.7002 47.5001C45.1002 47.5001 49.6002 43.1001 49.6002 37.6001C49.4002 32.1001 45.0002 27.7001 39.6002 27.7001ZM2.6002 35.9001V14.5001C2.6002 13.8001 2.9002 13.2001 3.5002 12.9001L19.0002 2.9001C19.6002 2.5001 20.4002 2.5001 21.1002 2.9001L36.6002 12.9001C37.2002 13.3001 37.5002 13.9001 37.5002 14.5001V27.9001C33.4002 28.8001 30.2002 32.3001 29.8002 36.5001H3.2002C2.8002 36.5001 2.6002 36.2001 2.6002 35.9001ZM39.6002 45.4001C35.3002 45.4001 31.7002 41.9001 31.7002 37.5001C31.7002 33.1001 35.2002 29.6001 39.6002 29.6001C44.0002 29.6001 47.5002 33.1001 47.5002 37.5001C47.5002 41.9001 43.9002 45.4001 39.6002 45.4001Z"
                  fill="#3E53A0"/>
            <path d="M43.0003 33.8002L38.8003 38.0002L36.5003 35.7002C36.1003 35.3002 35.5003 35.3002 35.1003 35.7002C34.7003 36.1002 34.7003 36.7002 35.1003 37.1002L37.7003 39.7002C38.0003 40.0002 38.4003 40.1002 38.8003 40.1002C39.2003 40.1002 39.6003 40.0002 39.9003 39.7002L44.4003 35.2002C44.8003 34.8002 44.8003 34.2002 44.4003 33.8002C44.0003 33.4002 43.3003 33.5002 43.0003 33.8002Z"
                  fill="#3E53A0"/>
            <path d="M33.6003 13.9002C34.0003 13.6002 34.1003 12.9002 33.8003 12.5002C33.5003 12.1002 32.8003 12.0002 32.4003 12.3002L21.0003 20.9002C20.4003 21.3002 19.7003 21.3002 19.1003 20.9002L7.60031 12.3002C7.20031 12.0002 6.50031 12.1002 6.20031 12.5002C5.90031 12.9002 6.00031 13.6002 6.40031 13.9002L17.9003 22.5002C18.5003 23.0002 19.3003 23.2002 20.0003 23.2002C20.7003 23.2002 21.5003 23.0002 22.1003 22.5002L33.6003 13.9002Z"
                  fill="#3E53A0"/>
        </svg>


        Tutte le Notifiche
    </h1>
    <#if notificheAll?size == 0>
        <div class="text-lg font-semibold text-bluScuro flex flex-row justify-center">Non ci sono Notifiche</div>
    <#else>
        <#list notificheAll as notifica>
            <div
                class="flex flex-col cursor-pointer justify-center relative border rounded-2xl border-bluScuro mt-4 p-4 hover:bg-giallo2/50 ${notifica.letta?then('','highlighted-row')}"
                onclick="markAsRead(${notifica.key}, '/home')"
            >
                <div class="text-lg font-semibold flex flex-row justify-between">${notifica.titolo}
                    <div class="text-sm font-normal">${notifica.created_at}</div>
                </div>
                <div class="mt-2 text-sm font-medium">${notifica.contenuto}</div>
            </div>
        </#list>
    </#if>
</div>