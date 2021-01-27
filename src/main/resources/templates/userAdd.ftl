<#import "parts/common.ftl" as c>
<#import "parts/user.ftl" as u>

<@c.page 'ASUOD-AddUser'>
    <div class="mb-4 text-center">
        <h3>Hовый пользователь</h3>
    </div>
    <@u.user "/userAdd" true user!'null' userform!'null'/>
</@c.page>