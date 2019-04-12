<#import "parts/common.ftl" as c>

<@c.page>
<link rel="stylesheet" href="/static/css/style.css">
<h5 class="mt-3 mb-3 text-center featurette-heading">List of users:</h5>
<div class="mb-3 ml-3 mr-3">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Role</th>
            <th scope="col">Full name</th>
            <th scope="col">Control</th>
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
            <td width="5%"><a class="btn btn-outline-primary" href="/user/${user.id}">Edit</a></td>
        </#list>
    </tr>
        </tbody>
    </table>
</div>
</@c.page>