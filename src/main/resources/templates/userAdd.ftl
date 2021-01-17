<#import "parts/common.ftl" as c>
<#import "parts/user.ftl" as u>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Добавить нового пользователя</h2>
    </div>
    ${message?ifExists}
    <@u.user "/userAdd" true false/>
</@c.page>