<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Добавить нового пользователя</h2>
    </div>
    ${message?ifExists}
    <@l.login "/userAdd" true />
</@c.page>