<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<link rel="stylesheet" href="/static/style.css">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
    <#if newsPosts?has_content>
    <h5 class="mt-3 mb-3 text-center featurette-heading">Facility news:</h5>
    <#else>
        <h3 class="mt-3 mb-3 text-center featurette-heading">There is no any news yet :(</h3>
    </#if>
<div class="mb-3 ml-3 mr-3">
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/news" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!}"
                       placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>
    <#if isEmployee>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            New post
        </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Message">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tag"/>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
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
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
    </#if>
    <div class="card-mb-3 card-deck">
        <#list newsPosts as newsPost>
            <div class="card mb-3 ">
            <#if newsPost.filename??>
            <img src="/uploads/${newsPost.filename}" class="card-img-top img-fluid">
            </#if>
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">${newsPost.text}</p>
                    <p class="card-text">
                        <small class="text-muted">${newsPost.tag}</small>
                    </p>
                </div>
                <div class="card-footer text-muted">${newsPost.authorName}</div>
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
