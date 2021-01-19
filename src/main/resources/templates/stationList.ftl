<#import "parts/common.ftl" as c>

<@c.page 'ASUOD-ListStation'>
    <div class="table-wrapper">
    <div class="table-title">
        <div class="row">
            <div class="col-sm-6">
                <h2>Управление ПТЭ</h2>
            </div>
            <div class="col-sm-6">
                <a href="/stationAdd" class="btn btn-success btn-group">Добавить</a>
            </div>
        </div>
    </div>

    <table class="table table-hover table table-bordered" id="myTable">
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
                    <a href="/station/${station.id}" data-toggle="tooltip" title="Редактировать ПТЭ"><i
                                class="far fa-edit fa-lg"></i></a>
                    <a href="/station/del/${station.id}" data-toggle="tooltip" title="Удалить ПТЭ"><i
                                class="far fa-trash-alt fa-lg"></i></a>
                </td>
            </tr>
        </#list>

        </tbody>
    </table>

    <#include "parts/datatableimports.ftl">
    <script type="text/javascript" charset="utf8"
            src="/static/js/datatablectivate.js"></script>
</@c.page>