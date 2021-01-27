<#import "parts/common.ftl" as c>
<#import "parts/station.ftl" as s>

<@c.page 'ASUOD-EditStation'>
    <div class="mb-4 text-center">
        <h3>Данные ПТЭ</h3>
    </div>
    <@s.station "/station" false station!'null' stationform!'null'/>
</@c.page>