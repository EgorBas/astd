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
                        <a href="/station/${station.id}" data-toggle="tooltip" title="Редактировать ПТЭ">
                            <i class="far fa-edit fa-lg"></i></a>
                        <a class="delete" data-toggle="modal" data-target="#deleteConfirm"
                           data-stationid="${station.id}"
                           title="Удалить ПТЭ"><i class="far fa-trash-alt fa-lg"></i></a>
                    </td>
                </tr>
            </#list>

            </tbody>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="deleteConfirm"
             data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteConfirmLabel">Необходимо подтвердить действие.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Вы собираетесь удалить ПТЭ из системы. Это действие необратимо. Вы уверены?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                        <a type="button" id="dellink" class="btn btn-danger" href="">Удалить</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- DataTable JS-->
    <#include "parts/datatableimports.ftl">
    <!-- DataTable Table Settings-->
    <script type="text/javascript" charset="utf8"
            src="/static/js/datatablectivate.js"></script>
    <!-- JS For Modal Confirm Delete User-->
    <script>
        $(document).ready(function () {
            $('#deleteConfirm').on('show.bs.modal', function (event) {
                var element = $(event.relatedTarget)
                var id = element.data('stationid')
                var link = '/station/del/' + id
                document.getElementById('dellink').href = link;
            })
        })
    </script>
</@c.page>