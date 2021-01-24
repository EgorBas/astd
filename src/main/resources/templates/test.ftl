<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page 'test'>
    <div class="mb-1">Add new user</div>
    ${message?ifExists}
    <#if user??>kjlkjljl"</#if>
    <@l.login "/registration" true />
</@c.page>