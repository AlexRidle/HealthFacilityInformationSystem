<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isEmployee = user.isEmployee()
    isDoctor = user.isDoctor()
    isOperator = user.isOperator()
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "Guest"
    isEmployee = false
    isDoctor = false
    isOperator = false
    isAdmin = false
    >
</#if>