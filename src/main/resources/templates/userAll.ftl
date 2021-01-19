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

        <table class="table table-bordered table-hover table-striped" id="myTable">
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
                        <a class="delete" href="/user/del/${user.id}" data-toggle="tooltip"
                           title="Удалить пользователя"><i class="far fa-trash-alt fa-lg"></i></a>
                    </td>
                </tr>
            </#list>

            </tbody>
        </table>

    </div>

</@c.page>