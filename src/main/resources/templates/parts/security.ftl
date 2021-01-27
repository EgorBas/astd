<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    firstname = user.getFirstname()
    lastname = user.getLastname()
    isAdmin = user.isAdmin()
    isServiceManager = user.isServiceManager()
    isOperator = user.isOperator()
    >
<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    isServiceManager = false
    isOperator = false
    >
</#if>
