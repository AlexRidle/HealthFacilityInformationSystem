<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ${message!}
    <@l.login "/registration" true />
</@c.page>