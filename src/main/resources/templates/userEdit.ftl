<#import "parts/common.ftl" as c>
<#import "parts/user.ftl" as u>

<@c.page 'ASUOD-EditUser'>
    <div class="mb-4 text-center">
        <h3>Профиль пользователя</h3>
    </div>
    ${message?ifExists}
    <@u.user "/user" false user/>
</@c.page>