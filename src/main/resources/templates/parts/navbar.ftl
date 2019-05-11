<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="/">Health Facility</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/news">Новости</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/ticket">Заказ талона</a>
            </li>
            <#if known>
                <li class="nav-item">
                    <a class="nav-link" href="/account">Аккаунт</a>
                </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/support">Оставить отзыв</a>
            </li>
            <#if isEmployee>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="employeesDropdown" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Для сотрудников</a>
                <div class="dropdown-menu" aria-labelledby="employeesDropdown">
                    <#if isDoctor>
                <a class="dropdown-item" href="/patient">Прием пациента</a>
                    </#if>
                <#if isOperator>
                <a class="dropdown-item" href="/schedule">Редактор талонов</a>
                <a class="dropdown-item" href="/feedback">Отзывы клиентов</a>
                </#if>
                <#if isAdmin>
                <a class="dropdown-item" href="/user">Зарегистрированные пользователи</a>
                </#if>
                </div>
            </li>
            </#if>
        </ul>

        <#if known>
        <div class="navbar-text mr-3">Добро пожаловать, ${name}!</div>
        </#if>
        <@logout />
    </div>
</nav>

<#macro logout>
    <#if known>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-outline-primary" type="submit">Выйти</button>
</form>
    <#else>
<a class="btn btn-outline-primary" href="/login">Вход</a>
    </#if>
</#macro>