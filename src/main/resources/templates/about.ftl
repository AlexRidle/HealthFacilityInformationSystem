<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/info_pages.css">
<link rel="stylesheet" href="/static/css/style.css">

<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
<div class="container">
    <main role="main" class="flex-shrink-0">
        <div class="container">
            <h1 class="mt-5">Информация об учреждении</h1>
            <p class="lead">На данной странице отображается вся информация о данном учреждении здравоохранения. Например:</p>
            <p class="lead">- <code>профиль</code></p>
            <p class="lead">- <code>местоположение</code></p>
            <p class="lead">- <code>штатное расписание</code></p>
            <p class="lead">- <code>перечень оказываемых услуг</code></p>
            <p class="lead">и т.д.</p>
        </div>
    </main>
</div>
    <#include "parts/footer.ftl">
</@c.page>
