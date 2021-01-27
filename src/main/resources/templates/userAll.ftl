<#import "parts/common.ftl" as c>

<@c.page 'ASUOD-ListUser'>
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Управление пользователями</h2>
                </div>
                <div class="col-sm-6">
                    <a href="/userAdd" class="btn btn-success btn-group">Добавить</a>
                </div>
            </div>
        </div>

        <table class="table table-bordered table-hover" id="userTable">
            <thead class="text-center thead-light">
            <tr>
                <th>Логин</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Отчество</th>
                <th>E-mail</th>
                <th>Статус</th>
                <th>Права</th>
                <th>Действия</th>
            </tr>
            </thead>
            <tbody class="text-center align-middle">
            <#list users as user>
                <tr>
                    <td class="align-middle">${user.username}</td>
                    <td class="align-middle">${user.lastname}</td>
                    <td class="align-middle">${user.firstname}</td>
                    <td class="align-middle">${user.patronymic}</td>
                    <td class="align-middle">${user.email}</td>
                    <td class="align-middle">
                        <#if user.active==true>Активен
                        <#else>Заблокирован
                        </#if>
                    </td>
                    <td class="align-middle"><#list user.roles as role>${role}<#sep><br> </#list></td>
                    <td class="align-middle">
                        <a class="edit" href="/user/${user.id}" data-toggle="tooltip"
                           title="Редактировать профиль пользователя"><i class="far fa-edit fa-lg"></i></a>
                        <a class="delete" data-toggle="modal" data-target="#deleteConfirm" data-userid="${user.id}"
                           title="Удалить пользователя"><i class="far fa-trash-alt fa-lg"></i></a>
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
                        Вы собираетесь удалить пользователя из системы. Это действие необратимо. Вы уверены?
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
    <script type="text/javascript" src="/static/DataTables_bs4/datatables.js"></script>
    <!-- DataTable Table Settings-->
    <script type="text/javascript" charset="utf8"
            src="/static/js/dataTableActivateUserTable.js"></script>
    <!-- JS For Modal Confirm Delete User-->
    <script>
        $(document).ready(function () {
            $('#deleteConfirm').on('show.bs.modal', function (event) {
                var element = $(event.relatedTarget)
                var id = element.data('userid')
                var link = '/user/del/' + id
                document.getElementById('dellink').href = link;
            })
        })
    </script>
</@c.page>