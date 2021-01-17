<#import "parts/common.ftl" as c>
<#import "parts/user.ftl" as u>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Редактировать профиль пользователя</h2>
    </div>
    ${message?ifExists}
    <@u.user "/user" false user/>
</@c.page>