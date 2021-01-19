<#import "parts/common.ftl" as c>
<#import "parts/user.ftl" as u>

<@c.page 'ASUOD-AddUser'>
    <div class="mb-4 text-center">
        <h3>Hового пользователя</h3>
    </div>
    ${message?ifExists}
    <@u.user "/userAdd" true false/>
</@c.page>