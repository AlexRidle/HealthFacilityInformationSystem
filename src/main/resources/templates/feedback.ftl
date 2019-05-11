<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Отзыв был успешно удален!
    </div>
    </#if>
    <#if response! == "error">
    <div class="alert alert-danger" role="alert">
        Возникла ошибка при удалении отзыва
    </div>
    </#if>
<h5 class="mt-3 mb-3 text-center featurette-heading">Список оставленных отзывов:</h5>
<div class="mb-3 ml-3 mr-3 mt-5">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Полное имя</th>
            <th scope="col">Дата</th>
            <th scope="col">Отзыв</th>
            <th scope="col">Управление</th>
        </tr>
        </thead>
        <tbody>
        <#list feedbacks as feedback>
        <tr>
            <td width="3%">${feedback?counter}</td>
            <td width="15%">${feedback.user.fullName}</td>
            <td width="10%">${feedback.feedbackDate}</td>
            <td> ${feedback.text}</td>
            <td width="5%"><a class="btn btn-outline-danger" href="/feedback/delete/${feedback.id}">Удалить</a></td>
        </#list>
        </tr>
        </tbody>
    </table>
</div>
    <#include "parts/footer.ftl">

</@c.page>