<#import "parts/common.ftl" as c>

<@c.page>
User editor
<h5 class="mt-3 mb-3 text-center featurette-heading">List of users:</h5>
<div class="mb-3 ml-3 mr-3">
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}" placeholder="username">
           <#list roles as role>
               <div>
                   <label><input type="checkbox"
                                 name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
               </div>
           </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>
</div>

</@c.page>