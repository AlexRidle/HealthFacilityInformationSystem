<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isEmployee = user.isEmployee()
    isDoctor = user.isDoctor()
    isOnlyDoctor = user.isOnlyDoctor()
    isOperator = user.isOperator()
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "Guest"
    isEmployee = false
    isDoctor = false
    isOnlyDoctor = false
    isOperator = false
    isAdmin = false
    >
</#if>