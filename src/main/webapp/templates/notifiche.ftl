<#include "./navbar.ftl">
<script type="module" src="/scripts/table.js"></script>


<div class="bg-light p-6 rounded-2xl shadow-normalBox mt-8">
            <#list notificheAll as notifica>
                <div class="mt-2">${notifica.titolo}</div>
                <div class="mt-2">${notifica.contenuto}</div>
                <div class="mt-2">${notifica.letta?string('yes', 'no')}</div>
            </#list>
    <div class="mt-2 text-3xl text-center">NOTIFICHE NON LETTE</div>
    <#list notificheNonLette as notifica>
        <div class="mt-2">${notifica.titolo}</div>
        <div class="mt-2">${notifica.contenuto}</div>
        <div class="mt-2">${notifica.letta?string('yes', 'no')}</div>
    </#list>

</div>