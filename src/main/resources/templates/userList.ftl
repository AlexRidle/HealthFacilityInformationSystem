<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
    <#if response! == "success">
    <div class="alert alert-success" role="alert">
        Пользователь был успешно изменен!
    </div>
    </#if>
<h5 class="mt-3 mb-3 text-center featurette-heading">Список зарегистрированных пользователей:</h5>
<div class="mb-3 ml-3 mr-3">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Логин</th>
            <th scope="col">Роль</th>
            <th scope="col">Полное имя</th>
            <th scope="col">Управление</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
        <#--<tr onclick="window.location='/user/${user.id}';">-->
        <tr>
            <td width="3%">${user?counter}</td>
            <td width="15%">${user.username}</td>
            <td width="15%"><#list user.roles as role>${role}<#sep>, </#list></td>
            <td> ${user.getFullName()}</td>
            <td width="5%"><a class="btn btn-outline-primary" href="/user/${user.id}">Изменить</a></td>
        </#list>
    </tr>
        </tbody>
    </table>
</div>
    <#include "parts/footer.ftl">

</@c.page>