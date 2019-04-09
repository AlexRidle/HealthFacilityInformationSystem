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
                <a class="nav-link" href="/news">News</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/account">Account</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Registered users</a>
            </li>
            </#if>
        </ul>

        <#if known>
        <div class="navbar-text mr-3">Hello, ${name}!</div>
        </#if>
        <@logout />
    </div>
</nav>

<#macro logout>
    <#if known>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-outline-primary" type="submit">Sign Out</button>
</form>
    <#else>
<a class="btn btn-outline-primary" href="/login">Sign in</a>
    </#if>
</#macro>