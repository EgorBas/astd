<#import "parts/common.ftl" as c>
<#import "parts/station.ftl" as s>

<@c.page 'ASUOD-AddStation'>
    <div class="mb-4 text-center">
        <h3>Добавить новый ПТЭ</h3>
    </div>
    <@s.station "/stationAdd" true station!'null' stationform!'null'/>
</@c.page>