<#import "parts/common.ftl" as c>
<#import "parts/station.ftl" as s>

<@c.page>
    <div class="mb-4 text-center">
        <h2>Добавить новый ПТЭ</h2>
    </div>
    ${message?ifExists}
    <@s.station "/stationAdd" true false/>
</@c.page>