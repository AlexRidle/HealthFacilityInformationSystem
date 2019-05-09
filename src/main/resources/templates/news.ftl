<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
    <#if newsPosts?has_content>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Новости учреждения:</h5>
    <#else>
        <h3 class="mt-3 mb-3 text-center featurette-heading">На данный момент новостей нет</h3>
    </#if>
<div class="container">
            <form method="get" action="/news">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="filter" placeholder="Введите тэг для поиска" value="${filter!}" aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Найти</button>
                    </div>
                </div>
                <#--<input type="text" name="filter" class="form-control" value="${filter!}"-->
                       <#--placeholder="Введите тэг для поиска">-->
                <#--<button type="submit" class="btn btn-primary ml-2">Найти</button>-->
            </form>
    <#if isEmployee>
        <a class="btn btn-outline-secondary btn-lg btn-block mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Создать новость
        </a>
    <div class="collapse <#if newsPost??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(titleError??)?string('is-invalid','')}"
                           value="<#if newsPost??>${newsPost.title}</#if>" name="title" placeholder="Заголовок">
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${titleError}
                    </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                           value="<#if newsPost??>${newsPost.text}</#if>" name="text" placeholder="Сообщение">
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Тэг"/>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Выберите изображение</label>
                    </div>
                </div>
                <script>
                    $('#customFile').on('change', function () {
                        //get the file name
                        var fileName = $(this).val();
                        fileName = fileName.replace("C:\\fakepath\\", "");
                        //replace the "Choose a file" label
                        $(this).next('.custom-file-label').html(fileName);
                    })
                </script>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-success">Добавить новость</button>
                </div>
            </form>
        </div>
    </div>
    </#if>
    <div class="card-mb-3 card-deck centered">
        <#list newsPosts as newsPost>
            <div class="card mb-3 max-card-width">
            <#if newsPost.filename??>
            <img src="/uploads/${newsPost.filename}" class="card-img-top img-fluid">
            </#if>
                <div class="card-body">
                    <h5 class="card-title">${newsPost.title}</h5>
                    <p class="card-text">${newsPost.text}</p>
                    <p class="card-text">
                        <small class="text-muted">${newsPost.tag}</small>
                    </p>
                </div>
                <#if isEmployee>
                <div class="card-footer text-muted"><a class="btn btn-outline-danger" href="/news/delete/${newsPost.id}">Удалить</a></div>
                </#if>
            </div>
             <#if newsPost?counter % 2 == 0>
             <div class="w-100 d-none d-sm-block d-md-none"><!-- wrap every 2 on sm--></div>
             </#if>
            <#if newsPost?counter % 3 == 0>
             <div class="w-100 d-none d-md-block d-lg-none"><!-- wrap every 3 on md--></div>
            </#if>
            <#if newsPost?counter % 4 == 0>
             <div class="w-100 d-none d-lg-block d-xl-none"><!-- wrap every 4 on lg--></div>
            </#if>
            <#if newsPost?counter % 5 == 0>
             <div class="w-100 d-none d-xl-block"><!-- wrap every 5 on xl--></div>
            </#if>
        </#list>
    </div>
</div>
</@c.page>
