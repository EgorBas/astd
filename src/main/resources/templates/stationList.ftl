<#import "parts/common.ftl" as c>

<@c.page>
    <div class="mb-3 text-center">
        <h2>Список ПТЭ</h2>
    </div>

    <table class="table table-hover table table-bordered">
        <thead class="thead-light text-center">
        <tr>
            <th>Номер</th>
            <th>Код</th>
            <th>Тип</th>
            <th>Название</th>
            <th>Адрес</th>
            <th>Статус</th>
            <th>Действия</th>
        </tr>
        </thead>
        <tbody class="text-center align-middle">
        <#list stations as station>
            <tr>
                <td class="align-middle">${station.stationnumber}</td>
                <td class="align-middle">${station.stationcode}</td>
                <td class="align-middle">${station.stationtype}</td>
                <td class="align-middle">${station.stationname}</td>
                <td class="align-middle">${station.stationaddress}</td>
                <td class="align-middle">
                    <#if station.active==true>Активен
                    <#else>Демонтирован
                    </#if>
                </td>
                <td class="align-middle">
                    <a href="/station/${station.id}" title="Изменить"><i class="far fa-edit"></i></a><br>
                    <a href="/station/del/${station.id}" title="Удалить"><i class="far fa-trash-alt"></i></a><br>
                </td>
            </tr>
        </#list>

        </tbody>
    </table>

    <a class="btn btn-primary" href="/stationAdd">Добавить</a>

</@c.page>