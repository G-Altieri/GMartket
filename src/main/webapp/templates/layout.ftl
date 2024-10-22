<!DOCTYPE html>
<html lang="it" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GMarket</title>

    <link rel="icon" href="/images/favicon.ico" type="image/x-icon">

    <!-- CSS -->
    <#--    <link href="/styles/tailwind.css" rel="stylesheet"/>-->
    <link href="/styles/global.css" rel="stylesheet"/>
    <link href="/styles/tailwind2.css" rel="stylesheet"/>

    <script type="application/javascript" src="/scripts/sweetAlert2.js"></script>
    <script type="application/javascript" src="/scripts/jquery.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<body class="bg-griggioChiaro">
<div class="min-h-screen h-full flex <#if includeHeader?string != 'false'> p-0 md:p-4</#if>">

    <!-- Se il parametro includeHeader è true, include l'header con la sidebar -->
    <#if includeHeader?string != "false">
        <!-- Include l'header, che contiene anche la sidebar -->
        <#include "header.ftl">
    </#if>

    <!-- Contenuto principale scrollabile -->
    <div class="flex-1 flex flex-col min-h-screen2 h-full
        <#if includeFooter?string != 'false'>hFooter</#if>
        <#if includeHeader?string != 'false'>ml-24 md:ml-80</#if>">
        <!-- Contenuto scrollabile -->
        <main class="flex-grow overflow-y-auto <#if includeFooter?string != 'false'>p-6</#if>">
            <#include content_tpl>
        </main>

        <!-- Footer -->
        <#if includeFooter?string != "false">
            <#include "footer.ftl">
        </#if>
    </div>

</div>

</body>

</html>
