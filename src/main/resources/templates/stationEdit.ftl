<#import "parts/common.ftl" as c>
<#import "parts/station.ftl" as s>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Редактировать ПТЭ</h2>
    </div>
    ${message?ifExists}
    <@s.station "/station" false station/>
</@c.page>